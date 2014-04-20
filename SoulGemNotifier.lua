--[[
	SoulGemNotifier
	Author: @ChrisAnn
	Thanks to Combat Log Statistics and XPNotifier for being inspiration
]]


SoulGemNotifier = {}
SoulGemNotifier.name = "SoulGemNotifier"
SoulGemNotifier.version = "0.1.0"

function SoulGemNotifier.Initialise(eventCode, addOnName)
	if (addOnName ~= SoulGemNotifier.name) then return end

	zo_callLater(function() d("Soul Gem Notifier Initialised.") end, 4000)
	EVENT_MANAGER:RegisterForEvent(SoulGemNotifier.name, EVENT_COMBAT_EVENT, SoulGemNotifier.OnCombatEvent)
end

function SoulGemNotifier.OnCombatEvent(eventCode, result, isError, abilityName, abilityGraphic, abilityActionSlotType, sourceName, sourceType, targetName, targetType, hitValue, powerType, damageType, log)
	-- Display all combat events for debugging
	d( "[" ..result .. "]," .. "[" ..abilityName .. "]," .. "[" ..sourceName .. "]," .. "[" ..sourceType .. "]," .. "[" ..targetName .. "]," .. "[" ..targetType .. "]," .. "[" ..hitValue .. "]," .. "[" ..abilityActionSlotType .. "]," .. "[" ..powerType .. "]," .. "[" ..damageType .. "]" )
end

EVENT_MANAGER:RegisterForEvent(SoulGemNotifier.name, EVENT_ADD_ON_LOADED, SoulGemNotifier.Initialise)