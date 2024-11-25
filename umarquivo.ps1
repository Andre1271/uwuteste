param (
    [string]$ShortcutPath
)

try {
    # Verificar se o caminho do atalho foi passado
    if (-not $ShortcutPath) {
        Write-Host "Erro: O caminho do atalho não foi passado!" -ForegroundColor Red
        Exit 1
    }

    # Validar se o arquivo de atalho existe
    if (-not (Test-Path $ShortcutPath)) {
        Write-Host "Erro: O caminho fornecido não é válido ou o atalho não existe!" -ForegroundColor Red
        Exit 1
    }

    # Obter o diretório e nome do atalho
    $shortcutDir = [System.IO.Path]::GetDirectoryName($ShortcutPath)
    $shortcutName = [System.IO.Path]::GetFileNameWithoutExtension($ShortcutPath)

    Write-Host "Diretório do atalho: $shortcutDir"
    Write-Host "Nome do atalho: $shortcutName"

    # Criar o caminho para o PDF
    $outputPDFPath = Join-Path -Path $shortcutDir -ChildPath "$shortcutName.pdf"
    Write-Host "PDF será salvo como: $outputPDFPath"

} catch {
    Write-Host "Erro: $_" -ForegroundColor Red
    $_ | Out-File -FilePath "$env:TEMP\script_error.log" -Append
    Write-Host "Erro registrado em: $env:TEMP\script_error.log" -ForegroundColor Cyan
    Write-Host "Pressione qualquer tecla para sair..." -ForegroundColor Cyan
    Read-Host
    Exit 1
}
