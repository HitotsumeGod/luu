local funcs_core = {}

local reps = game:GetService("ReplicatedStorage")
local globls = require(reps.Globals)

function funcs_core.get_min_pity()
	return globls.min_pity
end

function funcs_core.get_max_pity()
	return globls.max_pity
end

function funcs_core.get_player_by_id(playerid)
	local PlayerList = game:GetService("Players")
	for _, p in PlayerList:GetPlayers() do
		if playerid == p.UserId then
			return p
		end
	end
	return nil
end

function funcs_core.on_player_added(player)
	local ss = game:GetService("ServerStorage")
	local remb = require(reps.rembase)
	local callables = require(ss.remev_callables)
	local is_present = false
	for k, v in pairs(globls.ptbls) do
		if k == player.UserId then
			is_present = true
			break
		end
	end
	if not is_present then
		globls.ptbls[player.UserId] = funcs_core.gen_playertbl(player)
		print("Player " .. player.UserId .. " added to database.")
		callables.update_client(globls.ptbls)
	end
end

function funcs_core.get_playertbl(player)
	for k, v in pairs(globls.ptbls) do
		if tostring(k) == tostring(player.UserId) then
			return v
		end
	end
	return nil
end

function funcs_core.gen_playertbl(player) 

	local ptbl = {}
	local pobj = player
	local min_pity = funcs_core.get_min_pity()
	local max_pity = funcs_core.get_max_pity()
	ptbl["p_id"] = pobj.UserId
	ptbl["p_namestr"] = pobj.DisplayName
	ptbl["p_views"] = 0
	ptbl["p_wallet"] = 50
	ptbl["p_pity"] = math.random(min_pity, max_pity) / max_pity
	ptbl["p_vnum"] = math.random(2, 20)
	ptbl["p_viral"] = false
	ptbl["is_god"] = false
	ptbl["is_skibidi"] = false
	return ptbl
end

return funcs_core