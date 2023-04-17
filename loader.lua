getgenv().v5config = {
    Universal = {
        ESP = false,
        MUSICPLAYER = false,
        AIMBOT = false,
        CHATSPAM = false,
        MISCSTUFF = false,
        GAME = false
    },
    AutoLoadConfig = false
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/binwonk/9102192091209/main/notif.lua"))()
local temp = game:GetService("HttpService"):JSONDecode(readfile("binsploitV5.txt"))

if temp.AutoLoadConfig then
    Notify("To disable auto-loading,", "please check your workspace folder.", 1)
    wait(1)
    for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
        if v:FindFirstChild("main") then
            v:Destroy()
        end
    end
    loadstring(game:HttpGet("https://raw.githubusercontent.com/binwonk/9102192091209/main/man.lua"))()
end

local configUI = {}
local configlibrary = loadstring(game:GetObjects("rbxassetid://7657867786")[1].Source)()
local configData = game:GetService("HttpService"):JSONEncode(v5config)

if not isfile("binsploitV5.txt") then
    writefile("binsploitV5.txt", configData)
end

configUI.configWindow = configlibrary:CreateWindow({
    Name = "Binsploit V5 Config"
})

configUI.configTab = configUI.configWindow:CreateTab({
    Name = "Config",
})

configUI.configSec1 = configUI.configTab:CreateSection({
    Name = "Universal",
    Side = "Left"
})

configUI.configSec2 = configUI.configTab:CreateSection({
    Name = "Misc",
    Side = "Right"
})

configUI.

configUI.configSaveLoad = configUI.configTab:CreateSection({
    Name = "Config Options",
    Side = "Right"
})

configUI.configSaveButton = configUI.configSaveLoad:AddButton({
    Name = "Save Config",
    Callback = function()
        configData = game:GetService("HttpService"):JSONEncode(v5config)
        writefile("binsploitV5.txt", configData)
    end
})

configUI.configLoadButton = configUI.configSaveLoad:AddButton({
    Name = "Load Config",
    Callback = function()
        getgenv().v5config = game:GetService("HttpService"):JSONDecode(readfile("binsploitV5.txt"))
    end
})

configUI.ExecuteButton = configUI.configSaveLoad:AddButton({
    Name = "Execute!",
    Callback = function()
        for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
            if v:FindFirstChild("main") then
                v:Destroy()
            end
        end
        loadstring(game:HttpGet("https://raw.githubusercontent.com/binwonk/9102192091209/main/man.lua"))()
    end
})

configUI.configEspToggle = configUI.configSec1:AddToggle({
    Name = "ESP",
    Value = false,
    Callback = function(val)
        getgenv().v5config.Universal.ESP = val
    end
})

configUI.configMUSICPLAYERToggle = configUI.configSec1:AddToggle({
    Name = "Music Player",
    Value = false,
    Callback = function(val)
        getgenv().v5config.Universal.MUSICPLAYER = val
    end
})
