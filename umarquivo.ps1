param (
    [string]$ShortcutPath  # Recebe o caminho do atalho como argumento
)

try {
    # Validar se o argumento foi passado
    if (-not $ShortcutPath) {
        throw "O caminho do atalho não foi fornecido."
    }

    # Validar se o atalho realmente existe
    if (-not (Test-Path $ShortcutPath)) {
        throw "O atalho fornecido não existe: $ShortcutPath"
    }

    # Obter informações do atalho
    $shortcutDir = [System.IO.Path]::GetDirectoryName($ShortcutPath)
    $shortcutName = [System.IO.Path]::GetFileNameWithoutExtension($ShortcutPath)

    # Exibir no console
    Write-Host "Diretório do atalho: $shortcutDir"
    Write-Host "Nome do atalho: $shortcutName"

    # Criar caminho para um arquivo PDF
    $outputPDFPath = Join-Path -Path $shortcutDir -ChildPath "$shortcutName.pdf"
    Write-Host "Arquivo PDF será salvo como: $outputPDFPath"
    Write-Host "Pressione qualquer tecla para sair..." -ForegroundColor Cyan
    Read-Host
} catch {
    Write-Host "Erro: $_" -ForegroundColor Red
    $_ | Out-File -FilePath "$env:TEMP\script_error.log" -Append
    Write-Host "Erro registrado em: $env:TEMP\script_error.log" -ForegroundColor Cyan
    Write-Host "Pressione qualquer tecla para sair..." -ForegroundColor Cyan
    Read-Host
}
