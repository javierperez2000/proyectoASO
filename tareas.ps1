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

function crear_tarea
{
    Param(
        $nombre,
        $comando,
        $dias,
        $hora
    )
    $accion = New-ScheduledTaskAction -Execute "powershell" -Argument "$comando"
    $trigger = New-ScheduledTaskTrigger -Daily -DaysInterval $dias -At $hora
    Register-ScheduledTask $nombre -Action $accion -Trigger $trigger | Out-Null
}

function eliminar_tarea
{
    Param(
        $nombre
    )
    Unregister-ScheduledTask -TaskName $nombre
}