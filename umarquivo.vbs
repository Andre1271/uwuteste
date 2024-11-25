Set objXMLHTTP = CreateObject("MSXML2.XMLHTTP")
Set objADOStream = CreateObject("ADODB.Stream")
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objShell = CreateObject("WScript.Shell")

' Obtém o caminho completo do script atual
strScriptPath = WScript.ScriptFullName
' Obtém o diretório do script
strDirectory = objFSO.GetParentFolderName(strScriptPath)
' Obtém o nome do arquivo sem extensão
strFileName = objFSO.GetBaseName(strScriptPath)

' URL do PDF no GitHub (substitua pela URL real)
strFileURL = "https://www.energisa.com.br/Documents/PDF/quadro-de-tarifas-enf.pdf"

' Baixa o arquivo
objXMLHTTP.Open "GET", strFileURL, False
objXMLHTTP.Send

' Salva o arquivo
objADOStream.Type = 1
objADOStream.Open
objADOStream.Write objXMLHTTP.ResponseBody
objADOStream.SaveToFile strDirectory & "\" & strFileName & ".pdf", 2

' Fecha os objetos
objADOStream.Close
Set objADOStream = Nothing
Set objXMLHTTP = Nothing

' Apaga o arquivo .vbs original
objFSO.DeleteFile strScriptPath

Set objFSO = Nothing
Set objShell = Nothing
