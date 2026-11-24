# Testes, CI e critérios de qualidade

## Comandos disponíveis

```bash
python3 scripts/validate_skill.py
python3 -m unittest discover -s tests -v
bash tests/test_install.sh
```

A GitHub Action `validate.yml` executa esses testes em Linux e macOS nas
atualizações da branch principal e em pull requests.

## O que é validado na v0.1.0

- Existência de `SKILL.md` e das referências essenciais.
- Frontmatter YAML delimitado por `---` com `name` e `description`.
- Nome da skill em formato suportado.
- Caminhos relativos referenciados em `SKILL.md` e links locais Markdown do README.
- Instalação por symlink e por cópia no macOS/Linux em diretório temporário.

## O que ainda NÃO é validado

- Se modelos diferentes obedecem às perguntas e aguardam confirmação.
- Qualidade ou completude semântica dos requisitos gerados.
- Contradições entre matriz RBAC, endpoints, estados e regras de negócio.
- Conteúdo ou conformidade jurídica de cada especificação produzida.

Essas limitações motivam as issues iniciais de avaliação e lint semântico.

## Como adicionar testes comportamentais

Escreva um caso com: contexto conhecido, lacuna intencional, pergunta esperada,
decisões proibidas, resposta simulada do Product Owner e critério de aprovação.
Nunca inclua dados reais de organizações/entrevistas sem permissão explícita.
