local ss = game:GetService("ServerStorage")
local reps = game:GetService("ReplicatedStorage")
local workspace = game:GetService("Workspace")
local players = game:GetService("Players")
local globls = require(reps.Globals)
local fcore = require(reps.funcs_core)
local fcommon = require(reps.funcs_common)
local callables = require(ss.remev_callables)
local gilg_det = Instance.new("ClickDetector", workspace["other gui"]["Gilgamesh [Gambler]"])
local car_det = Instance.new("ClickDetector", workspace.Car)
players.PlayerAdded:Connect(fcore.on_player_added)
gilg_det.MouseClick:Connect(
	function(player) callables.open_gui(player, globls.remev_types[2]) end
)
car_det.MouseClick:Connect(
	function(player) callables.send_clicks(player, globls.remev_types[1]) end
)