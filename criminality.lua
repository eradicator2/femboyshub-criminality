local v_u_1_ = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local v2_ = v_u_1_:CreateWindow({
    Name = "FEMBOYSHUB PAID PREMIUM :3",
    LoadingTitle = "FemboysHub Paid Premium Loading...",
    LoadingSubtitle = "By Lis",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = Femmy,
        FileName = "Big Hub"
    },
    Discord = {
        Enabled = True,
        Invite = "EPfpgkg6",
        RememberJoins = true
    },
    KeySystem = true,
    KeySettings = {
        Title = "FemboysHub Paid Premium Version",
        Subtitle = "Key System",
        Note = "Key is in the Discord!",
        FileName = "Key123",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = "NoHomo"
    }
})
local v3_ = v2_:CreateTab("FemboysHub Main", nil)
v3_:CreateSection("FemboyHub Booster Aimbot")
local v_u_4_ = true
local v_u_5_ = true
local v_u_6_ = false
v3_:CreateToggle({
    Name = "Aimlock",
    CurrentValue = false,
    Flag = "",
    Callback = function(p_u_7_)
        v_u_6_ = p_u_7_
        Aimlock = v_u_6_
        getgenv().AimPart = "Head"
        getgenv().AimRadius = 100
        getgenv().FirstPerson = true
        getgenv().TeamCheck = false
        getgenv().PredictMovement = v_u_4_
        getgenv().PredictionVelocity = 16
        local v_u_8_ = game:GetService("Players")
        local v_u_9_ = game:GetService("UserInputService")
        local v10_ = game:GetService("RunService")
        local v_u_11_ = game:GetService("StarterGui")
        local v_u_12_ = v_u_8_.LocalPlayer
        local v_u_13_ = v_u_8_.LocalPlayer:GetMouse()
        local v_u_14_ = workspace.CurrentCamera
        local v_u_15_ = CFrame.new
        local v_u_16_ = Ray.new
        local _ = Vector3.new
        local _ = Vector2.new
        local v_u_17_ = true
        local v_u_18_ = false
        local v_u_19_ = false
        local v_u_20_ = nil
        local v_u_21_ = nil
        getgenv().CiazwareUniversalAimbotLoaded = true
        getgenv().SeparateNotify = function(p22_, p23_, _, p24_)
            v_u_11_:SetCore("SendNotification", {
                Title = p22_,
                Text = p23_,
                Duration = p24_
            })
        end
        getgenv().Notify = function(p25_, p26_, _, p27_)
            if v_u_19_ == true then
                v_u_11_:SetCore("SendNotification", {
                    Title = p25_,
                    Text = p26_,
                    Duration = (not p27_ or not type(p27_) == "number") and 3 or p27_
                })
            end
        end
        getgenv().WorldToViewportPoint = function(p28_)
            return v_u_14_:WorldToViewportPoint(p28_)
        end
        getgenv().WorldToScreenPoint = function(p29_)
            return v_u_14_:WorldToScreenPoint(p29_)
        end
        getgenv().GetObscuringObjects = function(p30_)
            local v31_ = p30_ and (p30_:FindFirstChild(getgenv().AimPart) and v_u_12_) and (v_u_12_.Character:FindFirstChild("Head") and workspace:FindPartOnRay(v_u_16_(p30_[getgenv().AimPart].Position, v_u_12_.Character.Head.Position)))
            if v31_ then
                local _ = v31_.IsDescendantOf
            end
        end
        getgenv().GetNearestTarget = function()
            local v32_ = v_u_8_
            local v33_, v34_, v35_ = pairs(v32_:GetPlayers())
            local v36_ = {}
            local v37_ = {}
            local v38_ = {}
            while true do
                local v39_
                v35_, v39_ = v33_(v34_, v35_)
                if v35_ == nil then
                    break
                end
                if v39_ ~= v_u_12_ then
                    table.insert(v36_, v39_)
                end
            end
            local v40_, v41_, v42_ = pairs(v36_)
            while true do
                local v43_
                v42_, v43_ = v40_(v41_, v42_)
                if v42_ == nil then
                    break
                end
                if v43_.Character and (v43_.Character:FindFirstChild("Head") and (v43_.Character:FindFirstChild("Humanoid") and v43_.Character:FindFirstChild("Humanoid").Health > 0)) then
                    local v44_ = v43_.Character:FindFirstChild("Head")
                    if getgenv().TeamCheck ~= true or v43_.Team == v_u_12_.Team then
                        if getgenv().TeamCheck == false and v43_.Team == v_u_12_.Team then
                            local v45_ = (v43_.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p).magnitude
                            local v46_ = Ray.new(game.Workspace.CurrentCamera.CFrame.p, (v_u_13_.Hit.p - game.Workspace.CurrentCamera.CFrame.p).unit * v45_)
                            local _, v47_ = game.Workspace:FindPartOnRay(v46_, game.Workspace)
                            local v48_ = math.floor((v47_ - v44_.Position).magnitude)
                            v37_[v43_.Name .. v42_] = {}
                            v37_[v43_.Name .. v42_].dist = v45_
                            v37_[v43_.Name .. v42_].plr = v43_
                            v37_[v43_.Name .. v42_].diff = v48_
                            table.insert(v38_, v48_)
                        end
                    else
                        local v49_ = (v43_.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p).magnitude
                        local v50_ = Ray.new(game.Workspace.CurrentCamera.CFrame.p, (v_u_13_.Hit.p - game.Workspace.CurrentCamera.CFrame.p).unit * v49_)
                        local _, v51_ = game.Workspace:FindPartOnRay(v50_, game.Workspace)
                        local v52_ = math.floor((v51_ - v44_.Position).magnitude)
                        v37_[v43_.Name .. v42_] = {}
                        v37_[v43_.Name .. v42_].dist = v49_
                        v37_[v43_.Name .. v42_].plr = v43_
                        v37_[v43_.Name .. v42_].diff = v52_
                        table.insert(v38_, v52_)
                    end
                end
            end
            if unpack(v38_) == nil then
                return nil
            end
            local v53_ = math.floor(math.min(unpack(v38_)))
            if getgenv().AimRadius < v53_ then
                return nil
            end
            local v54_, v55_, v56_ = pairs(v37_)
            while true do
                local v57_
                v56_, v57_ = v54_(v55_, v56_)
                if v56_ == nil then
                    break
                end
                if v57_.diff == v53_ then
                    return v57_.plr
                end
            end
            return nil
        end
        local v_u_60_ = v_u_9_.InputBegan:Connect(function(p58_)
            if not v_u_9_:GetFocusedTextBox() and p58_.UserInputType == Enum.UserInputType.MouseButton2 then
                v_u_18_ = true
                local v59_ = GetNearestTarget()
                if v59_ ~= nil then
                    print(v59_)
                    v_u_20_ = v59_
                    if v_u_5_ then
                        Notify("FemboyCrimHub", "Aimlock Target: " .. tostring(v_u_20_), "", 3)
                    end
                end
            end
        end)
        local v62_ = v_u_9_.InputEnded:Connect(function(p61_)
            if p_u_7_ and v_u_6_ then
                if not v_u_9_:GetFocusedTextBox() and p61_.UserInputType == Enum.UserInputType.MouseButton2 then
                    if v_u_20_ ~= nil then
                        v_u_20_ = nil
                    end
                    if v_u_18_ ~= false then
                        v_u_18_ = false
                    end
                end
            elseif v_u_60_ then
                v_u_60_:Disconnect()
                v_u_60_ = nil
            end
        end)
        if p_u_7_ then
            local _ = v10_.RenderStepped:Connect(function()
                getgenv().PredictMovement = v_u_4_
                if v_u_6_ and p_u_7_ then
                    if getgenv().FirstPerson == true then
                        if 0 == 0 then
                            v_u_19_ = true
                        else
                            v_u_19_ = false
                        end
                    end
                    if v_u_17_ == true and (v_u_18_ == true and (v_u_20_ and v_u_20_.Character)) and (v_u_20_.Character:FindFirstChild(getgenv().AimPart) and (getgenv().FirstPerson == true and v_u_19_ == true)) then
                        if getgenv().PredictMovement ~= true then
                            if getgenv().PredictMovement == false and (v_u_20_ and v_u_20_.Character) and v_u_20_.Character:FindFirstChild(getgenv().AimPart) then
                                v_u_14_.CFrame = v_u_15_(v_u_14_.CFrame.p, v_u_20_.Character[getgenv().AimPart].Position)
                            end
                        elseif v_u_20_ and v_u_20_.Character and v_u_20_.Character:FindFirstChild(getgenv().AimPart) then
                            v_u_14_.CFrame = v_u_15_(v_u_14_.CFrame.p, v_u_20_.Character[getgenv().AimPart].Position + v_u_20_.Character[getgenv().AimPart].Velocity / PredictionVelocity)
                        end
                    end
                elseif v_u_21_ then
                    v_u_21_:Disconnect()
                end
            end)
        elseif not (p_u_7_ or v_u_6_) then
            if v_u_21_ then
                v_u_21_:Disconnect()
            end
            if v_u_60_ then
                local v63_ = v_u_60_
                v_u_60_.Disconnect(v63_)
                v_u_60_ = nil
            end
            if v62_ then
                v62_:Disconnect()
            end
        end
    end
})
v3_:CreateToggle({
    Name = "Predict movement",
    CurrentValue = true,
    Flag = "",
    Callback = function(p64_)
        v_u_4_ = p64_
    end
})
v3_:CreateToggle({
    Name = "Notify aimlock\'s target",
    CurrentValue = true,
    Flag = "",
    Callback = function(p65_)
        v_u_5_ = p65_
    end
})
v3_:CreateSection("Player ESP")
local v_u_66_ = 14
local v_u_67_ = Color3.fromRGB(255, 255, 255)
local v_u_68_ = false
local v_u_69_ = false
local v_u_70_ = false
local v_u_71_ = false
local v_u_72_ = 0.5
v3_:CreateToggle({
    Name = "Player ESP",
    CurrentValue = v_u_68_,
    Flag = "Toggle1",
    Callback = function(p73_)
        v_u_68_ = p73_
        local v74_, v75_, v76_ = pairs(game.Players:GetPlayers())
        while true do
            local v77_
            v76_, v77_ = v74_(v75_, v76_)
            if v76_ == nil then
                break
            end
            if v77_.Character and v77_.Character:FindFirstChild("Head") then
                local v78_ = v77_.Character.Head:FindFirstChild("UsernameBillboard")
                if v78_ then
                    v78_.Enabled = p73_
                    local v79_ = v78_:FindFirstChild("InfoLabel")
                    if v79_ then
                        v79_.Visible = p73_
                    end
                end
            end
        end
    end
})
v3_:CreateSection("Settings")
v3_:CreateToggle({
    Name = "Show Health",
    CurrentValue = v_u_69_,
    Flag = "Toggle2",
    Callback = function(p80_)
        v_u_69_ = p80_
        local v81_, v82_, v83_ = pairs(game.Players:GetPlayers())
        while true do
            local v84_
            v83_, v84_ = v81_(v82_, v83_)
            if v83_ == nil then
                break
            end
            if v84_.Character and v84_.Character:FindFirstChild("Head") then
                local v85_ = v84_.Character.Head:FindFirstChild("UsernameBillboard")
                if v85_ then
                    local v86_ = v85_:FindFirstChild("InfoLabel")
                    if v86_ then
                        v86_.Text = v_u_69_ and "Name: " .. v84_.Name .. " | Health: " .. math.floor(v84_.Character.Humanoid.Health) or "Name: " .. v84_.Name
                    end
                end
            end
        end
    end
})
v3_:CreateToggle({
    Name = "Highlight",
    CurrentValue = v_u_71_,
    Flag = "Toggle4",
    Callback = function(p87_)
        v_u_71_ = p87_
        local v88_, v89_, v90_ = pairs(game.Players:GetPlayers())
        while true do
            local v91_
            v90_, v91_ = v88_(v89_, v90_)
            if v90_ == nil then
                break
            end
            if v91_.Character then
                local v92_ = v91_.Character
                local v93_ = v92_:FindFirstChild("Highlight")
                if v_u_71_ then
                    if not v93_ then
                        v93_ = Instance.new("Highlight")
                        v93_.Name = "Highlight"
                        v93_.Adornee = v92_
                        v93_.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        v93_.Parent = v92_
                    end
                    v93_.OutlineColor = v_u_70_ and Color3.fromHSV(tick() % 360 / 360, 1, 1) or v_u_67_
                    v93_.FillColor = v93_.OutlineColor
                    v93_.FillTransparency = v_u_72_
                elseif v93_ then
                    v93_:Destroy()
                end
            end
        end
    end
})
v3_:CreateToggle({
    Name = "Rainbow Text",
    CurrentValue = v_u_70_,
    Flag = "Toggle3",
    Callback = function(p94_)
        v_u_70_ = p94_
        local v95_, v96_, v97_ = pairs(game.Players:GetPlayers())
        while true do
            local v98_
            v97_, v98_ = v95_(v96_, v97_)
            if v97_ == nil then
                break
            end
            if v98_.Character then
                local v99_ = v98_.Character:FindFirstChild("Highlight")
                if v99_ then
                    v99_.OutlineColor = v_u_70_ and Color3.fromHSV(tick() % 360 / 360, 1, 1) or v_u_67_
                    v99_.FillColor = v99_.OutlineColor
                end
            end
        end
        local v100_, v101_, v102_ = pairs(game.Players:GetPlayers())
        while true do
            local v103_
            v102_, v103_ = v100_(v101_, v102_)
            if v102_ == nil then
                break
            end
            if v103_.Character and v103_.Character:FindFirstChild("Head") then
                local v104_ = v103_.Character.Head:FindFirstChild("UsernameBillboard")
                if v104_ then
                    local v_u_105_ = v104_:FindFirstChild("InfoLabel")
                    if v_u_105_ then
                        if v_u_70_ then
                            coroutine.wrap(function()
                                while v_u_70_ do
                                    for v106_ = 1, 360, 10 do
                                        local v107_ = v106_ / 360
                                        v_u_105_.TextColor3 = Color3.fromHSV(v107_, 1, 1)
                                        wait(0.1)
                                    end
                                end
                            end)()
                        else
                            v_u_105_.TextColor3 = v_u_67_
                        end
                    end
                end
            end
        end
    end
})
v3_:CreateColorPicker({
    Name = "Text Color Picker",
    Color = v_u_67_,
    Flag = "ColorPicker1",
    Callback = function(p108_)
        v_u_67_ = p108_
        if not v_u_70_ then
            local v109_, v110_, v111_ = pairs(game.Players:GetPlayers())
            while true do
                local v112_
                v111_, v112_ = v109_(v110_, v111_)
                if v111_ == nil then
                    break
                end
                if v112_.Character and v112_.Character:FindFirstChild("Head") then
                    local v113_ = v112_.Character.Head:FindFirstChild("UsernameBillboard")
                    if v113_ then
                        local v114_ = v113_:FindFirstChild("InfoLabel")
                        if v114_ then
                            v114_.TextColor3 = p108_
                        end
                    end
                end
            end
        end
        local v115_, v116_, v117_ = pairs(game.Players:GetPlayers())
        while true do
            local v118_
            v117_, v118_ = v115_(v116_, v117_)
            if v117_ == nil then
                break
            end
            if v118_.Character then
                local v119_ = v118_.Character:FindFirstChild("Highlight")
                if v119_ then
                    v119_.OutlineColor = v_u_70_ and Color3.fromHSV(tick() % 360 / 360, 1, 1) or v_u_67_
                    v119_.FillColor = v119_.OutlineColor
                end
            end
        end
    end
})
v3_:CreateSlider({
    Name = "Text Size",
    Range = {
        10,
        20
    },
    Increment = 1,
    Suffix = "Size",
    CurrentValue = v_u_66_,
    Flag = "Slider1",
    Callback = function(p120_)
        v_u_66_ = p120_
        local v121_, v122_, v123_ = pairs(game.Players:GetPlayers())
        while true do
            local v124_
            v123_, v124_ = v121_(v122_, v123_)
            if v123_ == nil then
                break
            end
            if v124_.Character and v124_.Character:FindFirstChild("Head") then
                local v125_ = v124_.Character.Head:FindFirstChild("UsernameBillboard")
                if v125_ then
                    local v126_ = v125_:FindFirstChild("InfoLabel")
                    if v126_ then
                        v126_.TextSize = v_u_66_
                    end
                end
            end
        end
    end
})
v3_:CreateSlider({
    Name = "Highlight Fill Transparency",
    Range = {
        0,
        1
    },
    Increment = 0.05,
    Suffix = "Transparency",
    CurrentValue = v_u_72_,
    Flag = "Slider2",
    Callback = function(p127_)
        v_u_72_ = p127_
        local v128_, v129_, v130_ = pairs(game.Players:GetPlayers())
        while true do
            local v131_
            v130_, v131_ = v128_(v129_, v130_)
            if v130_ == nil then
                break
            end
            if v131_.Character then
                local v132_ = v131_.Character:FindFirstChild("Highlight")
                if v132_ then
                    v132_.FillTransparency = v_u_72_
                end
            end
        end
    end
})
local function v_u_140_(p_u_133_)
    if p_u_133_ ~= game.Players.LocalPlayer then
        local v_u_134_ = p_u_133_.Character
        if v_u_134_ then
            local v135_ = v_u_134_:WaitForChild("Head")
            if v135_ then
                local v136_ = v135_:FindFirstChild("UsernameBillboard")
                if v136_ then
                    v136_:Destroy()
                end
                local v137_ = Instance.new("BillboardGui")
                v137_.Name = "UsernameBillboard"
                v137_.Adornee = v135_
                v137_.Size = UDim2.new(6, 0, 1, 0)
                v137_.StudsOffset = Vector3.new(0, 3, 0)
                v137_.AlwaysOnTop = true
                v137_.Enabled = v_u_68_
                local v_u_138_ = Instance.new("TextLabel")
                v_u_138_.Name = "InfoLabel"
                v_u_138_.Parent = v137_
                v_u_138_.Size = UDim2.new(1, 0, 1, 0)
                v_u_138_.BackgroundTransparency = 1
                v_u_138_.TextColor3 = v_u_67_
                v_u_138_.TextStrokeTransparency = 0.5
                v_u_138_.Font = Enum.Font.SourceSansBold
                v_u_138_.TextSize = v_u_66_
                v_u_138_.TextWrapped = false
                v_u_138_.TextTruncate = Enum.TextTruncate.None
                v_u_138_.Text = v_u_69_ and "Name: " .. p_u_133_.Name .. " | Health: " .. math.floor(v_u_134_.Humanoid.Health) or "Name: " .. p_u_133_.Name
                v137_.Parent = v135_
                if v_u_69_ then
                    v_u_134_.Humanoid.HealthChanged:Connect(function()
                        if v_u_138_ then
                            v_u_138_.Text = "Name: " .. p_u_133_.Name .. " | Health: " .. math.floor(v_u_134_.Humanoid.Health)
                        end
                    end)
                end
                if v_u_71_ then
                    local v139_ = v_u_134_:FindFirstChild("Highlight")
                    if not v139_ then
                        v139_ = Instance.new("Highlight")
                        v139_.Name = "Highlight"
                        v139_.Adornee = v_u_134_
                        v139_.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        v139_.Parent = v_u_134_
                    end
                    v139_.OutlineColor = v_u_70_ and Color3.fromHSV(tick() % 360 / 360, 1, 1) or v_u_67_
                    v139_.FillColor = v139_.OutlineColor
                    v139_.FillTransparency = v_u_72_
                end
            end
        else
            return
        end
    else
        return
    end
end
local function v142_(p_u_141_)
    p_u_141_.CharacterAdded:Connect(function(_)
        v_u_140_(p_u_141_)
    end)
end
local v143_, v144_, v145_ = pairs(game.Players:GetPlayers())
local v_u_146_ = v_u_140_
while true do
    local v_u_147_
    v145_, v_u_147_ = v143_(v144_, v145_)
    if v145_ == nil then
        break
    end
    v_u_146_(v_u_147_)
    v_u_147_.CharacterAdded:Connect(function()
        v_u_146_(v_u_147_)
    end)
end
game.Players.PlayerAdded:Connect(v142_)
v3_:CreateSection("Other ESP\'s")
local v_u_148_ = game.Players.LocalPlayer
local v_u_149_ = game:GetService("Workspace").CurrentCamera
local v150_ = game:GetService("RunService")
local v_u_151_ = {}
local v_u_152_ = false
local function v_u_155_(p153_)
    local v154_ = Drawing.new("Line")
    v154_.Visible = false
    v154_.Color = Color3.new(1, 1, 1)
    v154_.Thickness = 1
    v154_.Transparency = 1
    v_u_151_[p153_.UserId] = v154_
end
local function v_u_167_()
    if v_u_152_ then
        local v156_, v157_, v158_ = pairs(game.Players:GetPlayers())
        while true do
            local v159_
            v158_, v159_ = v156_(v157_, v158_)
            if v158_ == nil then
                break
            end
            local v160_ = v_u_151_[v159_.UserId]
            if not v160_ then
                v_u_155_(v159_)
                v160_ = v_u_151_[v159_.UserId]
            end
            if v159_.Character and (v159_.Character:FindFirstChild("Humanoid") and (v159_.Character:FindFirstChild("HumanoidRootPart") and (v159_ ~= v_u_148_ and v159_.Character.Humanoid.Health > 0))) then
                local v161_, v162_ = v_u_149_:worldToViewportPoint(v159_.Character.HumanoidRootPart.Position)
                if v162_ then
                    v160_.From = Vector2.new(v_u_149_.ViewportSize.X / 2, v_u_149_.ViewportSize.Y / 1)
                    v160_.To = Vector2.new(v161_.X, v161_.Y)
                    if _G.TeamCheck and v159_.TeamColor == v_u_148_.TeamColor then
                        v160_.Visible = false
                    else
                        v160_.Visible = true
                    end
                else
                    v160_.Visible = false
                end
            else
                v160_.Visible = false
            end
        end
    else
        local v163_, v164_, v165_ = pairs(v_u_151_)
        while true do
            local v166_
            v165_, v166_ = v163_(v164_, v165_)
            if v165_ == nil then
                break
            end
            v166_.Visible = false
        end
    end
end
v150_.RenderStepped:Connect(v_u_167_)
game.Players.PlayerAdded:Connect(function(p168_)
    v_u_155_(p168_)
end)
game.Players.PlayerRemoving:Connect(function(p169_)
    if v_u_151_[p169_.UserId] then
        v_u_151_[p169_.UserId]:Remove()
        v_u_151_[p169_.UserId] = nil
    end
end)
local v170_, v171_, v172_ = pairs(game.Players:GetPlayers())
local v_u_173_ = v_u_152_
local v174_ = v_u_155_
while true do
    local v175_
    v172_, v175_ = v170_(v171_, v172_)
    if v172_ == nil then
        break
    end
    v174_(v175_)
end
v3_:CreateToggle({
    Name = "Tracers",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(p176_)
        v_u_173_ = p176_
        v_u_167_()
    end
})
local v_u_177_ = false
v3_:CreateToggle({
    Name = "Safe ESP",
    CurrentValue = false,
    Flag = "",
    Callback = function(p178_)
        v_u_177_ = p178_
        if p178_ then
            local function v183_(p_u_179_)
                pcall(function()
                    if p_u_179_:FindFirstChild("SafeESP") then
                        if p_u_179_:FindFirstChild("Values") and (p_u_179_:FindFirstChild("Values"):FindFirstChild("Broken") and p_u_179_:FindFirstChild("SafeESP"):FindFirstChild("name")) then
                            if p_u_179_.Values.Broken.Value ~= true then
                                p_u_179_:FindFirstChild("SafeESP"):FindFirstChild("health").Text = "Health: " .. p_u_179_:FindFirstChild("Values"):FindFirstChild("Health").Value
                                p_u_179_:FindFirstChild("SafeESP"):FindFirstChild("health").Visible = true
                                p_u_179_:FindFirstChild("SafeESP"):FindFirstChild("name").TextColor3 = Color3.fromRGB(0, 255, 0)
                            else
                                p_u_179_:FindFirstChild("SafeESP"):FindFirstChild("name").TextColor3 = Color3.fromRGB(255, 0, 0)
                                p_u_179_:FindFirstChild("SafeESP"):FindFirstChild("health").Visible = false
                            end
                        end
                    else
                        local v180_ = Instance.new("BillboardGui", p_u_179_)
                        v180_.Name = "SafeESP"
                        v180_.AlwaysOnTop = true
                        v180_.Size = UDim2.new(1.2, 0, 1.2, 0)
                        local v181_ = Instance.new("TextLabel", v180_)
                        v181_.Size = UDim2.new(1, 0, 0.3, 0)
                        v181_.Name = "name"
                        v181_.Font = Enum.Font.SourceSans
                        v181_.FontSize = Enum.FontSize.Size18
                        v181_.TextStrokeTransparency = 0
                        v181_.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                        v181_.BackgroundTransparency = 1
                        local v182_ = Instance.new("TextLabel", v180_)
                        v182_.Size = UDim2.new(1, 0, 0.3, 0)
                        v182_.Name = "health"
                        v182_.Font = Enum.Font.SourceSans
                        v182_.FontSize = Enum.FontSize.Size18
                        v182_.TextStrokeTransparency = 0
                        v182_.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                        v182_.Position = UDim2.new()
                        v182_.BackgroundTransparency = 1
                        v182_.TextColor3 = Color3.fromRGB(0, 255, 0)
                        v182_.Position = UDim2.new(0, 0, 0, 17)
                        v182_.Text = "Health: "
                        if p_u_179_:FindFirstChild("Values") and p_u_179_:FindFirstChild("Values"):FindFirstChild("Broken") then
                            if p_u_179_.Values.Broken.Value ~= true then
                                v181_.TextColor3 = Color3.fromRGB(0, 255, 0)
                            else
                                v181_.TextColor3 = Color3.fromRGB(255, 0, 0)
                            end
                        end
                        if p_u_179_.Name:lower():find("smallsafe") then
                            v181_.Text = "Small Safe"
                        elseif p_u_179_.Name:lower():find("mediumsafe") then
                            v181_.Text = "Medium Safe"
                        elseif p_u_179_.Name:lower():find("register") then
                            v181_.Text = "Register"
                        elseif p_u_179_.Name:lower():find("cash") then
                            v181_.Text = "Register"
                        end
                    end
                end)
            end
            while v_u_177_ do
                wait(1)
                if v_u_177_ then
                    local v184_, v185_, v186_ = pairs(game:GetService("Workspace").Map.BredMakurz:GetChildren())
                    while true do
                        local v187_
                        v186_, v187_ = v184_(v185_, v186_)
                        if v186_ == nil then
                            break
                        end
                        if v187_ then
                            v183_(v187_)
                        end
                    end
                end
            end
        elseif not (p178_ or v_u_177_) then
            local v188_, v189_, v190_ = pairs(game:GetService("Workspace").Map.BredMakurz:GetChildren())
            while true do
                local v191_
                v190_, v191_ = v188_(v189_, v190_)
                if v190_ == nil then
                    break
                end
                if v191_:FindFirstChild("SafeESP") then
                    v191_.SafeESP:Destroy()
                end
            end
        end
    end
})
local v_u_192_ = false
v3_:CreateToggle({
    Name = "Tool ESP",
    CurrentValue = false,
    Flag = "",
    Callback = function(p193_)
        v_u_192_ = p193_
        if p193_ then
            local function v199_(p194_)
                local v195_, v196_, v197_ = pairs(p194_:GetChildren())
                while true do
                    local v198_
                    v197_, v198_ = v195_(v196_, v197_)
                    if v197_ == nil then
                        break
                    end
                    if v198_:IsA("Tool") then
                        return tostring(v198_.Name)
                    end
                end
                return ""
            end
            while v_u_192_ do
                wait(0)
                if v_u_192_ then
                    local v200_ = next
                    local v201_, v202_ = game:GetService("Players"):GetPlayers()
                    while true do
                        local v203_
                        v202_, v203_ = v200_(v201_, v202_)
                        if v202_ == nil then
                            break
                        end
                        if v203_ ~= game:GetService("Players").LocalPlayer and (v203_ and v203_.Character) and (v203_.Character:FindFirstChild("HumanoidRootPart") and (v203_.Character:FindFirstChild("Humanoid") and v203_.Character:FindFirstChild("Head"))) then
                            if v203_.Character.Head:FindFirstChild("ToolsESP") then
                                if v203_ and v203_.Character and (v203_.Character:FindFirstChild("HumanoidRootPart") and (v203_.Character:FindFirstChild("Humanoid") and (v203_.Character:FindFirstChild("Head") and v203_.Character:FindFirstChild("Head"):FindFirstChild("ToolsESP")))) then
                                    v203_.Character:FindFirstChild("Head"):FindFirstChild("ToolsESP").TextLabel.Text = v199_(v203_.Character)
                                end
                            else
                                local v204_ = Instance.new("BillboardGui", v203_.Character.Head)
                                v204_.Name = "ToolsESP"
                                v204_.AlwaysOnTop = true
                                v204_.Size = UDim2.new(1.2, 0, 1.2, 0)
                                local v205_ = Instance.new("TextLabel", v204_)
                                v205_.Size = UDim2.new(1, 0, 0.3, 0)
                                v205_.Font = Enum.Font.SourceSans
                                v205_.FontSize = Enum.FontSize.Size18
                                v205_.TextStrokeTransparency = 0
                                v205_.TextStrokeColor3 = Color3.new(0, 0, 0)
                                v205_.BackgroundTransparency = 1
                                v205_.Text = v199_(v203_.Character)
                                v205_.TextColor3 = Color3.new(1, 0.6470588235294118, 0)
                            end
                        end
                    end
                end
            end
        elseif not (p193_ or v_u_192_) then
            local v206_ = next
            local v207_, v208_ = game:GetService("Players"):GetPlayers()
            while true do
                local v209_
                v208_, v209_ = v206_(v207_, v208_)
                if v208_ == nil then
                    break
                end
                if v209_ ~= game:GetService("Players").LocalPlayer and (v209_ and v209_.Character) and (v209_.Character:FindFirstChild("HumanoidRootPart") and (v209_.Character:FindFirstChild("Humanoid") and (v209_.Character:FindFirstChild("Head") and v209_.Character.Head:FindFirstChild("ToolsESP")))) then
                    v209_.Character.Head.ToolsESP:Destroy()
                end
            end
        end
    end
})
local v_u_210_ = false
v3_:CreateToggle({
    Name = "Crate ESP",
    CurrentValue = false,
    Flag = "",
    Callback = function(p211_)
        v_u_210_ = p211_
        if p211_ then
            while v_u_210_ do
                wait(1)
                if v_u_210_ then
                    local _ = {
                        ColorSequenceKeypoint.new(0, Color3.new(1, 0.666667, 0)),
                        ColorSequenceKeypoint.new(0, Color3.new(1, 0.666667, 0))
                    }
                    local v212_, v213_, v214_ = pairs(game.Workspace.Filter.SpawnedPiles:GetChildren())
                    while true do
                        local v215_
                        v214_, v215_ = v212_(v213_, v214_)
                        if v214_ == nil then
                            break
                        end
                        if v215_.Name == "C1" and v215_:FindFirstChild("MeshPart") then
                            if v215_.MeshPart.TextureID ~= "rbxassetid://11157915894" then
                                if v215_.MeshPart.TextureID ~= "rbxassetid://11157911882" then
                                    if tostring(v215_.MeshPart.Particle.Color) == "0 1 0.666667 0 0 1 1 0.666667 0 0 " and not v215_:FindFirstChild("ESP") then
                                        local v216_ = Instance.new("Highlight")
                                        v216_.Name = "ESP"
                                        v216_.FillColor = Color3.fromRGB(255, 255, 0)
                                        v216_.OutlineColor = Color3.fromRGB(255, 255, 0)
                                        v216_.Parent = v215_
                                    end
                                elseif not v215_:FindFirstChild("ESP") then
                                    local v217_ = Instance.new("Highlight")
                                    v217_.Name = "ESP"
                                    v217_.FillColor = Color3.fromRGB(0, 255, 0)
                                    v217_.OutlineColor = Color3.fromRGB(0, 255, 0)
                                    v217_.Parent = v215_
                                end
                            elseif not v215_:FindFirstChild("ESP") then
                                local v218_ = Instance.new("Highlight")
                                v218_.Name = "ESP"
                                v218_.FillColor = Color3.fromRGB(255, 0, 0)
                                v218_.OutlineColor = Color3.fromRGB(255, 0, 0)
                                v218_.Parent = v215_
                            end
                        end
                    end
                    local v219_, v220_, v221_ = pairs(workspace.Debris.VParts:GetChildren())
                    while true do
                        local v222_
                        v221_, v222_ = v219_(v220_, v221_)
                        if v221_ == nil then
                            break
                        end
                        if v222_ and (v222_.Name == "SupplyCrate" and (v222_ and not v222_:FindFirstChild("ESP"))) then
                            local v223_ = Instance.new("Highlight")
                            v223_.Name = "ESP"
                            v223_.FillColor = Color3.fromRGB(255, 255, 0)
                            v223_.OutlineColor = Color3.fromRGB(255, 255, 0)
                            v223_.Parent = v222_
                        end
                    end
                    local v224_, v225_, v226_ = pairs(workspace.Map.MysteryBoxes:GetChildren())
                    while true do
                        local v227_
                        v226_, v227_ = v224_(v225_, v226_)
                        if v226_ == nil then
                            break
                        end
                        if v227_ and (v227_.Name == "MysteryBox" and (v227_ and not v227_:FindFirstChild("ESP"))) then
                            local v228_ = Instance.new("Highlight")
                            v228_.Name = "ESP"
                            v228_.FillColor = Color3.fromRGB(0, 255, 255)
                            v228_.OutlineColor = Color3.fromRGB(0, 255, 255)
                            v228_.Parent = v227_
                        end
                    end
                end
            end
        elseif not (v_u_210_ or p211_) then
            local v229_, v230_, v231_ = pairs(game.Workspace.Filter.SpawnedPiles:GetChildren())
            while true do
                local v232_
                v231_, v232_ = v229_(v230_, v231_)
                if v231_ == nil then
                    break
                end
                if v232_.Name == "C1" and v232_:FindFirstChild("ESP") then
                    v232_.ESP:Destroy()
                end
            end
            local v233_, v234_, v235_ = pairs(workspace.Debris.VParts:GetChildren())
            while true do
                local v236_
                v235_, v236_ = v233_(v234_, v235_)
                if v235_ == nil then
                    break
                end
                if v236_ and (v236_.Name == "SupplyCrate" and (v236_ and v236_:FindFirstChild("ESP"))) then
                    v236_.ESP:Destroy()
                end
            end
            local v237_, v238_, v239_ = pairs(workspace.Map.MysteryBoxes:GetChildren())
            while true do
                local v240_
                v239_, v240_ = v237_(v238_, v239_)
                if v239_ == nil then
                    break
                end
                if v240_ and (v240_.Name == "MysteryBox" and (v240_ and v240_:FindFirstChild("ESP"))) then
                    v240_.ESP:Destroy()
                end
            end
        end
    end
})
local v_u_241_ = false
v3_:CreateToggle({
    Name = "Dealer ESP",
    CurrentValue = false,
    Flag = "",
    Callback = function(p_u_242_)
        v_u_241_ = p_u_242_
        local function v245_(p243_)
            if v_u_241_ and (p_u_242_ and not p243_:FindFirstChild("DealerESP")) then
                local v244_ = Instance.new("Highlight")
                v244_.Parent = p243_
                v244_.FillColor = Color3.new(1, 1, 1)
                v244_.Name = "DealerESP"
                if p243_.Name ~= "ArmoryDealer" then
                    if p243_.Name == "Dealer" then
                        v244_.FillColor = Color3.fromRGB(153, 255, 153)
                        v244_.OutlineColor = Color3.fromRGB(153, 255, 153)
                    end
                else
                    v244_.FillColor = Color3.fromRGB(153, 204, 255)
                    v244_.OutlineColor = Color3.fromRGB(153, 204, 255)
                end
            end
        end
        if p_u_242_ then
            while v_u_241_ do
                wait(0.01)
                if p_u_242_ then
                    local v246_, v247_, v248_ = pairs(workspace.Map.Shopz:GetChildren())
                    while true do
                        local v249_
                        v248_, v249_ = v246_(v247_, v248_)
                        if v248_ == nil then
                            break
                        end
                        if v249_.Name == "Dealer" or v249_.Name == "ArmoryDealer" then
                            v245_(v249_)
                        end
                    end
                end
            end
        else
            local v250_, v251_, v252_ = pairs(workspace.Map.Shopz:GetChildren())
            while true do
                local v253_
                v252_, v253_ = v250_(v251_, v252_)
                if v252_ == nil then
                    break
                end
                if (v253_.Name == "Dealer" or v253_.Name == "ArmoryDealer") and v253_:FindFirstChild("DealerESP") then
                    v253_:FindFirstChild("DealerESP"):Destroy()
                end
            end
        end
    end
})
local v_u_254_ = false
v3_:CreateToggle({
    Name = "Scrap ESP",
    CurrentValue = false,
    Flag = "",
    Callback = function(p255_)
        v_u_254_ = p255_
        if p255_ then
            while v_u_254_ do
                wait(1)
                if v_u_254_ then
                    local v256_, v257_, v258_ = pairs(game.Workspace.Filter.SpawnedPiles:GetChildren())
                    while true do
                        local v259_
                        v258_, v259_ = v256_(v257_, v258_)
                        if v258_ == nil then
                            break
                        end
                        if (v259_.Name == "S1" or v259_.Name == "S2") and (v259_:FindFirstChild("MeshPart") and not v259_:FindFirstChild("ESP")) then
                            local v260_ = Instance.new("Highlight")
                            v260_.Name = "ESP"
                            v260_.FillColor = Color3.fromRGB(150, 150, 150)
                            v260_.OutlineColor = Color3.fromRGB(150, 150, 150)
                            v260_.Parent = v259_
                        end
                    end
                end
            end
        elseif not (v_u_254_ or p255_) then
            local v261_, v262_, v263_ = pairs(game.Workspace.Filter.SpawnedPiles:GetChildren())
            while true do
                local v264_
                v263_, v264_ = v261_(v262_, v263_)
                if v263_ == nil then
                    break
                end
                if (v264_.Name == "S1" or v264_.Name == "S2") and v264_:FindFirstChild("ESP") then
                    v264_.ESP:Destroy()
                end
            end
        end
    end
})
v3_:CreateButton({
    Name = "Player detection (Stays until leave)",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/arVatYFs", true))()
    end
})
local v265_ = v2_:CreateTab("FemboysHub Misc", nil)
v265_:CreateSection("Strafe")
local v_u_266_ = game:GetService("Players")
local v_u_267_ = game:GetService("RunService")
local v_u_268_ = v_u_266_.LocalPlayer
local v_u_269_ = 4
local v_u_270_ = 5
local v_u_271_ = false
local v_u_272_ = nil
local v_u_273_ = nil
local function v_u_282_()
    local v274_ = math.huge
    local v275_ = v_u_266_
    local v276_, v277_, v278_ = ipairs(v275_:GetPlayers())
    local v279_ = nil
    while true do
        local v280_
        v278_, v280_ = v276_(v277_, v278_)
        if v278_ == nil then
            break
        end
        if v280_ ~= v_u_268_ and v280_.Character and v280_.Character:FindFirstChild("HumanoidRootPart") then
            local v281_ = (v_u_268_.Character.HumanoidRootPart.Position - v280_.Character.HumanoidRootPart.Position).magnitude
            if v281_ < v274_ then
                v279_ = v280_
                v274_ = v281_
            end
        end
    end
    return v279_
end
local function v_u_291_()
    if v_u_273_ then
        v_u_273_:Disconnect()
    end
    local v_u_283_ = 0
    v_u_273_ = v_u_267_.RenderStepped:Connect(function(p284_)
        if v_u_271_ and (v_u_272_ and v_u_272_.Character) and v_u_272_.Character:FindFirstChild("HumanoidRootPart") then
            local v285_ = v_u_272_.Character.HumanoidRootPart.Position
            v_u_283_ = v_u_283_ + v_u_270_ * p284_
            local v286_ = v_u_269_ * math.cos(v_u_283_)
            local v287_ = v_u_269_ * math.sin(v_u_283_)
            v_u_268_.Character.HumanoidRootPart.CFrame = CFrame.new(v285_ + Vector3.new(v286_, 0, v287_), v285_)
            local v288_ = v_u_268_.Character:FindFirstChildOfClass("Humanoid")
            if v288_ then
                v288_.PlatformStand = true
            end
            local v289_ = v_u_272_.Character:FindFirstChildOfClass("Humanoid")
            if v289_ and v289_.Health < 15 then
                v_u_271_ = false
                v_u_272_ = nil
                print("Target player\'s health is below 15. Stopping.")
            end
        else
            local v290_ = v_u_268_.Character:FindFirstChildOfClass("Humanoid")
            if v290_ then
                v290_.PlatformStand = false
            end
            if v_u_273_ then
                v_u_273_:Disconnect()
                v_u_273_ = nil
            end
        end
    end)
end
v265_:CreateToggle({
    Name = "Strafe Around Nearest Player",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(p292_)
        v_u_271_ = p292_
        print("Strafing around nearest player:", v_u_271_)
        if v_u_271_ then
            v_u_272_ = v_u_282_()
            if v_u_272_ then
                v_u_291_()
            else
                v_u_271_ = false
                print("No valid target player found.")
            end
        elseif v_u_273_ then
            v_u_273_:Disconnect()
            v_u_273_ = nil
        end
    end
})
v265_:CreateSlider({
    Name = "Strafe Radius",
    Range = {
        1,
        10
    },
    Increment = 1,
    Suffix = "Units",
    CurrentValue = v_u_269_,
    Flag = "RadiusSlider",
    Callback = function(p293_)
        v_u_269_ = p293_
        print("Strafe radius set to:", v_u_269_)
    end
})
v265_:CreateSlider({
    Name = "Strafe Speed",
    Range = {
        1,
        10
    },
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = v_u_270_,
    Flag = "SpeedSlider",
    Callback = function(p294_)
        v_u_270_ = p294_
        print("Strafe speed set to:", v_u_270_)
    end
})
v_u_268_.CharacterAdded:Connect(function(p295_)
    p295_:WaitForChild("HumanoidRootPart")
    v_u_272_ = v_u_271_ and v_u_282_()
    if v_u_272_ then
        v_u_291_()
    end
end)
print("Strafe script with toggle and sliders loaded")
v265_:CreateSection("FollowPlayer")
local v_u_296_ = 3
v265_:CreateSlider({
    Name = "Follow Distance",
    Range = {
        1,
        5
    },
    Increment = 0.1,
    Suffix = "Units",
    CurrentValue = v_u_296_,
    Flag = "Slider1",
    Callback = function(p297_)
        v_u_296_ = p297_
    end
})
local v_u_298_ = game.Players.LocalPlayer
local v_u_299_ = v_u_298_.Character or v_u_298_.CharacterAdded:Wait()
local v300_ = v_u_299_
local v_u_301_ = v_u_299_.WaitForChild(v300_, "HumanoidRootPart")
local v_u_302_ = false
local v_u_303_ = 0.001
local v_u_304_ = nil
local function v306_(p305_)
    v_u_299_ = p305_
    v_u_301_ = v_u_299_:WaitForChild("HumanoidRootPart")
end
v_u_298_.CharacterAdded:Connect(v306_)
local function v_u_318_()
    local v307_ = math.huge
    local v308_, v309_, v310_ = ipairs(game.Players:GetPlayers())
    local v311_ = nil
    while true do
        local v312_
        v310_, v312_ = v308_(v309_, v310_)
        if v310_ == nil then
            break
        end
        if v312_ ~= v_u_298_ and v312_.Character and v312_.Character:FindFirstChild("HumanoidRootPart") then
            local v313_ = v312_.Character:FindFirstChild("HumanoidRootPart")
            local v314_ = v312_.Character:FindFirstChildOfClass("Humanoid")
            if v314_ and v314_.Health >= 15 then
                local v315_ = (v_u_301_.Position - v313_.Position).magnitude
                if v315_ < v307_ then
                    v311_ = v312_
                    v307_ = v315_
                end
            end
        end
    end
    if v311_ then
        v_u_304_ = v311_
        local v316_ = v311_.Character:FindFirstChild("HumanoidRootPart")
        local v317_ = v316_.Position - v316_.CFrame.LookVector * v_u_296_
        v_u_301_.CFrame = CFrame.new(v317_, v316_.Position)
    end
end
local function v_u_321_()
    if v_u_304_ and v_u_304_.Character and v_u_304_.Character:FindFirstChild("HumanoidRootPart") then
        local v319_ = v_u_304_.Character:FindFirstChild("HumanoidRootPart")
        local v320_ = v_u_304_.Character:FindFirstChild("Head")
        if v320_ then
            v_u_301_.CFrame = CFrame.new(v320_.Position + Vector3.new(0, 3, 0), v319_.Position)
        end
    end
end
v265_:CreateToggle({
    Name = "Enable Follow from Behind",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(p322_)
        if p322_ then
            v_u_302_ = true
            while v_u_302_ do
                if v_u_304_ and v_u_304_.Character and v_u_304_.Character:FindFirstChildOfClass("Humanoid") then
                    local v323_ = v_u_304_.Character:FindFirstChildOfClass("Humanoid")
                    if v323_ and v323_.Health < 15 then
                        v_u_302_ = false
                        v_u_321_()
                    else
                        v_u_318_()
                    end
                else
                    v_u_318_()
                end
                wait(v_u_303_)
            end
        else
            v_u_302_ = false
        end
    end
})
game:GetService("RunService").RenderStepped:Connect(function()
    if v_u_302_ and (v_u_304_ and v_u_304_.Character) and v_u_304_.Character:FindFirstChildOfClass("Humanoid") then
        local v324_ = v_u_304_.Character:FindFirstChildOfClass("Humanoid")
        if v324_ and v324_.Health < 15 then
            v_u_302_ = false
            v_u_321_()
        else
            v_u_318_()
        end
    end
end)
v265_:CreateSection("Bang")
local v_u_325_ = 3
local v_u_326_ = 1.3
local v_u_327_ = 4
local v_u_328_ = game.Players.LocalPlayer
local v_u_329_ = v_u_328_.Character or v_u_328_.CharacterAdded:Wait()
local v330_ = v_u_329_
local v_u_331_ = v_u_329_.WaitForChild(v330_, "HumanoidRootPart")
local v_u_332_ = false
local v_u_333_ = nil
local v_u_334_ = false
local v_u_335_ = 1
local v_u_336_ = 0.1
local v_u_337_ = Instance.new("Sound")
v_u_337_.SoundId = "rbxassetid://6892830182"
v_u_337_.Volume = 1
v_u_337_.Parent = v_u_329_
local v_u_338_ = Instance.new("Sound")
v_u_338_.SoundId = "rbxassetid://9125702141"
v_u_338_.Volume = 1
v_u_338_.Parent = v_u_329_
local function v340_(p339_)
    v_u_329_ = p339_
    v_u_331_ = v_u_329_:WaitForChild("HumanoidRootPart")
    v_u_337_.Parent = v_u_329_
    v_u_338_.Parent = v_u_329_
end
v_u_328_.CharacterAdded:Connect(v340_)
local function v_u_343_()
    if v_u_333_ and v_u_333_.Character and v_u_333_.Character:FindFirstChild("HumanoidRootPart") then
        local v341_ = v_u_333_.Character:FindFirstChild("HumanoidRootPart")
        local v342_ = v341_.Position - v341_.CFrame.LookVector * v_u_325_
        v_u_331_.CFrame = CFrame.new(v342_, v341_.Position)
    end
end
local function v_u_346_()
    if v_u_333_ and v_u_333_.Character and v_u_333_.Character:FindFirstChild("HumanoidRootPart") then
        local v344_ = v_u_333_.Character:FindFirstChild("HumanoidRootPart")
        local v345_ = v_u_333_.Character:FindFirstChild("Head")
        if v345_ then
            v_u_331_.CFrame = CFrame.new(v345_.Position + Vector3.new(0, 3, 0), v344_.Position)
        end
    end
end
v265_:CreateToggle({
    Name = "Bang",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(p347_)
        if p347_ then
            v_u_332_ = true
            v_u_334_ = true
            local v348_ = math.huge
            local v349_, v350_, v351_ = ipairs(game.Players:GetPlayers())
            local v352_ = nil
            while true do
                local v353_
                v351_, v353_ = v349_(v350_, v351_)
                if v351_ == nil then
                    break
                end
                if v353_ ~= v_u_328_ and v353_.Character and v353_.Character:FindFirstChild("HumanoidRootPart") then
                    local v354_ = v353_.Character:FindFirstChild("HumanoidRootPart")
                    local v355_ = v353_.Character:FindFirstChildOfClass("Humanoid")
                    if v355_ and v355_.Health >= 15 then
                        local v356_ = (v_u_331_.Position - v354_.Position).magnitude
                        if v356_ < v348_ then
                            v352_ = v353_
                            v348_ = v356_
                        end
                    end
                end
            end
            v_u_333_ = v352_
            coroutine.wrap(function()
                while v_u_334_ do
                    if v_u_332_ then
                        v_u_325_ = v_u_325_ + v_u_336_ * v_u_335_
                        if v_u_327_ > v_u_325_ then
                            if v_u_325_ <= v_u_326_ then
                                v_u_325_ = v_u_326_
                                v_u_335_ = 1
                                v_u_338_:Play()
                                v_u_337_:Play()
                            end
                        else
                            v_u_325_ = v_u_327_
                            v_u_335_ = - 1
                        end
                    end
                    wait(0.001)
                end
            end)()
        else
            v_u_332_ = false
            v_u_334_ = false
        end
    end
})
v265_:CreateSlider({
    Name = "Bang Speed",
    Range = {
        0.1,
        1
    },
    Increment = 0.1,
    Suffix = "Speed",
    CurrentValue = v_u_336_,
    Flag = "Slider1",
    Callback = function(p357_)
        v_u_336_ = p357_
    end
})
game:GetService("RunService").RenderStepped:Connect(function()
    if v_u_332_ then
        if v_u_333_ and v_u_333_.Character and v_u_333_.Character:FindFirstChildOfClass("Humanoid") then
            local v358_ = v_u_333_.Character:FindFirstChildOfClass("Humanoid")
            if v358_ and v358_.Health < 15 then
                v_u_332_ = false
                v_u_346_()
            else
                v_u_343_()
            end
        else
            v_u_332_ = false
        end
    end
end)
v265_:CreateSection("Spin")
local v359_ = game:GetService("Players")
local v_u_360_ = game:GetService("RunService")
local v_u_361_ = v359_.LocalPlayer
local v_u_362_ = 30
local v_u_363_ = false
local function v_u_371_()
    local v364_ = v_u_361_.Character or v_u_361_.CharacterAdded:Wait()
    local v_u_365_ = v364_:WaitForChild("HumanoidRootPart")
    local v_u_366_ = v364_:WaitForChild("Humanoid")
    local v_u_367_ = 0
    print("Initializing spinning logic...")
    local v_u_369_ = v_u_360_.RenderStepped:Connect(function(p368_)
        if v_u_363_ then
            v_u_367_ = v_u_367_ + v_u_362_ * p368_
            v_u_365_.CFrame = CFrame.new(v_u_365_.Position) * CFrame.Angles(0, v_u_367_, 0)
        end
        if v_u_366_.Health < 15 then
            v_u_363_ = false
        end
    end)
    v364_.AncestryChanged:Connect(function(_, p370_)
        if not p370_ then
            v_u_369_:Disconnect()
        end
    end)
end
local function v373_(p372_)
    print("Character added, initializing spinning...")
    p372_:WaitForChild("HumanoidRootPart")
    v_u_371_()
end
v_u_361_.CharacterAdded:Connect(v373_)
if v_u_361_.Character then
    v373_(v_u_361_.Character)
end
v265_:CreateToggle({
    Name = "Spin Toggle",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(p374_)
        v_u_363_ = p374_
        print("Spinning set to:", v_u_363_)
    end
})
v265_:CreateSlider({
    Name = "Spin Speed",
    Range = {
        1,
        100
    },
    Increment = 1,
    Suffix = "degrees/sec",
    CurrentValue = v_u_362_,
    Flag = "Slider1",
    Callback = function(p375_)
        v_u_362_ = p375_
        print("Spin speed set to:", v_u_362_)
    end
})
print("Script is running")
v265_:CreateSection("FemboyHub Movement")
local v_u_376_ = 1.1
local v_u_377_ = false
v265_:CreateToggle({
    Name = "Speed",
    CurrentValue = false,
    Flag = "",
    Callback = function(p378_)
        v_u_377_ = p378_
        getgenv().Speed = v_u_376_
        local v379_ = game:GetService("Players").LocalPlayer
        local v380_ = v379_.Character
        local v381_
        if v380_ then
            v381_ = v380_:FindFirstChildWhichIsA("Humanoid")
        else
            v381_ = v380_
        end
        local v382_ = game:GetService("RunService").Heartbeat
        if p378_ then
            while v_u_377_ and (v380_ and (v381_ and v381_.Parent)) do
                wait()
                if v_u_377_ and p378_ then
                    getgenv().Speed = v_u_376_
                    if v379_.Character and v379_.Character:FindFirstChildWhichIsA("Humanoid") then
                        v380_ = v379_.Character
                    end
                    local v383_ = v382_:Wait()
                    if v381_.MoveDirection.Magnitude <= 0 then
                        v380_:TranslateBy(v381_.MoveDirection * v383_ * 10)
                    else
                        v380_:TranslateBy(v381_.MoveDirection * tonumber(getgenv().Speed) * v383_ * 10)
                    end
                end
            end
        end
    end
})
v265_:CreateSlider({
    Name = "Speed",
    Range = {
        1,
        7
    },
    Increment = 0.1,
    Suffix = "Speed",
    CurrentValue = 1.1,
    Flag = "",
    Callback = function(p384_)
        v_u_376_ = p384_
    end
})
v265_:CreateSlider({
    Name = "Gravity (196 Normal 75 is highest jump)",
    Range = {
        196,
        75
    },
    Increment = 1,
    Suffix = "Gravity",
    CurrentValue = 196.2,
    Flag = "SliderGravity",
    Callback = function(p385_)
        workspace.Gravity = p385_
    end
})
local v_u_386_ = game:GetService("ReplicatedStorage"):FindFirstChild("Values"):FindFirstChild("FinishSpeedMulti")
v265_:CreateSlider({
    Name = "Finish/Stomp Speed",
    Range = {
        0,
        1.8
    },
    Increment = 0.1,
    Suffix = "Speed",
    CurrentValue = v_u_386_.Value,
    Flag = "FinishSpeedMultiplier",
    Callback = function(p387_)
        v_u_386_.Value = p387_
    end
})
v265_:CreateSection("FemboyHub Vision")
v265_:CreateSlider({
    Name = "Custom Day Time",
    Range = {
        1,
        24
    },
    Increment = 1,
    Suffix = ": 00",
    CurrentValue = 12,
    Flag = "Slider1",
    Callback = function(p388_)
        local v389_ = game:GetService("ReplicatedStorage"):FindFirstChild("Values"):FindFirstChild("TimeState")
        v389_.Value = p388_
        v389_.Enabled.Value = true
    end
})
v265_:CreateSlider({
    Name = "Max CameraZoom Distance",
    Range = {
        10,
        250
    },
    Increment = 2,
    Suffix = "Distance",
    CurrentValue = 10,
    Flag = "Slider1",
    Callback = function(p390_)
        game.Players.LocalPlayer.CameraMaxZoomDistance = p390_
    end
})
v265_:CreateDropdown({
    Name = "Camera Mode",
    Options = {
        "Zoom",
        "Invisicam"
    },
    CurrentOption = {
        "Zoom"
    },
    MultipleOptions = false,
    Flag = "Dropdown1",
    Callback = function(p391_)
        local v392_ = nil
        local v393_ = nil
        while true do
            local v394_
            v393_, v394_ = p391_(v392_, v393_)
            if v393_ == nil then
                break
            end
            game.Players.LocalPlayer.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode[v394_]
        end
    end
})
local function v_u_397_()
    local v395_ = Instance.new("ScreenGui")
    v395_.Name = "ExampleGui"
    v395_.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    local v396_ = Instance.new("ImageLabel")
    v396_.Name = "ExampleImage"
    v396_.Size = UDim2.new(0.03, 0, 0.03, 0)
    v396_.Position = UDim2.new(0.5, 0, 0.4775, 0)
    v396_.AnchorPoint = Vector2.new(0.5, 0.5)
    v396_.Image = "rbxassetid://1827745860"
    v396_.BackgroundTransparency = 1
    v396_.Visible = false
    v396_.Parent = v395_
end
v_u_397_()
game.Players.LocalPlayer.CharacterAdded:Connect(function()
    local v398_ = game.Players.LocalPlayer.PlayerGui:FindFirstChild("ExampleGui")
    if v398_ then
        v398_:Destroy()
    end
    v_u_397_()
end)
v265_:CreateToggle({
    Name = "Crosshair",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(p399_)
        local v400_ = game.Players.LocalPlayer.PlayerGui:FindFirstChild("ExampleGui")
        if v400_ then
            v400_ = game.Players.LocalPlayer.PlayerGui.ExampleGui:FindFirstChild("ExampleImage")
        end
        if v400_ then
            v400_.Visible = p399_
        end
    end
})
v265_:CreateSection("FemboyHub Chat")
v265_:CreateButton({
    Name = "Chat Spy",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LisSploit/FemboysHubChat/main/Spy"))()
    end
})
v265_:CreateSection("FemboyHub Combat")
v265_:CreateButton({
    Name = "WallBang",
    Callback = function()
        game:service("Workspace"):FindFirstChild("Map"):FindFirstChild("Parts"):FindFirstChild("M_Parts").Parent = game:service("Workspace"):FindFirstChild("Characters")
    end
})
v265_:CreateButton({
    Name = "Admin Protection (Auto leave when Staff joins the server)",
    Callback = function()
        local v_u_401_ = {
            "tabootvcat",
            "Revenantic",
            "Saabor",
            "MoIitor",
            "IAmUnderAMask",
            "SheriffGorji",
            "xXFireyScorpionXx",
            "LoChips",
            "DeliverCreations",
            "TDXiswinning",
            "TZZV",
            "FelixVenue",
            "SIEGFRlED",
            "ARRYvvv",
            "z_papermoon",
            "Malpheasance",
            "ModHandIer",
            "valphex",
            "J_anday",
            "tvdisko",
            "yIlehs",
            "DeliverCreations",
            "COLOSSUSBUILTOFSTEEL",
            "SeizedHolder",
            "r3shape",
            "RVVZ",
            "adurize",
            "codedcosmetics",
            "QuantumCaterpillar",
            "FractalHarmonics",
            "GalacticSculptor",
            "oTheSilver",
            "Kretacaous",
            "icarus_xs1goliath",
            "GlamorousDradon",
            "rainjeremy",
            "parachuter2000",
            "faintermercury",
            "harht",
            "Sansek1252",
            "Snorpuwu",
            "BenAzoten",
            "Cand1ebox",
            "KeenlyAware",
            "mrzued",
            "BruhmanVIII",
            "Nystesia",
            "fausties",
            "zateopp",
            "Iordnabi",
            "ReviveTheDevil",
            "jake_jpeg",
            "UncrossedMeat3888",
            "realpenyy",
            "karateeeh",
            "JayyMlg",
            "Lo_Chips",
            "Avelosky",
            "king_ab09",
            "TigerLe123",
            "Dalvanuis",
            "MoIitor",
            "FelixVenue",
            "iSonMillions"
        }
        for v402_ = 1, # v_u_401_ do
            local v403_ = v402_
            v_u_401_[v403_] = string.lower(v_u_401_[v403_])
        end
        local function v_u_405_(p404_)
            if table.find(v_u_401_, string.lower(p404_.Name)) then
                game.Players.LocalPlayer:Kick("Stinky Staff joined the server - Femboyshub")
            end
        end
        local function v410_()
            local v406_, v407_, v408_ = ipairs(game.Players:GetPlayers())
            while true do
                local v409_
                v408_, v409_ = v406_(v407_, v408_)
                if v408_ == nil then
                    break
                end
                v_u_405_(v409_)
            end
        end
        game.Players.PlayerAdded:Connect(v_u_405_)
        v410_()
    end
})
v265_:CreateButton({
    Name = "RPG-7 rocket control",
    Callback = function()
        local v_u_411_ = game:GetService("Players")
        local v_u_412_ = game:GetService("UserInputService")
        local v_u_413_ = game:GetService("RunService")
        local v_u_414_ = game:GetService("TweenService")
        local v_u_415_ = workspace.CurrentCamera
        local v416_ = workspace.Debris
        local v417_ = v416_.VParts
        local v_u_418_ = v_u_411_.LocalPlayer
        local v419_ = v_u_418_
        v_u_418_.GetMouse(v419_)
        local v_u_420_ = 0
        local v_u_421_ = 0
        local v_u_422_ = 300
        local v_u_423_ = false
        v417_.ChildAdded:Connect(function(p_u_424_)
            if v_u_411_.LocalPlayer.Character:FindFirstChild("RPG-7") then
                task.wait()
                if p_u_424_.Name == "RPG_Rocket" then
                    v_u_415_.CameraSubject = p_u_424_
                    v_u_418_.Character.HumanoidRootPart.Anchored = true
                    pcall(function()
                        p_u_424_.BodyForce:Destroy()
                        p_u_424_.RotPart.BodyAngularVelocity:Destroy()
                        p_u_424_.Sound:Destroy()
                    end)
                    local v_u_425_ = Instance.new("BodyVelocity", p_u_424_)
                    v_u_425_.MaxForce = Vector3.new(1000000000, 1000000000, 1000000000)
                    v_u_425_.Velocity = Vector3.new()
                    local v_u_426_ = Instance.new("BodyGyro", p_u_424_)
                    v_u_426_.P = 90000
                    v_u_426_.MaxTorque = Vector3.new(1000000000, 1000000000, 1000000000)
                    task.spawn(function()
                        repeat
                            v_u_413_.RenderStepped:Wait()
                            v_u_414_:Create(v_u_425_, TweenInfo.new(0.2), {
                                Velocity = (v_u_415_.CFrame.LookVector * v_u_420_ + v_u_415_.CFrame.RightVector * v_u_421_) * v_u_422_
                            }):Play()
                            v_u_426_.CFrame = v_u_415_.CoordinateFrame
                            workspace.CurrentCamera.CFrame = p_u_424_.CFrame * CFrame.new(Vector3.new(0, 1, 1))
                        until v_u_423_
                        v_u_423_ = false
                        v_u_415_.CameraSubject = v_u_418_.Character.Humanoid
                        v_u_418_.Character.HumanoidRootPart.Anchored = false
                    end)
                    v_u_412_.InputBegan:Connect(function(p427_)
                        if p427_.KeyCode ~= Enum.KeyCode.W then
                            if p427_.KeyCode ~= Enum.KeyCode.S then
                                if p427_.KeyCode ~= Enum.KeyCode.D then
                                    if p427_.KeyCode == Enum.KeyCode.A then
                                        v_u_421_ = - 1
                                    end
                                else
                                    v_u_421_ = 1
                                end
                            else
                                v_u_420_ = - 1
                            end
                        else
                            v_u_420_ = 1
                        end
                    end)
                    v_u_412_.InputEnded:Connect(function(p428_)
                        if p428_.KeyCode == Enum.KeyCode.W or p428_.KeyCode == Enum.KeyCode.S then
                            v_u_420_ = 0
                        elseif p428_.KeyCode == Enum.KeyCode.D or p428_.KeyCode == Enum.KeyCode.A then
                            v_u_421_ = 0
                        end
                    end)
                end
            end
        end)
        v416_.ChildAdded:Connect(function(p_u_429_)
            task.wait()
            pcall(function()
                v_u_423_ = p_u_429_.Name == "RPG_Explosion_Long" or p_u_429_.Name == "RPG_Explosion_Short"
            end)
        end)
    end
})
local v_u_430_ = "Head"
local v_u_431_ = 30
local v_u_432_ = false
v265_:CreateToggle({
    Name = "Melee aura",
    CurrentValue = false,
    Flag = "",
    Callback = function(p_u_433_)
        v_u_432_ = p_u_433_
        local function v_u_446_()
            local v434_ = game:GetService("Players")
            local v435_ = v434_.LocalPlayer
            local v436_ = v435_.Character
            local v437_
            if v436_ then
                v437_ = v436_:FindFirstChild(v_u_430_)
            else
                v437_ = v436_
            end
            if v436_ or HumanoidRootPart then
                local v438_ = math.huge
                local v439_, v440_, v441_ = pairs(v434_:GetPlayers())
                local v442_ = nil
                while true do
                    local v443_
                    v441_, v443_ = v439_(v440_, v441_)
                    if v441_ == nil then
                        break
                    end
                    if v443_ ~= v435_ and v443_.Character and v443_.Character:FindFirstChild(v_u_430_) then
                        local v444_ = v443_.Character:FindFirstChild(v_u_430_)
                        local v445_ = (v437_.Position - v444_.Position).magnitude
                        if v445_ < v438_ then
                            v442_ = v443_
                            v438_ = v445_
                        end
                    end
                end
                if v438_ > v_u_431_ then
                    return nil
                else
                    return v442_
                end
            else
                return
            end
        end
        if p_u_433_ then
            meleeaurarunservice = game:GetService("RunService").RenderStepped:Connect(function()
                if v_u_432_ and p_u_433_ then
                    local v447_, v448_, v449_ = pairs(game:GetService("Players").LocalPlayer.Character:GetChildren())
                    while true do
                        local v450_
                        v449_, v450_ = v447_(v448_, v449_)
                        if v449_ == nil then
                            break
                        end
                        if v450_ and v450_:IsA("Tool") then
                            if v450_.Name == "Fists" then
                                local v451_, v452_, v453_ = pairs(game:GetService("Players").LocalPlayer.Character:GetChildren())
                                while true do
                                    local v454_
                                    v453_, v454_ = v451_(v452_, v453_)
                                    if v453_ == nil then
                                        break
                                    end
                                    if v454_ and (v454_.Name == "Left Arm" or v454_.Name == "Right Arm") and v454_ then
                                        local v455_ = v_u_446_()
                                        if v455_ and v455_.Character and (v455_.Character:FindFirstChild("Humanoid") and (v455_.Character:FindFirstChild(v_u_430_) and (v455_.Character:FindFirstChild("Humanoid").Health > 0 and v454_))) then
                                            local v456_, v457_, v458_ = pairs(v454_:GetChildren())
                                            while true do
                                                local v459_
                                                v458_, v459_ = v456_(v457_, v458_)
                                                if v458_ == nil then
                                                    break
                                                end
                                                if v459_ and v459_.Name == "DmgPoint" then
                                                    local v460_ = v455_.Character:FindFirstChild(v_u_430_)
                                                    v459_.CFrame = CFrame.new(0, 0, 0)
                                                    local v461_ = v460_.Position.X + math.random(- v460_.Size.X, v460_.Size.X) / 10
                                                    local v462_ = v460_.Position.Y + math.random(- v460_.Size.Y, v460_.Size.Y) / 10
                                                    local v463_ = v460_.Position.Z + math.random(- v460_.Size.Z, v460_.Size.Z) / 10
                                                    v459_.WorldCFrame = CFrame.new(v461_, v462_, v463_) * CFrame.new(0, 0.5, 0)
                                                end
                                            end
                                        end
                                    end
                                end
                            elseif v450_.Name == "Sledgehammer" then
                                if v450_:FindFirstChild("Handle") and (v450_:FindFirstChild("Handle"):FindFirstChild("Swing1") or v450_:FindFirstChild("Handle"):FindFirstChild("Swing2")) then
                                    local v464_ = v_u_446_()
                                    if v464_ and v464_.Character and (v464_.Character:FindFirstChild("Humanoid") and (v464_.Character:FindFirstChild(v_u_430_) and v464_.Character:FindFirstChild("Humanoid").Health > 0)) then
                                        local v465_, v466_, v467_ = pairs(v450_.Handle:GetChildren())
                                        while true do
                                            local v468_
                                            v467_, v468_ = v465_(v466_, v467_)
                                            if v467_ == nil then
                                                break
                                            end
                                            if v468_ and v468_.Name == "DmgPoint" then
                                                local v469_ = v464_.Character:FindFirstChild(v_u_430_)
                                                v468_.CFrame = CFrame.new(0, 0, 0)
                                                local v470_ = v469_.Position.X + math.random(- v469_.Size.X, v469_.Size.X) / 10
                                                local v471_ = v469_.Position.Y + math.random(- v469_.Size.Y, v469_.Size.Y) / 10
                                                local v472_ = v469_.Position.Z + math.random(- v469_.Size.Z, v469_.Size.Z) / 10
                                                v468_.WorldCFrame = CFrame.new(v470_, v471_, v472_) * CFrame.new(0, 0.4, 0)
                                            end
                                        end
                                    end
                                end
                            elseif v450_:FindFirstChild("WeaponHandle") and (v450_:FindFirstChild("WeaponHandle"):FindFirstChild("Swing1") or v450_:FindFirstChild("WeaponHandle"):FindFirstChild("Swing2")) then
                                local v473_ = v_u_446_()
                                if v473_ and v473_.Character and (v473_.Character:FindFirstChild("Humanoid") and (v473_.Character:FindFirstChild(v_u_430_) and v473_.Character:FindFirstChild("Humanoid").Health > 0)) then
                                    local v474_, v475_, v476_ = pairs(v450_.WeaponHandle:GetChildren())
                                    while true do
                                        local v477_
                                        v476_, v477_ = v474_(v475_, v476_)
                                        if v476_ == nil then
                                            break
                                        end
                                        if v477_ and v477_.Name == "DmgPoint" then
                                            local v478_ = v473_.Character:FindFirstChild(v_u_430_)
                                            v477_.CFrame = CFrame.new(0, 0, 0)
                                            local v479_ = v478_.Position.X + math.random(- v478_.Size.X, v478_.Size.X) / 10
                                            local v480_ = v478_.Position.Y + math.random(- v478_.Size.Y, v478_.Size.Y) / 10
                                            local v481_ = v478_.Position.Z + math.random(- v478_.Size.Z, v478_.Size.Z) / 10
                                            v477_.WorldCFrame = CFrame.new(v479_, v480_, v481_) * CFrame.new(0, 0.54, 0)
                                        end
                                    end
                                end
                            end
                        end
                    end
                elseif meleeaurarunservice then
                    meleeaurarunservice:Disconnect()
                end
            end)
        elseif not p_u_433_ and (not v_u_432_ and meleeaurarunservice) then
            meleeaurarunservice:Disconnect()
        end
    end
})
v265_:CreateButton({
    Name = "Fling",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/sauga77kjk/RobloxExploitRepository/main/TouchFLING"))()
    end
})
local function v_u_492_(p482_)
    local v483_, v484_, v485_ = ipairs(p482_:GetDescendants())
    local v486_ = {}
    while true do
        local v487_
        v485_, v487_ = v483_(v484_, v485_)
        if v485_ == nil then
            break
        end
        if v487_:IsA("BasePart") then
            if not v486_[v487_] then
                v486_[v487_] = v487_.Material
            end
            v487_.Transparency = 0.5
            v487_.Material = Enum.Material.SmoothPlastic
            v487_.CanCollide = false
            if v487_.Name == "DFrame" then
                v487_.Transparency = 1
                v487_.CanCollide = false
            end
        end
    end
    local v488_, v489_, v490_ = pairs(v486_)
    while true do
        local v491_
        v490_, v491_ = v488_(v489_, v490_)
        if v490_ == nil then
            break
        end
        if v490_ and v490_:IsA("BasePart") then
            v490_.Material = v491_
        end
    end
end
local function v_u_494_(p493_)
    if p493_:IsA("Model") then
        v_u_492_(p493_)
    end
end
v265_:CreateButton({
    Name = "Anti Doors",
    Callback = function()
        local v495_ = game.Workspace.Map:FindFirstChild("Doors")
        if v495_ then
            local v496_, v497_, v498_ = ipairs(v495_:GetChildren())
            while true do
                local v499_
                v498_, v499_ = v496_(v497_, v498_)
                if v498_ == nil then
                    break
                end
                if v499_:IsA("Model") then
                    v_u_492_(v499_)
                end
            end
            v495_.ChildAdded:Connect(v_u_494_)
            print("Existing and new doors will now be semi-transparent, non-collidable, and DFrame parts will be invisible.")
        else
            print("No Doors folder found in Map.")
        end
    end
})
v265_:CreateButton({
    Name = "Remove BarbedWire",
    Callback = function()
        local v500_ = game.Workspace.Filter.Parts.F_Parts
        if v500_ and v500_:IsA("Folder") then
            local v501_, v502_, v503_ = ipairs(v500_:GetChildren())
            while true do
                local v504_
                v503_, v504_ = v501_(v502_, v503_)
                if v503_ == nil then
                    break
                end
                if v504_:IsA("Folder") then
                    v504_:Destroy()
                end
            end
            print("Folders in F_Parts have been deleted.")
        else
            warn("F_Parts folder does not exist or is not a folder.")
        end
    end
})
local v505_ = v2_:CreateTab("FemboysHub Teleports", nil)
v505_:CreateSection("Main Teleports")
v505_:CreateButton({
    Name = "Tower",
    Callback = function()
        local v506_ = game.Players.LocalPlayer
        local v507_ = v506_.Character or v506_.CharacterAdded:Wait()
        local v508_ = CFrame.new(- 4513.34766, 149.349609, - 879.456604, - 0.0525398403, 8.26210389e-9, - 0.998618841, - 1.27831257e-7, 1, 1.49990527e-8, 0.998618841, 1.28442736e-7, - 0.0525398403)
        local v509_ = v508_ + Vector3.new(0, 2, 0)
        local v510_ = v508_.Position
        local v511_ = (v509_.Position - v510_).Magnitude
        local v512_ = v511_ > 500 and 9 or (150 < v511_ and 7 or 5)
        local v513_ = 0.01
        local v514_ = v507_.PrimaryPart
        if v514_ then
            local v515_ = tick()
            while tick() - v515_ < v512_ do
                v514_.CFrame = v509_
                wait(v513_)
            end
        else
            warn("PrimaryPart not set for character")
        end
    end
})
v505_:CreateButton({
    Name = "Motel",
    Callback = function()
        local v516_ = game.Players.LocalPlayer
        local v517_ = v516_.Character or v516_.CharacterAdded:Wait()
        local v518_ = CFrame.new(- 4671.03076, 3.29673862, - 905.132507, 0.00827909447, 2.12039741e-9, - 0.999965727, 6.93145878e-8, 1, 2.69435185e-9, 0.999965727, - 6.93345186e-8, 0.00827909447)
        local v519_ = v518_ + Vector3.new(0, 2, 0)
        local v520_ = v518_.Position
        local v521_ = (v519_.Position - v520_).Magnitude
        local v522_ = v521_ > 500 and 9 or (150 < v521_ and 7 or 5)
        local v523_ = 0.01
        local v524_ = v517_.PrimaryPart
        if v524_ then
            local v525_ = tick()
            while tick() - v525_ < v522_ do
                v524_.CFrame = v519_
                wait(v523_)
            end
        else
            warn("PrimaryPart not set for character")
        end
    end
})
v505_:CreateButton({
    Name = "Cafe",
    Callback = function()
        local v526_ = game.Players.LocalPlayer
        local v527_ = v526_.Character or v526_.CharacterAdded:Wait()
        local v528_ = CFrame.new(- 4630.45752, 6.05001259, - 269.560516, 0.0246613994, 4.06907468e-8, - 0.999695837, 8.68120509e-8, 1, 4.2844686e-8, 0.999695837, - 8.78422597e-8, 0.0246613994)
        local v529_ = v528_ + Vector3.new(0, 2, 0)
        local v530_ = v528_.Position
        local v531_ = (v529_.Position - v530_).Magnitude
        local v532_ = v531_ > 500 and 9 or (150 < v531_ and 7 or 5)
        local v533_ = 0.01
        local v534_ = v527_.PrimaryPart
        if v534_ then
            local v535_ = tick()
            while tick() - v535_ < v532_ do
                v534_.CFrame = v529_
                wait(v533_)
            end
        else
            warn("PrimaryPart not set for character")
        end
    end
})
v505_:CreateButton({
    Name = "Illegal Pizza",
    Callback = function()
        local v536_ = game.Players.LocalPlayer
        local v537_ = v536_.Character or v536_.CharacterAdded:Wait()
        local v538_ = CFrame.new(- 4419.31836, 5.19999504, - 124.549927, 0.0327239819, - 3.50398643e-8, - 0.999464452, 1.76940649e-8, 1, - 3.44793101e-8, 0.999464452, - 1.65562888e-8, 0.0327239819)
        local v539_ = v538_ + Vector3.new(0, 2, 0)
        local v540_ = v538_.Position
        local v541_ = (v539_.Position - v540_).Magnitude
        local v542_ = v541_ > 500 and 9 or (150 < v541_ and 7 or 5)
        local v543_ = 0.01
        local v544_ = v537_.PrimaryPart
        if v544_ then
            local v545_ = tick()
            while tick() - v545_ < v542_ do
                v544_.CFrame = v539_
                wait(v543_)
            end
        else
            warn("PrimaryPart not set for character")
        end
    end
})
v505_:CreateButton({
    Name = "JunkYard",
    Callback = function()
        local v546_ = game.Players.LocalPlayer
        local v547_ = v546_.Character or v546_.CharacterAdded:Wait()
        local v548_ = CFrame.new(- 3919.51733, 3.79995584, - 448.998413, 0.0113751534, 1.73916492e-9, - 0.999935329, - 9.92708848e-8, 1, 6.09982898e-10, 0.999935329, 9.92575195e-8, 0.0113751534)
        local v549_ = v547_.PrimaryPart.Position
        local v550_ = (v548_.Position - v549_).Magnitude
        local v551_ = v550_ > 500 and 9 or (150 < v550_ and 7 or 5)
        local v552_ = 0.01
        local v553_ = v547_.PrimaryPart
        if v553_ then
            local v554_ = tick()
            while tick() - v554_ < v551_ do
                v553_.CFrame = v548_
                wait(v552_)
            end
        else
            warn("PrimaryPart not set for character")
        end
    end
})
v505_:CreateButton({
    Name = "Sewer",
    Callback = function()
        local v555_ = game.Players.LocalPlayer
        local v556_ = v555_.Character or v555_.CharacterAdded:Wait()
        local v557_ = CFrame.new(- 4658.19092, - 69.365921, - 871.911499, - 0.0228894278, - 7.16986825e-9, - 0.999737978, - 1.95281991e-9, 1, - 7.12703629e-9, 0.999737978, 1.78917448e-9, - 0.0228894278)
        local v558_ = v557_ + Vector3.new(0, 2, 0)
        local v559_ = v557_.Position
        local v560_ = (v558_.Position - v559_).Magnitude
        local v561_ = v560_ > 500 and 9 or (150 < v560_ and 7 or 5)
        local v562_ = 0.01
        local v563_ = v556_.PrimaryPart
        if v563_ then
            local v564_ = tick()
            while tick() - v564_ < v561_ do
                v563_.CFrame = v558_
                wait(v562_)
            end
        else
            warn("PrimaryPart not set for character")
        end
    end
})
v505_:CreateButton({
    Name = "Vibe Check down",
    Callback = function()
        local v565_ = game.Players.LocalPlayer
        local v566_ = v565_.Character or v565_.CharacterAdded:Wait()
        local v567_ = CFrame.new(- 4780.96729, - 200.964722, - 895.44696, 0.999941528, 6.56086208e-9, 0.0108164698, - 5.23050447e-9, 1, - 1.23021962e-7, - 0.0108164698, 1.22958184e-7, 0.999941528)
        local v568_ = v567_ + Vector3.new(0, 2, 0)
        local v569_ = v567_.Position
        local v570_ = (v568_.Position - v569_).Magnitude
        local v571_ = v570_ > 500 and 9 or (150 < v570_ and 7 or 5)
        local v572_ = 0.01
        local v573_ = v566_.PrimaryPart
        if v573_ then
            local v574_ = tick()
            while tick() - v574_ < v571_ do
                v573_.CFrame = v568_
                wait(v572_)
            end
        else
            warn("PrimaryPart not set for character")
        end
    end
})
v505_:CreateButton({
    Name = "Vibe Check Up",
    Callback = function()
        local v575_ = game.Players.LocalPlayer
        local v576_ = v575_.Character or v575_.CharacterAdded:Wait()
        local v577_ = CFrame.new(- 4776.97803, - 34.7683716, - 788.092468, 0.999498069, - 5.97677996e-8, 0.0316800252, 6.05885475e-8, 1, - 2.49475054e-8, - 0.0316800252, 2.68544298e-8, 0.999498069)
        local v578_ = v577_ + Vector3.new(0, 2, 0)
        local v579_ = v577_.Position
        local v580_ = (v578_.Position - v579_).Magnitude
        local v581_ = v580_ > 500 and 9 or (150 < v580_ and 7 or 5)
        local v582_ = 0.01
        local v583_ = v576_.PrimaryPart
        if v583_ then
            local v584_ = tick()
            while tick() - v584_ < v581_ do
                v583_.CFrame = v578_
                wait(v582_)
            end
        else
            warn("PrimaryPart not set for character")
        end
    end
})
v505_:CreateSection("Misc Teleports")
local v587_, v_u_588_, v_u_589_ = (function()
    local v585_ = game.Players.LocalPlayer
    local v586_ = v585_.Character or v585_.CharacterAdded:Wait()
    return v585_, v586_, v586_:WaitForChild("HumanoidRootPart")
end)()
v587_.CharacterAdded:Connect(function(p590_)
    v_u_588_ = p590_
    v_u_589_ = v_u_588_:WaitForChild("HumanoidRootPart")
end)
local function v_u_601_()
    local v591_ = game.Workspace.Map:FindFirstChild("VendingMachines")
    local v592_ = nil
    local v593_ = math.huge
    if v591_ then
        local v594_, v595_, v596_ = pairs(v591_:GetChildren())
        while true do
            local v597_
            v596_, v597_ = v594_(v595_, v596_)
            if v596_ == nil then
                break
            end
            local v598_ = v597_:FindFirstChild("Parts")
            if v598_ then
                local v599_ = v598_:FindFirstChild("ScreenMesh")
                if v599_ and v599_:IsA("BasePart") then
                    local v600_ = (v_u_589_.Position - v599_.Position).magnitude
                    if v600_ < v593_ then
                        v593_ = v600_
                        v592_ = v599_
                    end
                end
            end
        end
    end
    return v592_
end
local function v_u_607_()
    local v602_ = v_u_601_()
    if v602_ then
        local v603_ = (v_u_589_.Position - v602_.Position).magnitude > 150 and 7 or 5
        local v604_ = tick()
        while tick() - v604_ < v603_ do
            local v605_ = v602_.CFrame.LookVector * 3
            local v606_ = v602_.Position + v605_
            v_u_589_.CFrame = CFrame.new(v606_, v602_.Position)
            wait(0.01)
        end
    else
        warn("No ScreenMesh part found.")
    end
end
v505_:CreateButton({
    Name = "Teleport to Nearest VendingMachine",
    Callback = function()
        v_u_607_()
    end
})
local v_u_608_ = game.Players.LocalPlayer
local function v_u_609_()
    return v_u_608_.Character or v_u_608_.CharacterAdded:Wait()
end
local v_u_610_ = game.Workspace.Map.Shopz
local function v_u_621_(p611_)
    local v612_ = math.huge
    local v613_ = v_u_610_
    local v614_, v615_, v616_ = ipairs(v613_:GetChildren())
    local v617_ = nil
    while true do
        local v618_
        v616_, v618_ = v614_(v615_, v616_)
        if v616_ == nil then
            break
        end
        if v618_:IsA("Model") and (v618_.Name == "ArmoryDealer" or v618_.Name == "Dealer") then
            local v619_ = v618_:FindFirstChild("MainPart")
            if v619_ then
                local v620_ = (p611_.PrimaryPart.Position - v619_.Position).Magnitude
                if v620_ < v612_ then
                    v617_ = v619_
                    v612_ = v620_
                end
            end
        end
    end
    return v617_
end
local function v_u_626_()
    local v622_ = v_u_609_()
    local v623_ = v_u_621_(v622_)
    if v623_ then
        local v624_ = v623_.Position + v623_.CFrame.LookVector * 3
        v622_:SetPrimaryPartCFrame(CFrame.new(v624_, v623_.Position))
        local v625_ = tick()
        while tick() - v625_ < 6 do
            v622_:SetPrimaryPartCFrame(CFrame.new(v624_, v623_.Position))
            wait(0.01)
        end
    else
        warn("No \'MainPart\' found inside \'ArmoryDealer\' or \'Dealer\'.")
    end
end
v505_:CreateButton({
    Name = "Teleport to Nearest Dealer",
    Callback = function()
        v_u_626_()
    end
})
v_u_608_.CharacterAdded:Connect(function()
    if not v_u_608_.Character then
        v_u_608_.CharacterAdded:Wait()
    end
    v_u_626_()
end)
local v629_, v_u_630_, v_u_631_ = (function()
    local v627_ = game.Players.LocalPlayer
    local v628_ = v627_.Character or v627_.CharacterAdded:Wait()
    return v627_, v628_, v628_:WaitForChild("HumanoidRootPart")
end)()
v629_.CharacterAdded:Connect(function(p632_)
    v_u_630_ = p632_
    v_u_631_ = v_u_630_:WaitForChild("HumanoidRootPart")
end)
local v_u_633_ = game.Workspace.Map.BredMakurz
local v_u_634_ = {
    "SmallSafe_SW_11",
    "SmallSafe_FA_34",
    "SmallSafe_C_3",
    "SmallSafe_HO_37",
    "SmallSafe_SU_22",
    "SmallSafe_SU_15",
    "MediumSafe_VC_30",
    "MediumSafe_T_45",
    "SmallSafe_SW_26",
    "MediumSafe_SU_32",
    "MediumSafe_TS_20",
    "MediumSafe_SEW_8",
    "SmallSafe_TO_43",
    "SmallSafe_FA_36",
    "MediumSafe_HO_24",
    "SmallSafe_TO_42",
    "SmallSafe_BD_18",
    "MediumSafe_HO_39",
    "MediumSafe_VC_21",
    "MediumSafe_SEW_2",
    "SmallSafe_M_17",
    "SmallSafe_BD_12",
    "SmallSafe_WH_28",
    "MediumSafe_HO_41",
    "MediumSafe_T_46",
    "SmallSafe_FA_35",
    "MediumSafe_VC_38",
    "MediumSafe_SW_9",
    "MediumSafe_TS_20",
    "SmallSafe_TO_44",
    "Register_TS_27",
    "Register_BS_47",
    "Register_C_1",
    "Register_TS_4",
    "Register_B_10",
    "Register_HO_23",
    "Register_M_31",
    "Register_B_40",
    "Register_GS_16",
    "Register_M_25",
    "Register_P_13",
    "Register_P_14",
    "Register_VI_29",
    "Register_B_7",
    "Register_M_6",
    "Register_M_5",
    "Register_B_19",
    "Register_B_33"
}
local function v_u_646_()
    local v635_ = math.huge
    local v636_ = v_u_633_
    local v637_, v638_, v639_ = pairs(v636_:GetDescendants())
    local v640_ = nil
    while true do
        local v641_
        v639_, v641_ = v637_(v638_, v639_)
        if v639_ == nil then
            break
        end
        if v641_:IsA("Model") and table.find(v_u_634_, v641_.Name) then
            local v642_ = v641_:FindFirstChild("MainPart")
            local v643_ = v641_:FindFirstChild("Values")
            if v642_ and (v642_:IsA("BasePart") and v643_) then
                local v644_ = v643_:FindFirstChild("Broken")
                if v644_ and (v644_:IsA("BoolValue") and not v644_.Value) then
                    local v645_ = (v_u_631_.Position - v642_.Position).magnitude
                    if v645_ < v635_ then
                        v640_ = v642_
                        v635_ = v645_
                    end
                end
            end
        end
    end
    return v640_
end
local function v_u_652_()
    local v647_ = v_u_646_()
    if v647_ then
        local v648_ = (v_u_631_.Position - v647_.Position).magnitude > 150 and 7 or 5
        local v649_ = tick()
        while tick() - v649_ < v648_ do
            local v650_ = v647_.CFrame.LookVector * 3
            local v651_ = v647_.Position + v650_
            v_u_631_.CFrame = CFrame.new(v651_, v647_.Position)
            wait(0.01)
        end
    else
        warn("No usable safe found or all are broken.")
    end
end
v505_:CreateButton({
    Name = "Teleport to Nearest Safe/Register",
    Callback = function()
        v_u_652_()
    end
})
local function v_u_672_()
    local v653_ = game:GetService("Players")
    local v654_ = game:GetService("Workspace")
    local v655_ = v653_.LocalPlayer
    local v_u_656_ = (v655_.Character or v655_.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
    local v_u_657_ = v654_:WaitForChild("Map"):WaitForChild("ATMz"):WaitForChild("ATM"):WaitForChild("Parts"):WaitForChild("Main")
    local v666_ = (function()
        local v658_ = math.huge
        local v659_ = v_u_657_
        local v660_, v661_, v662_ = ipairs(v659_:GetChildren())
        local v663_ = nil
        while true do
            local v664_
            v662_, v664_ = v660_(v661_, v662_)
            if v662_ == nil then
                break
            end
            if v664_:IsA("BasePart") and v664_.Name == "atm" then
                local v665_ = (v_u_656_.Position - v664_.Position).Magnitude
                if v665_ < v658_ then
                    v663_ = v664_
                    v658_ = v665_
                end
            end
        end
        return v663_
    end)()
    if v666_ then
        local v667_ = v666_.CFrame
        local v668_ = v667_.Position + v667_.LookVector * - 3
        print("ATM Position:", v667_.Position)
        print("LookVector:", v667_.LookVector)
        print("New Position:", v668_)
        local v669_ = (v668_ - v_u_656_.Position).Magnitude > 200 and 7 or 5
        v_u_656_.CFrame = CFrame.new(v668_, v667_.Position)
        local v670_ = tick()
        local v671_ = v_u_656_
        while tick() - v670_ < v669_ do
            v671_.CFrame = CFrame.new(v668_, v667_.Position)
            wait(0.1)
        end
    else
        warn("No \'atm\' found inside \'Main\'.")
    end
end
local v_u_673_ = 30
local v_u_674_ = false
v505_:CreateButton({
    Name = "Teleport to ATM",
    Callback = function()
        if not v_u_674_ then
            v_u_672_()
            v_u_674_ = true
            local v_u_675_ = tick() + v_u_673_
            spawn(function()
                while tick() < v_u_675_ do
                    wait(1)
                end
                v_u_674_ = false
            end)
        end
    end
})
v505_:CreateSection("Temporary Teleports")
local v_u_676_ = game.Players.LocalPlayer
local function v_u_677_()
    return v_u_676_.Character or v_u_676_.CharacterAdded:Wait()
end
local v_u_678_ = game.Workspace.Map.Shopz
local function v_u_684_(_)
    local v679_ = v_u_678_
    local v680_, v681_, v682_ = ipairs(v679_:GetChildren())
    while true do
        local v683_
        v682_, v683_ = v680_(v681_, v682_)
        if v682_ == nil then
            break
        end
        if v683_:IsA("Model") and v683_.Name == "RebelDealer" then
            return v683_:FindFirstChild("MainPart")
        end
    end
    return nil
end
local function v_u_689_()
    local v685_ = v_u_677_()
    local v686_ = v_u_684_(v685_)
    if v686_ then
        local v687_ = v686_.Position + v686_.CFrame.LookVector * 3
        v685_:SetPrimaryPartCFrame(CFrame.new(v687_, v686_.Position))
        local v688_ = tick()
        while tick() - v688_ < 4 do
            v685_:SetPrimaryPartCFrame(CFrame.new(v687_, v686_.Position))
            wait(0.01)
        end
    else
        v_u_1_:Notify({
            Title = "RebelDealer Not Found",
            Content = "No \'RebelDealer\' found inside \'shopz\'.",
            Duration = 6.5,
            Image = 4483362458,
            Actions = {
                Ignore = {
                    Name = "Okay!",
                    Callback = function()
                        print("The user tapped Okay!")
                    end
                }
            }
        })
    end
end
v505_:CreateButton({
    Name = "Teleport to RebelDealer",
    Callback = function()
        v_u_689_()
    end
})
v_u_676_.CharacterAdded:Connect(function()
    if not v_u_676_.Character then
        v_u_676_.CharacterAdded:Wait()
    end
    v_u_689_()
end)
local v_u_690_ = game.Players.LocalPlayer
local function v_u_691_()
    return v_u_690_.Character or v_u_690_.CharacterAdded:Wait()
end
local v_u_692_ = game.Workspace.Map.MysteryBoxes:FindFirstChild("MysteryBox")
local function v_u_693_(_)
    if v_u_692_ then
        return v_u_692_:FindFirstChild("MainPart")
    else
        return nil
    end
end
local function v_u_698_()
    local v694_ = v_u_691_()
    local v695_ = v_u_693_(v694_)
    if v695_ then
        local v696_ = v695_.Position + v695_.CFrame.LookVector * 3
        v694_:SetPrimaryPartCFrame(CFrame.new(v696_, v695_.Position))
        local v697_ = tick()
        while tick() - v697_ < 4 do
            v694_:SetPrimaryPartCFrame(CFrame.new(v696_, v695_.Position))
            wait(0.01)
        end
    else
        v_u_1_:Notify({
            Title = "MysteryBox Not Found",
            Content = "No \'MysteryBox\' found inside \'MysteryBoxes\'.",
            Duration = 6.5,
            Image = 4483362458,
            Actions = {
                Ignore = {
                    Name = "Okay!",
                    Callback = function()
                        print("The user tapped Okay!")
                    end
                }
            }
        })
    end
end
v505_:CreateButton({
    Name = "Teleport to MysteryBox",
    Callback = function()
        v_u_698_()
    end
})
v_u_690_.CharacterAdded:Connect(function()
    if not v_u_690_.Character then
        v_u_690_.CharacterAdded:Wait()
    end
    v_u_698_()
end)
local v_u_699_ = game.Players.LocalPlayer
local function v_u_700_()
    return v_u_699_.Character or v_u_699_.CharacterAdded:Wait()
end
local function v_u_715_()
    local v701_ = game.Workspace.Filter.SpawnedBread
    local v702_ = v_u_700_().HumanoidRootPart.Position
    local v703_, v704_, v705_ = pairs(v701_:GetChildren())
    local v706_ = {}
    while true do
        local v707_
        v705_, v707_ = v703_(v704_, v705_)
        if v705_ == nil then
            break
        end
        if v707_:IsA("MeshPart") then
            table.insert(v706_, v707_)
        end
    end
    if # v706_ <= 0 then
        return nil
    end
    local v708_ = math.huge
    local v709_, v710_, v711_ = pairs(v706_)
    local v712_ = nil
    while true do
        local v713_
        v711_, v713_ = v709_(v710_, v711_)
        if v711_ == nil then
            break
        end
        local v714_ = (v713_.Position - v702_).magnitude
        if v714_ < v708_ then
            v712_ = v713_
            v708_ = v714_
        end
    end
    return v712_
end
local function v_u_720_()
    local v716_ = v_u_700_()
    local v717_ = v_u_715_()
    if v717_ then
        local v718_ = v717_.Position + v717_.CFrame.LookVector * 5 + Vector3.new(0, 5, 0)
        v716_:SetPrimaryPartCFrame(CFrame.new(v718_, v718_ + v717_.CFrame.LookVector))
        local v719_ = tick()
        while tick() - v719_ < 5 do
            v716_:SetPrimaryPartCFrame(CFrame.new(v718_, v718_ + v717_.CFrame.LookVector))
            wait(0.01)
        end
    else
        v_u_1_:Notify({
            Title = "No Cash Found",
            Content = "No Cash found in game.",
            Duration = 6.5,
            Image = 4483362458,
            Actions = {
                Ignore = {
                    Name = "Okay!",
                    Callback = function()
                        print("The user tapped Okay!")
                    end
                }
            }
        })
    end
end
v505_:CreateButton({
    Name = "Spawn to dropped Cash",
    Callback = function()
        v_u_720_()
    end
})
v_u_699_.CharacterAdded:Connect(function()
    if not v_u_699_.Character then
        v_u_699_.CharacterAdded:Wait()
    end
    v_u_720_()
end)
local v721_ = v2_:CreateTab("Boost", nil)
v721_:CreateSection("Thanks so much for boosting")
v721_:CreateSection("Booster stuff")
v721_:CreateButton({
    Name = "Click Teleport (Q)",
    Callback = function()
        plr = game.Players.LocalPlayer
        hum = plr.Character.HumanoidRootPart
        mouse = plr:GetMouse()
        mouse.KeyDown:connect(function(p722_)
            if p722_ == "q" and mouse.Target then
                hum.CFrame = CFrame.new(mouse.Hit.x, mouse.Hit.y + 5, mouse.Hit.z)
            end
        end)
    end
})
v721_:CreateButton({
    Name = "Fullbright",
    Callback = function()
        pcall(function()
            local v_u_723_ = game:GetService("Lighting")
            v_u_723_.Ambient = Color3.fromRGB(255, 255, 255)
            v_u_723_.Brightness = 1
            v_u_723_.FogEnd = 10000000000
            local v724_, v725_, v726_ = pairs(v_u_723_:GetDescendants())
            while true do
                local v727_
                v726_, v727_ = v724_(v725_, v726_)
                if v726_ == nil then
                    break
                end
                if v727_:IsA("BloomEffect") or (v727_:IsA("BlurEffect") or (v727_:IsA("ColorCorrectionEffect") or v727_:IsA("SunRaysEffect"))) then
                    v727_.Enabled = false
                end
            end
            v_u_723_.Changed:Connect(function()
                v_u_723_.Ambient = Color3.fromRGB(255, 255, 255)
                v_u_723_.Brightness = 1
                v_u_723_.FogEnd = 10000000000
            end)
            spawn(function()
                local v728_ = game:GetService("Players").LocalPlayer.Character
                while wait() do
                    repeat
                        wait()
                    until v728_ ~= nil
                    if not v728_.HumanoidRootPart:FindFirstChildWhichIsA("PointLight") then
                        local v729_ = Instance.new("PointLight", v728_.HumanoidRootPart)
                        v729_.Brightness = 1
                        v729_.Range = 60
                    end
                end
            end)
        end)
    end
})
v721_:CreateButton({
    Name = "Auto Lockpick",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Iceyze/crim-autolockpick/main/main.lua"))()
    end
})
v721_:CreateButton({
    Name = "AFK ATM Farm (Closes current UI)",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/ZBSqZcrm"))()
    end
})
