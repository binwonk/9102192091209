local game = game

getgenv().library = loadstring(game:HttpGet("https://gist.githubusercontent.com/binwonk/5b07bd287d32dc0942a203bc92ca47e4/raw/5446217eb429473c30eb3f346b824091bf2f7f25/58923752398.lua"))()
getgenv().notifLibrary = loadstring(game:HttpGet("https://api.irisapp.ca/Scripts/IrisBetterNotifications.lua"))()
getgenv().IrisAd = true
getgenv().Notify = function(Title, Body, RemoveTime)
	if tonumber(RemoveTime) == nil then
		RemoveTime = 3
	end
	notifLibrary.Notify(Title, Body, "rbxassetid://6022668911", {
		Duration = RemoveTime,
		Main = {
			Rounding = true
		}
	})
end

getgenv().v5 = library:CreateWindow({
	Name = "Binsploit V5-A",
	Themeable = {
		Info = {
			"Binsploit V5 by binwonk#1043",
			"Crash Server found by Pyronym",
			"Binsploit V5 Pre-Release B",
			"Stream Sniper: line 25" -- https://v3rmillion.net/showthread.php?tid=1168739
		}
	}
})

pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/binwonk/9102192091209/new/games/universal"))()
end)

pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/binwonk/9102192091209/new/games/" .. game.GameId .. game.PlaceId))()
end)
