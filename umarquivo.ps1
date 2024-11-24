# URL do arquivo PDF para abrir
$urlToPDF = "https://www.energisa.com.br/Documents/PDF/quadro-de-tarifas-enf.pdf"  # Substitua pela URL do PDF

# Caminho onde o Excel será salvo
$outputPath = "C:\Users\andre\source\Resumo das Concessões de Transmissão.xlsx"  # Substitua pelo local onde deseja salvar o arquivo Excel

# URL do Excel para download
$urlToDownload = "https://api.mziq.com/mzfilemanager/v2/d/60f49a2d-bd8c-4fd9-95ab-bdf833097a83/1f0bd96d-0361-50ac-49a2-ef1e89c9853b?origin=1"  # Substitua pela URL do Excel

# 1. Abrir o PDF no navegador padrão
try {
    Write-Host "Abrindo o PDF no navegador padrão..." -ForegroundColor Yellow
    Start-Process $urlToPDF -ErrorAction Stop
    Write-Host "PDF aberto com sucesso." -ForegroundColor Green
} catch {
    Write-Host "Erro ao abrir o PDF: $_" -ForegroundColor Red
    Exit 1
}

# 2. Baixar o arquivo Excel
try {
    Write-Host "Iniciando download do arquivo Excel..." -ForegroundColor Yellow
    Invoke-WebRequest -Uri $urlToDownload -OutFile $outputPath -ErrorAction Stop
    Write-Host "Arquivo Excel baixado com sucesso em $outputPath" -ForegroundColor Green
} catch {
    Write-Host "Erro ao baixar o arquivo Excel: $_" -ForegroundColor Red
    Exit 1
}

Write-Host "Pressione ENTER para fechar o script." -ForegroundColor Cyan
Read-Host
