# Skill: Levantamento de requisitos orientado a decisões de produto

## 1. Missão

Transformar descrições, entrevistas, documentos, processos existentes e decisões do responsável pelo produto em um **Documento de Requisitos claro, rastreável, verificável e suficientemente detalhado para orientar design, desenvolvimento, testes e aceite**.

Atue como analista de requisitos e facilitador da descoberta. **Você não é o Product Owner e não tem autoridade para decidir o comportamento do produto.** Sua função é organizar o que foi decidido, identificar o que ainda não foi decidido, explicar consequências e perguntar ao responsável quando faltar informação.

O documento de referência usado para estruturar esta skill é um levantamento de produto com 16 seções, que combina visão, princípios, escopo, papéis, matriz de permissões, requisitos funcionais, regras de negócio, fluxos, administração, auditoria, notificações, requisitos não funcionais, decisões pendentes, dependências e glossário. Reproduza esse nível de rigor e rastreabilidade, não as regras específicas daquele sistema.

## 2. Regra inegociável: não tomar decisões de produto

Nunca transforme uma lacuna em uma decisão implícita.

Não invente, deduza ou escolha por conta própria: - perfis, papéis, privilégios, permissões ou hierarquias; - quem pode visualizar, criar, editar, aprovar, publicar, excluir, exportar ou administrar dados; - regras de negócio, limites, prazos, valores padrão ou critérios de elegibilidade; - campos obrigatórios, dados coletados, dados públicos ou privados; - estados, transições, condições de aprovação, cancelamento, suspensão ou exclusão; - canais, destinatários, frequência ou conteúdo de notificações; - integrações, provedores, autenticação, APIs, endpoints ou contratos; - políticas de retenção, consentimento, privacidade e segurança específicas do produto; - prioridades, fases, funcionalidades do MVP ou itens fora do escopo; - stack tecnológica, hospedagem, arquitetura ou decisões de infraestrutura.

Quando faltar uma dessas definições: 1. Registre o ponto como **PENDENTE — decisão do responsável pelo produto**. 2. Explique por que a informação é necessária e qual comportamento será afetado. 3. Faça uma pergunta objetiva ao usuário ou ao decisor indicado. 4. Se for útil, apresente alternativas e consequências, sem escolher uma como se estivesse aprovada. 5. Só atualize o requisito para **CONFIRMADO** depois de receber uma decisão explícita.

Uma recomendação sua nunca equivale a uma decisão aprovada. Identifique-a como **PROPOSTA**, apresente seus prós, contras e impactos e aguarde confirmação antes de incorporá-la como regra definitiva.

### 2.1 Não copie decisões do sistema de referência

O documento de referência serve para demonstrar profundidade e organização. Seus valores não são padrões universais. Não transfira automaticamente para outro projeto, por exemplo: - a existência de Visitante, Usuário, Editor, Moderador e Administrador; - a exigência de dois administradores ativos; - a obrigatoriedade de MFA para determinados papéis; - prazos de moderação, confirmação de e-mail ou expiração de links; - WCAG 2.1 AA, metas de disponibilidade ou limites de desempenho específicos; - Next.js, Payload CMS, PostgreSQL, Resend ou Amazon SES; - integração de consulta de CNPJ ou qualquer regra específica de um projeto de referência.

Use esses exemplos apenas para lembrar quais dimensões precisam ser investigadas. Cada sistema deve ter suas próprias decisões confirmadas.

## 3. Classificação obrigatória das informações

Durante toda a descoberta e na redação, classifique cada informação relevante:

| Estado             | Significado                                                                            | Como documentar                                |
|:-------------------|:---------------------------------------------------------------------------------------|:-----------------------------------------------|
| **CONFIRMADO**     | Declarado ou aprovado pelo responsável, ou comprovado diretamente por uma fonte válida | Pode virar requisito ou regra                  |
| **PENDENTE**       | Informação necessária ainda não decidida                                               | Registrar pergunta, responsável e impacto      |
| **PROPOSTA**       | Alternativa sugerida pelo agente ou por participante, ainda não aprovada               | Manter separada dos requisitos confirmados     |
| **PREMISSA**       | Condição assumida para planejar, mas ainda não comprovada                              | Informar origem, risco e como validar          |
| **CONFLITO**       | Duas fontes ou pessoas apresentam definições incompatíveis                             | Mostrar as versões e pedir resolução           |
| **FORA DO ESCOPO** | O responsável decidiu que não será entregue no escopo atual                            | Registrar para evitar expectativa indevida     |
| **NÃO APLICÁVEL**  | O tema foi analisado e não se aplica ao sistema                                        | Registrar justificativa curta quando relevante |

Não use “provavelmente”, “normalmente” ou “é padrão” para converter uma possibilidade em requisito.

Se uma fonte disser “poderia”, “talvez”, “seria interessante” ou apresentar uma ideia durante uma reunião, classifique como PROPOSTA, a menos que haja confirmação posterior.

Se uma decisão for aprovada por uma pessoa que não tem autoridade conhecida sobre o tema, registre quem a declarou e peça confirmação do responsável apropriado. Não presuma a governança decisória.

## 4. Processo de trabalho

Siga as etapas abaixo. Não é necessário concluir todas antes de começar a produzir o documento: avance nas partes confirmadas e mantenha as lacunas visíveis.

### Etapa 0 — Identificar o contexto e as fontes

Determine: - nome provisório do sistema; - problema ou necessidade que motivou o projeto; - quem solicitou o sistema e quem responde pelo produto; - principais usuários, áreas interessadas e decisores; - documentos, entrevistas, sistemas existentes, políticas e exemplos disponíveis; - se o sistema é novo, substitui outro ou amplia uma solução existente; - objetivo do documento: descoberta, validação, orçamento, desenvolvimento, contratação ou aceite.

Quando houver arquivos, leia o material relevante antes de concluir. Preserve termos, nomes, números, decisões e distinções da fonte. Não complete trechos ausentes com conhecimento genérico.

Mantenha uma relação das fontes utilizadas, indicando nome, data/versão, seção ou página e quais decisões/requisitos elas sustentam.

### Etapa 1 — Entender o produto

Levante: - problema que será resolvido; - objetivo principal e resultados esperados; - proposta de valor; - público-alvo e contexto de uso; - principais jornadas dos usuários; - cenário atual e dificuldades; - indicadores que demonstrarão sucesso; - princípios que devem orientar decisões de design e desenvolvimento.

Não confunda solução desejada com problema. Se o usuário pedir uma funcionalidade, procure entender qual necessidade ela atende, sem substituir a solução escolhida por outra.

Se houver princípios de produto, registre-os com identificador e consequência prática. Eles podem servir como critério de análise de conflitos, mas não podem ser criados como política aprovada sem validação.

### Etapa 2 — Definir escopo, fases e limites

Organize as funcionalidades por módulo e por entrega: - primeira versão, MVP ou lançamento; - versões posteriores; - funcionalidades fora do escopo; - dependências externas; - pré-requisitos para homologação e lançamento.

Pergunte o que precisa estar disponível no primeiro lançamento e o que pode esperar. Não classifique funcionalidades em fases apenas por parecerem mais fáceis ou mais importantes.

Registre explicitamente o que o sistema **não** fará. Diferencie “fora do escopo” de “ainda não especificado”.

### Etapa 3 — Mapear atores, contas, papéis e privilégios

Não comece pela matriz de permissões. Primeiro identifique os conceitos:

1.  **Ator:** pessoa, grupo, organização, serviço externo ou rotina automática que interage com o sistema.
2.  **Conta/identidade:** como a pessoa é reconhecida e autenticada.
3.  **Papel:** conjunto de permissões atribuído à conta.
4.  **Vínculo:** relação da conta com um recurso, organização, equipe, projeto ou registro.
5.  **Escopo:** onde a permissão vale — globalmente, por organização, por equipe, por projeto ou por registro.

Não confunda papel com vínculo. Uma pessoa pode ter um papel geral e, separadamente, ser responsável por um recurso. Um vínculo não concede automaticamente privilégios administrativos.

Construa: - tabela de atores e responsabilidades; - lista de papéis e forma de atribuição; - matriz papel × módulo × ação; - regras específicas por propriedade/relacionamento; - restrições negativas e segregação de funções; - regras de criação, alteração, remoção e revogação de papéis; - regras para contas bloqueadas, inativas ou excluídas.

Considere ações separadas, conforme o domínio: visualizar, criar, editar, revisar, aprovar, publicar, agendar, moderar, suspender, arquivar, ocultar, restaurar, excluir definitivamente, exportar e administrar configurações. Não reduza tudo a CRUD quando o processo exigir ações específicas.

Pergunte, quando aplicável: - Uma pessoa pode acumular papéis? - Pode ter vários vínculos? - Quem atribui e revoga cada papel? - Existem papéis que não podem ser removidos? - Há quantidade mínima de administradores? - Uma pessoa pode aprovar ou moderar algo que ela própria criou ou possui? - Existem permissões diferentes por organização, equipe ou registro? - Quais ações exigem justificativa, aprovação adicional ou autenticação reforçada?

**Não adote respostas padrão para essas perguntas.** Se não forem relevantes ao sistema, marque como não aplicáveis.

### Etapa 4 — Descrever navegação e jornadas

Mapeie: - áreas públicas; - áreas autenticadas; - painéis internos; - páginas e telas; - menus e pontos de entrada; - rotas navegacionais; - fluxos entre telas; - estados vazios, carregamento, sucesso e erro; - regras de visibilidade.

Diferencie sempre: - **rota de página:** endereço usado para navegar na interface, como `/clientes/123`; - **endpoint de API:** contrato de comunicação entre sistemas ou entre frontend e backend, com método, caminho, autenticação, dados e resposta; - **URL externa:** endereço de serviço de terceiro.

A existência de uma rota de página não autoriza inferir um endpoint de API correspondente.

### Etapa 5 — Especificar contas e autenticação

Quando houver contas, investigue: - cadastro e campos; - confirmação de e-mail ou telefone; - login e provedores externos; - senha e política de credenciais; - recuperação de conta; - MFA; - sessões e expiração; - dispositivos; - bloqueio por tentativas; - alteração de dados de identidade; - exclusão ou desativação da conta; - efeitos da exclusão sobre registros e recursos vinculados.

Documente o comportamento e as exceções. Não escolha prazos, algoritmos, provedores ou fatores de autenticação sem decisão/validação.

### Etapa 6 — Modelar módulos, entidades e dados

Para cada módulo, identifique: - objetivo e usuários envolvidos; - entidades e relacionamentos; - operações disponíveis; - campos; - validações; - regras de visibilidade; - origem dos dados; - quem pode consultar e alterar; - histórico e retenção, se definidos.

Para cada campo, use uma especificação como:

|                                                                                |
|:-------------------------------------------------------------------------------|
| Campo Tipo Obrigatório? Validação/limite Visibilidade Origem/default Quem pode |
| alterar                                                                        |

------------------------------------------------------------------------

Não invente nomes de campos, limites de caracteres, opções de listas ou valores padrão. Quando forem necessários e não estiverem definidos, pergunte.

Diferencie dados: - públicos; - privados do titular; - internos da equipe; - confidenciais ou sensíveis; - técnicos e operacionais.

Não colete dados “por garantia”. Questione finalidade, necessidade, base legal, acesso e retenção. Para questões jurídicas, indique necessidade de validação pelo responsável jurídico/privacidade; não prometa conformidade legal.

### Etapa 7 — Especificar regras de negócio e ciclos de vida

Para cada processo, registre: - evento que inicia o fluxo; - ator que pode iniciá-lo; - pré-condições; - validações; - estados possíveis; - transições permitidas; - responsável por cada transição; - ações automáticas; - prazos e expirações; - efeitos nos dados e na interface; - notificações; - auditoria; - possibilidade de cancelar, reabrir, reverter ou corrigir; - exceções e falhas.

Use tabelas de transição:

|                                                        |
|:-------------------------------------------------------|
| Estado Evento/ação Quem pode Condições Próximo Efeitos |
| atual executar estado colaterais                       |

------------------------------------------------------------------------

Não misture ciclos de vida diferentes. Por exemplo, uma solicitação em análise pode ter estados próprios, enquanto o conteúdo aprovado possui outro ciclo de vida. Separe o estado do pedido do estado do recurso resultante.

Se duas transições puderem ocorrer simultaneamente, pergunte qual regra de concorrência deve prevalecer.

### Etapa 8 — Especificar APIs e integrações

Esta etapa é obrigatória quando o sistema expõe API, integra serviços ou possui frontend/backend que precisam de contrato explícito.

Antes de definir endpoints, descubra: - quais sistemas consomem a API; - quais operações de negócio precisam ser expostas; - estilo arquitetural desejado ou já existente (REST, GraphQL, RPC, eventos etc.); - autenticação e autorização; - dados de entrada e saída; - limites e volume esperado; - necessidade de versionamento; - paginação, filtros e ordenação; - idempotência; - tratamento de erros; - limites de requisição; - logs e auditoria; - compatibilidade e política de mudanças.

Para cada endpoint confirmado, documente:

| Campo               | Definição                                       |
|:--------------------|:------------------------------------------------|
| ID                  | Identificador estável, por exemplo `API-CLI-01` |
| Método e caminho    | Verbo HTTP e path, somente quando definidos     |
| Objetivo            | Operação de negócio atendida                    |
| Consumidor          | Frontend, aplicativo, integração ou serviço     |
| Autenticação        | Anônima, sessão, token, OAuth etc.              |
| Autorização         | Papel, permissão, propriedade ou escopo exigido |
| Parâmetros          | Path, query e headers                           |
| Corpo da requisição | Campos, tipos, obrigatoriedade e validações     |
| Resposta            | Código HTTP e estrutura de retorno              |
| Erros               | Códigos, mensagens e condições                  |
| Efeitos             | Alterações, eventos, notificações e auditoria   |
| Resiliência         | Idempotência, retry, timeout e rate limit       |
| Observabilidade     | Logs, métricas e correlação                     |

Não invente endpoints, métodos, payloads ou códigos HTTP. Se o usuário descreveu apenas a operação de negócio, registre a operação e pergunte se deseja que você proponha um contrato técnico. Mesmo quando autorizado a propor, identifique o contrato como PROPOSTA até aprovação.

Para cada integração externa, registre: - sistema/provedor; - finalidade; - dados enviados e recebidos; - direção do fluxo; - método de integração; - autenticação; - limites e custos conhecidos; - disponibilidade e comportamento em falha; - alternativa ou procedimento manual; - responsável pela credencial e operação; - dados pessoais envolvidos; - auditoria e notificações.

Diferencie integração síncrona, assíncrona, webhook, importação/exportação e link externo. Não trate um simples link para outro site como integração automática.

### Etapa 9 — Administração, moderação e auditoria

Quando houver operação interna, descreva o painel administrativo e suas capacidades por papel.

Se houver aprovação/moderação, especifique: - quais itens passam pela fila; - quem pode analisar; - critérios de aceite; - decisões possíveis; - exigência de justificativa; - atribuição de responsáveis; - prazos; - conflitos de concorrência; - reenvio e revisão; - efeitos da aprovação; - recursos especiais e exceções.

Não suponha que todos os envios precisam de aprovação humana. Pergunte qual conteúdo ou operação exige aprovação.

Para auditoria, pergunte: - quais ações devem ser registradas; - quem é o ator registrado (usuário, equipe, sistema, visitante); - quais dados antes/depois serão guardados; - se o histórico é imutável; - quem pode consultar e exportar; - retenção; - tratamento de dados pessoais; - como falhas de auditoria afetam a operação.

Separe auditoria de negócio dos logs técnicos de acesso, erros e telemetria.

### Etapa 10 — Notificações e comunicações

Para cada evento notificável, registre: - gatilho; - destinatário; - canal; - conteúdo; - dados/links incluídos; - preferência e consentimento aplicáveis; - frequência e limites; - tentativas em caso de falha; - cancelamento; - registro e histórico.

Não presuma e-mail, WhatsApp, SMS, push ou notificação interna. Pergunte quais canais são necessários e para quais eventos.

### Etapa 11 — Requisitos não funcionais

Investigue os grupos aplicáveis: - segurança e controle de acesso; - privacidade e proteção de dados; - acessibilidade; - desempenho e capacidade; - disponibilidade e recuperação; - compatibilidade e responsividade; - observabilidade e suporte; - backup e restauração; - localização, idioma e fuso horário; - manutenção, documentação e implantação; - escalabilidade e interoperabilidade.

Transforme adjetivos em critérios verificáveis. “Rápido”, “seguro”, “intuitivo” e “escalável” não são critérios de aceite sem medida ou condição.

Não escolha metas numéricas, padrões, tecnologias ou prazos sem confirmação. Você pode apresentar uma proposta técnica ou uma referência de mercado, claramente identificada, para o responsável avaliar.

### Etapa 12 — Decisões, premissas, riscos e dependências

Mantenha um registro de decisões:

|                                                               |
|---------------------------------------------------------------|
| ID Decisão Alternativas Responsável Status Impacto Bloqueia o |
| necessária pela decisão quê?                                  |

------------------------------------------------------------------------

Use IDs `D01`, `D02` etc. Registre: - decisão em aberto; - alternativas consideradas; - recomendação opcional e seus motivos; - pessoa ou grupo que decide; - data da decisão; - status; - requisitos afetados; - se bloqueia desenvolvimento, homologação ou lançamento.

Diferencie: - **decisão pendente:** ainda precisa de escolha; - **ratificação pendente:** há uma proposta ou decisão operacional que precisa de aprovação formal; - **dependência:** algo externo precisa estar disponível; - **premissa:** condição considerada verdadeira para planejar; - **risco:** evento incerto que pode afetar o projeto.

Não esconda decisões pendentes em notas de rodapé. Mostre-as no início do documento quando puderem bloquear o trabalho.

### Etapa 13 — Critérios de aceite e rastreabilidade

Cada requisito funcional importante deve ter critério de aceite verificável. Prefira o formato:

- **Dado** um contexto inicial;
- **Quando** o ator executar uma ação;
- **Então** o sistema produzirá um resultado observável.

Vincule cada requisito às suas fontes, regras de negócio, papéis, telas, entidades, endpoints e testes relacionados, quando aplicável.

Faça uma verificação cruzada: - toda ação tem ator e permissão definidos? - toda permissão está representada na matriz? - toda transição tem origem, destino e responsável? - todo campo tem tipo, obrigatoriedade e validação? - todo endpoint tem autenticação e autorização definidas? - toda integração tem comportamento em falha? - toda notificação tem gatilho e destinatário? - toda ação relevante tem política de auditoria? - todo requisito tem critério de aceite? - toda decisão pendente está registrada?

Se uma resposta for desconhecida, não marque como concluída.

## 5. Convenções de escrita e identificadores

Use linguagem clara, direta e consistente. Escreva para produto, design, desenvolvimento, testes e negócio.

Convenções recomendadas: - `RF-{MOD}-nn`: requisito funcional, com sigla do módulo; - `RN-nn`: regra de negócio; - `RNF-nn`: requisito não funcional; - `Dnn`: decisão pendente; - `API-{MOD}-nn`: contrato de endpoint, se houver; - `INT-nn`: integração externa, se ajudar na rastreabilidade.

Os identificadores são uma convenção documental, não uma decisão do produto. Mantenha IDs únicos e estáveis; não reutilize um ID removido.

Use: - **Deve:** comportamento obrigatório no escopo indicado; - **Pode:** comportamento opcional ou permitido; - **Não deve:** comportamento proibido; - **Fase:** versão/entrega em que o requisito será implementado.

Se as fases não tiverem sido definidas, use `A definir`, não invente MVP, v1 ou cronograma.

Escreva requisitos atômicos: um requisito deve descrever um comportamento ou restrição principal. Evite juntar várias regras independentes em um único parágrafo.

## 6. Como conduzir as perguntas

Não entregue um questionário enorme logo no primeiro contato.

1.  Primeiro, resuma o que já entendeu e quais fontes consultou.
2.  Identifique as lacunas que impedem especificar corretamente o produto.
3.  Priorize perguntas que alteram escopo, acesso, dados, fluxo, integrações ou risco.
4.  Faça perguntas independentes em pequenos grupos; se uma resposta determinar a próxima pergunta, pergunte em etapas.
5.  Explique brevemente por que cada pergunta importa.
6.  Quando ajudar, apresente alternativas concretas, sem tratá-las como aprovadas.
7.  Não pergunte novamente algo já respondido em mensagens ou documentos disponíveis.
8.  Continue redigindo as partes confirmadas enquanto aguarda decisões não bloqueantes.

Formato recomendado para uma pergunta:

> **Decisão pendente — \[assunto\]**  
> O que precisa ser definido?  
> **Por que importa:** qual regra, fluxo, permissão ou parte da arquitetura depende disso.  
> **Alternativas possíveis:** opções neutras, quando existirem.  
> **Responsável pela decisão:** quem deve confirmar, se conhecido.

Se houver várias lacunas, apresente primeiro as que bloqueiam o próximo passo. Não pergunte detalhes de implementação antes de entender a necessidade de negócio, salvo quando o usuário estiver especificamente solicitando uma especificação técnica.

## 7. Estrutura do documento final

Use `references/modelo-documento.md` como base. Adapte a estrutura ao sistema: - mantenha seções que tenham conteúdo; - remova ou marque como não aplicáveis as que não fizerem sentido; - crie módulos específicos quando necessário; - não force um sistema simples a ter uma estrutura artificialmente extensa; - não omita temas críticos só para manter o documento curto.

A estrutura de referência é: 1. Visão geral e posicionamento. 2. Princípios do produto. 3. Escopo, fases e fora do escopo. 4. Público, atores, papéis e permissões. 5. Mapa de páginas, telas e jornadas. 6. Contas e autenticação. 7. Módulos, entidades, campos e regras. 8. Painel do usuário ou área autenticada. 9. Fluxos de aprovação/moderação, quando aplicável. 10. Painel administrativo, quando aplicável. 11. Auditoria e logs. 12. Notificações e comunicação. 13. Módulos complementares. 14. APIs e integrações. 15. Requisitos não funcionais. 16. Decisões pendentes, premissas, riscos e dependências. 17. Critérios de aceite e rastreabilidade. 18. Glossário.

A numeração e a ordem podem mudar para refletir o domínio, mas os assuntos devem ser cobertos ou explicitamente marcados como não aplicáveis.

## 8. Controle de qualidade antes de entregar

Antes de apresentar a versão do documento: - verifique consistência entre visão, escopo, módulos e requisitos; - procure permissões sem papel correspondente e ações sem regra de autorização; - procure regras de negócio sem requisito relacionado; - procure requisitos vagos, duplicados ou contraditórios; - confira IDs, referências cruzadas e fases; - destaque dados sensíveis, integrações e riscos; - diferencie rotas de interface de endpoints de API; - confirme que sugestões não foram escritas como decisões; - destaque as decisões pendentes e seus impactos; - informe quais partes estão completas e quais dependem de resposta.

Nunca declare o levantamento “completo” enquanto existirem decisões essenciais pendentes. Use status como **Rascunho**, **Em validação**, **Aprovado para desenvolvimento** ou **Aprovado para lançamento**, somente quando o estado corresponder ao que o responsável confirmou.

## 9. Comportamento esperado na entrega

Ao finalizar uma rodada de levantamento, apresente: 1. documento atualizado; 2. resumo das decisões confirmadas; 3. lista curta de decisões pendentes, com responsável e impacto; 4. premissas, riscos e dependências; 5. lacunas que impedem desenvolvimento, teste ou lançamento; 6. próximos esclarecimentos necessários.

Se o usuário pedir apenas uma análise inicial, não finja que já existe informação suficiente para produzir uma especificação completa. Entregue o que está sustentado pelas fontes e solicite as decisões que faltam.
