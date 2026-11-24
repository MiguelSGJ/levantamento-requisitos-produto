# Primeira rodada de descoberta — exemplo fictício

## Resumo do entendimento

O sistema web deve registrar produtos e movimentações de estoque e permitir
consulta ao saldo. A definição dos papéis, regras de movimentação e campos
ainda depende de decisão do responsável pelo produto.

## Confirmado pelo brief

| ID provisório | Informação | Origem | Status |
|---|---|---|---|
| RF-EST-01 | Registrar produtos | Brief, parágrafo 1 | CONFIRMADO |
| RF-EST-02 | Registrar entradas e saídas | Brief, parágrafo 1 | CONFIRMADO |
| RF-EST-03 | Consultar a quantidade disponível | Brief, parágrafo 1 | CONFIRMADO |

Os IDs acima são apenas rótulos iniciais; validações e critérios de aceite
continuam incompletos. **Não** indicam documento aprovado.

## Decisões pendentes prioritárias

| ID | Pergunta | Por que importa | Status |
|---|---|---|---|
| D01 | Quem pode cadastrar, editar ou excluir produtos? | Determina RBAC e responsabilidades | PENDENTE |
| D02 | Quem pode registrar ou corrigir movimentações? | Define autorizações e estornos | PENDENTE |
| D03 | Quais dados compõem um produto? | Define campos e validações | PENDENTE |
| D04 | O estoque terá um único local ou vários depósitos? | Define entidade e cálculo do saldo | PENDENTE |

## Sugestões não aprovadas

- PROPOSTA: trabalhar com histórico de movimentações em vez de alterar saldo
  diretamente, para preservar rastreabilidade. **Aguardar validação.**
- PROPOSTA: incluir relatórios apenas em uma segunda fase. **Aguardar validação.**

## Próxima pergunta para a pessoa responsável

“Quais tipos de pessoas utilizarão o sistema e o que cada uma poderá fazer
com produtos e movimentações? Se preferir, posso organizar as opções em uma
matriz de permissões para você aprovar.”

**Importante:** não criar automaticamente papéis `Administrador`, `Estoquista`
ou `Gerente`; não inventar API ou prazo de retenção.
