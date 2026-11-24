# Publicar no GitHub (macOS)

Este pacote foi preparado para um repositório público com contribuições.
**Nenhum repositório remoto é criado automaticamente.**

## 1. Preparar ambiente

Instale GitHub CLI (se ainda não estiver instalado) e faça login:

```bash
brew install gh
gh auth login
```

## 2. Publicar (um comando)

Extraia o ZIP do pacote e entre na pasta raiz, que deve conter `SKILL.md`.
Depois de revisar os arquivos e confirmar que deseja um repositório público
com licença MIT, execute:

```bash
cd "$HOME/Downloads/levantamento-requisitos-produto-github"
bash scripts/publicar-github.sh
```

O script valida a estrutura, inicializa o Git, cria o primeiro commit e usa
`gh repo create` para publicar na **conta GitHub ativa**. Ele pede confirmação
antes de tornar os arquivos públicos. Se o diretório já tiver `.git`, aborta
para evitar alterações não intencionais.

### Alternativa manual

Na pasta raiz, execute:

```bash
cd "$HOME/Downloads/levantamento-requisitos-produto-github"
git init -b main
git add .
git commit -m "chore: publicar versao inicial da skill"
gh repo create levantamento-requisitos-produto \
  --public --source=. --remote=origin --push \
  --description "Skill open source para levantamento de requisitos sem inventar decisoes de produto"
```

Antes do `gh repo create`, revise [LICENSE](../LICENSE) e a visibilidade
desejada. Repositório público permite leitura e forks, mas contribuições
seguem por issues e pull requests, não por acesso irrestrito de escrita.

### Se o Git pedir sua identidade

Configure seu nome e e-mail com os dados que você deseja usar publicamente
nos commits (`git config --global user.name ...` e `git config --global user.email ...`).
Se preferir privacidade, utilize o e-mail **noreply** disponibilizado pela
configuração do seu GitHub.

## 3. Configuração recomendada do GitHub

Em **Settings → General / Pull Requests**, habilite squash merge, se desejar.
Em **Settings → Branches / Rulesets**, configure proteção da `main` com
PR obrigatório e checagem `Validate skill` (quando o workflow já rodou).
Em **Settings → Features**, habilite Issues. Em **Security**, considere
habilitar relatos privados de vulnerabilidade.

## 4. Criar o backlog inicial como GitHub Issues

Com o repositório publicado e `gh auth login` concluído:

```bash
bash scripts/seed_issues.sh
```

O script pergunta antes de criar, usa os textos de `.github/seed-issues/`
e tenta evitar títulos duplicados.

## 5. Usar a mesma cópia no Codex e no Claude

Ao publicar, mantenha seu clone local em uma pasta estável. Execute:

```bash
bash scripts/install.sh --target both --mode symlink
```

Agora `git pull --ff-only` atualiza uma única cópia para os dois agentes.
