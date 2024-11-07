powershell -Command "Add-Type -TypeDefinition @'
using System;
using System.Windows.Forms;
public class MessageBoxClass {
    public static void Show(string message) {
        MessageBox.Show(message, 'Alerta', MessageBoxButtons.OK, MessageBoxIcon.Warning);
    }
}
'@; [MessageBoxClass]::Show('Olá, eu fui executado')"
