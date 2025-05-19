local reps = game:GetService("ReplicatedStorage")
local input = game:GetService("UserInputService")
local players = game:GetService("Players")
local fcore = require(reps.funcs_core)
local fcommon = require(reps.funcs_common)
local globls = require(reps.Globals)

function on_get_remev(data)
	globls.ptbls = data
	local ptbl = fcore.get_playertbl(players.LocalPlayer)
	players.LocalPlayer.PlayerGui["money gui"].f2.TextBox.Text = ptbl.p_wallet
end

function update_guis(player) 
	local ptbl = fcore.get_playertbl(player)
	player.PlayerGui["money gui"].f2.TextBox.Text = ptbl.p_wallet
end

local tbl_importer = reps:WaitForChild("new_ptbls")
tbl_importer.OnClientEvent:Connect(function(data) print(data) on_get_remev(data) end)
local click_retriever = reps:WaitForChild("server_remev")
click_retriever.OnClientEvent:Connect(
	function(data)
		if data == globls.remev_types[1] then
			fcommon.get_views(players.LocalPlayer)  
			update_guis(players.LocalPlayer)
		elseif data == globls.remev_types[2] then
			fcommon.open_shop_gui(players.LocalPlayer)
		else
			print("error: invalid data")
		end
	end)
print("set click retriever")