--localscript

local sprinting = false
function sprint(input, _gameProcessed)
	local player = game.Players.LocalPlayer
		if input.KeyCode == Enum.KeyCode.LeftShift then
			if not sprinting then
				sprinting = true
				player.Character.Humanoid.WalkSpeed = 22
			else
				sprinting = false
				player.Character.Humanoid.WalkSpeed = 8
			end
		end
end
local sinput = game:GetService("UserInputService")
sinput.InputBegan:Connect(sprint)
