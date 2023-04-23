local Players = game:GetService("Players")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Camera = workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()
local ColorVariable = Color3.new(1,1,1)
local useNametags = true
local NametagsInfo = true

local drawingTable = {}
local connectionsTable = {}
local tracerFunctions = {}
local method = "Center"
local ColorMethod = "Normal" -- or "Rainbow"

function tracerFunctions.removeFromTable(item,name)
    print("hihi")
end
function tracerFunctions.addToTable(item,name)
    print("hihi")
end

function tracerFunctions.round(num, decimalPlaces)
    local mult = 10^(decimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

function tracerFunctions.clearTable()
    for i,v in pairs(drawingTable) do
        for x,d in pairs(v) do
            d:Remove()
        end
        v = nil;
    end
    for i,v in pairs(connectionsTable) do
        v:Disconnect()
        v = nil
    end
end


tracerFunctions.clearTable()

function tracerFunctions.addESP(player,Method)
    Method = method
    local line = Drawing.new("Line")
    line.Visible = false
    line.Color = Color3.new(1,1,1)
    line.Thickness = 1
    line.Transparency = 1
    local text = Drawing.new("Text")
	text.Text = player.Name
	text.Color = Color3.new(1, 1, 1)
	text.Outline = true
	text.OutlineColor = Color3.new(0, 0, 0)
	text.Size = 20
	text.Visible = false
    drawingTable[player.Name] = {line, text}
    print("added line")
    local con;
    function doTracer()
    con = game:GetService("RunService").RenderStepped:Connect(function()
        Method = method
        if ColorMethod == "Normal" then
            line.Color = ColorVariable
        elseif ColorMethod == "Rainbow" then
            line.Color = Color3.fromHSV(tick() * 24 % 255/255, 1, 1)
        end
        if Method == "Center" then
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player ~= LocalPlayer then
                local WTSP,OS = Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)

                if OS then
                    line.Visible = true
                    print("yahoo!")
                    line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                    line.To = Vector2.new(WTSP.X,WTSP.Y)
                else
                    line.Visible = false
                end
            else
                line.Visible = false
            end
        elseif Method == "Bottom" then
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player ~= LocalPlayer then
                local WTSP,OS = Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)

                if OS then
                    line.Visible = true
                    print("yahoo!")
                    line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 1)
                    line.To = Vector2.new(WTSP.X,WTSP.Y)
                else
                    line.Visible = false
                end
            else
                line.Visible = false
            end
        elseif Method == "Top" then
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player ~= LocalPlayer then
                local WTSP,OS = Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)

                if OS then
                    line.Visible = true
                    print("yahoo!")
                    line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y - Camera.ViewportSize.Y)
                    line.To = Vector2.new(WTSP.X,WTSP.Y)
                else
                    line.Visible = false
                end
            else
                line.Visible = false
            end
        elseif Method == "Mouse" then
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player ~= LocalPlayer then
                local WTSP,OS = Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)

                if OS then
                    line.Visible = true
                    print("yahoo!")
                    line.From = Vector2.new(Mouse.X, Mouse.Y + 36)
                    line.To = Vector2.new(WTSP.X,WTSP.Y)
                else
                    line.Visible = false
                end
            else
                line.Visible = false
            end
        end
        if useNametags and player.Character and player.Character:FindFirstChild("Head") and player.Character:FindFirstChildOfClass("Humanoid") then
            local WTSP,OS = Camera:WorldToViewportPoint(player.Character.Head.Position)
            if NametagsInfo then
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    text.Text = player.Name .. ", Distance: " .. tostring(tracerFunctions.round((LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - player.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude),2) .. ", Health: " .. tracerFunctions.round(player.Character:FindFirstChildOfClass("Humanoid").Health,2)
                end
            end
            if OS then
                text.Visible = true
                text.Position = Vector2.new(WTSP.X, WTSP.Y)
            else
                text.Visible = false
            end
        end
    end)
    end
    coroutine.wrap(doTracer)()
    print("connected")
    connectionsTable[player.Name] = con
    print("added to table")
end

function tracerFunctions.removeESP(player)
    if drawingTable[player.Name] then
        for x,d in pairs(drawingTable[player.Name]) do
            d:Remove()
            d = nil
        end
    end
    if connectionsTable[player.Name] then
        connectionsTable[player.Name]:Disconnect()
        connectionsTable[player.Name] = nil
    end
end

function tracerFunctions.changeMethod(meth)
    method = meth
end

function tracerFunctions.updateColor(color3)
    ColorVariable = color3
end

function tracerFunctions.colorMethod(meth)
    ColorMethod = meth
end

function tracerFunctions.clearTables()
    tracerFunctions.clearTable()
    drawingTable = {}
    connectionsTable = {}
end

tracerFunctions.colorMethod("Normal")
tracerFunctions.changeMethod("Bottom")

tracerFunctions.clearTables()

return tracerFunctions
