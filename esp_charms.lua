-- ============================================================
-- SERVICES
-- ============================================================
local Players           = game:GetService("Players")
local RunService        = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui           = game:GetService("CoreGui")

local localPlayer = Players.LocalPlayer

--[[
local skillRemote = ReplicatedStorage
    :WaitForChild("Remotes")
    :WaitForChild("Generator")
    :WaitForChild("SkillCheckResultEvent")

local mt         = getrawmetatable(game)
local oldNamecall = mt.__namecall

setreadonly(mt, false)
mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    -- Intercept FireServer di remote skill check
    if method == "FireServer" and self == skillRemote then
        local firstArg = select(1, ...)
        if firstArg == "fail" then
            warn("[Hook] Blocked SkillCheck fail")
            return  -- buang, jangan kirim ke server
        end
    end
    return oldNamecall(self, ...)
end)
setreadonly(mt, true)

warn("[Hook] SkillCheck fail blocker active")
]]
local targetSpeed = 18
local storedSpeed = 16
local isLocked    = false

local speedThrottle  = 0
local SPEED_INTERVAL = 0.15  -- lebih lambat dari sebelumnya, biar ga trip anti-cheat

local reapplyDebounce = false  -- biar ga langsung counter tiap frame

local gui = Instance.new("ScreenGui")
gui.Name         = "SpeedSystem_Core"
gui.ResetOnSpawn = false
gui.Parent       = (gethui and gethui()) or CoreGui

local f = Instance.new("Frame")
f.Size                   = UDim2.new(0, 110, 0, 82)
f.Position               = UDim2.new(0.5, -55, 0.4, -41)
f.BackgroundColor3       = Color3.fromRGB(15, 15, 15)
f.BackgroundTransparency = 0.15
f.Active                 = true
f.Draggable              = true
f.Parent                 = gui

Instance.new("UICorner", f).CornerRadius = UDim.new(0, 7)

local stroke = Instance.new("UIStroke", f)
stroke.Color        = Color3.fromRGB(0, 140, 210)
stroke.Thickness    = 1
stroke.Transparency = 0.5

local handle = Instance.new("Frame")
handle.Size             = UDim2.new(1, 0, 0, 17)
handle.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
handle.Parent           = f
Instance.new("UICorner", handle).CornerRadius = UDim.new(0, 7)

local title = Instance.new("TextLabel")
title.Size                   = UDim2.new(1, 0, 1, 0)
title.BackgroundTransparency = 1
title.Text                   = "CORE SPEED"
title.TextColor3             = Color3.fromRGB(0, 170, 255)
title.TextSize               = 8
title.Font                   = Enum.Font.SourceSansBold
title.Parent                 = handle

local speedLabel = Instance.new("TextLabel")
speedLabel.Size                   = UDim2.new(1, 0, 0, 28)
speedLabel.Position               = UDim2.new(0, 0, 0.22, 0)
speedLabel.BackgroundTransparency = 1
speedLabel.Text                   = tostring(targetSpeed)
speedLabel.TextColor3             = Color3.fromRGB(0, 200, 255)
speedLabel.TextSize               = 20
speedLabel.Font                   = Enum.Font.SourceSansBold
speedLabel.Parent                 = f

local controls = Instance.new("Frame")
controls.Size                   = UDim2.new(1, -10, 0, 20)
controls.Position               = UDim2.new(0, 5, 0.68, 0)
controls.BackgroundTransparency = 1
controls.Parent                 = f

local function createBtn(text, pos, sizeX, color)
    local btn = Instance.new("TextButton")
    btn.Size             = UDim2.new(sizeX, -3, 1, 0)
    btn.Position         = pos
    btn.BackgroundColor3 = color or Color3.fromRGB(35, 35, 35)
    btn.Text             = text
    btn.TextColor3       = Color3.fromRGB(255, 255, 255)
    btn.TextSize         = 11
    btn.Font             = Enum.Font.SourceSansBold
    btn.Parent           = controls
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)
    return btn
end

-- Minus dibikin disabled (abu-abu, ga bisa diklik)
local minusBtn = createBtn("-",   UDim2.new(0,    0, 0, 0), 0.25, Color3.fromRGB(50, 50, 50))
local lockBtn  = createBtn("OFF", UDim2.new(0.25, 3, 0, 0), 0.5, Color3.fromRGB(120, 35, 35))
local plusBtn  = createBtn("+",   UDim2.new(0.75, 3, 0, 0), 0.25)

minusBtn.TextColor3 = Color3.fromRGB(80, 80, 80)  -- teks redup, keliatan disabled
-- minus tidak connect ke apapun → gabisa turun

plusBtn.MouseButton1Click:Connect(function()
    targetSpeed = targetSpeed + 1
    speedLabel.Text = tostring(targetSpeed)
    -- Kalau lagi locked, langsung apply naiknya
    if isLocked then
        local char = localPlayer.Character
        local hum  = char and char:FindFirstChildOfClass("Humanoid")
        if hum and isSpeedBoostNormal() then
            hum.WalkSpeed = targetSpeed
        end
    end
end)

local function isSpeedBoostNormal()
    local char = localPlayer.Character
    if not char then return false end
    local val = char:GetAttribute("speedboost")
    if val == nil then return true end
    return val == 1
end

local function lockSkillCheckSpeed(char)
    char:SetAttribute("skillcheckspeed", 1.8)
    char:GetAttributeChangedSignal("skillcheckspeed"):Connect(function()
        if char:GetAttribute("skillcheckspeed") ~= 1.8 then
            char:SetAttribute("skillcheckspeed", 1.8)
        end
    end)
end

if localPlayer.Character then task.spawn(lockSkillCheckSpeed, localPlayer.Character) end
localPlayer.CharacterAdded:Connect(lockSkillCheckSpeed)

local walkSpeedConn = nil
local boostAttrConn = nil

local function applySpeedIfAllowed(hum)
    if not isLocked then return end
    if isSpeedBoostNormal() then
        if hum and hum.WalkSpeed ~= targetSpeed then
            hum.WalkSpeed = targetSpeed
        end
    end
end

local function hookHumanoid(char)
    if walkSpeedConn then walkSpeedConn:Disconnect(); walkSpeedConn = nil end
    if boostAttrConn then boostAttrConn:Disconnect(); boostAttrConn = nil end

    local hum = char:WaitForChild("Humanoid")
    applySpeedIfAllowed(hum)

    walkSpeedConn = hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
        if not isLocked then return end
        if not isSpeedBoostNormal() then return end  -- lagi boost, skip

        local newSpeed = hum.WalkSpeed
        if newSpeed < targetSpeed and not reapplyDebounce then
            reapplyDebounce = true
            task.delay(0.2, function()
                if isLocked and isSpeedBoostNormal() then
                    local h = localPlayer.Character and localPlayer.Character:FindFirstChildOfClass("Humanoid")
                    if h and h.Health > 0 then h.WalkSpeed = targetSpeed end
                end
                reapplyDebounce = false
            end)
        end
        -- speed naik? biarkan aja, ga sync targetSpeed
    end)

    -- Key change: pantau speedboost attribute
    boostAttrConn = char:GetAttributeChangedSignal("speedboost"):Connect(function()
        if not isLocked then return end

        if not isSpeedBoostNormal() then
            -- Game lagi kasih boost → disable sementara, kembalikan speed normal dulu
            reapplyDebounce = true  -- block heartbeat juga
            local h = char:FindFirstChildOfClass("Humanoid")
            if h then h.WalkSpeed = storedSpeed end  -- lepas ke speed asli biar ga conflict
        else
            -- Game udah balikin → re-enable dan apply target lagi
            task.wait(0.15)  -- tunggu game settle dulu
            reapplyDebounce = false
            local h = char:FindFirstChildOfClass("Humanoid")
            if h and h.Health > 0 then h.WalkSpeed = targetSpeed end
        end
    end)
end
lockBtn.MouseButton1Click:Connect(function()
    isLocked = not isLocked
    local char = localPlayer.Character
    local hum  = char and char:FindFirstChildOfClass("Humanoid")

    if isLocked then
        storedSpeed              = hum and hum.WalkSpeed or storedSpeed
        lockBtn.Text             = "ON"
        lockBtn.BackgroundColor3 = Color3.fromRGB(35, 120, 35)
        applySpeedIfAllowed(hum)
    else
        lockBtn.Text             = "OFF"
        lockBtn.BackgroundColor3 = Color3.fromRGB(120, 35, 35)
        if hum and isSpeedBoostNormal() then
            hum.WalkSpeed = storedSpeed
        end
    end
end)

if localPlayer.Character then task.spawn(hookHumanoid, localPlayer.Character) end
localPlayer.CharacterAdded:Connect(hookHumanoid)

-- Heartbeat safety net — interval lebih jarang, biar ga spam property changes
RunService.Heartbeat:Connect(function(dt)
    speedThrottle = speedThrottle + dt
    if speedThrottle < SPEED_INTERVAL then return end
    speedThrottle = 0

    if not isLocked then return end
    if not isSpeedBoostNormal() then return end
    if reapplyDebounce then return end  -- lagi nunggu delay, skip

    local char = localPlayer.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum and hum.Health > 0 and hum.WalkSpeed < targetSpeed then
        -- hanya counter kalau speed TURUN di bawah target
        hum.WalkSpeed = targetSpeed
    end
end)


--[[


local GEN_PREFIX     = "Gen_"
local generatorCache = {}
local gensFolder     = nil
local folderConn     = nil
local renameCooldown = false

-- Cari folder di bawah Map yang isinya ada instance bernama "Generator"
local function findGensFolder(map)
    if not map then return nil end
    for _, child in ipairs(map:GetChildren()) do
        -- Cek apakah folder ini berisi "Generator"
        if child:FindFirstChild("Generator") then
            return child
        end
    end
    return nil
end

local function isRawGenerator(obj)
    -- Nama asli game sebelum rename
    return (obj.Name == "Generator" or obj.Name:match("^" .. GEN_PREFIX))
        and not obj.Name:match("^GeneratorPoint")
end

local function refreshGeneratorNames()
    if renameCooldown then return end
    renameCooldown = true

    local valid = {}
    for _, obj in ipairs(generatorCache) do
        if obj and obj.Parent then table.insert(valid, obj) end
    end
    generatorCache = valid

    for i, obj in ipairs(generatorCache) do
        obj.Name = GEN_PREFIX .. i
    end

    warn("[GenIndex] Renamed", #generatorCache, "generators")
    task.delay(0.3, function() renameCooldown = false end)
end

local function rebuildGeneratorCache()
    generatorCache = {}
    if not gensFolder then return end
    for _, obj in ipairs(gensFolder:GetChildren()) do
        if isRawGenerator(obj) then
            table.insert(generatorCache, obj)
        end
    end
    -- Rename dulu sebelum cache dipakai
    refreshGeneratorNames()
end

local function hookFolder()
    if folderConn then folderConn:Disconnect(); folderConn = nil end
    if not gensFolder then return end
    folderConn = gensFolder.ChildAdded:Connect(function(child)
        task.wait(0.2)
        if child and child.Parent and isRawGenerator(child) then
            table.insert(generatorCache, child)
            refreshGeneratorNames()
        end
    end)
end

local function initGenerators(map)
    gensFolder = findGensFolder(map)
    if not gensFolder then
        warn("[GenIndex] Folder generator tidak ditemukan!")
        return
    end
    warn("[GenIndex] Folder:", gensFolder:GetFullName())
    rebuildGeneratorCache()
    hookFolder()
end

task.spawn(function()
    local map = workspace:WaitForChild("Map", 30)
    if map then initGenerators(map) end
end)

workspace.ChildAdded:Connect(function(child)
    if child.Name == "Map" then
        task.wait(0.5)
        initGenerators(child)
    end
end)

workspace.DescendantRemoving:Connect(function(desc)
    if desc.Name:match("^" .. GEN_PREFIX) then
        for i, obj in ipairs(generatorCache) do
            if obj == desc then
                table.remove(generatorCache, i)
                break
            end
        end
        task.delay(0.1, refreshGeneratorNames)
    end
end)


-- ============================================================
-- BAGIAN 3: AUTO SKILL CHECK
-- ============================================================
local function getClosestGeneratorAndPoint()
    local char = localPlayer.Character
    if not char then return nil, nil end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil, nil end

    local closestGen   = nil
    local closestPoint = nil
    local minGenDist   = 5

    for _, obj in ipairs(generatorCache) do
        if obj and obj.Parent then
            local part = obj:IsA("Model")
                and (obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart"))
                or (obj:IsA("BasePart") and obj)
            if part then
                local dist = (hrp.Position - part.Position).Magnitude
                if dist < minGenDist then
                    minGenDist = dist
                    closestGen = obj
                end
            end
        end
    end

    if not closestGen then return nil, nil end

    local minPointDist = 5
    for i = 1, 4 do
        pcall(function()
            local point = closestGen:FindFirstChild("GeneratorPoint" .. i)
            if point and point:IsA("BasePart") then
                local dist = (hrp.Position - point.Position).Magnitude
                if dist < minPointDist then
                    minPointDist = dist
                    closestPoint = point
                end
            end
        end)
    end

    return closestGen, closestPoint
end

local skillCooldown  = false
local SKILL_INTERVAL = 0.3

RunService.Heartbeat:Connect(function()
    if skillCooldown then return end
    pcall(function()
        local skillGui = localPlayer.PlayerGui:FindFirstChild("SkillCheckPromptGui")
        if not skillGui then return end
        local checkFrame = skillGui:FindFirstChild("Check")
        if not (checkFrame and checkFrame.Visible) then return end

        local targetGen, targetPoint = getClosestGeneratorAndPoint()
        if not (targetGen and targetPoint) then return end

        skillCooldown = true
        skillRemote:FireServer("success", 1, targetGen, targetPoint)
        warn("[SkillCheck] Fired →", targetGen.Name, targetPoint.Name)

        task.delay(SKILL_INTERVAL, function() skillCooldown = false end)
    end)
end),]]


local Players    = game:GetService("Players")
local RunService = game:GetService("RunService")
local localPlayer = Players.LocalPlayer

local hookData = {}

local function isKiller()
    local team = localPlayer.Team
    if not team then return false end
    return team.Name == "Killer"
end

local function applyLabel(model)
    if model:FindFirstChild("ScourgeHookESP") then return end

    local part = model:FindFirstChildWhichIsA("BasePart")
    if not part then return end

    local bb = Instance.new("BillboardGui")
    bb.Name             = "ScourgeHookESP"
    bb.Size             = UDim2.new(0, 60, 0, 20)
    bb.StudsOffset      = Vector3.new(0, 2.5, 0)
    bb.AlwaysOnTop      = true
    bb.LightInfluence   = 0
    bb.Adornee          = part
    bb.Parent           = model

    local lbl = Instance.new("TextLabel", bb)
    lbl.Size                   = UDim2.new(1, 0, 1, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text                   = "cursed"
    lbl.TextColor3             = Color3.fromRGB(255, 80, 80)
    lbl.TextSize               = 11
    lbl.Font                   = Enum.Font.GothamBold
    lbl.TextStrokeTransparency = 0.4
    lbl.TextStrokeColor3       = Color3.fromRGB(0, 0, 0)

    return bb
end

local function hasScourgeHookAttr(model)
    local ok, attrs = pcall(function() return model:GetAttributes() end)
    if not ok then return false end
    for k in pairs(attrs) do
        if k:find("ScourgeHook") then return true end
    end
    return false
end

local function detachHook(model)
    local data = hookData[model]
    if not data then return end
    for _, c in ipairs(data.conns) do pcall(function() c:Disconnect() end) end
    pcall(function()
        local bb = model:FindFirstChild("ScourgeHookESP")
        if bb then bb:Destroy() end
    end)
    hookData[model] = nil
end

local function processHookModel(model)
    if hookData[model] then return end
    if not isKiller() then return end
    if not hasScourgeHookAttr(model) then return end

    warn("[ScourgeHook] Found:", model:GetFullName())

    local bb = applyLabel(model)
    local conns = {}

    table.insert(conns, model.AncestryChanged:Connect(function()
        if not model.Parent then
            detachHook(model)
            warn("[ScourgeHook] Removed:", model.Name)
        end
    end))

    hookData[model] = { bb = bb, conns = conns }
end

local function detachAll()
    for model in pairs(hookData) do
        detachHook(model)
    end
end

local function scanMap()
    if not isKiller() then return end
    local map = workspace:FindFirstChild("Map")
    if not map then return end
    for _, obj in ipairs(map:GetDescendants()) do
        if obj.Name == "Hook" and (obj:IsA("Model") or obj:IsA("BasePart")) then
            task.spawn(processHookModel, obj)
        end
    end
end

task.spawn(function()
    workspace:WaitForChild("Map", 30)
    scanMap()
end)

workspace.DescendantAdded:Connect(function(desc)
    if desc.Name == "Map" then
        task.delay(1, scanMap)
        return
    end
    if desc.Name == "Hook" and (desc:IsA("Model") or desc:IsA("BasePart")) then
        task.delay(0.5, function()
            if desc and desc.Parent then
                processHookModel(desc)
            end
        end)
    end
end)

localPlayer:GetPropertyChangedSignal("Team"):Connect(function()
    task.wait(0.1)
    if isKiller() then
        scanMap()
    else
        detachAll()
    end
end)

local syncThrottle = 0
RunService.Heartbeat:Connect(function(dt)
    syncThrottle = syncThrottle + dt
    if syncThrottle < 2 then return end
    syncThrottle = 0

    if not isKiller() then return end

    for model in pairs(hookData) do
        if model and model.Parent then
            if not model:FindFirstChild("ScourgeHookESP") then
                applyLabel(model)
            end
        end
    end
end)

warn("[ScourgeHook] ESP active — waiting for Killer team")

-- ============================================================
-- BAGIAN 4: VAULT SPEED
-- ============================================================
local VAULT_SPEED = 1.3

local function setVaultSpeed(char)
    if not char then return end
    if char:GetAttribute("vaultspeed") ~= VAULT_SPEED then
        char:SetAttribute("vaultspeed", VAULT_SPEED)
    end
end

local function hookVault(char)
    setVaultSpeed(char)
    char:GetAttributeChangedSignal("vaultspeed"):Connect(function()
        setVaultSpeed(char)
    end)
end

if localPlayer.Character then task.spawn(hookVault, localPlayer.Character) end
localPlayer.CharacterAdded:Connect(function(char)
    task.wait(0.5); hookVault(char)
end)

print("[CORE] Speed | SkillCheck | VaultSpeed (" .. VAULT_SPEED .. ") | Generator Indexer — Active")


-- ============================================================
-- ESP / CHARMS
-- ============================================================
local ESP_ENABLED          = true
local OUTLINE_TRANSPARENCY = 0
local DEFAULT_COLOR        = Color3.fromRGB(255, 255, 255)
local SELF_OUTLINE         = false
local esp                  = {}

local function getTeamColor(player)
    return player.Team and player.TeamColor.Color or DEFAULT_COLOR
end

local function createCharHighlight(char, color)
    local old = char:FindFirstChildOfClass("Highlight")
    if old then old:Destroy() end
    local hl = Instance.new("Highlight")
    hl.FillTransparency    = 1
    hl.OutlineTransparency = OUTLINE_TRANSPARENCY
    hl.OutlineColor        = color
    hl.Adornee             = char
    hl.DepthMode           = Enum.HighlightDepthMode.AlwaysOnTop
    hl.Parent              = char
    return hl
end

local function attachESP(player)
    if player == localPlayer and not SELF_OUTLINE then return end
    if esp[player] then return end
    esp[player] = {}

    local function applyToChar(char)
        if esp[player] and esp[player].highlight then
            pcall(function() esp[player].highlight:Destroy() end)
            esp[player].highlight = nil
        end
        if not char or not ESP_ENABLED then return end
        esp[player].highlight = createCharHighlight(char, getTeamColor(player))
    end

    if player.Character then task.spawn(applyToChar, player.Character) end

    esp[player].charConn = player.CharacterAdded:Connect(function(char)
        task.wait(0.1); applyToChar(char)
    end)
    esp[player].teamConn = player:GetPropertyChangedSignal("Team"):Connect(function()
        task.wait(0.05)
        if player.Character then applyToChar(player.Character) end
    end)
    esp[player].teamColorConn = player:GetPropertyChangedSignal("TeamColor"):Connect(function()
        if player.Character then applyToChar(player.Character) end
    end)
end

local function detachESP(player)
    local data = esp[player]
    if not data then return end
    if data.charConn      then data.charConn:Disconnect()      end
    if data.teamConn      then data.teamConn:Disconnect()      end
    if data.teamColorConn then data.teamColorConn:Disconnect() end
    pcall(function()
        if player.Character then
            local hl = player.Character:FindFirstChildOfClass("Highlight")
            if hl then hl:Destroy() end
        end
    end)
    pcall(function() if data.highlight then data.highlight:Destroy() end end)
    esp[player] = nil
end

for _, p in ipairs(Players:GetPlayers()) do
    if p ~= localPlayer or SELF_OUTLINE then task.spawn(attachESP, p) end
end
Players.PlayerAdded:Connect(attachESP)
Players.PlayerRemoving:Connect(detachESP)

local syncThrottle = 0
RunService.Heartbeat:Connect(function(dt)
    syncThrottle = syncThrottle + dt
    if syncThrottle < 1.0 then return end
    syncThrottle = 0
    if not ESP_ENABLED then return end
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= localPlayer or SELF_OUTLINE then
            local char = player.Character
            if char then
                local hl = char:FindFirstChildOfClass("Highlight")
                local expected = getTeamColor(player)
                if not hl or hl.OutlineColor ~= expected then
                    pcall(function()
                        local data = esp[player]
                        if not data then attachESP(player); return end
                        data.highlight = createCharHighlight(char, expected)
                    end)
                end
            end
        end
    end
end)

local ESP = {}
function ESP:Toggle(state)
    ESP_ENABLED = (state == nil) and (not ESP_ENABLED) or state
    if not ESP_ENABLED then
        for _, p in ipairs(Players:GetPlayers()) do
            pcall(function()
                if p.Character then
                    local hl = p.Character:FindFirstChildOfClass("Highlight")
                    if hl then hl:Destroy() end
                end
            end)
        end
    else
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= localPlayer or SELF_OUTLINE then
                if p.Character then pcall(createCharHighlight, p.Character, getTeamColor(p)) end
            end
        end
    end
    return ESP_ENABLED
end

print("[ESP] Charms active — team-colored outlines ON")
return ESP
