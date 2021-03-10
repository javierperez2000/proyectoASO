function menu_usuarios
{
    Clear-Host
    Write-Host -ForegroundColor Yellow -BackgroundColor Black "ADMINISTRACIÓN COMPLETA DEL SISTEMA`n"
    Write-Host -ForegroundColor Magenta -BackgroundColor Black "USUARIOS Y GRUPOS LOCALES:`n"
    Write-Host -ForegroundColor Cyan "  1)" -NoNewline
    " Crear un usuario."
    Write-Host -ForegroundColor Cyan "  2)" -NoNewline
    " Eliminar un usuario."
    Write-Host -ForegroundColor Cyan "  3)" -NoNewline
    " Crear un grupo."
    Write-Host -ForegroundColor Cyan "  4)" -NoNewline
    " Eliminar un grupo."
    Write-Host -ForegroundColor Cyan "  5)" -NoNewline
    " Meter un usuario en un grupo."
    Write-Host -ForegroundColor Cyan "  6)" -NoNewline
    " Sacar un usuario de un grupo."
    Write-Host -ForegroundColor Red "  7)" -NoNewline
    " Salir.`n"
}