function correo
{
    Param(
        $body
    )
    $dia = Get-Date -Format "dddd dd/MM/yyyy"
    $dia = $dia.ToUpper()
    $hora = Get-Date -Format "HH:mm"
    $credenciales = New-Object System.Management.Automation.PSCredential ("proyecto@jperez.tk", (ConvertTo-SecureString "Proyecto00." -AsPlainText -Force))
    Send-MailMessage -From 'proyecto@jperez.tk' -To 'jvrprz744@gmail.com' -Subject "CAMBIOS SERVIDOR EL $dia A LAS $HORA" -Body "$body" -SmtpServer 'smtp.ionos.es' -Port '587' -Credential $credenciales
}

function menu_principal
{
    Clear-Host
    Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nADMINISTRACIÓN COMPLETA DEL SISTEMA`n"
    Write-Host -ForegroundColor Magenta -BackgroundColor Black "MENÚ PRINCIPAL:`n"
    Write-Host -ForegroundColor Green "  1)" -NoNewline
    " Gestión de Usuarios y Grupos locales."
    Write-Host -ForegroundColor Green "  2)" -NoNewline
    " Programador de tareas."
    Write-Host -ForegroundColor Green "  3)" -NoNewline
    " Información del sistema."
    Write-Host -ForegroundColor Red "  4)" -NoNewline
    " Salir.`n"
}

function pulsar_para_continuar
{
    Read-Host "`nPulsa cualquier tecla para continuar..."
}