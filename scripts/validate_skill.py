#!/usr/bin/env python3
"""Validação estrutural portátil (stdlib) do pacote de skill."""

from __future__ import annotations

import argparse
from pathlib import Path
import re
import sys

SKILL_NAME = "levantamento-requisitos-produto"
REQUIRED_FILES = (
    "SKILL.md",
    "README.md",
    "references/metodologia-completa.md",
    "references/modelo-documento.md",
    "references/banco-de-perguntas.md",
    "references/checklist-de-qualidade.md",
)


def validate_frontmatter(content: str) -> list[str]:
    errors: list[str] = []
    lines = content.splitlines()
    if not lines or lines[0] != "---":
        return ["SKILL.md: frontmatter deve começar na primeira linha com '---'."]
    try:
        closing = lines.index("---", 1)
    except ValueError:
        return ["SKILL.md: falta fechamento '---' do frontmatter."]

    fm = lines[1:closing]
    fields: dict[str, str] = {}
    active: str | None = None
    for line in fm:
        match = re.match(r"^([a-z][a-z0-9_-]*):\s*(.*)$", line)
        if match:
            active = match.group(1)
            fields[active] = match.group(2).strip().strip('"\'')
        elif active is not None and line.startswith((" ", "\t")):
            fields[active] += " " + line.strip()
        elif line.strip():
            errors.append(f"SKILL.md: linha inesperada no frontmatter: {line!r}")
    if fields.get("name") != SKILL_NAME:
        errors.append(f"SKILL.md: name deve ser '{SKILL_NAME}'.")
    if not re.fullmatch(r"[a-z0-9]+(?:-[a-z0-9]+)*", fields.get("name", "")):
        errors.append("SKILL.md: name deve usar letras minúsculas, números e hífens.")
    if not fields.get("description") or fields["description"] in (">", ">-", "|"):
        errors.append("SKILL.md: description precisa descrever quando ativar a skill.")
    if closing + 1 >= len(lines) or not "".join(lines[closing + 1 :]).strip():
        errors.append("SKILL.md: conteúdo Markdown está vazio.")
    return errors


def markdown_links(content: str) -> list[str]:
    return re.findall(r"\]\(([^)]+)\)", content)


def validate_repo(root: Path) -> list[str]:
    errors: list[str] = []
    for path in REQUIRED_FILES:
        if not (root / path).is_file():
            errors.append(f"Arquivo obrigatório ausente: {path}")
    skill = root / "SKILL.md"
    if skill.is_file():
        content = skill.read_text(encoding="utf-8")
        errors.extend(validate_frontmatter(content))
        # Checa caminhos de referências citados literalmente no Markdown.
        referenced = set(re.findall(
            r"(?:references|examples)/[a-zA-Z0-9_./-]+\.md", content
        ))
        for relative in sorted(referenced):
            if not (root / relative).is_file():
                errors.append(f"Referência da skill inexistente: {relative}")
    for file_path in (root / "README.md", root / "README.en.md"):
        if not file_path.is_file():
            continue
        for raw_link in markdown_links(file_path.read_text(encoding="utf-8")):
            target = raw_link.split("#", 1)[0]
            if not target or target.startswith(("https:", "http:", "mailto:", "#")):
                continue
            if " " in target:
                continue
            if not (file_path.parent / target).exists():
                errors.append(f"Link local inexistente em {file_path.name}: {target}")
    return errors


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--root", type=Path, default=Path(__file__).resolve().parents[1]
    )
    args = parser.parse_args()
    errors = validate_repo(args.root.resolve())
    if errors:
        for error in errors:
            print("ERRO:", error, file=sys.stderr)
        return 1
    print("OK: estrutura, metadados, referências e links locais válidos.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
