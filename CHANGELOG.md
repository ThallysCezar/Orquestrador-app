# Histórico de versões

Formato: o que muda para quem usa. Datas só onde o histórico do código as confirma (o repositório do código começa em 24/10/2026;
as versões 0.1 a 0.3 são anteriores a ele).

## 0.8.2 (26/10/2026)
- **Linux: o AppImage voltou a abrir.** Os AppImages das versões 0.6.0 a 0.8.1 saíram sem um componente necessário e fechavam na
  abertura com o erro "Cannot find module 'electron-updater'". Quem baixou o Linux dessas versões deve baixar esta. O Windows não foi afetado.
- **Setas:** arrastar um trecho de uma seta passa a funcionar também quando o mouse sai de cima dela; um clique na seta só a seleciona,
  e o menu fica no botão direito. O destaque da ferramenta ativa na barra de ferramentas ficou igual ao da barra de andares.

## 0.8.1 (26/10/2026)
- **Setas sem diagonais:** ao mover um bloco, as setas ligadas a ele voltam ao caminho automático (antes, os pontos de desvio que você tinha
  posto ficavam no lugar antigo e a seta virava uma diagonal esquisita). Setas já salvas com pontos antigos também passam a ser desenhadas
  só com linhas retas.
- **Menu de andares reformulado:** cada andar aparece numa lista com o número, o andar atual marcado, ações de subir, descer, renomear e
  excluir agrupadas, e o botão "+ Novo andar" no fim. Funciona nos temas claro e escuro (o botão "+ Novo andar" estava difícil de ler no tema claro).

## 0.8.0 (26/10/2026)
- **Pasta em formato de cartão:** cada pasta do canvas agora mostra o tipo (repositório Git, documentos ou Maestro), a subpasta de saída,
  o **caminho real no disco** (com botões para copiar e abrir a pasta), os agentes ligados a ela com a permissão de cada um (`rw` ou `ro`)
  e quantos arquivos foram alterados. Clicar nas alterações abre o explorador de Git e Worktrees.
- O terminal de cada agente mostra, no rodapé, a pasta ou as pastas ligadas a ele (ou "sem pasta").
- O cartão acompanha o tema claro e o escuro. Workspaces antigos continuam funcionando: o cartão ajusta a própria altura, e o "Organizar" já conta com ele.

## 0.6.3 (26/10/2026)
- **Editor de notas dividindo a tela:** o editor lateral deixou de cobrir o canvas e agora empurra o canvas para o lado, para você
  ver os dois ao mesmo tempo.
- **Quebra de linha automática** no editor, com botão *Wrap* e atalho `Alt+Z`; os números de linha acompanham as linhas quebradas.

## 0.7.1 (26/10/2026)
- **Controles de andar no canto inferior esquerdo:** o seletor de andar (com o número), o botão "+ Andar", a vista empilhada, o mapa
  e o ajuste à tela agora ficam juntos numa barra no canto inferior esquerdo, no mesmo estilo da barra de ferramentas. A pílula do andar
  saiu da barra superior.
- Em janelas estreitas (abaixo de uns 1180 px) a barra de andares sobe para ficar acima da barra de ferramentas, sem cobrir os botões
  Terminal e Nota.
- Tema claro: o número do andar atual e os selos amarelos ficaram legíveis.

## 0.7.0 (26/10/2026)
- **Ícones novos:** todos os emojis da interface foram trocados por um único conjunto de ícones, no mesmo estilo e com a mesma
  aparência no Windows e no Linux. As bolinhas de status (ligados, ociosos, parados) agora são desenhadas pelo app.
- **Tema claro corrigido:** o comando que você aprova na fila estava quase invisível, e os botões Aprovar e Permitir, a barra superior,
  os selos e vários menus também. Agora todos os textos têm contraste legível nos dois temas.
- **Nome do agente visível no tema claro** (antes ficava escuro sobre o bloco escuro do terminal).
- **Editor de notas:** a barra de status inferior ficou legível (o texto azul sobre azul sumia nos dois temas).
- Tamanhos de letra e cantos arredondados padronizados em toda a interface (diferenças pequenas, de até 2 px).

## 0.6.2 (26/10/2026)
- **Ícone novo:** uma batuta ligando dois terminais, com formas mais grossas para continuar legível em tamanhos pequenos.
- A verificação automática de atualizações agora acontece cerca de 3 segundos depois de abrir o app (antes, 20 s).

## 0.6.1 (26/10/2026)
- Versão de teste do ciclo de atualização automática: não traz mudança de funcionalidade. Quem está na 0.6.0 deve receber o aviso
  de versão nova e conseguir atualizar por dentro do app.

## 0.6.0 (26/10/2026)
- **Atualização automática:** o app verifica as Releases deste repositório ao abrir e a cada poucas horas, e avisa quando há versão nova
  (**Baixar e instalar**, **Ver novidades**, **Depois**). Nada é baixado nem instalado sem a sua confirmação; o app confere a
  integridade (SHA-512) e a assinatura do instalador. Dá para desligar em *Configurações do app*, e há "Verificar atualizações" na paleta (`Ctrl+K`).
  Versões anteriores à 0.6.0 não se atualizam sozinhas: instale esta uma vez à mão.
- Paleta de comandos (`Ctrl+K`), modo foco no agente e visão espacial dos andares.
- Visualizador de diff do worktree de cada agente e merge de um clique, com confirmação.
- Novo ícone do app.
- Correção: criar o primeiro workspace podia deixar a tela em branco (ordem dos hooks do React).

## 0.5.1 (26/10/2026)
- **Editor lateral de notas** em Markdown (código, prévia ou dividido; `Ctrl+S` salva). Avisa quando a nota está ligada a um
  arquivo `.md`, porque nesse caso o agente lê o arquivo, não o texto do editor.
- Barra de espaço volta a ativar botões e links focados.

## 0.5.0 (26/10/2026)
- Setas ortogonais com vértices arrastáveis, âncora automática ou manual em cada ponta e estilo de seta por workspace.
- Linhas-guia e encaixe ao mover e redimensionar; camadas (trazer para frente / enviar para trás).
- Menu de contexto do canvas (copiar, colar, duplicar) e **modelos de canvas** prontos.
- Explorador de Git e Worktrees.
- Correções da revisão: "Organizar" descarta vértices manuais antigos e `Ctrl+Z` restaura a seta inteira; modelos criam setas
  com aprovação (`ask`); copiar um Maestro não cria um segundo; a cópia de uma nota não herda o arquivo.

## 0.4.x (24 a 26/10/2026)
- **0.4.3 — "Organizar" reescrito:** cada nota fica à esquerda do seu agente e cada pasta logo abaixo; usa o tamanho real dos
  blocos; escolhe os lados das setas; `Ctrl+Z` desfaz por 20 s.
- **0.4.2 / 0.4.1:** endurecimento do desenho das setas depois de um relato de setas que sumiam (causa ainda não reproduzida).
- **0.4.0 — Permissões Totais** (opcional, com confirmação) e "aprovar tudo" na fila (sem as mensagens seguradas por limite).

## 0.3.x (24/10/2026)
- Interface nova: barra superior em seções, modais novos, cores de nota, terminal que inicia ao criar, texto inline.
- Revisão: só modelos que existem aparecem nos seletores; o terminal comum (`shell`) deixou de ser tratado como agente.

## 0.2.x
- Controle de contexto: conversa nova por tarefa, limite de tamanho de mensagem, selo no terminal, `/compact`.
- Seletor (dropdown) de modelos reais de cada CLI; permissões do OpenCode na fila; fluxo misto das três CLIs.
- Abas e painel ao lado; instalador assinado; versão Linux; modelos de workspace; reprodução do histórico; tema claro.

## 0.1.0
- Primeira versão instalável: canvas, terminais reais, broker de mensagens via MCP, fila "Aguardando por mim", worktrees.
