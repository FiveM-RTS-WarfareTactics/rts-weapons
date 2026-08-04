# RTS Weapons

Weapon damage modifier management for Enyo RTS warfare balance. Applies custom damage values to all GTA V weapons to ensure balanced RTS combat.

**No dependencies** — works standalone.

## Features
- 80+ weapon damage modifiers (handheld + vehicle weapons + explosives)
- Auto-applies on resource start
- Zero collision damage for vehicles (CAR/PLANE/BOAT/TRUCK = 0.0)
- Balanced tank, APC, and aircraft weapon scaling

## Commands
| Command | Description |
|---------|-------------|
| `/rts_weapons apply` | Re-apply all modifiers |
| `/rts_weapons status` | Check if modifiers are active |

## Exports
```lua
exports['rts-weapons']:ApplyWeaponModifiers()
local active = exports['rts-weapons']:AreModifiersApplied()
```

## License
Apache 2.0
