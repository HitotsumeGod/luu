local remev_callables = {}

local reps = game:GetService("ReplicatedStorage")
local remb = require(reps.rembase)
local remev = remb.make_remev("server_remev", reps)

function remev_callables.update_client(data)
	local pemev = remb.make_remev("new_ptbls", reps)
	remb.fireall(pemev, data)
end

function remev_callables.send_clicks(player, click_type)
	remb.fire(remev, player, click_type)
end

function remev_callables.open_gui(player, gui_type)
	remb.fire(remev, player, gui_type)
end

return remev_callables
