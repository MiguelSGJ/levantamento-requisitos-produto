# Guia de contribuição

Obrigado por considerar colaborar. Nosso objetivo é melhorar a qualidade da
descoberta de requisitos, **sem permitir que a IA decida o produto sozinha**.

## Onde contribuir

- Corrigir instruções ambíguas ou conflitantes.
- Adicionar perguntas úteis para outros domínios.
- Melhorar exemplos, cenários de teste e rastreabilidade.
- Melhorar scripts de instalação, validação e automação.
- Expandir documentação e acessibilidade linguística.

Consulte [ROADMAP](docs/ROADMAP.md) e abra issue antes de mudanças grandes.

## Primeira contribuição

1. Abra uma issue e explique problema, contexto e resultado esperado.
2. Faça fork do repositório e crie branch (`feat/nome-da-melhoria` ou
   `fix/nome-do-problema`).
3. Faça alteração **pequena e delimitada**; mantenha exemplos fictícios.
4. Execute os testes:
   ```bash
   python3 scripts/validate_skill.py
   python3 -m unittest discover -s tests -v
   bash tests/test_install.sh
   ```
5. Envie PR preenchendo o template e vinculando a issue.
6. Responda ao feedback de revisão com respeito e registre decisões relevantes.

## Padrões de alteração

- Preserve frontmatter válido (`name` e `description`) no `SKILL.md`.
- Não modifique regras de produto como se fossem universais.
- Use linguagem específica e verificável; evite promessas não mensuráveis.
- Se modificar a metodologia, revise o modelo, o checklist e exemplos afetados.
- Explique limitações; testes automatizados não equivalem a validação semântica.
- Prefira dependências mínimas e ferramentas portáteis.
- Não cole entrevistas reais, PDFs privados, tokens ou credenciais.
- Documente comportamento novo e ofereça caso de teste negativo (lacuna
  que **não** pode virar decisão).

## Requisitos para aprovação de um PR

- Passar CI.
- Mostrar cenário que melhora e eventual impacto na compatibilidade.
- Não introduzir comportamento que invente privilégios, limites ou endpoints.
- Ter documentação e teste compatíveis com a mudança.
- Para mudanças grandes, obter consenso em discussão pública prévia.

## Comunicação e governança

Issues e PRs são o espaço preferencial para discutir propostas. Mantenedores
revisam contribuições quando disponíveis, mas não existe SLA prometido.
Comentários técnicos são bem-vindos, ataques pessoais não; siga
[CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md).

Contribuições enviadas sob esta licença são disponibilizadas nos termos da
[MIT License](LICENSE), salvo indicação expressa em contrário antes da aceitação.
