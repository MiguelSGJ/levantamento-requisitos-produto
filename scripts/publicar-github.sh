#!/usr/bin/env bash
set -euo pipefail
ROOT="$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd -P)"
cd "$ROOT"

REPO_NAME='levantamento-requisitos-produto'
command -v git >/dev/null || { echo 'Git não encontrado.' >&2; exit 1; }
command -v gh >/dev/null || { echo 'Instale o GitHub CLI: brew install gh' >&2; exit 1; }
gh auth status >/dev/null || { echo 'Faça login: gh auth login' >&2; exit 1; }

if [[ -d .git ]]; then
  echo 'Este diretório já tem um repositório Git. Revise o estado e publique manualmente.' >&2
  exit 1
fi
if [[ ! -f SKILL.md || ! -f LICENSE || ! -f README.md ]]; then
  echo 'Pacote incompleto: SKILL.md, README.md ou LICENSE não encontrado.' >&2
  exit 1
fi

echo 'O próximo passo publicará um repositório PÚBLICO no GitHub da conta ativa.'
echo 'A licença inicial é MIT. Revise autoria, informações e links antes de confirmar.'
read -r -p "Confirmar publicação pública '$REPO_NAME' com licença MIT? [sim/N] " confirmacao
case "$confirmacao" in sim|SIM|s|S) ;; *) echo 'Publicação cancelada.'; exit 0 ;; esac

python3 scripts/validate_skill.py
git init -b main
git add .
git commit -m 'chore: publicar skill e estrutura open source v0.1.0'
gh repo create "$REPO_NAME" \
  --public --source=. --remote=origin --push \
  --description 'Skill open source para levantamento de requisitos sem inventar decisoes de produto'

echo 'Repositório publicado. Para abrir o backlog, execute: bash scripts/seed_issues.sh'
