# Orquestra para Linux: como instalar e usar (leia primeiro)

O **Orquestra** coloca agentes de código (Claude Code, Antigravity, OpenCode) em terminais num canvas, com um "Maestro" que delega tarefas e uma fila onde você aprova o que eles mandam entre si. É um projeto pessoal do Thallys, em teste.

> Use **só repositórios de teste**. Não aponte os agentes para código de trabalho ou de produção.

## O que vem nesta pasta

| Arquivo | Para quê |
|---|---|
| `Orquestra-<versão>.AppImage` | O app em um único arquivo (não precisa instalar) |
| `COMO-INSTALAR-LINUX.md` | Este guia |

## Antes de começar

Testado só no **Ubuntu 24.04 dentro do WSL2**. Em desktop Linux de verdade, outras distribuições: **não foi testado** (é justamente o que este teste quer descobrir).

1. Bibliotecas do sistema (Ubuntu/Debian; no Ubuntu antigo os nomes não têm o `t64`):

```bash
sudo apt-get install -y git curl libnss3 libatk1.0-0t64 libatk-bridge2.0-0t64 libcups2t64 libdrm2 libgbm1 libgtk-3-0t64 libasound2t64 libxkbcommon0 libxcomposite1 libxdamage1 libxfixes3 libxrandr2 libpango-1.0-0 libcairo2 libx11-xcb1 xdg-utils
```

2. **Pelo menos uma CLI de agente instalada e logada na sua conta** (o app só orquestra, quem trabalha é a CLI):
   - OpenCode: `npm install -g opencode-ai` e depois `opencode providers` para entrar. Dá para testar de graça com os modelos "-free" que ele lista (`opencode models`).
   - Claude Code: `npm install -g @anthropic-ai/claude-code` e depois rode `claude` uma vez para entrar.
   - Antigravity (`agy`): instalação oficial dele; **não foi testado no Linux**.

## Abrir o app

```bash
chmod +x Orquestra-*.AppImage
./Orquestra-*.AppImage
```

Se der erro, tente na ordem:
- **Reclamou de FUSE / não abre:** `./Orquestra-*.AppImage --appimage-extract-and-run`
- **Reclamou de sandbox** (comum no Ubuntu 24.04): acrescente `--no-sandbox` (menos seguro; o app só abre a própria interface local). Exemplo: `./Orquestra-*.AppImage --appimage-extract-and-run --no-sandbox`

Os dados do app ficam em `~/.config/Orquestra/`. Cada workspace fica na pasta que **você** escolher, em `<pasta>/.orquestra/`.

## Primeiro teste (5 minutos)

1. Menu no canto superior esquerdo → **Novo workspace…** → escolha uma **pasta de teste vazia** → modelo **Implementador → Revisor**, **Time Antigravity** ou **Time local (OpenCode + Ollama)**.
2. Aperte **▶** no terminal do **Maestro** e em um agente. Responda diálogos de confiança ou termos **dentro do próprio terminal** da CLI.
3. Se disser "Não encontrei o …": use **Escolher o arquivo…** e aponte o executável da CLI (ou instale-a e logue).
4. No terminal do Maestro: *"Peça ao Agente 1 para responder 'pronto' usando report."*
5. Em **Aguardando por mim** aprove a tarefa e depois o relatório.
6. Menu → **Histórico de mensagens…** → aba **Reprodução** mostra o que aconteceu.
7. **Parar tudo** e feche o app: não deve sobrar processo (`pgrep -af 'claude|agy|opencode'`).

Atalhos: `F1` lista todos; `Ctrl+Shift+L` tema claro/escuro; `Ctrl+Shift+O` organiza o canvas.

## Se algo der errado

| Sintoma | O que fazer |
|---|---|
| `error while loading shared libraries` | Instale as bibliotecas do passo 1 |
| A janela não abre | Veja as opções de FUSE e sandbox acima |
| "Não encontrei o …" | Instale a CLI e faça login, ou aponte o executável |
| O agente fica "iniciando" | Ele está num diálogo de confiança: responda no terminal dele |
| A mensagem não chega | Precisa existir uma **seta** entre os blocos; confira *Aguardando por mim* e se está *Pausado* |
| Maestro com modelo local (Ollama) não lê as mensagens | Modelos pequenos não usam bem as ferramentas: use um maior |

## O que **não** foi testado

Desktop Linux real (só WSL), `agy` e o login do Claude Code no Linux, e o sandbox do Chromium sem `--no-sandbox`. Se algo falhar, anote a mensagem exata (ou tire print) e mande para o Thallys.
