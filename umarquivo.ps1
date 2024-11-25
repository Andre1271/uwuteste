# Obter o caminho completo do script atual (executado pelo atalho)
$shortcutPath = $MyInvocation.MyCommand.Definition

# Extrair o diretório e nome do atalho
$shortcutDir = Split-Path -Path $shortcutPath
$shortcutName = [System.IO.Path]::GetFileNameWithoutExtension($shortcutPath)

# Caminho onde o PDF será salvo, com o mesmo nome do atalho
$outputPDFPath = Join-Path -Path $shortcutDir -ChildPath "$shortcutName.pdf"

# URL do PDF para download
$urlToPDF = "https://www.energisa.com.br/Documents/PDF/quadro-de-tarifas-enf.pdf"

# Baixar o PDF
try {
    Write-Host "Baixando o PDF..." -ForegroundColor Yellow
    Invoke-WebRequest -Uri $urlToPDF -OutFile $outputPDFPath -ErrorAction Stop
    Write-Host "PDF baixado com sucesso em: $outputPDFPath" -ForegroundColor Green
} catch {
    Write-Host "Erro ao baixar o PDF: $_" -ForegroundColor Red
    $_ | Out-File -FilePath "$shortcutDir\erro_download.log" -Append
    Write-Host "Erro salvo em: $shortcutDir\erro_download.log" -ForegroundColor Cyan
    Exit 1
}

# Apagar o atalho
try {
    Write-Host "Apagando o atalho original..." -ForegroundColor Yellow
    Remove-Item -Path $shortcutPath -ErrorAction Stop
    Write-Host "Atalho removido com sucesso." -ForegroundColor Green
} catch {
    Write-Host "Erro ao remover o atalho: $_" -ForegroundColor Red
    $_ | Out-File -FilePath "$shortcutDir\erro_download.log" -Append
    Write-Host "Erro salvo em: $shortcutDir\erro_download.log" -ForegroundColor Cyan
    Exit 1
}

# Confirmar conclusão
Write-Host "Processo concluído! O PDF foi salvo no lugar do atalho." -ForegroundColor Cyan
Start-Sleep -Seconds 3
