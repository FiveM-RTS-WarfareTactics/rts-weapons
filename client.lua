local modifiersApplied = false

function ApplyWeaponModifiers()
    for weaponName, modifier in pairs(Config.WeaponModifiers) do
        local weaponHash = GetHashKey(weaponName)
        if weaponHash and weaponHash ~= 0 then
            SetWeaponDamageModifier(weaponHash, modifier)
        end
    end
    modifiersApplied = true
    print("^2[RTS Weapons] Damage modifiers applied.^7")
end

RegisterCommand('rts_weapons', function(source, args)
    local sub = args[1] or "apply"
    if sub == "apply" then
        ApplyWeaponModifiers()
    elseif sub == "status" then
        print("^2[RTS Weapons] Modifiers " .. (modifiersApplied and "^2ACTIVE^7" or "^1INACTIVE^7") .. ".^7")
    end
end, false)

exports('ApplyWeaponModifiers', ApplyWeaponModifiers)
exports('AreModifiersApplied', function() return modifiersApplied end)

exports('GetWeaponModifier', function(weaponName)
    return Config.WeaponModifiers[weaponName]
end)

exports('SetWeaponModifier', function(weaponName, value)
    Config.WeaponModifiers[weaponName] = tonumber(value) or 1.0
    local hash = GetHashKey(weaponName)
    if hash and hash ~= 0 then
        SetWeaponDamageModifier(hash, Config.WeaponModifiers[weaponName])
    end
end)

exports('GetAllModifiers', function()
    return Config.WeaponModifiers
end)

CreateThread(function()
    Wait(1000)
    ApplyWeaponModifiers()
end)