-- check if item is in list helper function
local function contains(list, x)
	for _,v in pairs(list) do
		if v == x then return true end
	end
	return false
end

local f = CreateFrame("FRAME")
f:RegisterEvent("MERCHANT_SHOW")

f:SetScript("OnEvent", function(self, event, ...)
	local list = {
		-- Kaufotron 1000
		--"Rezept: Schwerer Kodoeintopf",
		--"Rezept: Mageres Wildbret",
		-- Superverkaufomat 680
		--"Rezept: Drachenodemchili",
		"Rezept: Scharfe Wolfrippchen",
		--"Rezept: Eigenartiger Eintopf",
		--"Rezept: Mageres Wolfsteak",
		-- Diverse
		"Aquadynamischer Fischanlocker"
	}
	local numMerchantItems = GetMerchantNumItems()
	for ind=numMerchantItems,1,-1 do
		local name, texture, price, quantity, numAvailable, isUsable, extendedCost = GetMerchantItemInfo(ind)
		-- kauf die beim Vendor verfügbare Anzahl, da es sich um limitierte Items handelt
		-- unlimitierte Items haben den Wert -1 und dann muss man das Argument anpassen
		if contains(list, name) then BuyMerchantItem(ind, numAvailable) end
	end
end)
