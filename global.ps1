function correo
{
    $credenciales = New-Object System.Management.Automation.PSCredential ("proyecto@jperez.tk", (ConvertTo-SecureString "Proyecto00." -AsPlainText -Force))
    # Send-MailMessage -From 'proyecto@jperez.tk' -To 'jvrprz744@gmail.com' -Subject 'Correo de prueba' -Body 'Prueba desde PS' -SmtpServer 'smtp.ionos.es' -Port '587' -Credential $credenciales
}

function menu_principal
{
    Clear-Host
    Write-Host -ForegroundColor Yellow -BackgroundColor Black "ADMINISTRACIÓN COMPLETA DEL SISTEMA`n"
    Write-Host -ForegroundColor Magenta -BackgroundColor Black "MENÚ PRINCIPAL:`n"
    Write-Host -ForegroundColor Green "  1)" -NoNewline
    " Gestión de Usuarios y Grupos locales."
    Write-Host -ForegroundColor Green "  2)" -NoNewline
    " Opción 2."
    Write-Host -ForegroundColor Green "  3)" -NoNewline
    " Opción 3."
    Write-Host -ForegroundColor Green "  4)" -NoNewline
    " Opción 4."
    Write-Host -ForegroundColor Red "  5)" -NoNewline
    " Salir.`n"
}