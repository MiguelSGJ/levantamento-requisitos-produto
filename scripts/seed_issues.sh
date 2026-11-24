#!/usr/bin/env bash
set -euo pipefail
ROOT="$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd -P)"

command -v gh >/dev/null || {
  echo 'Instale o GitHub CLI (gh) e faça gh auth login.' >&2
  exit 1
}
gh auth status >/dev/null || {
  echo 'Autentique-se primeiro: gh auth login' >&2
  exit 1
}
gh repo view >/dev/null || {
  echo 'Entre na pasta de um repositório remoto no GitHub.' >&2
  exit 1
}

echo 'O script criará até 8 issues públicas a partir do backlog.'
read -r -p 'Continuar? [s/N] ' response
case "$response" in s|S|sim|SIM) ;; *) echo 'Cancelado.'; exit 0 ;; esac

for file in "$ROOT"/.github/seed-issues/*.md; do
  title="$(head -n 1 "$file" | sed 's/^# //')"
  if gh issue list --state all --limit 1000 --json title --jq '.[].title' | grep -Fxq "$title"; then
    echo "Já existe: $title"
  else
    gh issue create --title "$title" --body-file "$file"
    echo "Criada: $title"
  fi
done
