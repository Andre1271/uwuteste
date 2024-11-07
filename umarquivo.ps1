Add-Type -TypeDefinition @"
using System;
using System.Windows.Forms;
public class MessageBoxClass {
    public static void Show(string message) {
        MessageBox.Show(message, 'Alerta', MessageBoxButtons.OK, MessageBoxIcon.Information);
    }
}
"@
[MessageBoxClass]::Show('Olá')
