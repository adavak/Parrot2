local Parrot = Parrot

local L = LibStub("AceLocale-3.0"):GetLocale("Parrot_Auras")

local newList, del = Rock:GetRecyclingFunctions("Parrot", "newList", "del")

local debug = Parrot.debug

local AURA_LATENCY_DELAY = 0.2

Parrot:RegisterCombatEvent{
	category = "Notification",
	subCategory = L["Auras"],
	name = "Buff gains",
	localName = L["Buff gains"],
	defaultTag = "([Name])",
	combatLogEvents = {
		{
			eventType = "SPELL_AURA_APPLIED",
			func = function(srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, spellId, spellName, spellSchool, auraType, amount)
				if auraType ~= "BUFF" or dstGUID ~= UnitGUID("player") then
					return nil
				end

				local info = newList()
				info.spellID = spellId
				info.abilityName = spellName
				info.recipientID = dstGUID
				info.recepientName = dstName
				info.icon = select(3, GetSpellInfo(spellId))

				return info

			end,
		},
	},
	tagTranslations = {
		Name = "abilityName",
		Icon = "icon",
	},
	tagTranslationsHelp = {
		Name = L["The name of the buff gained."],
	},
	color = "b2b200", -- dark yellow
}

Parrot:RegisterCombatEvent{
	category = "Notification",
	subCategory = L["Auras"],
	name = "Debuff gains",
	localName = L["Debuff gains"],
	defaultTag = "([Name])",
	combatLogEvents = {
		{
			eventType = "SPELL_AURA_APPLIED",
			func = function(srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, spellId, spellName, spellSchool, auraType, amount)
				if auraType ~= "DEBUFF" or dstGUID ~= UnitGUID("player") then
					return nil
				end

				local info = newList()
				info.spellID = spellId
				info.abilityName = spellName
				info.recipientID = dstGUID
				info.recepientName = dstName
				info.icon = select(3, GetSpellInfo(spellId))

				return info

			end,
		},
	},
	tagTranslations = {
		Name = "abilityName",
		Icon = "icon",
	},
	tagTranslationsHelp = {
		Name = L["The name of the debuff gained."],
	},
	color = "007f7f", -- dark cyan
}


Parrot:RegisterCombatEvent{
	category = "Notification",
	subCategory = L["Auras"],
	name = "Buff stack gains",
	localName = L["Buff stack gains"],
	defaultTag = "([Name] -[Amount]-)",
	combatLogEvents = {
		{
			eventType = "SPELL_AURA_APPLIED_DOSE",
			func = function(srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, spellId, spellName, spellSchool, auraType, amount)
				if auraType ~= "BUFF" or dstGUID ~= UnitGUID("player") then
					return nil
				end

				local info = newList()
				info.spellID = spellId
				info.abilityName = spellName
				info.recipientID = dstGUID
				info.recepientName = dstName
				info.icon = select(3, GetSpellInfo(spellId))
				info.amount = amount

				return info

			end,
		}
	},
	tagTranslations = {
		Name = "abilityName",
		Icon = "icon",
		Amount = "amount",
	},
	tagTranslationsHelp = {
		Name = L["The name of the buff gained."],
		Name = L["New Amount of stacks of the buff."],
	},
	color = "b2b200", -- dark yellow
}

Parrot:RegisterCombatEvent{
	category = "Notification",
	subCategory = L["Auras"],
	name = "Debuff stack gains",
	localName = L["Debuff stack gains"],
	defaultTag = "([Name] -[Amount]-)",
	combatLogEvents = {
		{
			eventType = "SPELL_AURA_APPLIED_DOSE",
			func = function(srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, spellId, spellName, spellSchool, auraType, amount)
				if auraType ~= "DEBUFF" or dstGUID ~= UnitGUID("player") then
					return nil
				end

				local info = newList()
				info.spellID = spellId
				info.abilityName = spellName
				info.recipientID = dstGUID
				info.recepientName = dstName
				info.icon = select(3, GetSpellInfo(spellId))
				info.amount = amount

				return info

			end,
		}
	},
	tagTranslations = {
		Name = "abilityName",
		Icon = "icon",
		Amount = "amount",
	},
	tagTranslationsHelp = {
		Name = L["The name of the debuff gained."],
		Name = L["New Amount of stacks of the debuff."],
	},
	color = "007f7f", -- dark cyan
}

Parrot:RegisterCombatEvent{
	category = "Notification",
	subCategory = L["Auras"],
	name = "Buff fades",
	localName = L["Buff fades"],
	defaultTag = "-([Name])",
	combatLogEvents = {
		{
			eventType = "SPELL_AURA_REMOVED",
			func = function(srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, spellId, spellName, spellSchool, auraType, amount)
				if auraType ~= "BUFF" or dstGUID ~= UnitGUID("player") then
					return nil
				end

				local info = newList()
				info.spellID = spellId
				info.abilityName = spellName
				info.recipientID = dstGUID
				info.recepientName = dstName
				info.icon = select(3, GetSpellInfo(spellId))

				return info

			end,
		},
	},
	tagTranslations = {
		Name = "abilityName",
		Icon = "icon",
	},
	tagTranslationsHelp = {
		Name = L["The name of the buff lost."],
	},
	color = "e5e500", -- yellow
}


Parrot:RegisterCombatEvent{
	category = "Notification",
	subCategory = L["Auras"],
	name = "Debuff fades",
	localName = L["Debuff fades"],
	defaultTag = "-([Name])",
	combatLogEvents = {
		{
			eventType = "SPELL_AURA_REMOVED",
			func = function(srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, spellId, spellName, spellSchool, auraType, amount)
				if auraType ~= "DEBUFF" or dstGUID ~= UnitGUID("player") then
					return nil
				end

--				local auraid = checkAura(spellId)
--
--				if auraid then
--				  table.remove(current_player_auras, auraid)
--				end

				local info = newList()
				info.spellID = spellId
				info.abilityName = spellName
				info.recipientID = dstGUID
				info.recepientName = dstName
				info.icon = select(3, GetSpellInfo(spellId))

				return info

			end,
		},
	},
	tagTranslations = {
		Name = "abilityName",
		Icon = "icon",
	},
	tagTranslationsHelp = {
		Name = L["The name of the debuff lost."],
	},
	color = "00d8d8", -- cyan
}


Parrot:RegisterCombatEvent{
	category = "Notification",
	subCategory = L["Auras"],
	name = "Target buff gains",
	localName = L["Target buff gains"],
	defaultTag = "[Unitname] gains [Buffname]",
	combatLogEvents = {
		{
			eventType = "SPELL_AURA_APPLIED",
			func = function(srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, spellId, spellName, spellSchool, auraType, amount)
				if auraType ~= "BUFF" or dstGUID ~= UnitGUID("target") then
					return nil
				end

				local info = newList()
				info.spellID = spellId
				info.abilityName = spellName
				info.recipientID = dstGUID
				info.recepientName = dstName
				info.icon = select(3, GetSpellInfo(spellId))

				return info

			end,
		}
	},
	tagTranslations = {
		Buffname = "abilityName",
		Icon = "icon",
		Unitname = "recepientName",
	},
	tagTranslationsHelp = {
		Buffname = L["The name of the buff gained."],
		Unitname = L["The name of the unit that gained the buff."],
	},
	color = "b2b200", -- dark yellow
	defaultDisabled = true,
}

Parrot:RegisterCombatEvent{
	category = "Notification",
	subCategory = L["Auras"],
	name = "Target buff stack gains",
	localName = L["Target buff stack gains"],
	defaultTag = "[Unitname] gains [Buffname] -[Amount]-)",
	combatLogEvents = {
		{
			eventType = "SPELL_AURA_APPLIED_DOSE",
			func = function(srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, spellId, spellName, spellSchool, auraType, amount)
				if auraType ~= "BUFF" or dstGUID ~= UnitGUID("target") then
					return nil
				end

				local info = newList()
				info.spellID = spellId
				info.abilityName = spellName
				info.recipientID = dstGUID
				info.recepientName = dstName
				info.icon = select(3, GetSpellInfo(spellId))
				info.amount = amount

				return info

			end,
		}
	},

	tagTranslations = {
		Buffname = "abilityName",
		Icon = "icon",
		Amount = "amount",
		Unitname = "dstName",
	},
	tagTranslationsHelp = {
		Buffname = L["The name of the buff gained."],
		Amount = L["New Amount of stacks of the buff."],
		Unitname = L["The name of the unit that gained the buff."],
	},
	color = "b2b200", -- dark yellow
	defaultDisabled = true,
}

Parrot:RegisterCombatEvent{
	category = "Notification",
	subCategory = L["Auras"],
	name = "Item buff gains",
	localName = L["Item buff gains"],
	defaultTag = "([Name])",
	combatLogEvents = {
		{
			eventType = "ENCHANT_APPLIED",
			func = function(srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, spellName, itemId, itemName)
				if dstGUID ~= UnitGUID("player") then
					return nil
				end

				local info = newList()
				info.itemId = itemId
				info.abilityName = spellName
				info.itemName = itemName

				return info

			end,
		},
	},
	tagTranslations = {
		Name = "abilityName",
		ItemName = "itemName",
		Icon = function(info)
			return GetItemIcon(info.itemId)
		end,
	},
	tagTranslationsHelp = {
		Name = L["The name of the item buff gained."],
		ItemName = L["The name of the item, the buff has been applied to."],
	},
	color = "b2b2b2", -- gray
}



Parrot:RegisterCombatEvent{
	category = "Notification",
	subCategory = L["Auras"],
	name = "Item buff fades",
	localName = L["Item buff fades"],
	defaultTag = "-([Name])",
	combatLogEvents = {
		{
			eventType = "ENCHANT_REMOVED",
			func = function(srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, spellName, itemId, itemName)
				if dstGUID ~= UnitGUID("player") then
					return nil
				end

				local info = newList()
				info.itemId = itemId
				info.abilityName = spellName
				info.itemName = itemName

				return info

			end,
		},
	},
	tagTranslations = {
		Name = "abilityName",
		ItemName = "itemName",
		Icon = function(info)
			return GetItemIcon(info.itemId)
		end,
	},
	tagTranslationsHelp = {
		Name = L["The name of the item buff lost."],
		ItemName = L["The name of the item, the buff has faded from."],
	},
	color = "e5e5e5", -- light gray
}

local function compareUnitAndSpell(ref, info)

	if not ref.unit or not ref.spell or not info.dstGUID then
--		debug("not complete, return false")
		return false
	end
	local good = (info.dstGUID == UnitGUID(ref.unit)) and (ref.auraType == info.auraType)
--	debug("compare unit and auraType ", good)
--	debug("compare unit and auraType ", info.dstGUID == UnitGUID(ref.unit))

	if good then
		if type(ref.spell) == 'number' then
			return ref.spell == info.spellId
		else
			return ref.spell == info.spellName
		end
	end
end

local unitChoices = {
	["player"] = PLAYER,
	["focus"] = FOCUS,
	["target"] = TARGET,
	["pet"] = PET,
}

local auraTypeChoices = {
	["BUFF"] = L["Buff"],
	["DEBUFF"] = L["Debuff"],
}

local function parseSpell(arg)
	return tostring(arg or "")
end
local function saveSpell(arg)
	return tonumber(arg) or arg
end

Parrot:RegisterPrimaryTriggerCondition {
	subCategory = L["Auras"],
	name = "Aura gain",
	localName = L["Aura gain"],
	combatLogEvents = {
		{
			eventType = "SPELL_AURA_APPLIED",
			triggerData = function(srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, spellId, spellName, spellSchool, auraType, amount)
				return {
					spellId = spellId,
					spellName = spellName,
					dstGUID = dstGUID,
					auraType = auraType,
				}
			end,
		},
	},
	param = {
		type = 'group',
		args = {
			unit = {
				name = L["Unit"],
				desc = L["The unit that is affected"],
				type = 'select',
				values = unitChoices,
			},
			spell = {
				name = L["Spell"],
				desc = L["Buff name or spell id"],
				type = 'string',
				usage = "<Buff name or spell id>",
				save = saveSpell,
				parse = parseSpell,
			},
			auraType = {
				name = L["Aura type"],
				desc = L["Type of the aura"],
				type = 'select',
				values = auraTypeChoices,
			},
		},
	},
	check = compareUnitAndSpell,
}

Parrot:RegisterPrimaryTriggerCondition {
	subCategory = L["Auras"],
	name = "Aura stack gain",
	localName = L["Aura stack gain"],
	combatLogEvents = {
		{
			eventType = "SPELL_AURA_APPLIED_DOSE",
			triggerData = function(srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, spellId, spellName, spellSchool, auraType, amount)
				return {
					dstGUID = dstGUID,
					spellId = spellId,
					spellName = spellName,
					amount = amount,
				}
			end,
		},
	},
	param = {
		type = 'group',
		args = {
			unit = {
				name = L["Unit"],
				desc = L["The unit that is affected"],
				type = 'select',
				values = unitChoices,
			},
			spell = {
				name = L["Spell"],
				desc = L["Buff name or spell id"],
				type = 'string',
				usage = "<Buff name or spell id>",
				save = saveSpell,
				parse = parseSpell,
			},
			amount = {
				name = L["Amount"],
				desc = L["Amount of stacks of the aura"],
				type = 'number',
				min = 1,
				max = 100,
				step = 1,
			},
			auraType = {
				name = L["Aura type"],
				desc = L["Type of the aura"],
				type = 'select',
				values = auraTypeChoices,
			},
		},
	},
	check = function(ref, info)
			if not ref.amount then
				return false
			end
			return compareUnitAndSpell(ref, info) and ref.amount == info.amount
		end,
}

Parrot:RegisterPrimaryTriggerCondition {
	subCategory = L["Auras"],
	name = "Aura fade",
	localName = L["Aura fade"],
	combatLogEvents = {
		{
			eventType = "SPELL_AURA_REMOVED",
			triggerData = function(srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, spellId, spellName, spellSchool, auraType, amount)
				return {
					spellId = spellId,
					spellName = spellName,
					auraType = auraType,
					dstGUID = dstGUID,
				}
			end,
		},
	},
	param = {
		type = 'group',
		args = {
			unit = {
				name = L["Unit"],
				desc = L["The unit that is affected"],
				type = 'select',
				values = unitChoices,
			},
			spell = {
				name = L["Spell"],
				desc = L["Buff name or spell id"],
				type = 'string',
				usage = "<Buff name or spell id>",
				save = saveSpell,
				parse = parseSpell,
			},
			auraType = {
				name = L["Aura type"],
				desc = L["Type of the aura"],
				type = 'select',
				values = auraTypeChoices,
			},
		},
	},
	check = compareUnitAndSpell,
}

local function checkItemBuff(ref, info)
	if ref.unit and ref.spell then
		return ref.spell == info.spellName and UnitGUID(ref.unit) == info.dstGUID
	else
		return false
	end
end

Parrot:RegisterPrimaryTriggerCondition {
	subCategory = L["Auras"],
	name = "Item buff gain",
	localName = L["Item buff gain"],
	combatLogEvents = {
		{
			eventType = "ENCHANT_APPLIED",
			triggerData = function(srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, spellName, itemId, itemName)
				return {
					spellName = spellName,
					itemName = itemName,
					dstGUID = dstGUID,
				}
			end,
		}
	},
	param = {
		type = 'group',
		args = {
			unit = {
				name = L["Unit"],
				desc = L["The unit that is affected"],
				type = 'select',
				values = unitChoices,
			},
			spell = {
				name = L["Spell"],
				desc = L["Buff name"],
				type = 'string',
			},
		},
	},
	check = checkItemBuff,
}

Parrot:RegisterPrimaryTriggerCondition {
	subCategory = L["Auras"],
	name = "Item buff fade",
	localName = L["Item buff fade"],
	combatLogEvents = {
		{
			eventType = "ENCHANT_REMOVED",
			triggerData = function(srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, spellName, itemId, itemName)
				return {
					spellName = spellName,
					itemName = itemName,
					dstGUID = dstGUID,
				}
			end,
		}
	},
	param = {
		type = 'group',
		args = {
			unit = {
				name = L["Unit"],
				desc = L["The unit that is affected"],
				type = 'select',
				values = unitChoices,
			},
			spell = {
				name = L["Spell"],
				desc = L["Buff name"],
				type = 'string',
			},
		},
	},
	check = checkItemBuff,
}

Parrot:RegisterSecondaryTriggerCondition {
	subCategory = L["Auras"],
	name = "Aura inactive",
	localName = L["Aura inactive"],
	notLocalName = L["Aura active"],
	param = {
		type = 'string',
		usage = "<Buff name>",
		save = saveSpell,
		parse = parseSpell,
	},
	check = function(param)
		return not UnitAura("player", param or "")
	end,
}
