local Silahlar = {
    back_bone = 24816,
    x = 0.075,
    y = -0.15,
    z = -0.02,
    x_rotation = 0.0,
    y_rotation = 165.0,
    z_rotation = 0.0,
    compatable_weapon_hashes = {
      ["w_ar_assaultrifle"] = -1074790547,
      ["w_ar_carbinerifle"] = -2084633992,
      ["w_sb_microsmg"] = 324215364,
      ["w_ar_carbinerifle"] = -2084633992,
      ["w_ar_carbineriflemk2"] = GetHashKey("WEAPON_CARBINERIFLE_MK2"),
      ["w_ar_assaultrifle"] = -1074790547,
      ["w_ar_specialcarbine"] = -1063057011,
      ["w_ar_bullpuprifle"] = 2132975508,
      ["w_ar_advancedrifle"] = -1357824103,
      ["w_me_bat"] = -1786099057,
      ["w_sb_assaultsmg"] = -270015777,
      ["w_sb_smg"] = 736523883,
      ["w_sb_smgmk2"] = GetHashKey("WEAPON_SMG_MK2"),
      ["w_sb_gusenberg"] = 1627465347,
      ["w_sr_sniperrifle"] = 100416529,
      ["w_sg_assaultshotgun"] = -494615257,
      ["w_sg_bullpupshotgun"] = -1654528753,
      ["w_sg_pumpshotgun"] = 487013001,
      ["w_ar_musket"] = -1466123874,
      ["w_sg_heavyshotgun"] = GetHashKey("WEAPON_HEAVYSHOTGUN"),
      ["w_lr_firework"] = 2138347493,
    }
}

local silahsil = {}

function SilahAs(weapon)
      local me = PlayerPedId()
      local hash = GetHashKey(weapon)

      for wep_name, wep_hash in pairs(Silahlar.compatable_weapon_hashes) do
           if HasPedGotWeapon(me, wep_hash, false) then
                if hash == wep_hash then
                   ObjeOlustur(wep_name, Silahlar.back_bone, Silahlar.x, Silahlar.y, Silahlar.z, Silahlar.x_rotation, Silahlar.y_rotation, Silahlar.z_rotation) 
                end
           end
      end
end

function ObjeOlustur(weaponProp,boneNumber,x,y,z,xR,yR,zR)
    local ped = PlayerPedId()
    local bone = GetPedBoneIndex(ped, boneNumber)
    RequestModel(weaponProp)
    while not HasModelLoaded(weaponProp) do
        Wait(100)
    end

    silahsil[weaponProp] = {prop = CreateObject(GetHashKey(weaponProp), 1.0, 1.0, 1.0, true, true, false)}

    if weaponProp ~= 'w_me_bat' then
    AttachEntityToEntity(silahsil[weaponProp].prop, ped, bone, x, y, z, xR, yR, zR, 1, 1, 0, 0, 2, 1)
    else
    AttachEntityToEntity(silahsil[weaponProp].prop, ped, bone, 0.11, -0.14, 0.0, 75.0, 185.0, 92.0, 1, 1, 0, 0, 2, 1)
    end
end


Citizen.CreateThread(function()
while true do
Citizen.Wait(100)
for k,v in pairs(silahsil) do
if GetSelectedPedWeapon(PlayerPedId()) ~= GetHashKey('WEAPON_UNARMED') then
DeleteObject(v.prop)
silahsil[k] = nil
end
end

end
end)