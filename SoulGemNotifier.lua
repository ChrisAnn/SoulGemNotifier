--[[
	SoulGemNotifier
	Author: @ChrisAnn
	Thanks to SoulGemsCounter, Combat Log Statistics and XPNotifier for being inspiration
]]


SoulGemNotifier = {}
SoulGemNotifier.name = "SoulGemNotifier"
SoulGemNotifier.version = "1.0.2"
SoulGemNotifier.debug = false

function SoulGemNotifier.Initialise(eventCode, addOnName)
	if (addOnName ~= SoulGemNotifier.name) then return end

	zo_callLater(function() d("Soul Gem Notifier Initialised.") end, 4000)
	EVENT_MANAGER:RegisterForEvent(SoulGemNotifier.name, EVENT_INVENTORY_SINGLE_SLOT_UPDATE, SoulGemNotifier.OnSingleSlotUpdate)
end

function SoulGemNotifier.OnSingleSlotUpdate(eventId, bagId, slotId, isNewItem)
	
	if (SoulGemNotifier.debug) then
		d("|r|c888888 [eventId:"..eventId.."][bagId:"..bagId.."][slotId:"..slotId.."]" .. string.format("[isNewItem: %s]", isNewItem and "true" or "false"))
		d("|r|c888888 " .. string.format("IsFilledSoulGem: %s", IsItemSoulGem(1, bagId, slotId) and "true" or "false"))
	end

	if (IsItemSoulGem(1, bagId, slotId) and isNewItem) then
		d("|r|c00FFFF Filled a Soul Gem")
	end
end

EVENT_MANAGER:RegisterForEvent(SoulGemNotifier.name, EVENT_ADD_ON_LOADED, SoulGemNotifier.Initialise)