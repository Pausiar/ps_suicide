# 🔫 PS Suicide - Script de Suicidio para FiveM

Un script simple y optimizado para FiveM que permite a los jugadores suicidarse mediante un comando con diferentes armas y sus respectivos props.

## 📋 Descripción

Este script permite que los jugadores puedan terminar con la vida de su personaje de manera controlada utilizando el comando `/suicide`. El script reproduce una animación realista de suicidio con la pistola que el jugador tenga equipada, dando la opción de confirmar o cancelar la acción.

## ✨ Características

- 🎯 **Sistema de confirmación**: El jugador debe confirmar presionando `E` o cancelar con `X`
- 🔫 **Múltiples armas soportadas**: Compatible con pistolas y revólveres del juego
- 🎬 **Animaciones realistas**: Utiliza las animaciones nativas de GTA V (`mp_suicide`)
- 🔊 **Efectos de sonido**: Reproduce sonido cuando no hay munición
- ⚡ **Optimizado**: Solo ejecuta threads cuando es necesario
- 📝 **Indicador visual 3D**: Muestra las teclas de confirmación/cancelación en pantalla
- ✅ **Verificación de armas**: Solo funciona si el jugador tiene un arma válida equipada
- 🎯 **Verificación de munición**: Si no hay munición, reproduce un "click" sin causar daño

## 📦 Instalación

1. Descarga el script
2. Coloca la carpeta `ps_suicide` en tu directorio de resources de FiveM
3. Añade `ensure ps_suicide` en tu `server.cfg`
4. Reinicia el servidor o ejecuta `refresh` y luego `start ps_suicide`

## ⚙️ Configuración

El archivo `config.lua` permite personalizar las armas permitidas y el comportamiento del script.

### Armas Soportadas

Por defecto, el script soporta las siguientes armas:

**Pistolas:**
- `weapon_pistol` - Pistola
- `weapon_pistol_mk2` - Pistola Mk II
- `weapon_combatpistol` - Pistola de combate
- `weapon_appistol` - AP Pistol
- `weapon_pistol50` - Pistol .50
- `weapon_snspistol` - SNS Pistol
- `weapon_snspistol_mk2` - SNS Pistol Mk II
- `weapon_heavypistol` - Heavy Pistol
- `weapon_vintagepistol` - Vintage Pistol
- `weapon_ceramicpistol` - Ceramic Pistol
- `weapon_gadgetpistol` - Perico Pistol

**Revólveres:**
- `weapon_revolver` - Heavy Revolver
- `weapon_revolver_mk2` - Heavy Revolver Mk II
- `weapon_doubleaction` - Double Action Revolver
- `weapon_navyrevolver` - Navy Revolver

### Añadir/Quitar Armas

Para modificar las armas permitidas, edita el archivo `config.lua`:

```lua
Config.Weapons = {
    {hash = 'weapon_pistol'},
    -- Añade más armas aquí
}
```

### Notificación Personalizada

Si no usas ESX o quieres cambiar la notificación cuando no se tiene un arma:

```lua
Config.NoWeaponInHands = function()
    -- Personaliza tu notificación aquí
    -- Ejemplo para otros frameworks:
    -- QBCore.Functions.Notify('No tienes un arma en las manos', 'error')
    -- TriggerEvent('chat:addMessage', {args = {'No tienes un arma en las manos'}})
end
```

## 🎮 Uso

1. **Equipar un arma**: El jugador debe tener equipada una de las pistolas/revólveres soportados
2. **Ejecutar comando**: Escribe `/suicide` en el chat
3. **Confirmar o cancelar**:
   - Presiona `E` para confirmar el suicidio
   - Presiona `X` para cancelar la acción

### Controles

| Tecla | Acción |
|-------|--------|
| `/suicide` | Inicia el proceso de suicidio |
| `E` | Confirma el suicidio |
| `X` | Cancela el suicidio |

## 🔧 Características Técnicas

- **Framework**: Compatible con cualquier framework (incluye ejemplo para ESX)
- **Versión de Lua**: 5.4
- **Versión FX**: Bodacious
- **Optimización**: Utiliza CreateThread solo cuando es necesario
- **Animación**: `mp_suicide` (pistol)
- **Sin dependencias**: Funciona de forma independiente

## 📝 Notas Importantes

- ⚠️ El script solo funciona con armas de fuego tipo pistola/revólver
- ⚠️ Si el arma no tiene munición, solo reproducirá un sonido de "click"
- ⚠️ Las tasers y escopetas recortadas están excluidas por diseño
- ✅ La animación se pausa en el momento exacto (0.28) esperando confirmación
- ✅ El jugador puede moverse libremente hasta presionar E o X

## 👨‍💻 Autor

**Pausiar**

## 📄 Licencia

Este proyecto es de código abierto y está disponible para ser usado y modificado libremente.

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Si encuentras algún bug o tienes alguna sugerencia, no dudes en abrir un issue o pull request.

## 📞 Soporte

Si tienes algún problema con el script:
1. Verifica que el recurso esté iniciado correctamente
2. Revisa la consola F8 para errores
3. Asegúrate de tener un arma válida equipada
4. Verifica que la configuración sea correcta

---

⭐ Si te gusta este script, no olvides darle una estrella al repositorio!
