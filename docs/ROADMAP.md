# Roadmap e backlog de contribuição

Este documento separa **o que existe** daquilo que **a comunidade pode construir**.
Não é uma promessa de prazo; prioridades e soluções propostas dependem de revisão.

## Disponível — v0.1.0

- [x] Skill portátil `SKILL.md` para Codex e Claude Code.
- [x] Política para nunca inventar decisões de produto.
- [x] Metodologia de descoberta e modelo de documento.
- [x] Banco de perguntas e checklist de qualidade.
- [x] Exemplo fictício e documentação de instalação.
- [x] Instalação por cópia ou symlink em macOS/Linux e PowerShell.
- [x] Validador básico de estrutura, metadados e caminhos locais.
- [x] Testes automatizados básicos e GitHub Actions.
- [x] Templates de issues, PR, contribuição e segurança.

## Prioridade alta — próximos incrementos

- [ ] **Avaliações com diferentes modelos de IA:** medir se identificam
  decisões faltantes e deixam de inventá-las. [Issue sugerida](../.github/seed-issues/01-evals-comportamentais.md)
- [ ] **Lint semântico de rastreabilidade:** detectar IDs duplicados,
  referências quebradas e requisitos inconsistentes.
  [Issue sugerida](../.github/seed-issues/02-lint-rastreabilidade.md)
- [ ] **Pacote de exemplos multissetoriais:** saúde, educação, marketplace,
  SaaS B2B, setor público, com dados fictícios.
  [Issue sugerida](../.github/seed-issues/03-exemplos.md)
- [ ] **Suite de perguntas adaptativas por domínio:** evitar interrogatórios
  repetitivos sem perder cobertura.
  [Issue sugerida](../.github/seed-issues/04-perguntas-adaptativas.md)

## Prioridade média

- [ ] **Exportação para DOCX/PDF** com fidelidade de estrutura e índice.
  [Issue sugerida](../.github/seed-issues/05-exportacao.md)
- [ ] **Versão em inglês da skill e referências**, sem mudar os conceitos.
  [Issue sugerida](../.github/seed-issues/06-internacionalizacao.md)
- [ ] **Catálogo de cenários de API** e exemplos de contrato REST, GraphQL,
  integrações assíncronas e webhooks.
  [Issue sugerida](../.github/seed-issues/07-apis.md)
- [ ] **Metadados opcionais de catálogo de skills** e validações por plataforma.
  [Issue sugerida](../.github/seed-issues/08-metadata.md)

## Como escolher uma tarefa

Comece por documentação, exemplos fictícios ou testes pequenos. Antes de
implementar uma mudança que torne algum fluxo **obrigatório**, abra uma
proposta: a skill não pode virar um conjunto de decisões de produto fixas.

Os textos acima podem ser publicados como issues executando
`bash scripts/seed_issues.sh` **depois** que o repositório estiver no GitHub.
O script solicita confirmação antes de criar as issues.
