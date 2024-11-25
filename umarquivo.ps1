# Caminho do diretório atual de execução
$executionDir = $PWD.Path

# Nome para o arquivo PDF
$outputPDFPath = Join-Path -Path $executionDir -ChildPath "baixado.pdf"

# URL do PDF para download
$urlToPDF = "https://www.energisa.com.br/Documents/PDF/quadro-de-tarifas-enf.pdf"

# Baixar o PDF
try {
    Write-Host "Baixando o PDF no diretório: $executionDir" -ForegroundColor Yellow
    Invoke-WebRequest -Uri $urlToPDF -OutFile $outputPDFPath -ErrorAction Stop
    Write-Host "PDF baixado com sucesso em: $outputPDFPath" -ForegroundColor Green
} catch {
    Write-Host "Erro ao baixar o PDF: $_" -ForegroundColor Red
    $_ | Out-File -FilePath "$executionDir\erro_download.log" -Append
    Write-Host "Erro salvo em: $executionDir\erro_download.log" -ForegroundColor Cyan
    Exit 1
}

# Confirmação final
Write-Host "Processo concluído! O PDF foi salvo como 'baixado.pdf' no diretório atual." -ForegroundColor Cyan
Start-Sleep -Seconds 3
