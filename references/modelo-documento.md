# Documento de Requisitos — [Nome do Sistema]

> **Status:** [Rascunho / Em validação / Aprovado para desenvolvimento / Aprovado para lançamento]  
> **Versão:** [v0.1]  
> **Data:** [dd/mm/aaaa]  
> **Responsável pelo produto:** [nome/papel]  
> **Elaboração:** [responsável]  
> **Fontes:** [documentos, entrevistas, reuniões, sistemas existentes]

## 1. Visão geral

### 1.1 Contexto e problema

[Qual problema existe? Quem é afetado? Como é resolvido hoje?]

### 1.2 Objetivo do sistema

[O que o produto deve permitir ou melhorar?]

### 1.3 Público e proposta de valor

[Quem usa, quem se beneficia e em qual contexto?]

### 1.4 Princípios do produto

| ID  | Princípio confirmado | Consequência prática      |
|:----|:---------------------|:--------------------------|
| P1  | [descrição]        | [como orienta decisões] |

## 2. Escopo e fases

| Módulo/entrega | Escopo                  | Fase          | Dependências     | Status                  |
|:---------------|:------------------------|:--------------|:-----------------|:------------------------|
| [módulo]     | [o que será entregue] | [a definir] | [dependências] | [confirmado/pendente] |

### 2.1 Fora do escopo

- [Item explicitamente excluído e motivo]

### 2.2 Evoluções futuras

- [Ideia futura, sem compromisso de entrega]

## 3. Atores, perfis e permissões

### 3.1 Atores

| Ator     | Objetivo     | Responsabilidades     | Como obtém acesso |
|:---------|:-------------|:----------------------|:------------------|
| [ator] | [objetivo] | [responsabilidades] | [regra]         |

### 3.2 Papéis

| Papel     | Quem pode recebê-lo | Quem atribui/remove | Escopo                  |
|:----------|:--------------------|:--------------------|:------------------------|
| [papel] | [critério]        | [responsável]     | [global/recurso/etc.] |

### 3.3 Vínculos e propriedade de recursos

[Descrever relações que não são papéis administrativos.]

### 3.4 Matriz de permissões

| Ação                           | Papel 1 | Papel 2 | Papel 3 | Vínculo/escopo | Observações |
|:-------------------------------|----------:|--------:|--------:|--------:|--------------:|
| Visualizar [recurso]         |     [ ] |   [ ] |   [ ] |   [ ] |         [ ] |
| Criar [recurso]              |     [ ] |   [ ] |   [ ] |   [ ] |         [ ] |
| Editar [recurso]             |     [ ] |   [ ] |   [ ] |   [ ] |         [ ] |
| Aprovar/publicar               |     [ ] |   [ ] |   [ ] |   [ ] |         [ ] |
| Excluir/restaurar              |     [ ] |   [ ] |   [ ] |   [ ] |         [ ] |
| Exportar                       |     [ ] |   [ ] |   [ ] |   [ ] |         [ ] |
| Gerenciar papéis/configurações |     [ ] |   [ ] |   [ ] |   [ ] |         [ ] |

> Os papéis são **placeholders**, não padrões obrigatórios. Renomeie e acrescente colunas somente depois de confirmar os perfis reais. Diferencie permissões globais de permissões condicionadas ao vínculo ou à propriedade do recurso.

### 3.5 Regras de autorização

- [RN] [Regra confirmada]
- [PENDENTE] [Regra ainda não decidida]

## 4. Mapa de páginas, telas e jornadas

| Área     | Rota de navegação | Objetivo     | Acesso                    | Origem dos dados |
|:---------|:------------------|:-------------|:--------------------------|:-----------------|
| [área] | [rota]          | [objetivo] | [público/privado/papel] | [módulo]       |

### 4.1 Jornadas principais

1.  [Ator] inicia [ação].
2.  Sistema valida [condições].
3.  [Resultado ou próxima etapa].

## 5. Contas e autenticação

### 5.1 Cadastro e identidade

[Campos, validações e regras confirmadas.]

### 5.2 Login e provedores

[Métodos de autenticação e regras.]

### 5.3 Recuperação, sessões e segurança da conta

[Fluxos, prazos e exceções.]

### 5.4 Gestão e exclusão de conta

[Efeitos sobre dados, vínculos, histórico e recursos.]

## 6. Módulos e requisitos funcionais

### 6.1 [Nome do módulo]

**Objetivo:** [objetivo do módulo]  
**Atores:** [atores]  
**Fase:** [confirmada ou a definir]

#### Campos e dados

| Campo     | Tipo     | Obrigatório? | Validação/limite | Visibilidade                | Origem/default | Quem altera |
|:----------|:---------|:-------------|:-----------------|:----------------------------|:---------------|-------------|
| [campo] | [tipo] | [sim/não]  | [regra]        | [público/privado/interno] | [origem]     | [papel]   |

#### Requisitos funcionais

| ID            | Requisito                                          | Fase     | Fonte     | Status                  | Critério de aceite        |
|:--------------|:---------------------------------------------------|:---------|:----------|:------------------------|:--------------------------|
| RF-[MOD]-01 | O sistema deve [comportamento único e testável]. | [fase] | [fonte] | [confirmado/pendente] | [resultado verificável] |

#### Regras de negócio

- **RN-01 — [Nome]:** [regra, condições e exceções].

## 7. Fluxos e ciclos de vida

### 7.1 Estados

| Estado     | Significado     | Visível para | Como entra/sai |
|:-----------|:----------------|:-------------|:---------------|
| [estado] | [significado] | [atores]   | [transição]  |

### 7.2 Transições

| Estado atual | Evento/ação | Ator autorizado | Condições     | Próximo estado | Efeitos     |
|--------------|:------------|:----------------|:--------------|:---------------|:------------|
| [estado]   | [evento]  | [ator]        | [condições] | [estado]     | [efeitos] |

### 7.3 Exceções e concorrência

[Cancelamento, reabertura, falhas, ações simultâneas, expiração e reversão.]

## 8. Área do usuário

[Dados, recursos, histórico, ações, limites e regras de acesso.]

## 9. Aprovação/moderação (se aplicável)

[Itens que passam por aprovação, fila, responsáveis, critérios, decisões, prazos, reenvio e exceções.]

## 10. Painel administrativo (se aplicável)

[Gestão de módulos, usuários, papéis, configurações, listas, relatórios e exportações.]

## 11. Auditoria e logs

| Ação/evento | Quem é registrado | Dados registrados | Quem consulta | Retenção             |
|:------------|:------------------|:------------------|:--------------|:---------------------|
| [ação]    | [ator/sistema]  | [campos]        | [papéis]    | [prazo confirmado] |

[Descrever imutabilidade, antes/depois, falhas, anonimização e separação entre auditoria e logs técnicos.]

## 12. Notificações

| Gatilho    | Destinatário     | Canal     | Conteúdo     | Preferências/limites | Retentativas |
|:-----------|:-----------------|:----------|:-------------|:---------------------|:-------------|
| [evento] | [destinatário] | [canal] | [conteúdo] | [regra]            | [regra]    |

## 13. APIs e integrações

> Esta seção descreve contratos de API. Não confundir com rotas de navegação da interface.

### 13.1 Endpoints

| ID             | Método        | Caminho       | Operação     | Autenticação  | Autorização   | Status       |
|:---------------|:--------------|:--------------|:-------------|:--------------|:--------------|:-------------|
| API-[MOD]-01 | [a definir] | [a definir] | [operação] | [a definir] | [a definir] | [pendente] |

Para cada endpoint, detalhar parâmetros, corpo, resposta, erros, validações, efeitos colaterais, idempotência, rate limit e auditoria.

### 13.2 Integrações externas

| Sistema/provedor | Finalidade     | Dados trocados | Direção                        | Autenticação | Falhas/alternativa | Responsável     |
|:-----------------|:---------------|:---------------|:-------------------------------|:-------------|:-------------------|:----------------|
| [integração]   | [finalidade] | [dados]      | [entrada/saída/bidirecional] | [método]   | [comportamento]  | [responsável] |

## 14. Requisitos não funcionais

| ID     | Categoria      | Requisito mensurável    | Como verificar         | Status     |
|:-------|:---------------|:------------------------|:-----------------------|:-----------|
| RNF-01 | Segurança      | [critério confirmado] | [teste/evidência]    | [status] |
| RNF-02 | Desempenho     | [meta confirmada]     | [métrica/ferramenta] | [status] |
| RNF-03 | Acessibilidade | [critério confirmado] | [teste]              | [status] |
| RNF-04 | Operação       | [critério confirmado] | [teste/evidência]    | [status] |

## 15. Decisões pendentes, premissas, riscos e dependências

### 15.1 Decisões pendentes

| ID  | Decisão     | Alternativas | Quem decide     | Impacto     | Bloqueia  | Status   |
|:----|:------------|:-------------|:----------------|:------------|:----------|:---------|
| D01 | [decisão] | [opções]   | [responsável] | [impacto] | [etapa] | Pendente |

### 15.2 Premissas

| Premissa     | Origem     | Como validar  | Risco se estiver errada |
|:-------------|:-----------|:--------------|:------------------------|
| [premissa] | [origem] | [validação] | [risco]               |

### 15.3 Dependências

- [ ] [dependência, responsável e data necessária]

### 15.4 Riscos

| Risco     | Probabilidade/impacto | Mitigação proposta | Responsável     |
|:----------|:----------------------|:-------------------|:----------------|
| [risco] | [avaliação]         | [ação]           | [responsável] |

## 16. Critérios de aceite gerais

- [ ] [critério verificável]
- [ ] [critério verificável]

## 17. Glossário

| Termo     | Significado no contexto deste sistema |
|:----------|:--------------------------------------|
| [termo] | [definição]                         |

## 18. Histórico de versões e aprovações

| Versão | Data     | Autor     | Alterações     | Aprovado por |
|:-------|:---------|:----------|:---------------|:-------------|
| v0.1   | [data] | [autor] | [alterações] | [pendente] |
