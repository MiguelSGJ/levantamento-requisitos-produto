# Levantamento de Requisitos — Skill para Agentes de IA

[![Validate skill](https://github.com/MiguelSGJ/levantamento-requisitos-produto/actions/workflows/validate.yml/badge.svg)](https://github.com/MiguelSGJ/levantamento-requisitos-produto/actions/workflows/validate.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Compatibility](https://img.shields.io/badge/Agents-Codex%20%7C%20Claude%20Code-blueviolet)](docs/INSTALACAO.md)

Uma **skill open source** para agentes de IA conduzirem levantamentos de
requisitos e documentarem decisões de produto **sem inventar regras de negócio**.
Projetada para diferentes domínios e tamanhos de sistema.

> **Princípio central:** o agente estrutura, investiga, recomenda quando solicitado
> e documenta; **o responsável pelo produto decide**.

🇧🇷 Documentação principal em português. [English overview](README.en.md).

## O que a skill cobre

| Área | Resultado esperado |
|---|---|
| Visão do produto | Problema, objetivo, stakeholders, princípios e valor |
| Escopo | Módulos, fases, dependências, exclusões |
| RBAC e privilégios | Atores, papéis, vínculos, matriz de permissões, exceções |
| Dados | Entidades, relacionamentos, campos, obrigatoriedade e validação |
| Fluxos | Jornadas, estados, transições, exceções e concorrência |
| Requisitos | RF, RN, RNF, critérios de aceite e rastreabilidade |
| Operação | Administração, moderação, auditoria, notificações |
| Arquitetura de integração | APIs, endpoints, contratos, provedores e falhas |
| Governança | Decisões pendentes, premissas, riscos e dependências |

Nada disso é imposto ao produto. São dimensões a investigar **quando aplicáveis**.

## Exemplo rápido

**Usuário:** “Quero criar um sistema para gerir clientes e contratos.”

**Comportamento esperado:** o agente não pressupõe `Admin/Gerente/Usuário`,
aprovação de contratos, exclusão definitiva, prazos, campos obrigatórios nem
endpoints. Ele identifica quais decisões precisam ser tomadas e pergunta quem
pode ver, criar, alterar ou excluir cada recurso. Usa as respostas para redigir
requisitos e registra explicitamente o que ainda está pendente.

Veja o [exemplo fictício de estoque](examples/estoque/primeira-rodada.md).

## Instalação rápida — macOS / Linux

> **Nota:** o endereço GitHub indicado abaixo será válido após a publicação.
> Para publicar este pacote pela primeira vez, veja [como publicar](docs/PUBLICAR-GITHUB.md).

Requer Git e shell Bash. Ao publicar na conta GitHub conectada (`MiguelSGJ`), use:

```bash
git clone https://github.com/MiguelSGJ/levantamento-requisitos-produto.git \
  "$HOME/lev-requisitos-skill"
cd "$HOME/lev-requisitos-skill"

# Link simbólico: os dois agentes leem os mesmos arquivos do repositório.
bash scripts/install.sh --target both --mode symlink
```

As pastas instaladas serão `~/.agents/skills/levantamento-requisitos-produto`
(Codex) e `~/.claude/skills/levantamento-requisitos-produto` (Claude Code).
Instalações anteriores são preservadas com sufixo `.backup-AAAAMMDD-HHMMSS`.
Se preferir cópias independentes, use `--mode copy`.

Para atualizar a skill instalada via symlink:

```bash
cd "$HOME/lev-requisitos-skill"
git pull --ff-only
```

Veja [instalação completa, Windows e migração de cópias existentes](docs/INSTALACAO.md).

Para publicar seu próprio fork/repositório usando `gh`, consulte
[Publicar no GitHub](docs/PUBLICAR-GITHUB.md).

## Como invocar

**Codex:** `$levantamento-requisitos-produto` ou referência contextual à skill.

**Claude Code:** `/levantamento-requisitos-produto` ou pedido contextual.

Exemplo de prompt:

```text
Use a skill levantamento-requisitos-produto para descobrir os requisitos
deste sistema. Antes de decidir papéis, privilégios, fluxos, campos,
endpoints ou regras de negócio, pergunte. Separe confirmado, pendente,
proposta e premissa; crie o documento progressivamente.
```

## Estrutura do repositório

```text
levantamento-requisitos-produto/
├── SKILL.md                  # instruções que o agente carrega
├── references/               # metodologia, modelo, perguntas, checklist
├── examples/estoque/         # brief e primeira rodada de exemplo fictício
├── docs/                     # instalação, testes, roadmap, decisões
├── scripts/                  # instalação e validação
├── tests/                    # testes do validador e da instalação
├── .github/                  # CI, templates de issues e pull requests
├── CONTRIBUTING.md
├── CODE_OF_CONDUCT.md
├── SECURITY.md
└── LICENSE
```

## Estado do projeto

**v0.1.0 — base utilizável.** A skill, seus documentos e o instalador estão
disponíveis. Existem melhorias planejadas que **ainda não foram implementadas**:
testes de comportamento com modelos, validação cruzada de rastreabilidade,
exportadores e mais exemplos de domínio. Consulte o [roadmap](docs/ROADMAP.md)
e as [tarefas sugeridas](.github/seed-issues/) para começar a contribuir.

## Contribuir

Contribuições são bem-vindas: correções na metodologia, melhorias de prompts,
novos exemplos com dados fictícios, testes, automatizações e traduções.

Leia [CONTRIBUTING.md](CONTRIBUTING.md) antes de enviar um pull request. Para
propor uma melhoria, abra uma issue com cenário, comportamento esperado e
critérios de aceite. Para começar, procure tarefas de baixa complexidade no
[backlog](docs/ROADMAP.md). Respeite o [Código de Conduta](CODE_OF_CONDUCT.md).

## Referências e fundamentação

O material usa princípios de engenharia de requisitos e organiza decisões de
produto, sem afirmar conformidade automática a normas. Consulte
[referências técnicas](docs/REFERENCIAS.md) para orientações de engenharia de
requisitos, segurança e acessibilidade.

## Qualidade e limitações

```bash
python3 scripts/validate_skill.py
python3 -m unittest discover -s tests -v
bash tests/test_install.sh
```

A validação automática atual confere **estrutura e metadados**, não garante
que um modelo de IA seguirá todas as decisões corretamente. Isso exige
avaliação comportamental, planejada no roadmap.

## Licença e origem

Código, templates e textos deste repositório disponibilizados sob [MIT](LICENSE).
Antes de publicar, revise o titular de direitos autorais se necessário.
O projeto é comunitário e **não é oficial nem afiliado** à OpenAI ou à Anthropic.

A metodologia foi inspirada no nível de detalhamento de um levantamento real,
mas **não inclui nem redistribui o documento fonte, informações institucionais
específicas ou decisões do sistema original**.
