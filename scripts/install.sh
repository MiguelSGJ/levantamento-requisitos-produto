#!/usr/bin/env bash
set -euo pipefail

SKILL_NAME='levantamento-requisitos-produto'
SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
SOURCE_DIR="$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd -P)"
TARGET='both'
MODE='symlink'

usage() {
  cat <<'USAGE'
Uso: bash scripts/install.sh [--target codex|claude|both] [--mode symlink|copy]
  --target  Agente que receberá a skill (padrão: both)
  --mode    Como instalar: link simbólico ou cópia (padrão: symlink)
  --help    Exibe esta mensagem
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --target) TARGET="${2:-}"; shift 2 ;;
    --mode) MODE="${2:-}"; shift 2 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Argumento desconhecido: $1" >&2; usage >&2; exit 2 ;;
  esac
done

case "$TARGET" in both|codex|claude) ;; *) echo "--target inválido" >&2; exit 2 ;; esac
case "$MODE" in symlink|copy) ;; *) echo "--mode inválido" >&2; exit 2 ;; esac

if [[ ! -f "$SOURCE_DIR/SKILL.md" || ! -d "$SOURCE_DIR/references" ]]; then
  echo 'Erro: a origem precisa conter SKILL.md e references/' >&2
  exit 1
fi

install_one() {
  local base="$1"
  local dest="$base/$SKILL_NAME"
  local backup
  mkdir -p "$base"

  if [[ "$dest" == "$SOURCE_DIR" ]]; then
    echo "Origem já está no destino: $dest"
    return
  fi
  if [[ "$MODE" == 'symlink' && -L "$dest" && "$(readlink "$dest")" == "$SOURCE_DIR" ]]; then
    echo "Symlink já correto: $dest"
    return
  fi
  if [[ -e "$dest" || -L "$dest" ]]; then
    backup="$dest.backup-$(date +%Y%m%d-%H%M%S)-$$"
    mv "$dest" "$backup"
    echo "Instalação anterior preservada em: $backup"
  fi
  if [[ "$MODE" == 'symlink' ]]; then
    ln -s "$SOURCE_DIR" "$dest"
    echo "Symlink: $dest -> $SOURCE_DIR"
  else
    mkdir -p "$dest"
    cp "$SOURCE_DIR/SKILL.md" "$dest/SKILL.md"
    cp -R "$SOURCE_DIR/references" "$dest/references"
    if [[ -d "$SOURCE_DIR/examples" ]]; then
      cp -R "$SOURCE_DIR/examples" "$dest/examples"
    fi
    echo "Cópia: $dest"
  fi
}

if [[ "$TARGET" == 'codex' || "$TARGET" == 'both' ]]; then
  install_one "$HOME/.agents/skills"
fi
if [[ "$TARGET" == 'claude' || "$TARGET" == 'both' ]]; then
  install_one "$HOME/.claude/skills"
fi

echo 'Concluído. Abra uma nova sessão do agente, se a skill não aparecer.'
