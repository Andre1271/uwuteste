param (
    [string]$ShortcutPath  # Captura o caminho do atalho
)

# Validar se o argumento foi passado
if (-not $ShortcutPath) {
    Write-Host "Erro: O caminho do atalho não foi passado!" -ForegroundColor Red
    Exit 1
}

# Extrair o diretório e o nome do atalho
$shortcutDir = [System.IO.Path]::GetDirectoryName($ShortcutPath)
$shortcutName = [System.IO.Path]::GetFileNameWithoutExtension($ShortcutPath)

Write-Host "Diretório do atalho: $shortcutDir"
Write-Host "Nome do atalho: $shortcutName"

# Exemplo: Criar um novo arquivo com o mesmo nome que o atalho, mas em formato PDF
$outputPDFPath = Join-Path -Path $shortcutDir -ChildPath "$shortcutName.pdf"
Write-Host "PDF será salvo como: $outputPDFPath"
