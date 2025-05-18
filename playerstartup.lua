--localscript

function on_get_remev(data)
	local reps = game:GetService("ReplicatedStorage")
	local players = game:GetService("Players")
	local Globals = require(reps.Globals)
	local fcore = require(reps.funcs_core)
	Globals.ptbls = data
	print(Globals.ptbls)
	local ptbl = fcore.get_playertbl(players.LocalPlayer)
	players.LocalPlayer.PlayerGui["money gui"].f2.TextBox.Text = ptbl.p_wallet 
end

function update_guis(player) 
	local reps = game:GetService("ReplicatedStorage")
	local fcore = require(reps.funcs_core)
	local ptbl = fcore.get_playertbl(player)
	player.PlayerGui["money gui"].f2.TextBox.Text = ptbl.p_wallet
end

local reps = game:GetService("ReplicatedStorage")
local input = game:GetService("UserInputService")
local players = game:GetService("Players")
local fcore = require(reps.funcs_core)
local fcommon = require(reps.funcs_common)
local Globals = require(reps.Globals)
local tbl_importer = reps:WaitForChild("new_ptbls")
tbl_importer.OnClientEvent:Connect(on_get_remev)
local click_retriever = reps:WaitForChild("sent_clicks")
click_retriever.OnClientEvent:Connect(
	function() 
		fcommon.get_views(players.LocalPlayer)  
		update_guis(players.LocalPlayer)
	end)
print("set click retriever")
