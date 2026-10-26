# Decisões de projeto

As escolhas que moldam o Orquestra, com o motivo de cada uma. Elas existem para mostrar o raciocínio por trás do app:
o que foi decidido, por quê, e o que ficou de fora de propósito.

## Arquitetura

**1. Os agentes nunca conversam diretamente.** Tudo passa por um broker dentro do app. Assim existe um contrato, um registro
de tudo, limites de turnos e um ponto único onde a aprovação humana acontece.

**2. O conteúdo das mensagens nunca é digitado no terminal.** Digitar texto no terminal de outro programa é frágil
(foco, formatação, tamanho) e perigoso (o texto vira prompt). O terminal serve para **observar e intervir**. Quando há
mensagem nova, o app digita só uma linha curta e fixa ("você tem N mensagem(ns), chame `read_inbox`") e o agente busca o
conteúdo por uma ferramenta MCP.

**3. Relatório é dado, não ordem.** O que um agente devolve chega marcado como informação. Ações arriscadas continuam
indo para a fila de aprovação. É a defesa contra injeção de prompt entre agentes.

**4. Um único servidor MCP, só em `127.0.0.1`, com rota e token por agente.** Um servidor por agente gastaria memória e
MCP por stdio exigiria um processo extra para cada um. Uma porta local e um token aleatório por agente, revogado quando o
processo termina, resolvem com menos peças.

**5. Terminais reais (pseudoterminal), não uma caixa de chat.** O valor está em usar a CLI exatamente como ela é: tudo o que
ela faz hoje e passar a fazer amanhã continua funcionando sem o app precisar reimplementar nada.

**6. Electron.** O app precisa de terminais reais, processos filhos, git, SQLite e um servidor local: tudo isso é natural
no Node. Terminal no navegador (xterm.js + node-pty) é a mesma base do terminal do VS Code. Trocar de tecnologia custaria
reescrever o processo principal inteiro sem ganho visível para quem usa.

## Segurança e isolamento

**7. Um git worktree por agente que escreve.** O repositório principal não é tocado, e dois agentes não se atropelam. O
isolamento mais forte (Docker por agente) foi adiado de propósito para não inflar o início.

**8. O app não faz merge.** O que cada agente produziu fica na branch dele, e você decide o que entra. O app só mostra
o estado.

**9. Histórico imutável.** Mensagens e eventos ficam em SQLite com gatilhos que impedem apagar ou reescrever o passado
(o status de uma mensagem muda; o conteúdo só pode ser editado enquanto ela espera aprovação). Quem audita confia no que
vê.

**10. Aprovação humana por padrão.** A seta de mensagem tem um modo (`ask` por padrão, `auto` ou `outside`). Os modelos
prontos criam setas com `ask`. "Permissões Totais" existe para quem quer, mas exige confirmação explícita e não passa por
cima das mensagens seguradas por limite.

**11. Nunca mostrar nem controlar custo.** Cada CLI roda na conta e nos limites de quem usa. O app limita **turnos e
tempo**, que são a proteção real contra laços entre agentes.

## Experiência

**12. Terminal como protagonista.** Pouca moldura, notas autoadesivas, sem painéis fixos nem selos de decoração. O canvas
é o espaço de trabalho; a fila e os modais aparecem quando precisam.

**13. A nota de briefing define o papel.** Zonas no canvas são só visuais, sem papel nem permissão. Quem diz o que um agente
é e faz é a nota ligada a ele por uma seta.

**14. Cada tarefa começa numa conversa nova.** O que mais enche a janela de contexto do agente é carregar o histórico de
tarefas anteriores. Por padrão o agente recomeça limpo a cada tarefa, e o terminal mostra quanto texto de mensagens ele já
recebeu.

**15. Vários workspaces, sem estado global.** Cada workspace vive na pasta que você escolhe, com seu próprio banco; trocar
de aba não pausa os agentes.

## Como o projeto é construído

Código e commits em inglês; interface e documentos em português do Brasil. Os tipos compartilhados entre a interface e o
processo principal ficam num único lugar, com regras puras testáveis sem Electron. A suíte tem mais de 300 testes, incluindo
terminal e git de verdade em pastas temporárias. Um agente de IA ajuda a escrever o código, mas cada etapa é revisada,
testada e só segue com a aprovação do autor.
