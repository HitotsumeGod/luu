local funcs_common = {}

--primary function for returning views after a view-click event. takes the clicked object and the clicker player as arguments. 
--begins with a single view as a base, and scales up based on clickable variables and player statistics.
function funcs_common.get_views(player)
	local reps = game:GetService("ReplicatedStorage")
	local fcore = require(reps.funcs_core)
	local remev = require(reps.rembase)
	local views = 1
	local ptbl = fcore.get_playertbl(player)
	if ptbl.is_viral then
		for i = 2, 10 do
			if i % ptbl.vnum == 0 then
				views += 1
			end
		end
	end
	ptbl.p_views = views
	ptbl.p_wallet += views
	print(ptbl.p_wallet)
end

function funcs_common.open_shop_gui(player)
	local gui = game:GetService("StarterGui")
	local cloned_gui = gui["shop gui"]:Clone()
	cloned_gui.Parent = player.PlayerGui
	cloned_gui.Enabled = true
end

return funcs_common