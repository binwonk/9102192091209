local game = game
local qot = syn.queue_on_teleport or queue_on_teleport or fluxus.queue_on_teleport


local universal = v5:CreateTab({
	Name = "Universal"
})

local MiscUniversalSection = universal:CreateSection({
	Name = "Misc",
	Side = "Left"
})

local UniversalRejoin = MiscUniversalSection:AddButton({
	Name = "Rejoin",
	Callback = function()
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer)
	end
})

local JoinDiscordButton = MiscUniversalSection:AddButton({
	Name = "Join Discord",
	Callback = function()
		setclipboard("https://discord.com/invite/zgHy6TsYcQ")
		Notify("Invite set to clipboard!", "Thank you for using Binsploit V5.", 1)
	end
})

local qrejoin = false
if qot then
game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
	if State == Enum.TeleportState.Started then
		if qrejoin then
			qot([[loadstring(game:HttpGet("https://gist.githubusercontent.com/binwonk/9102192091209/new/loader.lua"))()]])
		end
	end
end)
local QueueOnTeleportToggle = MiscUniversalSection:AddToggle({
	Name = "Queue On Teleport",
	Value = false,
	Callback = function(val)
		qrejoin = val
	end
})
end
