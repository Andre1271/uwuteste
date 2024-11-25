try {
    # Captura o caminho do script PowerShell executado
    $scriptPath = $MyInvocation.MyCommand.Path
    
    # Pega o diretório onde o script está sendo executado
    $scriptDir = [System.IO.Path]::GetDirectoryName($scriptPath)
    
    # Obter o nome do script
    $scriptName = [System.IO.Path]::GetFileNameWithoutExtension($scriptPath)
    
    # Mostrar no console
    Write-Host "Diretório do script: $scriptDir"
    Write-Host "Nome do script: $scriptName"
    
    # Criar um caminho para salvar um arquivo PDF no mesmo diretório
    $outputPDFPath = Join-Path -Path $scriptDir -ChildPath "$scriptName.pdf"
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
