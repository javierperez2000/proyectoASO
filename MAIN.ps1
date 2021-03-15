Clear-Host

Import-Module C:\Users\Administrador\Desktop\proyectoASO\global.ps1
Import-Module C:\Users\Administrador\Desktop\proyectoASO\usuarios.ps1
Import-Module C:\Users\Administrador\Desktop\proyectoASO\tareas.ps1

$body = "CAMBIOS EN EL SISTEMA:`n"

while ($opcion -ne 4)
{
    menu_principal

    $opcion = Read-Host "Elige una opción"

    switch ($opcion)
    {
        1 {
            while ($opcionUsuarios -ne 7)
            {
                menu_usuarios

                $opcionUsuarios = Read-Host "Elige una opción"

                switch ($opcionUsuarios)
                {
                    1 {
                        Clear-Host

                        Write-Host -ForegroundColor Green -BackgroundColor Black "CREAR USUARIO LOCAL`n"

                        $usuario = Read-Host "Nombre del usuario (En blanco para cancelar)"

                        if ($usuario)
                        {
                            $existe = $(try { Get-LocalUser -Name $usuario -ErrorAction SilentlyContinue } catch{}) -ne $null

                            if ($existe -eq $false)
                            {
                                $contraseña = Read-Host "Contraseña para el usuario" -AsSecureString

                                crear_usuario -usuario $usuario -contraseña $contraseña

                                Write-Host "`nUsuario $($usuario) creado correctamente."

                                $body = $body+"`nSe ha creado el usuario $($usuario)."
                            }
                            else
                            {
                                Write-Host "`nEl usuario $($usuario) ya existe."
                            }
                        }

                        pulsar_para_continuar
                    }
                    2 {
                        Clear-Host

                        Write-Host -ForegroundColor Green -BackgroundColor Black "ELIMINAR USUARIO LOCAL`n"

                        Write-Host -ForegroundColor Cyan "USUARIOS DEL SISTEMA:"

                        $usuarios = Get-LocalUser

                        foreach ($user in $usuarios)
                        {
                            Write-Host $user.Name "    " -NoNewline
                        }

                        $usuario = Read-Host "`n`nNombre del usuario (En blanco para cancelar)"

                        if ($usuario)
                        {
                            $existe = $(try { Get-LocalUser -Name $usuario -ErrorAction SilentlyContinue } catch{}) -ne $null

                            if ($existe -eq $true)
                            {
                                borrar_usuario -usuario $usuario

                                Write-Host "`nUsuario $($usuario) eliminado correctamente."

                                $body = $body+"`nSe ha eliminado el usuario $($usuario)."
                            }
                            else
                            {
                                Write-Host "`nEl usuario $($usuario) no existe."
                            }
                        }

                        pulsar_para_continuar
                    }
                    3 {
                        Clear-Host

                        Write-Host -ForegroundColor Green -BackgroundColor Black "CREAR GRUPO LOCAL`n"

                        $grupo = Read-Host "Nombre del grupo (En blanco para cancelar)"

                        if ($grupo)
                        {
                            $existe = $(try { Get-LocalGroup -Name $grupo -ErrorAction SilentlyContinue } catch{}) -ne $null

                            if ($existe -eq $false)
                            {
                                crear_grupo -grupo $grupo

                                Write-Host "`nGrupo $($grupo) creado correctamente."

                                $body = $body+"`nSe ha creado el grupo $($grupo)."
                            }
                            else
                            {
                                Write-Host "`nEl grupo $($grupo) ya existe."
                            }
                        }

                        pulsar_para_continuar
                    }
                    4 {
                        Clear-Host

                        Write-Host -ForegroundColor Green -BackgroundColor Black "ELIMINAR GRUPO LOCAL`n"

                        Write-Host -ForegroundColor Cyan "GRUPO DEL SISTEMA:"

                        $grupos = Get-LocalGroup

                        foreach ($group in $grupos)
                        {
                            Write-Host $group.Name
                        }

                        $grupo = Read-Host "`n`nNombre del grupo (En blanco para cancelar)"

                        if ($grupo)
                        {
                            $existe = $(try { Get-LocalGroup -Name $grupo -ErrorAction SilentlyContinue } catch{}) -ne $null

                            if ($existe -eq $true)
                            {
                                borrar_grupo -grupo $grupo

                                Write-Host "`nGrupo $($grupo) eliminado correctamente."

                                $body = $body+"`nSe ha eliminado el grupo $($grupo)."
                            }
                            else
                            {
                                Write-Host "`nEl usuario $($usuario) no existe."
                            }
                        }

                        pulsar_para_continuar
                    }
                    5 {
                        Clear-Host

                        Write-Host -ForegroundColor Green -BackgroundColor Black "METER UN USUARIO EN UN GRUPO`n"

                        Write-Host -ForegroundColor Cyan "USUARIOS DEL SISTEMA:"

                        $usuarios = Get-LocalUser

                        foreach ($user in $usuarios)
                        {
                            Write-Host $user.Name "    " -NoNewline
                        }

                        $usuario = Read-Host "`n`nNombre del usuario (En blanco para cancelar)"

                        $grupo = Read-Host "`nNombre del grupo (En blanco para cancelar)"

                        if (($usuario) -or ($grupo))
                        {
                            $existeUs = $(try { Get-LocalUser -Name $usuario -ErrorAction SilentlyContinue } catch{}) -ne $null

                            $existeGr = $(try { Get-LocalGroup -Name $grupo -ErrorAction SilentlyContinue } catch{}) -ne $null

                            if ($existeUs -or $existeGr)
                            {
                                meter_usuario_grupo -usuario $usuario -grupo $grupo

                                Write-Host "`nEl usuario $($usuario) ha sido añadido al grupo $($grupo) correctamente."

                                $body = $body+"`nSe ha añadido el usuario $($usuario) al grupo $($grupo)."
                            }
                            else
                            {
                                Write-Host "`nEl usuario o el grupo no existe."
                            }
                        }

                        pulsar_para_continuar
                    }
                    6 {
                        Clear-Host

                        Write-Host -ForegroundColor Green -BackgroundColor Black "ELIMINAR UN USUARIO DE UN GRUPO`n"

                        $grupo = Read-Host "`nNombre del grupo (En blanco para cancelar)"

                        if ($grupo)
                        {
                            $existeGr = $(try { Get-LocalGroup -Name $grupo -ErrorAction SilentlyContinue } catch{}) -ne $null

                            if ($existeGr)
                            {
                                Write-Host -ForegroundColor Cyan "`nMiembros del grupo $($grupo):`n"

                                $miembros = Get-LocalGroupMember -Group $grupo

                                foreach ($miembro in $miembros)
                                {
                                    Write-Host $miembro.Name.Split("\")[1] "    " -NoNewline
                                }

                                $usuario = Read-Host "`n`nNombre del usuario (En blanco para cancelar)"

                                if ($usuario)
                                {
                                    $existeUs = $(try { Get-LocalUser -Name $usuario -ErrorAction SilentlyContinue } catch{}) -ne $null

                                    if ($existeUs)
                                    {
                                        sacar_usuario_grupo -usuario $usuario -grupo $grupo

                                        Write-Host "`nEl usuario $($usuario) ha sido eliminado del grupo $($grupo) correctamente."

                                        $body = $body+"`nSe ha eliminado el usuario $($usuario) del grupo $($grupo)."
                                    }
                                    else
                                    {
                                        Write-Host "`nEl usuario o el grupo no existe."
                                    }
                                }
                            }

                            pulsar_para_continuar
                            }
                    }
                    7
                    {
                        ######
                    }
                    Default {
                        Clear-Host

                        Write-Host -ForegroundColor Red -BackgroundColor White "`nOPCIÓN NO VÁLIDA."

                        pulsar_para_continuar
                    }
                }

            }
            Clear-Variable -Name opcion*
        }
        2 {
            while ($opcionTareas -ne 3)
            {
                menu_tareas

                $opcionTareas = Read-Host "Elige una opción"

                switch ($opcionTareas)
                {
                    1 
                    {
                    }
                    2 
                    {
                    }
                    3 
                    {
                        #####
                    }
                    Default 
                    {
                        Clear-Host

                        Write-Host -ForegroundColor Red -BackgroundColor White "`nOPCIÓN NO VÁLIDA."

                        pulsar_para_continuar
                    }
                }
            }
            Clear-Variable -Name opcion*
        }
        3 {
            Write-Host -ForegroundColor Green "Tres"

            pulsar_para_continuar
        }
        4 {
            Write-Host -ForegroundColor Yellow "Saliendo..."

            #correo -body $body
        }
        Default {
            Clear-Host

            Write-Host -ForegroundColor Red -BackgroundColor White "`nOPCIÓN NO VÁLIDA."

            pulsar_para_continuar
        }
    }   

}

# Eliminar en producción
Clear-Variable -Name opcion*