function menu_tareas
{
    Clear-Host
    Write-Host "Cargando..."
    Start-Sleep 0.6
    Clear-Host
    Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nADMINISTRACIÓN COMPLETA DEL SISTEMA`n"
    Write-Host -ForegroundColor Magenta -BackgroundColor Black "PROGRAMADOR DE TAREAS:`n"
    Write-Host -ForegroundColor Cyan "  1)" -NoNewline
    " Crear una tarea programada."
    Write-Host -ForegroundColor Cyan "  2)" -NoNewline
    " Eliminar una tarea programada."
    Write-Host -ForegroundColor Red "  3)" -NoNewline
    " Salir.`n"
}

# $accion = New-ScheduledTaskAction -Execute "powershell" -Argument "Stop-Computer"
# $trigger = New-ScheduledTaskTrigger -Daily -DaysInterval 1 -At 3am
# Register-ScheduledTask $nombre -Action $accion -Trigger $trigger