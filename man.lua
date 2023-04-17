repeat wait() until game:IsLoaded()

local PlaceIDs = {}

getgenv().SUPER_SECRET_KEY = "NO_NITRO" -- You want my discord nitro?  You can have it!  I left everything I gathered together in one place!  Now you just have to find it!

getgenv().library = loadstring(game:GetObjects("rbxassetid://7657867786")[1].Source)()
loadstring(game:HttpGet("https://raw.githubusercontent.com/binwonk/9102192091209/main/notif.lua"))()
getgenv().IrisAd = true
getgenv().httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request -- used for the serverhop

if game.PlaceId == 3082707367 then
	getgenv().ROWizardOneShotStatus = false
	getgenv().ROWizardOneShotSettings = {
		Inclusions = {
			"HandleDamage",
			"ReplicateCast",
			"TarantallegraHit",
			"SpawnGeminioClone",
			"SpawnHelios",
			"SpawnBombardo",
			"DiffindoHit"
		}
	}
	getgenv().Remote = game:GetService("ReplicatedStorage").Modules.Network.RemoteEvent
end

if game.GameId == 73885730 then
	getgenv().PrisonLifeOneShotStatus = false
	getgenv().GodModePLToggle = false
	getgenv().GodModePLCFrame = nil;
	getgenv().Remote = game:GetService("ReplicatedStorage").meleeEvent
end

getgenv().welcomeMessages = {[1] = {
    Title = "Welcome,",
    Body = "to the most skidded script on Roblox."
},[2] = {
    Title = "Did you know?",
    Body = "One in every 5 Discord users is a terrorist!"
},[3] = {
    Title = "One Script,",
    Body = "to rule them all."
},[4] = {
    Title = "The skidding goes ever on and on,",
    Body = "Down from v3rmillion where it began."
},[5] = {
    Title = "Rip and skid,",
    Body = "Until it is done."
},[6] = {
    Title = "Why are we still here?",
    Body = "Just to skid?"
},[7] = {
    Title = "Remember, no Russian.",
    Body = ""
},[8] = {
    Title = "Hello everybody,",
    Body = "my name is Markiplier."
},[9] = {
    Title = "Impressive, very nice.",
    Body = "Let's see Paul Allen's script."
},[10] = {
    Title = "Oh, you think JJSploit is your ally?",
    Body = "But you merely adopted the exploit. I was born using it, skidded with it."
},[11] = {
    Title = "Binsploit V5",
    Body = "Brought to you by binwonk#1043."
},[12] = {
    Title = "I once saw him skid three scripts on V3rmillion, with a pencil,",
    Body = "with a fucking pencil!"
},[13] = {
    Title = "That thing was too big to be called a sword.",
    Body = "Too big, too thick, too heavy, and too rough, it was more like a large hunk of iron."
},[14] = {
    Title = "For what purpose, " .. game:GetService("Players").LocalPlayer.Name .. "?",
    Body = "To give the Covenant back their bomb."
},[15] = {
    Title = "Dread it, run from it,",
    Body = "Binsploit V5 arrives all the same."
},[16] = {
    Title = "You will not rise from the Deep,",
    Body = "but drown in it."
},[17] = {
    Title = "That day, if our positions were switched...",
    Body = "Would our fates be different? Would I have your life, and you mine?"
}}
getgenv().welcomeMessage = welcomeMessages[math.random(1, #welcomeMessages)]

getgenv().spoofWS = false
getgenv().spoofKICK = false
getgenv().spoofPos = false
getgenv().alwaysHumJump = false
getgenv().kickReason = true

getgenv().AWGodMode = false

getgenv().spoofs = {
WalkSpeed = 16,
JumpPower = 50
}
local oldnind = nil;
local oldind = nil;
local oldnc = nil;
oldnind = hookmetamethod(game, "__newindex", function(u, w, o)
if spoofWS then
    if not checkcaller() and tostring(u) == "Humanoid" and (w == "JumpPower" or w == "WalkSpeed") then
        spoofs[w] = o
        return
    end
end
if spoofPos then
    if not checkcaller() and tostring(u) == game:GetService("Players").LocalPlayer.Name then
        if w == "CFrame" then
            return CFrame.new(0,0,0)
        end
        if w == "Position" then
            return Vector3.new(0,0,0)
        end
    end
end
return oldnind(u, w, o)
end)
oldind = hookmetamethod(game, "__index", function(u, w)
if spoofWS then
    if not checkcaller() and tostring(u) == "Humanoid" and (w == "JumpPower" or w == "WalkSpeed") then
        return spoofs[w]
    end
end
if ArsenalWallbang then
    if w == "Clips" then
        return workspace.Map
    end
end
if spoofPos then
    if not checkcaller() and tostring(u) == game:GetService("Players").LocalPlayer.Name then
        if w == "CFrame" then
            return CFrame.new(0,0,0)
        end
        if w == "Position" then
            return Vector3.new(0,0,0)
        end
    end
end
return oldind(u, w)
end)
oldnc = hookmetamethod(game, "__namecall", function(self, ...)
local args = {...}
if spoofKICK then
    if (getnamecallmethod() == "kick" or getnamecallmethod() == "Kick") and self == game.Players.LocalPlayer then
        if kickReason == true then
            if args[1] then
                Notify("Kick Attempted For: ", args[1], 3)
            end
        end
        return wait(9e8)
    end
end
if ROWizardOneShotStatus then
    if getnamecallmethod() == "FireServer" and self.Name == "RemoteEvent" then
        local xd = args[1]
        if table.find(ROWizardOneShotSettings.Inclusions, xd) then
            for i = 1, 4 do
                oldnc(self, ...)
            end
        end
        return oldnc(self, ...)
    end
end
if AWGodMode then
    if getnamecallmethod() == "FireServer" and self.Name == "FallReport" then
        return
    end
end
if PrisonLifeOneShotStatus then
    if getnamecallmethod() == "FireServer" and self.Name == "meleeEvent" then
        for i = 1, 50 do
            oldnc(self, ...)
        end
        return oldnc(self, ...)
    end
end
return oldnc(self, ...)
end)

getgenv().v5 = library:CreateWindow({
	Name = "Binsploit V5-A",
	Themeable = {
		Info = {
			"Binsploit V5 by binwonk#1043",
			"Crash Server found by Pyronym",
			"Binsploit V5 Pre-Release A",
			"Stream Sniper: https://v3rmillion.net/showthread.php?tid=1168739"
		}
	}
})

Notify(welcomeMessage)

if v5config.UNIVERSAL.ESP then
    -- ESP LOADSTRING GOES HERE
end
if v5config.UNIVERSAL.MUSICPLAYER then
    -- MUSIC PLAYER LOADSTRING GOES HERE
end
if v5config.UNIVERSAL.AIMBOT then
    -- AIMBOT LOADSTRTING
end
if v5config.UNIVERSAL.CHATSPAM then
end
if v5config.UNIVERSAL.MISCSTUFF then
end
if v5config.UNIVERSAL.GAME then
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/binwonk/9102192091209/main/games/" .. tostring(game.PlaceId) .. ".lua"))()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/binwonk/9102192091209/main/games/" .. tostring(game.GameId) .. ".lua"))()
    end)
end
