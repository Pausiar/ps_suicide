local dict = 'mp_suicide'
local anim = 'pistol'
local suicideanim = false
local closing = false

-- Cargar animación al iniciar
CreateThread(function()
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(100)
    end
end)

-- Comando de suicidio
RegisterCommand('suicide', function()
    local ped = PlayerPedId()
    local tieneArma = false
    
    for _, g in ipairs(Config.Weapons) do
        if HasPedGotWeapon(ped, GetHashKey(g.hash), false) then
            tieneArma = true
            break
        end
    end
    
    if tieneArma then
        IniciarSuicidio()
    else
        Config.NoWeaponInHands()
    end
end)

function IniciarSuicidio()
    local ped = PlayerPedId()
    TaskPlayAnim(ped, dict, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
    suicideanim = true
    closing = false
    
    -- Iniciar threads solo cuando se activa el suicidio
    IniciarControlAnimacion()
    IniciarControlTeclas()
end

function EjecutarSuicidio()
    local ped = PlayerPedId()
    local wephash = GetSelectedPedWeapon(ped)
    local wepammo = GetAmmoInPedWeapon(ped, wephash)
    
    if wepammo ~= 0 then
        closing = true
        local coords = GetEntityCoords(ped)
        local rot = GetEntityRotation(ped)
        
        ClearPedTasks(ped)
        SetPedShootRate(ped, 1000)
        SetPedShootsAtCoord(ped, 0, 0, 0, true)
        TaskPlayAnimAdvanced(ped, dict, anim, coords, rot, 8.0, 8.0, 3000, 0, 0.28, 0, 0)
        Wait(200)
        SetEntityHealth(ped, 0)
        suicideanim = false
    else 
        PlaySoundFrontend(-1, 'Faster_Click', 'RESPAWN_ONLINE_SOUNDSET', 1)
        suicideanim = false
    end
end

function IniciarControlAnimacion()
    CreateThread(function()
        while suicideanim do
            Wait(100)
            
            local ped = PlayerPedId()
            if IsEntityPlayingAnim(ped, dict, anim, 3) then
                local currentTime = GetEntityAnimCurrentTime(ped, dict, anim)
                -- Pausar cuando llegue a 0.28
                if currentTime >= 0.28 and not closing then
                    SetEntityAnimCurrentTime(ped, dict, anim, currentTime)
                    SetEntityAnimSpeed(ped, dict, anim, 0)
                end
            end
        end
    end)
end

function IniciarControlTeclas()
    CreateThread(function()
        while suicideanim do
            Wait(0)
            
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            
            -- Mostrar texto 3D
            DrawText3D(coords.x, coords.y, coords.z, 'Suicidarse: [E], Cancelar: [X]')
            
            -- Tecla E para ejecutar suicidio
            if IsControlJustPressed(0, 38) then
                EjecutarSuicidio()
            end
            
            -- Tecla X para cancelar
            if IsControlJustPressed(0, 73) then
                StopAnimTask(ped, dict, anim, 1.1)
                suicideanim = false
            end
        end
    end)
end

function DrawText3D(x, y, z, text, linecount)
    linecount = linecount or 0.7
    
    SetTextScale(0.325, 0.325)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    
    local factor = (string.len(text)) / 470
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03 * linecount, 0, 0, 0, 68)
    ClearDrawOrigin()
end

