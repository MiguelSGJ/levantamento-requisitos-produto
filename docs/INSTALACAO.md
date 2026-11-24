# Instalação e atualização

A raiz deste repositório **é a pasta da skill** porque contém `SKILL.md`.
Não coloque apenas o `SKILL.md` no destino: mantenha `references/` e `examples/`.

## Diretórios

| Agente | Global (macOS/Linux) | Local ao projeto |
|---|---|---|
| Codex | `~/.agents/skills/levantamento-requisitos-produto` | `.agents/skills/levantamento-requisitos-produto` |
| Claude Code | `~/.claude/skills/levantamento-requisitos-produto` | `.claude/skills/levantamento-requisitos-produto` |

## macOS / Linux — symlinks (recomendado)

```bash
git clone https://github.com/MiguelSGJ/levantamento-requisitos-produto.git \
  "$HOME/lev-requisitos-skill"
cd "$HOME/lev-requisitos-skill"
bash scripts/install.sh --target both --mode symlink
```

O script **não apaga silenciosamente** as instalações preexistentes: cria backups
e apresenta os destinos instalados. Se o repositório estiver dentro de um dos
destinos, ele preserva esse diretório e liga o outro agente a ele.

Conferir:

```bash
/bin/ls -ld "$HOME/.agents/skills/levantamento-requisitos-produto"
/bin/ls -ld "$HOME/.claude/skills/levantamento-requisitos-produto"
test -f "$HOME/.claude/skills/levantamento-requisitos-produto/SKILL.md"       && echo 'Skill acessível pelo Claude'
```

Se seu `ls` tiver alias conflitante com `eza`, use `/bin/ls` como acima.

Atualizar:

```bash
cd "$HOME/lev-requisitos-skill"
git pull --ff-only
```

### Instalação por cópia

```bash
bash scripts/install.sh --target both --mode copy
```

É útil quando a máquina não deve depender de links, mas atualizações exigem
executar a instalação novamente. Não edite arquivos copiados se quiser
manter contribuições versionadas: edite o repositório e reinstale.

### Apenas um agente

```bash
bash scripts/install.sh --target codex --mode symlink
bash scripts/install.sh --target claude --mode symlink
```

## Windows — PowerShell

```powershell
git clone https://github.com/MiguelSGJ/levantamento-requisitos-produto.git "$HOME\lev-requisitos-skill"
cd "$HOME\lev-requisitos-skill"
.\scripts\install.ps1 -Target both -Mode copy
```

Para symlinks, use `-Mode symlink`; no Windows, links simbólicos podem exigir
**Developer Mode** ou privilégios adequados. O modo `copy` evita esse requisito.

## Usando a skill

No Codex: `$levantamento-requisitos-produto`.

No Claude Code: `/levantamento-requisitos-produto`.

Se não aparecer, abra uma nova sessão e verifique a estrutura e o frontmatter
do arquivo, especialmente `name` e `description`.

## Desinstalar sem perder trabalho

Se o destino for um symlink criado pelo instalador, use `unlink` somente nele:

```bash
unlink "$HOME/.claude/skills/levantamento-requisitos-produto"
```

**Não execute `rm -rf` em diretórios que possam conter arquivos próprios**.
Backups feitos durante a instalação ficam ao lado da instalação anterior.

## Referências oficiais

- https://developers.openai.com/codex/skills
- https://code.claude.com/docs/en/skills
- https://agentskills.io/specification
