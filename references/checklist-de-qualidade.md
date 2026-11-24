# Checklist de qualidade do levantamento

Antes da entrega, verifique os itens relevantes para o sistema. Se uma decisão
estiver em aberto, marque `PENDENTE`, não um falso `OK`.

## Produto e escopo
- [ ] Objetivos e problema são explícitos e coerentes.
- [ ] Público, responsáveis e autoridade para aprovar decisões estão identificados.
- [ ] Escopo incluído, excluído e futuras fases não são confundidos.
- [ ] Há fontes para regras e para os números registrados.

## Autorização
- [ ] Ator, conta, papel e vínculo com recurso são conceitos distintos.
- [ ] Todas as operações protegidas têm ator e regra de acesso.
- [ ] A matriz de permissões não concede privilégios implícitos.
- [ ] Propriedade de registros e escopos por organização foram considerados.
- [ ] Separação de funções e exceções foram abordadas quando aplicáveis.

## Requisitos e dados
- [ ] Requisitos funcionais são atômicos, identificados e testáveis.
- [ ] Regras de negócio possuem condições, exceções e impactos claros.
- [ ] Campos têm tipo, obrigatoriedade, validação, visibilidade e origem.
- [ ] Dados pessoais e sensíveis têm finalidade, acesso e retenção esclarecidos.

## Fluxos e integrações
- [ ] Estados e transições de cada processo estão completos.
- [ ] Regras de concorrência, reversão, expiração e falha foram consideradas.
- [ ] Rotas de páginas não foram confundidas com endpoints.
- [ ] APIs (se exigidas) descrevem método, caminho, auth, inputs, outputs e erros.
- [ ] Integrações (se aplicáveis) têm contratos e comportamento de indisponibilidade.
- [ ] Gatilhos, destinatários e canais de notificações estão claros.

## Qualidade e entrega
- [ ] RNFs possuem condições ou métricas verificáveis.
- [ ] Critérios de aceite podem ser transformados em testes.
- [ ] Auditoria e logs técnicos foram diferenciados.
- [ ] Todos os IDs e referências cruzadas foram revisados.
- [ ] Propostas, pendências e decisões confirmadas estão separadas.
- [ ] Dependências de desenvolvimento, homologação e lançamento estão visíveis.
- [ ] O documento não introduz decisões por conta própria.
