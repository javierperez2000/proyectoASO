function menu_usuarios
{
    Clear-Host
    Write-Host "Cargando..."
    Start-Sleep 0.6
    Clear-Host
    Write-Host -ForegroundColor Yellow -BackgroundColor Black "`nADMINISTRACIÓN COMPLETA DEL SISTEMA`n"
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

function crear_usuario
{
    Param(
        $usuario,
        $contraseña
    )
    New-LocalUser $usuario -Password (ConvertTo-SecureString $contraseña -asplaintext -force) | Out-Null
}

function borrar_usuario
{
    Param(
        $usuario
    )
    Remove-LocalUser $usuario | Out-Null
}

function crear_grupo
{
    Param(
        $grupo
    )
    New-LocalGroup $grupo | Out-Null
}

function borrar_grupo
{
    Param(
        $grupo
    )
    Remove-LocalGroup $grupo | Out-Null
}

function meter_usuario_grupo
{
    Param(
        $usuario,
        $grupo
    )
    Add-LocalGroupMember -Member $usuario -Group $grupo -ErrorAction SilentlyContinue
}

function sacar_usuario_grupo
{
    Param(
        $usuario,
        $grupo
    )
    Remove-LocalGroupMember -Member $usuario -Group $grupo
}