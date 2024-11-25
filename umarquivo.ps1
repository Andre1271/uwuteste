try {
    # Parâmetro esperado para receber o caminho do atalho
    param (
        [string]$ShortcutPath
    )

    # Validar se o argumento foi passado
    if (-not $ShortcutPath) {
        Write-Host "Erro: O caminho do atalho não foi passado!" -ForegroundColor Red
        Write-Host "Certifique-se de passar o argumento -ShortcutPath com o atalho." -ForegroundColor Yellow
        Write-Host "Pressione qualquer tecla para sair..." -ForegroundColor Cyan
        Read-Host
        Exit 1
    }

    # Validar se o arquivo existe
    if (-not (Test-Path $ShortcutPath)) {
        Write-Host "Erro: O caminho fornecido não é válido ou o atalho não existe!" -ForegroundColor Red
        Write-Host "Caminho fornecido: $ShortcutPath" -ForegroundColor Yellow
        Write-Host "Pressione qualquer tecla para sair..." -ForegroundColor Cyan
        Read-Host
        Exit 1
    }

    # Processar o atalho
    $shortcutDir = [System.IO.Path]::GetDirectoryName($ShortcutPath)
    $shortcutName = [System.IO.Path]::GetFileNameWithoutExtension($ShortcutPath)

    # Exibir informações do atalho
    Write-Host "Diretório do atalho: $shortcutDir"
    Write-Host "Nome do atalho: $shortcutName"

    # Criar caminho para o PDF
    $outputPDFPath = Join-Path -Path $shortcutDir -ChildPath "$shortcutName.pdf"
    Write-Host "PDF será salvo como: $outputPDFPath"
    
    # Adicionar lógica para baixar ou salvar o PDF, se necessário
    # Exemplo de mensagem:
    Write-Host "Aqui você pode adicionar a lógica para processar o arquivo..."
    
} catch {
    # Tratar qualquer erro e salvar no arquivo de log
    Write-Host "Erro: $_" -ForegroundColor Red
    $_ | Out-File -FilePath "$env:TEMP\script_error.log" -Append
    Write-Host "Erro registrado em: $env:TEMP\script_error.log" -ForegroundColor Cyan
    Write-Host "Pressione qualquer tecla para sair..." -ForegroundColor Cyan
    Read-Host
    Exit 1
}
