Clear-Host

Import-Module C:\Users\Administrador\Desktop\proyectoASO\global.ps1
Import-Module C:\Users\Administrador\Desktop\proyectoASO\usuarios.ps1

while ($opcion -ne 5)
{
    menu_principal

    $opcion = Read-Host "Elige una opción"

    switch ($opcion)
    {
        1 {
            while ($opcionUsuarios -ne 5)
            {
                Write-Host "Cargando..."

                Start-Sleep 0.8

                menu_usuarios

                $opcionUsuarios = Read-Host "Elige una opción"

            }
        }
        2 {
            Write-Host -ForegroundColor Green "Dos"
        }
        3 {
            Write-Host -ForegroundColor Green "Tres"
        }
        4 {
            Write-Host -ForegroundColor Green "Cuatro"
        }
        5 {
            Write-Host -ForegroundColor Yellow "Saliendo..."
        }
        Default {
            Write-Host -ForegroundColor Green "Opción no válida."
        }
    }   

}

# Eliminar en producción
Clear-Variable -Name opcion*