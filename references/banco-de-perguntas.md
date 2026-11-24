# Banco de perguntas para levantamento de requisitos

Este arquivo é um repertório para a skill `levantamento-requisitos-produto`. **Não faça todas as perguntas por padrão.** Selecione apenas as que forem relevantes e ainda não estiverem respondidas nas fontes ou na conversa.

## 1. Produto e contexto

- Qual problema o sistema deve resolver?
- Quem sente esse problema e quem será o usuário principal?
- Como o processo funciona hoje?
- Qual resultado deve melhorar com o sistema?
- Como o responsável saberá que o produto teve sucesso?
- Quem é o Product Owner ou responsável por aprovar decisões?
- Há políticas, contratos, normas ou sistemas existentes que precisam ser respeitados?

## 2. Escopo e fases

- O que obrigatoriamente precisa estar disponível no primeiro lançamento?
- O que pode ficar para uma versão posterior?
- O que está explicitamente fora do escopo?
- Há prazo, orçamento ou dependência que limite o escopo?
- Quem aprova a entrada ou retirada de funcionalidades?

## 3. Atores e permissões

- Quais tipos de pessoas ou sistemas interagem com o produto?
- É possível usar o sistema sem conta?
- Quais papéis existem e o que cada um pode fazer?
- Quem atribui e remove papéis?
- Uma pessoa pode acumular papéis?
- Há permissões por organização, equipe, projeto ou registro?
- Quem pode ver dados privados ou internos?
- Quem pode aprovar ações de outras pessoas?
- Uma pessoa pode aprovar o próprio cadastro ou a própria solicitação?
- Há ações que exigem justificativa, dupla aprovação ou MFA?
- Há um número mínimo de administradores ou regra para impedir bloqueio do último administrador?

## 4. Dados e cadastros

- Quais entidades o sistema precisa armazenar?
- Quais campos cada cadastro possui?
- Quais campos são obrigatórios e quais são opcionais?
- Quais validações, formatos, limites e valores permitidos se aplicam?
- Quais dados aparecem publicamente?
- Quais dados ficam visíveis apenas ao titular ou à equipe?
- De onde vêm os dados: usuário, equipe, integração ou cálculo do sistema?
- Quem pode alterar cada campo?
- Existem dados sensíveis ou pessoais? Qual a finalidade e quem pode acessá-los?
- Por quanto tempo cada tipo de dado deve ser mantido?

## 5. Fluxos e estados

- Quais são os estados possíveis de cada processo ou registro?
- Quem pode iniciar cada fluxo?
- Quem pode mudar o estado?
- Quais condições precisam ser atendidas em cada transição?
- O que acontece quando um prazo vence?
- O usuário pode cancelar, editar, reenviar ou pedir revisão?
- Uma ação pode ser revertida?
- Quais etapas são automáticas?
- Como tratar ações simultâneas de dois usuários?
- O que acontece se uma integração falhar durante o fluxo?

## 6. APIs e integrações

- O sistema terá API? Quem irá consumi-la?
- Quais operações precisam ser disponibilizadas?
- Existe padrão técnico já escolhido (REST, GraphQL, RPC, eventos)?
- A API será pública, privada ou interna?
- Como os consumidores serão autenticados?
- Quais papéis ou permissões controlam cada operação?
- Quais dados entram e quais dados saem?
- Há paginação, filtros, ordenação, versionamento ou limites de uso?
- Quais erros precisam ser previstos?
- Alguma operação precisa ser idempotente?
- Há webhooks ou processamento assíncrono?
- Quais serviços externos serão integrados?
- Quem fornece e administra credenciais?
- Qual é o comportamento esperado quando o serviço externo estiver indisponível?
- Existe alternativa manual ou provedor secundário?

## 7. Administração, auditoria e relatórios

- Quais atividades precisam ser realizadas por uma equipe interna?
- Quais listas e configurações precisam ser editáveis?
- Quais ações devem gerar auditoria?
- O histórico deve registrar valores anteriores e novos?
- Quem pode consultar ou exportar auditoria?
- Quais relatórios e indicadores são necessários?
- Quem pode exportar dados e quais campos devem ser omitidos?

## 8. Notificações

- Quais eventos precisam gerar aviso?
- Quem deve receber cada aviso?
- Quais canais são necessários?
- O usuário pode escolher preferências ou cancelar comunicações?
- Há limites de frequência?
- O que acontece se a entrega falhar?
- O sistema precisa guardar histórico de envios?

## 9. Requisitos não funcionais

- Quais são os requisitos de segurança?
- Existem exigências legais, contratuais ou internas de privacidade?
- Quais requisitos de acessibilidade são obrigatórios?
- Qual volume de usuários, registros e acessos é esperado?
- Há metas de desempenho ou disponibilidade?
- Quais dispositivos e navegadores precisam ser suportados?
- Quais são os requisitos de backup e recuperação?
- Quais ambientes serão usados (desenvolvimento, homologação, produção)?
- Quem dará suporte e manterá o sistema?
- Há stack, hospedagem ou padrões técnicos já aprovados?

## 10. Lançamento e governança

- Quem aprova o documento de requisitos?
- Quem valida critérios de aceite?
- Quais conteúdos ou dados precisam existir antes do lançamento?
- Quais integrações, credenciais, domínios ou serviços precisam estar disponíveis?
- Quem será responsável pela operação diária?
- Quais itens bloqueiam desenvolvimento, homologação ou lançamento?
