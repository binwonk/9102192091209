notifLibrary = loadstring(game:HttpGet("https://api.irisapp.ca/Scripts/IrisBetterNotifications.lua"))()

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
