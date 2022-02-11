# qb-lettucejob
https://github.com/GabbarFramework
Join My Server
https://discord.gg/Pv4MG7HXwB

I used qb-weedpicking as the Base

qb-weedpicking Author - https://github.com/MrEvilGamer

#More Scripts Coming Soon#

Step 1
Make sure you add the images that i gave to the inventory and open the shared.lua and add the text given to
qb-core/shared.lua

['lettuce'] 				 	 = {['name'] = 'lettuce', 			  	  	['label'] = 'Lwttuce', 				['weight'] = 100, 		['type'] = 'item', 		['image'] = 'lettuce.png', 	   		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'Healthy Plant'},

['cooked_lettuce'] 				 = {['name'] = 'cooked_lettuce', 			  	['label'] = 'Cooked Lettuce', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'cooked_lettuce.png', 	   	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'Healthy Lettuce'},

Step 2
Make sure to add these in qb-core/client/functions.lua
(And this after Drawtext3d) 

```lua
QBCore.Functions.Draw2DText = function(x, y, text, scale)
    SetTextFont(4)
    SetTextProportional(7)
    SetTextScale(scale, scale)
    SetTextColour(255, 255, 255, 255)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextOutline()
    SetTextCentre(true)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end
```

(This at the Bottom)

```lua
QBCore.Functions.SpawnObject = function(model, coords, cb)
    local model = (type(model) == 'number' and model or GetHashKey(model))

    Citizen.CreateThread(function()
        RequestModel(model)
        local obj = CreateObject(model, coords.x, coords.y, coords.z, true, false, true)
        SetModelAsNoLongerNeeded(model)

        if cb then
            cb(obj)
        end
    end)
end
```
```lua
QBCore.Functions.SpawnLocalObject = function(model, coords, cb)
    local model = (type(model) == 'number' and model or GetHashKey(model))

    Citizen.CreateThread(function()
        RequestModel(model)
        local obj = CreateObject(model, coords.x, coords.y, coords.z, false, false, true)
        SetModelAsNoLongerNeeded(model)

        if cb then
            cb(obj)
        end
    end)
end
```
```lua
QBCore.Functions.DeleteObject = function(object)
    SetEntityAsMissionEntity(object, false, true)
    DeleteObject(object)
end
```
