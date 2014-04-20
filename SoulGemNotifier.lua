--[[
	SoulGemNotifier
	Author: @ChrisAnn
	Thanks to SoulGemsCounter, Combat Log Statistics and XPNotifier for being inspiration
]]


SoulGemNotifier = {}
SoulGemNotifier.name = "SoulGemNotifier"
SoulGemNotifier.version = "0.1.0"

function SoulGemNotifier.Initialise(eventCode, addOnName)
	if (addOnName ~= SoulGemNotifier.name) then return end

	zo_callLater(function() d("Soul Gem Notifier Initialised.") end, 4000)
	EVENT_MANAGER:RegisterForEvent(SoulGemNotifier.name, EVENT_INVENTORY_SINGLE_SLOT_UPDATE, SoulGemNotifier.OnSingleSlotUpdate)
end

function SoulGemNotifier.OnSingleSlotUpdate(eventId, bagId, slotId, isNewItem)
	d("[eventId:"..eventId.."][bagId:"..bagId.."][slotId:"..slotId.."]" .. string.format("[isNewItem: %s]", isNewItem and "true" or "false"))
	d(string.format("IsFilledSoulGem: %s", IsItemSoulGem(1, bagId, slotId) and "true" or "false"))
end

EVENT_MANAGER:RegisterForEvent(SoulGemNotifier.name, EVENT_ADD_ON_LOADED, SoulGemNotifier.Initialise)