Clear-Host

Import-Module C:\Users\Administrador\Desktop\proyectoASO\global.ps1
Import-Module C:\Users\Administrador\Desktop\proyectoASO\usuarios.ps1
Import-Module C:\Users\Administrador\Desktop\proyectoASO\tareas.ps1
Import-Module C:\Users\Administrador\Desktop\proyectoASO\informacion.ps1

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
                        Clear-Host

                        Write-Host -ForegroundColor Green -BackgroundColor Black "CREAR TAREA PROGRAMADA`n"

                        Write-Host "───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────"

                        Write-Host "  La creación de esta tarea no implica que el contenido esté bien, asegúrese antes que el comando/script es correcto."

                        Write-Host "───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────`n"

                        $nombre = Read-Host "¿Cómo quieres llamar a la tarea? (En blanco para cancelar)"

                        if ($nombre)
                        {
                            $existe = $(try { Get-ScheduledTask -TaskName $nombre -ErrorAction SilentlyContinue } catch{}) -ne $null

                            if ($existe -eq $false)
                            {
                                $comando = Read-Host "`nComando o ruta absoluta de un script"

                                if ($comando)
                                {}
                                else
                                {
                                    $comando = "Get-LocalUser"
                                }

                                $dias = Read-Host "`n¿Cada cuantos días quieres que se repita? (Por defecto 1 para repetir a diario)"

                                if ($dias)
                                {}
                                else
                                {
                                    $dias = 1
                                }

                                $hora = Read-Host "`n¿A qué hora quieres que se ejecute? (Formato 24 horas)"

                                if ($hora)
                                {}
                                else
                                {
                                    $hora = "00:00"
                                }

                                crear_tarea -nombre $nombre -dias $dias -hora $hora -comando $comando

                                Write-Host "`nTarea programada $($nombre) creada correctamente."

                                $body = $body+"`nSe ha creado una tarea programada llamada $($nombre)."
                            }
                            else
                            {
                                Write-Host "`nLa tarea programada $($nombre) ya existe."
                            }
                        }

                        pulsar_para_continuar
                    }
                    2 
                    {
                        Clear-Host

                        Write-Host -ForegroundColor Green -BackgroundColor Black "ELIMINAR TAREA PROGRAMADA`n"

                        $tareas = Get-ScheduledTask

                        foreach ($tarea in $tareas)
                        {
                            if ($tarea.TaskPath -eq "\")
                            {
                                Write-Host $tarea.TaskName "    " -NoNewline
                            }
                        }

                        $nombre = Read-Host "`n`n¿Cómo se llama la tarea?"

                        $existe = $(try { Get-ScheduledTask -TaskName $nombre -ErrorAction SilentlyContinue } catch{}) -ne $null

                        if ($existe -eq $true)
                        {
                            eliminar_tarea -nombre $nombre

                            Write-Host "`nLa tarea programada $($nombre) se eliminado correctamente."

                            $body = $body+"`nSe ha eliminado una tarea programada llamada $($nombre)."
                        }
                        else
                        {
                            Write-Host "`nLa tarea programada $($nombre) no existe."
                        }

                        pulsar_para_continuar
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
            while ($opcionInformacion -ne 5)
            {
                menu_informacion

                $opcionInformacion = Read-Host "Elige una opción"

                switch ($opcionInformacion)
                {
                    1 
                    {
                        Clear-Host

                        sistema

                        pulsar_para_continuar
                    }
                    2 
                    {
                        Clear-Host

                        procesador

                        pulsar_para_continuar
                    }
                    3 
                    {
                        Clear-Host

                        memoria

                        pulsar_para_continuar
                    }
                    4 
                    {
                        Clear-Host

                        sistema
                        Write-Host ""
                        procesador
                        Write-Host ""
                        memoria
                        Write-Host ""
                        pulsar_para_continuar
                    }
                    5 
                    {
                        ####
                    }
                    Default 
                    {
                        Clear-Host

                        Write-Host -ForegroundColor Red -BackgroundColor White "`nOPCIÓN NO VÁLIDA."

                        pulsar_para_continuar
                    }
                }
            }
        }
        4 {
            Write-Host -ForegroundColor Yellow "Saliendo..."

            correo -body $body
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