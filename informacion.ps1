function menu_informacion
{
    Clear-Host
    Write-Host "Cargando..."
    Start-Sleep 0.6
    Clear-Host
    Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nADMINISTRACIÓN COMPLETA DEL SISTEMA`n"
    Write-Host -ForegroundColor Magenta -BackgroundColor Black "INFORMACIÓN DEL SISTEMA:`n"
    Write-Host -ForegroundColor Cyan "  1)" -NoNewline
    " Ver información del Sistema Operativo."
    Write-Host -ForegroundColor Cyan "  2)" -NoNewline
    " Ver información del procesador."
    Write-Host -ForegroundColor Cyan "  3)" -NoNewline
    " Ver información de la RAM."
    Write-Host -ForegroundColor Cyan "  4)" -NoNewline
    " Ver toda la información."
    Write-Host -ForegroundColor Red "  5)" -NoNewline
    " Salir.`n"
}

function sistema
{
    $sistema = Get-CimInstance Win32_OperatingSystem
    Write-Host -ForegroundColor Cyan "SISTEMA OPERATIVO:"
    Write-Host -ForegroundColor Magenta "`nVERSION: " -NoNewline
    $sistema.Caption
    Write-Host -ForegroundColor Magenta "`nNOMBRE DEL EQUIPO: " -NoNewline
    $sistema.CSName
    Write-Host -ForegroundColor Magenta "`nDIRECTORIO DE INSTALACIÓN: " -NoNewline
    $sistema.SystemDirectory
}

function procesador
{
    $procesador = Get-CimInstance Win32_Processor
    Write-Host -ForegroundColor Cyan "PROCESADOR:"
    Write-Host -ForegroundColor Magenta "`nMODELO: " -NoNewline
    $procesador.Name[0]
    Write-Host -ForegroundColor Magenta "`nFRECUENCIA DE RELOJ: " -NoNewline
    $velocidad = [math]::round(($procesador.MaxClockSpeed[0]/1024),2)
    Write-Host $velocidad "GHz"
    Write-Host -ForegroundColor Magenta "`nNÚCLEOS: " -NoNewline
    $procesador.NumberOfCores[0]
}

function memoria
{
    $memoria = Get-CimInstance Win32_PhysicalMemory
    $contador = 1
    Write-Host -ForegroundColor Cyan "MEMORIA RAM:"
    foreach ($slot in $memoria)
    {
        Write-Host -ForegroundColor Yellow "`n[MEMORIA $($contador)]"
        Write-Host -ForegroundColor Magenta "`nSLOT: " -NoNewline
        $memoria.DeviceLocator[$contador-1]
        Write-Host -ForegroundColor Magenta "`nCAPACIDAD: " -NoNewline
        $capacidad = [math]::round(($memoria.Capacity[$contador-1]/1024),2)
        $capacidad = $capacidad/1024
        $capacidad = $capacidad/1024
        Write-host $capacidad "GB"
        $contador = $contador+1
    }
    
}