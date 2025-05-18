--modulescript

local rembase = {}

function rembase.make_remev(name, parent)
	local remev = nil
	if parent then
		remev = Instance.new("RemoteEvent", parent)
	else
		remev = Instance.new("RemoteEvent")
	end
	remev.Name = name
	return remev
end

function rembase.fire(remev, player, data)
	print("firing...")
	remev:FireClient(player, data)
end

function rembase.fireall(remev, data)
	print("firing all...")
	remev:FireAllClients(data)
end

return rembase
