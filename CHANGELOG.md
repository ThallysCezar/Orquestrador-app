# Histórico de versões

Formato: o que muda para quem usa. Datas só onde o histórico do código as confirma (o repositório do código começa em 24/10/2026;
as versões 0.1 a 0.3 são anteriores a ele).

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
