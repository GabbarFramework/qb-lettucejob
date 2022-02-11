local QBCore = exports['qb-core']:GetCoreObject()

TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterServerEvent('qb-lettucejob:pickedUpLettuce') --hero
AddEventHandler('qb-lettucejob:pickedUpLettuce', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	    if 	TriggerClientEvent("QBCore:Notify", src, "You Got Lettuce.", "Success", 8000) then
		  Player.Functions.AddItem('lettuce', 1) ---- change this shit 
		  TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['lettuce'], "add")
	    end
end)	

RegisterServerEvent('qb-lettucejob:CookLettuce')
AddEventHandler('qb-lettucejob:CookLettuce', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.GetItemByName('lettuce') then
		local chance = math.random(1, 8)
		if chance == 1 or chance == 2 or chance == 3 or chance == 4 or chance == 5 or chance == 6 or chance == 7 or chance == 8 then
			Player.Functions.RemoveItem('lettuce', 2)----change this
			Player.Functions.AddItem('cooked_lettuce', 1)----change this
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['lettuce'], "remove")
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['cooked_lettuce'], "add")
			TriggerClientEvent('QBCore:Notify', src, 'Cooked Lettuce Sucessfully', "success")  
		end 
	else
		TriggerClientEvent('QBCore:Notify', src, 'You don\'t have the right items', "error") 
	end
end)

--selldrug ok

RegisterServerEvent('qb-lettucejob:selld3')
AddEventHandler('qb-lettucejob:selld3', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local Item = Player.Functions.GetItemByName('cooked_lettuce')
   
	
      
	for i = 1, Item.amount do
	if Item.amount >0 then
	if Player.Functions.GetItemByName('cooked_lettuce') then
		local chance2 = math.random(1, 8)
		if chance2 == 1 or chance2 == 2 or chance2 == 9 or chance2 == 4 or chance2 == 10 or chance2 == 6 or chance2 == 7 or chance2 == 8 then
			Player.Functions.RemoveItem('cooked_lettuce', 1)----change this
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['cooked_lettuce'], "remove")
			Player.Functions.AddMoney("cash", Config.Pricesell, "sold-pawn-items")
			TriggerClientEvent('QBCore:Notify', src, 'You Sold Cooked Lettuce', "success")   
		end 
	else
		TriggerClientEvent('QBCore:Notify', src, 'You don\'t have the right items', "error") 
	end
else
	TriggerClientEvent('QBCore:Notify', src, 'You don\'t have the right items', "error") 
	
end
end
end)



function CancelProcessing(playerId)
	if playersProcessingCannabis[playerId] then
		ClearTimeout(playersProcessingCannabis[playerId])
		playersProcessingCannabis[playerId] = nil
	end
end

RegisterServerEvent('qb-lettucejob:cancelProcessing3')
AddEventHandler('qb-lettucejob:cancelProcessing3', function()
	CancelProcessing(source)
end)

AddEventHandler('QBCore_:playerDropped', function(playerId, reason)
	CancelProcessing(playerId)
end)

RegisterServerEvent('qb-lettucejob:onPlayerDeath2')
AddEventHandler('qb-lettucejob:onPlayerDeath2', function(data)
	local src = source
	CancelProcessing(src)
end)

QBCore.Functions.CreateCallback('poppy:process', function(source, cb)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	 
	if Player.PlayerData.item ~= nil and next(Player.PlayerData.items) ~= nil then
		for k, v in pairs(Player.PlayerData.items) do
		    if Player.Playerdata.items[k] ~= nil then
				if Player.Playerdata.items[k].name == "cocaine_bag" then
					cb(true)
			    else
					TriggerClientEvent("QBCore:Notify", src, "You do not have any Coke process", "error", 10000)
					cb(false)
				end
	        end
		end	
	end
end)
