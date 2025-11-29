local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local Camera = Workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "FEMBOYSHUB PAID PREMIUM :3",
    LoadingTitle = "FemboysHub Loading...",
    LoadingSubtitle = "By Lis",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "Femmy",
        FileName = "Big Hub"
    },
    Discord = {
        Enabled = true,
        Invite = "EPfpgkg6",
        RememberJoins = true
    },
    KeySystem = false,
})

local MainTab = Window:CreateTab("FemboysHub Main", nil)
local MiscTab = Window:CreateTab("FemboysHub Misc", nil)
local CombatTab = Window:CreateTab("FemboysHub Combat", nil)
local TeleportsTab = Window:CreateTab("FemboysHub Teleports", nil)
local BoostTab = Window:CreateTab("Boost", nil)

getgenv().AimPart = "Head"
getgenv().AimRadius = 100
getgenv().FirstPerson = true
getgenv().TeamCheck = false
getgenv().PredictMovement = true
getgenv().PredictionVelocity = 16

local AimlockTarget = nil
local AimlockEnabled = false
local ConnectionInput = nil
local ConnectionRender = nil

local function Notify(title, text, duration)
    StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration or 3
    })
end

local function GetNearestTarget()
    local nearestPlr = nil
    local shortestDistance = math.huge
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 then
            if getgenv().TeamCheck and plr.Team == LocalPlayer.Team then continue end
            local pos = Camera:WorldToViewportPoint(plr.Character.Head.Position)
            local mousePos = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
            local distance = (Vector2.new(pos.X, pos.Y) - mousePos).Magnitude
            if distance < getgenv().AimRadius and distance < shortestDistance then
                nearestPlr = plr
                shortestDistance = distance
            end
        end
    end
    return nearestPlr
end

MainTab:CreateSection("FemboyHub Booster Aimbot")

MainTab:CreateToggle({
    Name = "Aimlock",
    CurrentValue = false,
    Callback = function(enabled)
        if enabled then
            ConnectionInput = UserInputService.InputBegan:Connect(function(input)
                if not UserInputService:GetFocusedTextBox() and input.UserInputType == Enum.UserInputType.MouseButton2 then
                    AimlockEnabled = true
                    local target = GetNearestTarget()
                    if target then
                        AimlockTarget = target
                        if getgenv().NotifyTarget then
                            Notify("FemboyCrimHub", "Aimlock Target: " .. tostring(AimlockTarget.Name), 3)
                        end
                    end
                end
            end)
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton2 then
                    AimlockTarget = nil
                    AimlockEnabled = false
                end
            end)
            ConnectionRender = RunService.RenderStepped:Connect(function()
                if AimlockEnabled and AimlockTarget and AimlockTarget.Character and AimlockTarget.Character:FindFirstChild(getgenv().AimPart) then
                    local targetPos = AimlockTarget.Character[getgenv().AimPart].Position
                    if getgenv().PredictMovement then
                        targetPos = targetPos + (AimlockTarget.Character[getgenv().AimPart].Velocity / getgenv().PredictionVelocity)
                    end
                    Camera.CFrame = CFrame.new(Camera.CFrame.p, targetPos)
                end
            end)
        else
            if ConnectionRender then ConnectionRender:Disconnect() end
            if ConnectionInput then ConnectionInput:Disconnect() end
            AimlockTarget = nil
            AimlockEnabled = false
        end
    end
})

MainTab:CreateToggle({
    Name = "Predict movement",
    CurrentValue = true,
    Callback = function(val) getgenv().PredictMovement = val end
})

MainTab:CreateToggle({
    Name = "Notify aimlock's target",
    CurrentValue = true,
    Callback = function(val) getgenv().NotifyTarget = val end
})

MainTab:CreateSection("Player ESP")

local ESP_Enabled = false
local ESP_Health = false
local ESP_Highlight = false
local ESP_Rainbow = false
local ESP_Tracers = false
local ESP_Color = Color3.fromRGB(255, 255, 255)
local ESP_TextSize = 14
local ESP_FillTrans = 0.5
local TracerLines = {}

local function UpdateESP(plr)
    if not plr.Character then return end
    local head = plr.Character:FindFirstChild("Head")
    if not head then return end
    if head:FindFirstChild("UsernameBillboard") then head.UsernameBillboard:Destroy() end
    if not ESP_Enabled then return end
    local bg = Instance.new("BillboardGui", head)
    bg.Name = "UsernameBillboard"
    bg.Size = UDim2.new(6, 0, 1, 0)
    bg.StudsOffset = Vector3.new(0, 3, 0)
    bg.AlwaysOnTop = true
    local label = Instance.new("TextLabel", bg)
    label.Name = "InfoLabel"
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = ESP_Color
    label.TextStrokeTransparency = 0.5
    label.TextSize = ESP_TextSize
    label.Font = Enum.Font.SourceSansBold
    local content = "Name: " .. plr.Name
    if ESP_Health and plr.Character:FindFirstChild("Humanoid") then
        content = content .. " | HP: " .. math.floor(plr.Character.Humanoid.Health)
    end
    label.Text = content
    if ESP_Rainbow then
        task.spawn(function()
            while ESP_Rainbow and label.Parent do
                local t = tick() % 1
                label.TextColor3 = Color3.fromHSV(t, 1, 1)
                task.wait(0.1)
            end
        end)
    end
end

local function UpdateTracers()
    for _, line in pairs(TracerLines) do line.Visible = false end
    if not ESP_Tracers then return end
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 then
            local line = TracerLines[plr.UserId]
            if not line then
                line = Drawing.new("Line")
                line.Thickness = 1
                line.Color = Color3.new(1, 1, 1)
                TracerLines[plr.UserId] = line
            end
            local vector, onScreen = Camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
            if onScreen then
                line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                line.To = Vector2.new(vector.X, vector.Y)
                line.Visible = true
            else
                line.Visible = false
            end
        end
    end
end

RunService.RenderStepped:Connect(UpdateTracers)

MainTab:CreateToggle({
    Name = "Player ESP",
    CurrentValue = false,
    Callback = function(val)
        ESP_Enabled = val
        for _, v in pairs(Players:GetPlayers()) do UpdateESP(v) end
    end
})

MainTab:CreateToggle({
    Name = "Show Health",
    CurrentValue = false,
    Callback = function(val)
        ESP_Health = val
        if ESP_Enabled then for _, v in pairs(Players:GetPlayers()) do UpdateESP(v) end end
    end
})

MainTab:CreateToggle({
    Name = "Highlight",
    CurrentValue = false,
    Callback = function(val)
        ESP_Highlight = val
        for _, plr in pairs(Players:GetPlayers()) do
            if plr.Character then
                local hl = plr.Character:FindFirstChild("Highlight")
                if val then
                    if not hl then
                        hl = Instance.new("Highlight", plr.Character)
                        hl.Name = "Highlight"
                        hl.FillTransparency = ESP_FillTrans
                        hl.OutlineColor = ESP_Color
                    end
                elseif hl then hl:Destroy() end
            end
        end
    end
})

MainTab:CreateToggle({
    Name = "Rainbow Text",
    CurrentValue = false,
    Callback = function(val)
        ESP_Rainbow = val
        if ESP_Enabled then for _, v in pairs(Players:GetPlayers()) do UpdateESP(v) end end
    end
})

MainTab:CreateToggle({
    Name = "Tracers",
    CurrentValue = false,
    Callback = function(val) ESP_Tracers = val end
})

MainTab:CreateColorPicker({
    Name = "Text Color Picker",
    Color = Color3.fromRGB(255, 255, 255),
    Callback = function(col)
        ESP_Color = col
        if not ESP_Rainbow and ESP_Enabled then
             for _, v in pairs(Players:GetPlayers()) do UpdateESP(v) end
        end
    end
})

MainTab:CreateSlider({
    Name = "Text Size",
    Range = {10, 20},
    Increment = 1,
    CurrentValue = 14,
    Callback = function(val)
        ESP_TextSize = val
        if ESP_Enabled then for _, v in pairs(Players:GetPlayers()) do UpdateESP(v) end end
    end
})

MainTab:CreateSlider({
    Name = "Highlight Fill Transparency",
    Range = {0, 1},
    Increment = 0.05,
    CurrentValue = 0.5,
    Callback = function(val)
        ESP_FillTrans = val
        for _, plr in pairs(Players:GetPlayers()) do
            if plr.Character and plr.Character:FindFirstChild("Highlight") then
                plr.Character.Highlight.FillTransparency = val
            end
        end
    end
})

Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(function() task.wait(1) if ESP_Enabled then UpdateESP(plr) end end)
end)

for _, p in pairs(Players:GetPlayers()) do
    p.CharacterAdded:Connect(function() task.wait(1) if ESP_Enabled then UpdateESP(p) end end)
end

MainTab:CreateSection("Other ESP's")

local SafeESP_Enabled = false
MainTab:CreateToggle({
    Name = "Safe ESP",
    CurrentValue = false,
    Callback = function(val)
        SafeESP_Enabled = val
        if val then
            task.spawn(function()
                while SafeESP_Enabled do
                    task.wait(1)
                    if Workspace:FindFirstChild("Map") and Workspace.Map:FindFirstChild("BredMakurz") then
                        for _, obj in pairs(Workspace.Map.BredMakurz:GetChildren()) do
                            if not obj:FindFirstChild("SafeESP") then
                                local isSafe = obj.Name:lower():find("safe") or obj.Name:lower():find("register") or obj.Name:lower():find("cash")
                                if isSafe then
                                    local bg = Instance.new("BillboardGui", obj)
                                    bg.Name = "SafeESP"
                                    bg.AlwaysOnTop = true
                                    bg.Size = UDim2.new(1.2, 0, 1.2, 0)
                                    local txt = Instance.new("TextLabel", bg)
                                    txt.Name = "name"
                                    txt.Size = UDim2.new(1,0,0.3,0)
                                    txt.BackgroundTransparency = 1
                                    txt.TextColor3 = Color3.fromRGB(0, 255, 0)
                                    txt.Text = obj.Name
                                    local hp = Instance.new("TextLabel", bg)
                                    hp.Name = "health"
                                    hp.Size = UDim2.new(1,0,0.3,0)
                                    hp.Position = UDim2.new(0,0,0,17)
                                    hp.BackgroundTransparency = 1
                                    hp.TextColor3 = Color3.fromRGB(0, 255, 0)
                                    if obj:FindFirstChild("Values") and obj.Values:FindFirstChild("Broken") then
                                        if obj.Values.Broken.Value then
                                            txt.TextColor3 = Color3.fromRGB(255, 0, 0)
                                            hp.Visible = false
                                        else
                                            if obj.Values:FindFirstChild("Health") then
                                                hp.Text = "Health: " .. obj.Values.Health.Value
                                            end
                                        end
                                    end
                                end
                            else
                                if obj:FindFirstChild("Values") and obj.Values:FindFirstChild("Broken") and obj.SafeESP:FindFirstChild("name") then
                                     if obj.Values.Broken.Value then
                                        obj.SafeESP.name.TextColor3 = Color3.fromRGB(255, 0, 0)
                                        if obj.SafeESP:FindFirstChild("health") then obj.SafeESP.health.Visible = false end
                                     else
                                        if obj.Values:FindFirstChild("Health") and obj.SafeESP:FindFirstChild("health") then
                                            obj.SafeESP.health.Text = "Health: " .. obj.Values.Health.Value
                                        end
                                     end
                                end
                            end
                        end
                    end
                end
            end)
        else
            if Workspace:FindFirstChild("Map") and Workspace.Map:FindFirstChild("BredMakurz") then
                for _, obj in pairs(Workspace.Map.BredMakurz:GetChildren()) do
                    if obj:FindFirstChild("SafeESP") then obj.SafeESP:Destroy() end
                end
            end
        end
    end
})

local ToolESP_Enabled = false
MainTab:CreateToggle({
    Name = "Tool ESP",
    CurrentValue = false,
    Callback = function(val)
        ToolESP_Enabled = val
        if val then
            task.spawn(function()
                while ToolESP_Enabled do
                    task.wait(0.5)
                    for _, plr in pairs(Players:GetPlayers()) do
                        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("Head") then
                            local toolName = ""
                            for _, item in pairs(plr.Character:GetChildren()) do
                                if item:IsA("Tool") then toolName = item.Name break end
                            end
                            if toolName ~= "" then
                                local esp = plr.Character.Head:FindFirstChild("ToolsESP")
                                if not esp then
                                    esp = Instance.new("BillboardGui", plr.Character.Head)
                                    esp.Name = "ToolsESP"
                                    esp.AlwaysOnTop = true
                                    esp.Size = UDim2.new(1.2,0,1.2,0)
                                    local txt = Instance.new("TextLabel", esp)
                                    txt.Size = UDim2.new(1,0,0.3,0)
                                    txt.BackgroundTransparency = 1
                                    txt.TextColor3 = Color3.new(1, 0.64, 0)
                                    txt.Text = toolName
                                else
                                    esp.TextLabel.Text = toolName
                                end
                            elseif plr.Character.Head:FindFirstChild("ToolsESP") then
                                plr.Character.Head.ToolsESP:Destroy()
                            end
                        end
                    end
                end
            end)
        else
            for _, plr in pairs(Players:GetPlayers()) do
                if plr.Character and plr.Character:FindFirstChild("Head") and plr.Character.Head:FindFirstChild("ToolsESP") then
                    plr.Character.Head.ToolsESP:Destroy()
                end
            end
        end
    end
})

local CrateESP_Enabled = false
MainTab:CreateToggle({
    Name = "Crate ESP",
    CurrentValue = false,
    Callback = function(val)
        CrateESP_Enabled = val
        if val then
            task.spawn(function()
                while CrateESP_Enabled do
                    task.wait(1)
                    if Workspace:FindFirstChild("Filter") and Workspace.Filter:FindFirstChild("SpawnedPiles") then
                         for _, v in pairs(Workspace.Filter.SpawnedPiles:GetChildren()) do
                            if v.Name == "C1" and v:FindFirstChild("MeshPart") and not v:FindFirstChild("ESP") then
                                local hl = Instance.new("Highlight", v)
                                hl.Name = "ESP"
                                if v.MeshPart.TextureID == "rbxassetid://11157915894" then 
                                    hl.FillColor = Color3.fromRGB(255, 0, 0) 
                                elseif v.MeshPart.TextureID == "rbxassetid://11157911882" then 
                                    hl.FillColor = Color3.fromRGB(0, 255, 0)
                                else 
                                    hl.FillColor = Color3.fromRGB(255, 255, 0) 
                                end
                            end
                         end
                    end
                    if Workspace:FindFirstChild("Debris") and Workspace.Debris:FindFirstChild("VParts") then
                        for _, v in pairs(Workspace.Debris.VParts:GetChildren()) do
                            if v.Name == "SupplyCrate" and not v:FindFirstChild("ESP") then
                                local hl = Instance.new("Highlight", v)
                                hl.Name = "ESP"
                                hl.FillColor = Color3.fromRGB(255, 255, 0)
                            end
                        end
                    end
                    if Workspace:FindFirstChild("Map") and Workspace.Map:FindFirstChild("MysteryBoxes") then
                        for _, v in pairs(Workspace.Map.MysteryBoxes:GetChildren()) do
                            if v.Name == "MysteryBox" and not v:FindFirstChild("ESP") then
                                local hl = Instance.new("Highlight", v)
                                hl.Name = "ESP"
                                hl.FillColor = Color3.fromRGB(0, 255, 255)
                            end
                        end
                    end
                end
            end)
        else
            for _, v in pairs(Workspace:GetDescendants()) do
                if v.Name == "ESP" and v:IsA("Highlight") then v:Destroy() end
            end
        end
    end
})

local DealerESP_Enabled = false
MainTab:CreateToggle({
    Name = "Dealer ESP",
    CurrentValue = false,
    Callback = function(val)
        DealerESP_Enabled = val
        if val then
            task.spawn(function()
                while DealerESP_Enabled do
                    task.wait(1)
                    if Workspace:FindFirstChild("Map") and Workspace.Map:FindFirstChild("Shopz") then
                        for _, v in pairs(Workspace.Map.Shopz:GetChildren()) do
                            if (v.Name == "Dealer" or v.Name == "ArmoryDealer") and not v:FindFirstChild("DealerESP") then
                                local hl = Instance.new("Highlight", v)
                                hl.Name = "DealerESP"
                                if v.Name == "Dealer" then hl.FillColor = Color3.fromRGB(153, 255, 153)
                                else hl.FillColor = Color3.fromRGB(153, 204, 255) end
                            end
                        end
                    end
                end
            end)
        else
             if Workspace:FindFirstChild("Map") and Workspace.Map:FindFirstChild("Shopz") then
                for _, v in pairs(Workspace.Map.Shopz:GetChildren()) do
                    if v:FindFirstChild("DealerESP") then v.DealerESP:Destroy() end
                end
            end
        end
    end
})

local ScrapESP_Enabled = false
MainTab:CreateToggle({
    Name = "Scrap ESP",
    CurrentValue = false,
    Callback = function(val)
        ScrapESP_Enabled = val
        if val then
            task.spawn(function()
                while ScrapESP_Enabled do
                    task.wait(1)
                    if Workspace:FindFirstChild("Filter") and Workspace.Filter:FindFirstChild("SpawnedPiles") then
                        for _, v in pairs(Workspace.Filter.SpawnedPiles:GetChildren()) do
                            if (v.Name == "S1" or v.Name == "S2") and not v:FindFirstChild("ESP") then
                                local hl = Instance.new("Highlight", v)
                                hl.Name = "ESP"
                                hl.FillColor = Color3.fromRGB(150, 150, 150)
                            end
                        end
                    end
                end
            end)
        else
            if Workspace:FindFirstChild("Filter") and Workspace.Filter:FindFirstChild("SpawnedPiles") then
                for _, v in pairs(Workspace.Filter.SpawnedPiles:GetChildren()) do
                    if v:FindFirstChild("ESP") then v.ESP:Destroy() end
                end
            end
        end
    end
})

MainTab:CreateButton({
    Name = "Player detection (Stays until leave)",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/arVatYFs", true))()
    end
})

MiscTab:CreateSection("Strafe")

local StrafeEnabled = false
local StrafeRadius = 4
local StrafeSpeed = 5
local StrafeTarget = nil
local StrafeConnection = nil

local function GetStrafeTarget()
    local target = nil
    local dist = math.huge
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            local mag = (LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
            if mag < dist then dist = mag target = v end
        end
    end
    return target
end

MiscTab:CreateToggle({
    Name = "Strafe Around Nearest Player",
    CurrentValue = false,
    Callback = function(val)
        StrafeEnabled = val
        if val then
            StrafeTarget = GetStrafeTarget()
            if StrafeTarget then
                local angle = 0
                StrafeConnection = RunService.RenderStepped:Connect(function(dt)
                    if StrafeEnabled and StrafeTarget and StrafeTarget.Character and StrafeTarget.Character:FindFirstChild("HumanoidRootPart") then
                        angle = angle + StrafeSpeed * dt
                        local offset = Vector3.new(math.cos(angle) * StrafeRadius, 0, math.sin(angle) * StrafeRadius)
                        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(StrafeTarget.Character.HumanoidRootPart.Position + offset, StrafeTarget.Character.HumanoidRootPart.Position)
                        if LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid.PlatformStand = true end
                        if StrafeTarget.Character:FindFirstChild("Humanoid") and StrafeTarget.Character.Humanoid.Health < 15 then
                            StrafeEnabled = false
                        end
                    else
                        if LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid.PlatformStand = false end
                        StrafeConnection:Disconnect()
                    end
                end)
            end
        else
            if StrafeConnection then StrafeConnection:Disconnect() end
            if LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid.PlatformStand = false end
        end
    end
})

MiscTab:CreateSlider({
    Name = "Strafe Radius",
    Range = {1, 10},
    Increment = 1,
    CurrentValue = 4,
    Callback = function(val) StrafeRadius = val end
})

MiscTab:CreateSlider({
    Name = "Strafe Speed",
    Range = {1, 10},
    Increment = 1,
    CurrentValue = 5,
    Callback = function(val) StrafeSpeed = val end
})

MiscTab:CreateSection("FollowPlayer")

local FollowDist = 3
local FollowEnabled = false

MiscTab:CreateSlider({
    Name = "Follow Distance",
    Range = {1, 5},
    Increment = 0.1,
    CurrentValue = 3,
    Callback = function(val) FollowDist = val end
})

MiscTab:CreateToggle({
    Name = "Enable Follow from Behind",
    CurrentValue = false,
    Callback = function(val)
        FollowEnabled = val
        task.spawn(function()
            while FollowEnabled do
                local target = GetStrafeTarget() 
                if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                    local tRoot = target.Character.HumanoidRootPart
                    local goal = tRoot.Position - tRoot.CFrame.LookVector * FollowDist
                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(goal, tRoot.Position)
                end
                task.wait()
            end
        end)
    end
})

MiscTab:CreateSection("Bang")

local BangEnabled = false
local BangSpeed = 1
local BangAnimSpeed = 3
local BangSound1 = Instance.new("Sound", LocalPlayer.Character) BangSound1.SoundId = "rbxassetid://6892830182"
local BangSound2 = Instance.new("Sound", LocalPlayer.Character) BangSound2.SoundId = "rbxassetid://9125702141"

MiscTab:CreateToggle({
    Name = "Bang",
    CurrentValue = false,
    Callback = function(val)
        BangEnabled = val
        if val then
            task.spawn(function()
                local target = GetStrafeTarget()
                local dir = 1
                while BangEnabled and target do
                    if BangAnimSpeed <= 1.3 then dir = 1 BangSound1:Play() BangSound2:Play() end
                    if BangAnimSpeed >= 4 then dir = -1 end
                    BangAnimSpeed = BangAnimSpeed + (0.1 * dir * BangSpeed)
                    local tRoot = target.Character.HumanoidRootPart
                    local goal = tRoot.Position - tRoot.CFrame.LookVector * BangAnimSpeed
                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(goal, tRoot.Position)
                    task.wait()
                end
            end)
        end
    end
})

MiscTab:CreateSlider({
    Name = "Bang Speed",
    Range = {0.1, 1},
    Increment = 0.1,
    CurrentValue = 1,
    Callback = function(val) BangSpeed = val end
})

MiscTab:CreateSection("Spin")

local SpinEnabled = false
local SpinSpeed = 30

MiscTab:CreateToggle({
    Name = "Spin Toggle",
    CurrentValue = false,
    Callback = function(val)
        SpinEnabled = val
        task.spawn(function()
            local rot = 0
            while SpinEnabled do
                rot = rot + SpinSpeed
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                     LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(SpinSpeed), 0)
                end
                RunService.RenderStepped:Wait()
            end
        end)
    end
})

MiscTab:CreateSlider({
    Name = "Spin Speed",
    Range = {1, 100},
    Increment = 1,
    CurrentValue = 30,
    Callback = function(val) SpinSpeed = val end
})

MiscTab:CreateSection("FemboyHub Movement")

local SpeedHackEnabled = false
local SpeedHackVal = 1.1

MiscTab:CreateToggle({
    Name = "Speed",
    CurrentValue = false,
    Callback = function(val)
        SpeedHackEnabled = val
        if val then
            task.spawn(function()
                while SpeedHackEnabled do
                    RunService.Heartbeat:Wait()
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                        local hum = LocalPlayer.Character.Humanoid
                        if hum.MoveDirection.Magnitude > 0 then
                            LocalPlayer.Character:TranslateBy(hum.MoveDirection * SpeedHackVal * 0.2)
                        end
                    end
                end
            end)
        end
    end
})

MiscTab:CreateSlider({
    Name = "Speed",
    Range = {1, 7},
    Increment = 0.1,
    CurrentValue = 1.1,
    Callback = function(val) SpeedHackVal = val end
})

MiscTab:CreateSlider({
    Name = "Gravity",
    Range = {196, 75},
    Increment = 1,
    CurrentValue = 196,
    Callback = function(val) Workspace.Gravity = val end
})

local FinishMulti = ReplicatedStorage:FindFirstChild("Values") and ReplicatedStorage.Values:FindFirstChild("FinishSpeedMulti")
if FinishMulti then
    MiscTab:CreateSlider({
        Name = "Finish/Stomp Speed",
        Range = {0, 1.8},
        Increment = 0.1,
        CurrentValue = FinishMulti.Value,
        Callback = function(val) FinishMulti.Value = val end
    })
end

MiscTab:CreateSection("FemboyHub Vision")

MiscTab:CreateSlider({
    Name = "Custom Day Time",
    Range = {1, 24},
    Increment = 1,
    CurrentValue = 12,
    Callback = function(val)
        local ts = ReplicatedStorage:FindFirstChild("Values") and ReplicatedStorage.Values:FindFirstChild("TimeState")
        if ts then ts.Value = val ts.Enabled.Value = true end
    end
})

MiscTab:CreateSlider({
    Name = "Max CameraZoom Distance",
    Range = {10, 250},
    Increment = 2,
    CurrentValue = 10,
    Callback = function(val) LocalPlayer.CameraMaxZoomDistance = val end
})

MiscTab:CreateDropdown({
    Name = "Camera Mode",
    Options = {"Zoom", "Invisicam"},
    CurrentOption = {"Zoom"},
    Callback = function(opt)
        LocalPlayer.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode[opt[1]]
    end
})

local function CreateCrosshair()
    local gui = Instance.new("ScreenGui", LocalPlayer.PlayerGui)
    gui.Name = "CrosshairGui"
    local img = Instance.new("ImageLabel", gui)
    img.Name = "Crosshair"
    img.Size = UDim2.new(0.03, 0, 0.03, 0)
    img.Position = UDim2.new(0.5, 0, 0.5, 0)
    img.AnchorPoint = Vector2.new(0.5, 0.5)
    img.Image = "rbxassetid://1827745860"
    img.BackgroundTransparency = 1
    img.Visible = false
end
CreateCrosshair()
LocalPlayer.CharacterAdded:Connect(function() 
    if LocalPlayer.PlayerGui:FindFirstChild("CrosshairGui") then LocalPlayer.PlayerGui.CrosshairGui:Destroy() end
    CreateCrosshair()
end)

MiscTab:CreateToggle({
    Name = "Crosshair",
    CurrentValue = false,
    Callback = function(val)
        if LocalPlayer.PlayerGui:FindFirstChild("CrosshairGui") then
            LocalPlayer.PlayerGui.CrosshairGui.Crosshair.Visible = val
        end
    end
})

CombatTab:CreateSection("FemboyHub Chat")
CombatTab:CreateButton({
    Name = "Chat Spy",
    Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/LisSploit/FemboysHubChat/main/Spy"))() end
})

CombatTab:CreateSection("FemboyHub Combat")
CombatTab:CreateButton({
    Name = "WallBang",
    Callback = function()
        local mparts = Workspace:FindFirstChild("Map") and Workspace.Map:FindFirstChild("Parts") and Workspace.Map.Parts:FindFirstChild("M_Parts")
        if mparts then mparts.Parent = Workspace:FindFirstChild("Characters") end
    end
})

CombatTab:CreateButton({
    Name = "Admin Protection",
    Callback = function()
        local staff = {"tabootvcat","Revenantic","Saabor","MoIitor","IAmUnderAMask","SheriffGorji","xXFireyScorpionXx","LoChips","DeliverCreations","TDXiswinning","TZZV","FelixVenue","SIEGFRlED","ARRYvvv","z_papermoon","Malpheasance","ModHandIer","valphex","J_anday","tvdisko","yIlehs","COLOSSUSBUILTOFSTEEL","SeizedHolder","r3shape","RVVZ","adurize","codedcosmetics","QuantumCaterpillar","FractalHarmonics","GalacticSculptor","oTheSilver","Kretacaous","icarus_xs1goliath","GlamorousDradon","rainjeremy","parachuter2000","faintermercury","harht","Sansek1252","Snorpuwu","BenAzoten","Cand1ebox","KeenlyAware","mrzued","BruhmanVIII","Nystesia","fausties","zateopp","Iordnabi","ReviveTheDevil","jake_jpeg","UncrossedMeat3888","realpenyy","karateeeh","JayyMlg","Lo_Chips","Avelosky","king_ab09","TigerLe123","Dalvanuis","iSonMillions"}
        local function check(p)
            for _, s in pairs(staff) do
                if p.Name:lower() == s:lower() then LocalPlayer:Kick("Stinky Staff joined") end
            end
        end
        Players.PlayerAdded:Connect(check)
        for _, p in pairs(Players:GetPlayers()) do check(p) end
    end
})

CombatTab:CreateButton({
    Name = "RPG-7 rocket control",
    Callback = function()
        local debris = Workspace:FindFirstChild("Debris") and Workspace.Debris:FindFirstChild("VParts")
        if not debris then return end
        local control = false
        debris.ChildAdded:Connect(function(child)
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("RPG-7") and child.Name == "RPG_Rocket" then
                task.wait()
                Camera.CameraSubject = child
                LocalPlayer.Character.HumanoidRootPart.Anchored = true
                pcall(function() child.BodyForce:Destroy() child.RotPart.BodyAngularVelocity:Destroy() child.Sound:Destroy() end)
                local bv = Instance.new("BodyVelocity", child)
                bv.MaxForce = Vector3.new(1e9,1e9,1e9)
                local bg = Instance.new("BodyGyro", child)
                bg.MaxTorque = Vector3.new(1e9,1e9,1e9)
                local x, y = 0, 0
                control = true
                task.spawn(function()
                    local con = RunService.RenderStepped:Connect(function()
                        if not control or not child.Parent then control = false end
                        local vel = (Camera.CFrame.LookVector * x + Camera.CFrame.RightVector * y) * 300
                        TweenService:Create(bv, TweenInfo.new(0.2), {Velocity = vel}):Play()
                        bg.CFrame = Camera.CFrame
                        Camera.CFrame = child.CFrame * CFrame.new(0,1,1)
                    end)
                    repeat task.wait() until not control
                    con:Disconnect()
                    Camera.CameraSubject = LocalPlayer.Character.Humanoid
                    LocalPlayer.Character.HumanoidRootPart.Anchored = false
                end)
                UserInputService.InputBegan:Connect(function(i) 
                    if i.KeyCode == Enum.KeyCode.W then x = 1 elseif i.KeyCode == Enum.KeyCode.S then x = -1 elseif i.KeyCode == Enum.KeyCode.D then y = 1 elseif i.KeyCode == Enum.KeyCode.A then y = -1 end 
                end)
                UserInputService.InputEnded:Connect(function(i) 
                    if i.KeyCode == Enum.KeyCode.W or i.KeyCode == Enum.KeyCode.S then x = 0 elseif i.KeyCode == Enum.KeyCode.D or i.KeyCode == Enum.KeyCode.A then y = 0 end 
                end)
            end
        end)
    end
})

local MeleeAuraEnabled = false
local MeleeTarget = nil
local MeleeRange = 30

CombatTab:CreateToggle({
    Name = "Melee aura",
    CurrentValue = false,
    Callback = function(val)
        MeleeAuraEnabled = val
        if val then
            RunService.RenderStepped:Connect(function()
                if not MeleeAuraEnabled then return end
                local char = LocalPlayer.Character
                local tool = char and char:FindFirstChildWhichIsA("Tool")
                if tool and (tool.Name == "Fists" or tool.Name == "Sledgehammer" or tool:FindFirstChild("WeaponHandle")) then
                    local target = nil
                    local dist = math.huge
                    for _, v in pairs(Players:GetPlayers()) do
                        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Head") and v.Character.Humanoid.Health > 0 then
                            local mag = (char.Head.Position - v.Character.Head.Position).Magnitude
                            if mag < dist and mag < MeleeRange then dist = mag target = v end
                        end
                    end
                    if target then
                        local parts = {}
                        if tool.Name == "Fists" then
                            if char:FindFirstChild("Right Arm") then for _, p in pairs(char["Right Arm"]:GetChildren()) do if p.Name == "DmgPoint" then table.insert(parts, p) end end end
                            if char:FindFirstChild("Left Arm") then for _, p in pairs(char["Left Arm"]:GetChildren()) do if p.Name == "DmgPoint" then table.insert(parts, p) end end end
                        elseif tool:FindFirstChild("Handle") then
                            for _, p in pairs(tool.Handle:GetChildren()) do if p.Name == "DmgPoint" then table.insert(parts, p) end end
                        elseif tool:FindFirstChild("WeaponHandle") then
                             for _, p in pairs(tool.WeaponHandle:GetChildren()) do if p.Name == "DmgPoint" then table.insert(parts, p) end end
                        end
                        
                        for _, p in pairs(parts) do
                            p.CFrame = CFrame.new()
                            local tHead = target.Character.Head
                            local r = Vector3.new(math.random(-tHead.Size.X, tHead.Size.X), math.random(-tHead.Size.Y, tHead.Size.Y), math.random(-tHead.Size.Z, tHead.Size.Z)) / 10
                            p.WorldCFrame = CFrame.new(tHead.Position + r)
                        end
                    end
                end
            end)
        end
    end
})

CombatTab:CreateButton({
    Name = "Fling",
    Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/sauga77kjk/RobloxExploitRepository/main/TouchFLING"))() end
})

CombatTab:CreateButton({
    Name = "Anti Doors",
    Callback = function()
        local doors = Workspace.Map:FindFirstChild("Doors")
        if doors then
            for _, d in pairs(doors:GetDescendants()) do
                if d:IsA("BasePart") then d.Transparency = 0.5 d.CanCollide = false end
            end
        end
    end
})

CombatTab:CreateButton({
    Name = "Remove BarbedWire",
    Callback = function()
        local fparts = Workspace.Filter.Parts:FindFirstChild("F_Parts")
        if fparts then fparts:Destroy() end
    end
})

TeleportsTab:CreateSection("Main Teleports")

local function TP(cframe)
    local char = LocalPlayer.Character
    if char and char.PrimaryPart then
        local start = char.PrimaryPart.Position
        local dist = (cframe.Position - start).Magnitude
        local time = dist > 500 and 9 or (dist > 150 and 7 or 5)
        local s = tick()
        while tick() - s < time do
            char:SetPrimaryPartCFrame(cframe)
            task.wait(0.01)
        end
    end
end

TeleportsTab:CreateButton({Name = "Tower", Callback = function() TP(CFrame.new(-4513, 149, -879) + Vector3.new(0,2,0)) end})
TeleportsTab:CreateButton({Name = "Motel", Callback = function() TP(CFrame.new(-4671, 3, -905) + Vector3.new(0,2,0)) end})
TeleportsTab:CreateButton({Name = "Cafe", Callback = function() TP(CFrame.new(-4630, 6, -269) + Vector3.new(0,2,0)) end})
TeleportsTab:CreateButton({Name = "Illegal Pizza", Callback = function() TP(CFrame.new(-4419, 5, -124) + Vector3.new(0,2,0)) end})
TeleportsTab:CreateButton({Name = "JunkYard", Callback = function() TP(CFrame.new(-3919, 3, -448)) end})
TeleportsTab:CreateButton({Name = "Sewer", Callback = function() TP(CFrame.new(-4658, -69, -871) + Vector3.new(0,2,0)) end})
TeleportsTab:CreateButton({Name = "Vibe Check down", Callback = function() TP(CFrame.new(-4780, -200, -895) + Vector3.new(0,2,0)) end})
TeleportsTab:CreateButton({Name = "Vibe Check Up", Callback = function() TP(CFrame.new(-4776, -34, -788) + Vector3.new(0,2,0)) end})

TeleportsTab:CreateSection("Misc Teleports")

TeleportsTab:CreateButton({
    Name = "Teleport to Nearest VendingMachine",
    Callback = function()
        local t = nil local dist = math.huge
        if Workspace.Map:FindFirstChild("VendingMachines") then
            for _, v in pairs(Workspace.Map.VendingMachines:GetChildren()) do
                local m = v:FindFirstChild("Parts") and v.Parts:FindFirstChild("ScreenMesh")
                if m then
                    local d = (LocalPlayer.Character.PrimaryPart.Position - m.Position).Magnitude
                    if d < dist then dist = d t = m end
                end
            end
        end
        if t then TP(CFrame.new(t.Position + t.CFrame.LookVector * 3, t.Position)) end
    end
})

TeleportsTab:CreateButton({
    Name = "Teleport to Nearest Dealer",
    Callback = function()
         local t = nil local dist = math.huge
         if Workspace.Map:FindFirstChild("Shopz") then
            for _, v in pairs(Workspace.Map.Shopz:GetChildren()) do
                if (v.Name == "Dealer" or v.Name == "ArmoryDealer") and v:FindFirstChild("MainPart") then
                    local d = (LocalPlayer.Character.PrimaryPart.Position - v.MainPart.Position).Magnitude
                    if d < dist then dist = d t = v.MainPart end
                end
            end
         end
         if t then TP(CFrame.new(t.Position + t.CFrame.LookVector * 3, t.Position)) end
    end
})

TeleportsTab:CreateButton({
    Name = "Teleport to Nearest Safe/Register",
    Callback = function()
        local t = nil local dist = math.huge
        if Workspace.Map:FindFirstChild("BredMakurz") then
            for _, v in pairs(Workspace.Map.BredMakurz:GetDescendants()) do
                if v:IsA("Model") and v:FindFirstChild("MainPart") and v:FindFirstChild("Values") and v.Values:FindFirstChild("Broken") and not v.Values.Broken.Value then
                    if v.Name:find("Safe") or v.Name:find("Register") then
                        local d = (LocalPlayer.Character.PrimaryPart.Position - v.MainPart.Position).Magnitude
                        if d < dist then dist = d t = v.MainPart end
                    end
                end
            end
        end
        if t then TP(CFrame.new(t.Position + t.CFrame.LookVector * 3, t.Position)) end
    end
})

TeleportsTab:CreateButton({
    Name = "Teleport to ATM",
    Callback = function()
        local t = nil local dist = math.huge
        if Workspace.Map:FindFirstChild("ATMz") then
            for _, v in pairs(Workspace.Map.ATMz.ATM.Parts.Main:GetChildren()) do
                if v.Name == "atm" then
                     local d = (LocalPlayer.Character.PrimaryPart.Position - v.Position).Magnitude
                     if d < dist then dist = d t = v end
                end
            end
        end
        if t then TP(CFrame.new(t.Position - t.CFrame.LookVector * 3, t.Position)) end
    end
})

TeleportsTab:CreateSection("Temporary Teleports")

TeleportsTab:CreateButton({
    Name = "Teleport to RebelDealer",
    Callback = function()
        local d = Workspace.Map.Shopz:FindFirstChild("RebelDealer")
        if d and d:FindFirstChild("MainPart") then
            TP(CFrame.new(d.MainPart.Position + d.MainPart.CFrame.LookVector * 3, d.MainPart.Position))
        else
            Notify("Error", "RebelDealer Not Found", 3)
        end
    end
})

TeleportsTab:CreateButton({
    Name = "Teleport to MysteryBox",
    Callback = function()
        local b = Workspace.Map.MysteryBoxes:FindFirstChild("MysteryBox")
        if b and b:FindFirstChild("MainPart") then
            TP(CFrame.new(b.MainPart.Position + b.MainPart.CFrame.LookVector * 3, b.MainPart.Position))
        else
            Notify("Error", "MysteryBox Not Found", 3)
        end
    end
})

TeleportsTab:CreateButton({
    Name = "Spawn to dropped Cash",
    Callback = function()
        local t = nil local dist = math.huge
        if Workspace.Filter:FindFirstChild("SpawnedBread") then
            for _, v in pairs(Workspace.Filter.SpawnedBread:GetChildren()) do
                if v:IsA("MeshPart") then
                     local d = (LocalPlayer.Character.PrimaryPart.Position - v.Position).Magnitude
                     if d < dist then dist = d t = v end
                end
            end
        end
        if t then
            local pos = t.Position + Vector3.new(0,5,0)
            TP(CFrame.new(pos, t.Position))
        else
            Notify("Error", "No Cash Found", 3)
        end
    end
})

BoostTab:CreateSection("Thanks so much for boosting")
BoostTab:CreateSection("Booster stuff")

BoostTab:CreateButton({
    Name = "Click Teleport (Q)",
    Callback = function()
        Mouse.KeyDown:Connect(function(k)
            if k == "q" and Mouse.Target then
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Mouse.Hit.X, Mouse.Hit.Y + 5, Mouse.Hit.Z)
            end
        end)
    end
})

BoostTab:CreateButton({
    Name = "Fullbright",
    Callback = function()
        Lighting.Ambient = Color3.fromRGB(255, 255, 255)
        Lighting.Brightness = 1
        Lighting.FogEnd = 1e9
        for _, v in pairs(Lighting:GetDescendants()) do
            if v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("SunRaysEffect") then v.Enabled = false end
        end
        task.spawn(function()
            while task.wait(1) do
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and not LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Light") then
                    local l = Instance.new("PointLight", LocalPlayer.Character.HumanoidRootPart)
                    l.Name = "Light"
                    l.Brightness = 1
                    l.Range = 60
                end
            end
        end)
    end
})

BoostTab:CreateButton({
    Name = "Auto Lockpick",
    Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Iceyze/crim-autolockpick/main/main.lua"))() end
})

BoostTab:CreateButton({
    Name = "AFK ATM Farm",
    Callback = function() loadstring(game:HttpGet("https://pastebin.com/raw/ZBSqZcrm"))() end
})

Rayfield:LoadConfiguration()
