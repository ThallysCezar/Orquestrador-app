# Orquestra: como instalar e usar (leia primeiro)

O **Orquestra** é um app de Windows que coloca agentes de código (Claude Code, Antigravity, OpenCode) em terminais num canvas, com um "Maestro" que delega tarefas e uma fila onde você aprova o que eles mandam entre si. É um projeto pessoal do Thallys, em teste.

> Use **só repositórios de teste**. Não aponte os agentes para código de trabalho ou de produção.

## O que vem nesta pasta

| Arquivo | Para quê |
|---|---|
| `Orquestra-Setup-<versão>.exe` | O instalador (assinado com o certificado do Thallys) |
| `orquestra-codesign.cer` | O certificado (parte pública), para o Windows confiar no instalador |
| `1-confiar-certificado.bat` | Faz o Windows confiar nesse certificado (passo 1) |
| `confiar-certificado.ps1` | Usado pelo `.bat` (não precisa abrir) |

## Antes de começar

- Windows 10 ou 11 (64 bits).
- **Git** instalado (`git --version` no terminal).
- Pelo menos **uma CLI de agente instalada e logada na sua conta**: `claude` (Claude Code), `agy` (Antigravity) ou `opencode` (`npm install -g opencode-ai`). O app só orquestra: quem trabalha é a CLI, com a **sua** conta.

## Passo 1: confiar no certificado (uma vez)

O certificado é **autoassinado** (do Thallys, não de uma empresa). Sem este passo o Windows mostra "editor desconhecido". Ao confiar nele, o seu computador passa a aceitar qualquer programa assinado por ele, então **só faça se você confia no Thallys**.

1. Dê duplo clique em **`1-confiar-certificado.bat`**.
2. O Windows pede permissão de administrador: confirme.
3. Deve aparecer "Pronto: o Windows desta máquina agora confia no certificado do Orquestra."

(Para desfazer depois: `certmgr.msc` → remova "Thallys Cezar (Orquestra)" de "Autoridades de Certificação Raiz Confiáveis" e de "Editores Confiáveis".)

## Passo 2: instalar

1. Duplo clique em **`Orquestra-Setup-<versão>.exe`**. Não pede senha de administrador.
2. Se mesmo assim o Windows avisar (SmartScreen), clique em **Mais informações → Executar assim mesmo**.
3. Escolha a pasta (o padrão serve) e abra **Orquestra** pelo menu Iniciar.

Atualizar = rodar um instalador novo por cima. Desinstalar não apaga seus workspaces.

## Passo 3: primeiro teste (5 minutos)

1. No menu do canto superior esquerdo: **Novo workspace…** → escolha uma **pasta de teste vazia** → modelo **Implementador → Revisor** (Claude) ou **Time Antigravity** ou **Time local (OpenCode + Ollama)**.
2. Aperte **▶** no terminal do **Maestro** e em um agente. Na primeira vez, responda os diálogos de confiança ou termos **dentro do próprio terminal** da CLI.
3. Se o app disser "Não encontrei o …": use **Escolher o arquivo…** e aponte o executável da CLI.
4. No terminal do Maestro, escreva: *"Peça ao Agente 1 para responder 'pronto' usando report."*
5. Em **Aguardando por mim** (cartões amarelos) aprove a tarefa e depois o relatório.
6. Veja o que aconteceu em menu → **Histórico de mensagens…** → aba **Reprodução**.
7. **Parar tudo** e feche o app.

Atalhos úteis: `F1` lista todos; `Ctrl+Shift+L` tema claro/escuro; `Ctrl+Shift+O` organiza o canvas.

## Se algo der errado

| Sintoma | O que fazer |
|---|---|
| O Windows ainda avisa "editor desconhecido" | Refaça o Passo 1 (precisa do administrador) |
| "Não encontrei o Claude Code/Antigravity/OpenCode" | Instale a CLI e faça login, ou aponte o executável |
| O agente fica "iniciando" | Ele está num diálogo de confiança: responda no terminal dele |
| A mensagem não chega | Precisa existir uma **seta** entre os dois blocos; confira *Aguardando por mim* e se está *Pausado* |
| O Maestro com modelo local (Ollama) não lê as mensagens | Modelos pequenos não usam bem as ferramentas: use um modelo maior |

## O que **não** foi testado

Esta é a primeira vez que o pacote vai para outra máquina: **não foi verificada uma instalação em um computador limpo**. Se algo falhar, anote a mensagem exata (ou tire print) e mande para o Thallys: é justamente isso que o teste quer descobrir.
