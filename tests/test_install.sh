#!/usr/bin/env bash
set -euo pipefail
ROOT="$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd -P)"
TEMP_HOME="$(mktemp -d)"
trap 'rm -rf "$TEMP_HOME"' EXIT

# Simula instalação anterior para garantir que backup não seja apagado.
mkdir -p "$TEMP_HOME/.claude/skills/levantamento-requisitos-produto"
echo 'versão anterior' > "$TEMP_HOME/.claude/skills/levantamento-requisitos-produto/old.txt"

HOME="$TEMP_HOME" bash "$ROOT/scripts/install.sh" --target both --mode symlink
[[ -L "$TEMP_HOME/.agents/skills/levantamento-requisitos-produto" ]]
[[ -L "$TEMP_HOME/.claude/skills/levantamento-requisitos-produto" ]]
[[ -f "$TEMP_HOME/.claude/skills/levantamento-requisitos-produto/SKILL.md" ]]
find "$TEMP_HOME/.claude/skills" -name 'levantamento-requisitos-produto.backup-*' -type d \
  -exec test -f '{}/old.txt' \;

HOME="$TEMP_HOME" bash "$ROOT/scripts/install.sh" --target both --mode symlink
HOME="$TEMP_HOME" bash "$ROOT/scripts/install.sh" --target claude --mode copy
[[ ! -L "$TEMP_HOME/.claude/skills/levantamento-requisitos-produto" ]]
[[ -f "$TEMP_HOME/.claude/skills/levantamento-requisitos-produto/SKILL.md" ]]
[[ -f "$TEMP_HOME/.claude/skills/levantamento-requisitos-produto/references/modelo-documento.md" ]]

echo 'OK: instalador preserva backups, symlinks e cópias.'
