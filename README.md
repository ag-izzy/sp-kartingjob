Preview:
https://www.youtube.com/watch?v=47G8e3l62kA

Installation

    Download the script and put it in the [resource] folder.
    Download qb-target & nh-context (if you don't have) and put it in the [resource] or [standalone] folder. (it doesn't really matter) Add the following code to your server.cfg/resouces.cfg

ensure qb-target
ensure nh-context
ensure qb-kartingjob

Dependencies

    qb-target
    nh-context


Add This To qb-core > shared > jobs.lua

['karting'] = {
        label = 'Karting',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Karting Worker',
                payment = 50
            },
            ['2'] = {
                name = 'Karting Boss',
                payment = 100
            },
        },
    },


Add this To qb-core > shared item.lua

	["humburgerbuns"] 			 = {["name"] = "humburgerbuns", 	["label"] = "Humburger Buns", 	["weight"] = 125, 		["type"] = "item", 		["image"] = "humburgerbuns.png",   ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Humburger Buns."},
	["cheese"] 			 		 = {["name"] = "cheese", 			["label"] = "Cheese", 			["weight"] = 125, 		["type"] = "item", 		["image"] = "cheese.png", 		   ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Cheese."},
	["cookedpatty"] 			 = {["name"] = "cookedpatty", 		["label"] = "Cooked Patty", 	["weight"] = 125, 		["type"] = "item", 		["image"] = "cookedpatty.png", 	   ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Cooked Humburger Patty."},
	["lettuce"] 			 	 = {["name"] = "lettuce", 			["label"] = "Lettuce", 			["weight"] = 125, 		["type"] = "item", 		["image"] = "lettuce.png", 	       ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Lettuce."},
	["patty"] 			         = {["name"] = "patty", 			["label"] = "Patty", 			["weight"] = 125, 		["type"] = "item", 		["image"] = "patty.png", 		   ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Patty!"},
	["potato"] 			         = {["name"] = "potato", 			["label"] = "Potato", 			["weight"] = 125, 		["type"] = "item", 		["image"] = "potato.png", 		   ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Potato!"},
	["burger-fries"] 				 = {["name"] = "burger-fries", 			 	  	["label"] = "Pomfrit", 				    ["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_fries.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sates Hunger."},
	["burger-softdrink"] 			 = {["name"] = "burger-softdrink", 				["label"] = "Soft Drink", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_softdrink.png", 		   ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ice Cold Drink."},
  	["burger-heartstopper"] 		 = {["name"] = "burger-heartstopper", 			["label"] = "Heartstopper", 			["weight"] = 2500, 		["type"] = "item", 		["image"] = "bs_the-heart-stopper.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sates Hunger."},


Add This To qb-smallresources > config.lua > ConsumeablesEat > 

["burger-heartstopper"] = math.random(35, 54),


Add This To qb-smallresources > config.lua > ConsumeablesDrink > 

["burger-softdrink"] = math.random(40, 50),

Add This To qb-smallresources > server > consummbles.lua > 

QBCore.Functions.CreateUseableItem("burger-softdrink", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

Add This To qb-smallresources > server > consummbles.lua > 

QBCore.Functions.CreateUseableItem("burger-heartstopper", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

Karting Cars For The Garage System: https://www.filemail.com/d/zrjdhvteiommxjl

Map For The Script: https://forum.cfx.re/uploads/short-url/mG2RdkXTckktnR0wJAcfaFiKY4v.rar

Done (;
