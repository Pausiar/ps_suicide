Config = {}

-- Armas permitidas para el suicidio
Config.Weapons = {
	-- Pistolas normales
	{hash = 'weapon_pistol'},           -- Pistola
	{hash = 'weapon_pistol_mk2'},       -- Pistola Mk II
	{hash = 'weapon_combatpistol'},     -- Pistola de combate
	{hash = 'weapon_appistol'},         -- AP Pistol
	{hash = 'weapon_pistol50'},         -- Pistol .50
	{hash = 'weapon_snspistol'},        -- SNS Pistol
	{hash = 'weapon_snspistol_mk2'},    -- SNS Pistol Mk II
	{hash = 'weapon_heavypistol'},      -- Heavy Pistol
	{hash = 'weapon_vintagepistol'},    -- Vintage Pistol   
	{hash = 'weapon_revolver'},         -- Heavy Revolver
	{hash = 'weapon_revolver_mk2'},     -- Heavy Revolver Mk II
	{hash = 'weapon_doubleaction'},     -- Double Action Revolver
	{hash = 'weapon_navyrevolver'},     -- Navy Revolver
	{hash = 'weapon_gadgetpistol'},     -- Perico Pistol
	{hash = 'weapon_ceramicpistol'},    -- Ceramic Pistol
	-- Excluidos: weapon_stungun, weapon_stungun_mp (taser)
	-- Excluidos: weapon_sawnoffshotgun (escopeta recortada)
}

-- Función cuando no se tiene un arma en las manos
Config.NoWeaponInHands = function()
	-- Puedes agregar una notificación aquí si lo deseas
	ESX.ShowNotification('No tienes un arma en las manos')
end