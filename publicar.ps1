# Publica uma versão como Release do GitHub (anexa os zips de Windows e Linux e usa o trecho do CHANGELOG como notas).
# Por padrão só MOSTRA o que faria. Para publicar de verdade: -Confirmar. Precisa do GitHub CLI (gh) logado.
#   powershell -File publicar.ps1 -Repo SEU-USUARIO/NOME-DO-REPO -Versao 0.5.1            (mostra o plano)
#   powershell -File publicar.ps1 -Repo SEU-USUARIO/NOME-DO-REPO -Versao 0.5.1 -Confirmar (publica)
# Publicar torna os arquivos públicos (e podem ficar em cache mesmo se apagados depois): confira o conteúdo antes.
param(
  [Parameter(Mandatory = $true)][string]$Repo,
  [Parameter(Mandatory = $true)][string]$Versao,
  [switch]$Confirmar
)
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
$pasta = Join-Path $PSScriptRoot $Versao
$arquivos = @('Orquestra-Windows.zip', 'Orquestra-Linux.zip') | ForEach-Object { Join-Path $pasta $_ } | Where-Object { Test-Path $_ }
if ($arquivos.Count -eq 0) { Write-Error "Nenhum pacote em $pasta"; exit 1 }

# notas: o bloco do CHANGELOG que começa em "## <versão>" (ou "## <major.minor>.x") até o próximo "## "
$texto = Get-Content (Join-Path $PSScriptRoot 'CHANGELOG.md') -Raw -Encoding UTF8
$padrao = '(?ms)^## ' + [regex]::Escape($Versao) + '.*?(?=^## |\z)'
$m = [regex]::Match($texto, $padrao)
$notas = if ($m.Success) { $m.Value.Trim() } else { "Versão $Versao." }
$arqNotas = Join-Path $env:TEMP "notas-$Versao.md"
Set-Content $arqNotas $notas -Encoding UTF8

Write-Host "Repositório : $Repo"
Write-Host "Tag         : v$Versao"
Write-Host "Anexos      :"; $arquivos | ForEach-Object { Write-Host ("  {0}  ({1:N0} MB)" -f $_, ((Get-Item $_).Length / 1MB)) }
Write-Host "Notas       :"; Write-Host $notas
if (-not $Confirmar) { Write-Host "`n(Nada foi publicado. Rode de novo com -Confirmar.)"; exit 0 }

& gh release create "v$Versao" @arquivos --repo $Repo --title "Orquestra $Versao" --notes-file $arqNotas --prerelease
if ($LASTEXITCODE -ne 0) { Write-Error 'gh release create falhou'; exit 1 }
Write-Host "Publicado: https://github.com/$Repo/releases/tag/v$Versao"
