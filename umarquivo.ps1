function Show-WarningPopup {
    param (
        [string]$message,
        [string]$title
    )
    $popupJob = Start-Job -ScriptBlock {
        Add-Type -AssemblyName System.Windows.Forms
        [System.Windows.Forms.MessageBox]::Show($using:message, $using:title, [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
    }
}

Show-WarningPopup -message "You have been warned!" -title "Title"
