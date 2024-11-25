try {
    # Obter o caminho do script que está sendo executado
    $scriptPath = $MyInvocation.MyCommand.Path

    # Obter o diretório e o nome do script
    $scriptDir = [System.IO.Path]::GetDirectoryName($scriptPath)
    $scriptName = [System.IO.Path]::GetFileNameWithoutExtension($scriptPath)

    Write-Host "Diretório do script: $scriptDir"
    Write-Host "Nome do script: $scriptName"

    # Criar caminho para o PDF
    $outputPDFPath = Join-Path -Path $scriptDir -ChildPath "$scriptName.pdf"
    Write-Host "PDF será salvo como: $outputPDFPath"

} catch {
    Write-Host "Erro: $_" -ForegroundColor Red
    $_ | Out-File -FilePath "$env:TEMP\script_error.log" -Append
    Write-Host "Erro registrado em: $env:TEMP\script_error.log" -ForegroundColor Cyan
    Write-Host "Pressione qualquer tecla para sair..." -ForegroundColor Cyan
    Read-Host
    Exit 1
}
