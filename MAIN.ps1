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
            while ($opcionUsuarios -ne 7)
            {
                Write-Host "Cargando..."

                Start-Sleep 0.8

                menu_usuarios

                $opcionUsuarios = Read-Host "Elige una opción"

                switch ($opcionUsuarios)
                {
                    1 {
                        Clear-Host

                        Write-Host "Opcion 1"

                        Read-Host "Pulsa cualquier tecla para continuar..."
                    }
                    2 {
                        Clear-Host

                        Write-Host "Opcion 2"

                        Read-Host "Pulsa cualquier tecla para continuar..."
                    }
                    3 {
                        Clear-Host

                        Write-Host "Opcion 3"

                        Read-Host "Pulsa cualquier tecla para continuar..."
                    }
                    4 {
                        Clear-Host

                        Write-Host "Opcion 4"

                        Read-Host "Pulsa cualquier tecla para continuar..."
                    }
                    5 {
                        Clear-Host

                        Write-Host "Opcion 5"

                        Read-Host "Pulsa cualquier tecla para continuar..."
                    }
                    6 {
                        Clear-Host

                        Write-Host "Opcion 6"

                        Read-Host "Pulsa cualquier tecla para continuar..."
                    }
                    Default {
                        Write-Host -ForegroundColor Green "Opción no válida."
                    }
                }

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