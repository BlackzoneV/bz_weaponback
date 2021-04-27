# bz_weaponback
FiveM


#Kurulum
disc-inventoryhud > client > weapons.lua<br>

    RegisterNetEvent('disc-inventoryhud:useWeapon')
    AddEventHandler('disc-inventoryhud:useWeapon', function(weapon)
          if currentWeapon == weapon then
    (+) exports['bz_weaponback']:SilahAs(currentWeapon)
