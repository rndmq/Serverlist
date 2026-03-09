
-- ============================================================
-- SERVICES
-- ============================================================
local Players           = game:GetService("Players")
local RunService        = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui           = game:GetService("CoreGui")

local localPlayer = Players.LocalPlayer

-- ============================================================
-- BAGIAN 1: SPEED GUI & LOCK
-- ============================================================
local targetSpeed = 18
local storedSpeed = 16
local isLocked    = false

-- FIX frame drop: throttle speed enforcement, bukan tiap frame
local speedThrottle = 0
local SPEED_INTERVAL = 0.05 -- enforce tiap 50ms, bukan tiap frame

local gui = Instance.new("ScreenGui")
gui.Name         = "SpeedSystem_Core"
gui.ResetOnSpawn = false
gui.Parent       = (gethui and gethui()) or CoreGui

-- UI lebih kecil
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
stroke.Color       = Color3.fromRGB(0, 140, 210)
stroke.Thickness   = 1
stroke.Transparency = 0.5

local handle = Instance.new("Frame")
handle.Size             = UDim2.new(1, 0, 0, 17)
handle.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
handle.Parent           = f
Instance.new("UICorner", handle).CornerRadius = UDim.new(0, 7)

local title = Instance.new("TextLabel")
title.Size                = UDim2.new(1, 0, 1, 0)
title.BackgroundTransparency = 1
title.Text                = "CORE SPEED"
title.TextColor3          = Color3.fromRGB(0, 170, 255)
title.TextSize            = 8
title.Font                = Enum.Font.SourceSansBold
title.Parent              = handle

local speedLabel = Instance.new("TextLabel")
speedLabel.Size                  = UDim2.new(1, 0, 0, 28)
speedLabel.Position              = UDim2.new(0, 0, 0.22, 0)
speedLabel.BackgroundTransparency = 1
speedLabel.Text                  = tostring(targetSpeed)
speedLabel.TextColor3            = Color3.fromRGB(0, 200, 255)
speedLabel.TextSize              = 20
speedLabel.Font                  = Enum.Font.SourceSansBold
speedLabel.Parent                = f

local controls = Instance.new("Frame")
controls.Size               = UDim2.new(1, -10, 0, 20)
controls.Position           = UDim2.new(0, 5, 0.68, 0)
controls.BackgroundTransparency = 1
controls.Parent             = f

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

local minusBtn = createBtn("-",   UDim2.new(0,    0, 0, 0), 0.25)
local lockBtn  = createBtn("OFF", UDim2.new(0.25, 3, 0, 0), 0.5, Color3.fromRGB(120, 35, 35))
local plusBtn  = createBtn("+",   UDim2.new(0.75, 3, 0, 0), 0.25)

minusBtn.MouseButton1Click:Connect(function()
    targetSpeed = math.max(0, targetSpeed - 1)
    speedLabel.Text = tostring(targetSpeed)
end)

plusBtn.MouseButton1Click:Connect(function()
    targetSpeed = targetSpeed + 1
    speedLabel.Text = tostring(targetSpeed)
end)

lockBtn.MouseButton1Click:Connect(function()
    isLocked = not isLocked
    local hum = localPlayer.Character and localPlayer.Character:FindFirstChildOfClass("Humanoid")
    if isLocked then
        storedSpeed              = hum and hum.WalkSpeed or storedSpeed
        lockBtn.Text             = "ON"
        lockBtn.BackgroundColor3 = Color3.fromRGB(35, 120, 35)
    else
        lockBtn.Text             = "OFF"
        lockBtn.BackgroundColor3 = Color3.fromRGB(120, 35, 35)
        if hum then hum.WalkSpeed = storedSpeed end
    end
end)

-- FIX speed override: pasang listener di Humanoid.WalkSpeed changed
-- sehingga LANGSUNG counter saat game coba override, bukan nunggu frame berikut
local walkSpeedConn = nil

local function hookHumanoid(char)
    if walkSpeedConn then
        walkSpeedConn:Disconnect()
        walkSpeedConn = nil
    end
    local hum = char:WaitForChild("Humanoid")
    -- Langsung set saat connect
    if isLocked then hum.WalkSpeed = targetSpeed end
    -- Counter setiap kali game ubah WalkSpeed
    walkSpeedConn = hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
        if isLocked and hum.WalkSpeed ~= targetSpeed then
            hum.WalkSpeed = targetSpeed
        end
    end)
end

if localPlayer.Character then
    task.spawn(hookHumanoid, localPlayer.Character)
end

localPlayer.CharacterAdded:Connect(function(char)
    isLocked = isLocked -- pertahankan state
    hookHumanoid(char)
end)

-- Heartbeat throttle sebagai safety net (bukan loop utama)
RunService.Heartbeat:Connect(function(dt)
    speedThrottle = speedThrottle + dt
    if speedThrottle < SPEED_INTERVAL then return end
    speedThrottle = 0

    if not isLocked then return end
    local char = localPlayer.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum and hum.Health > 0 and hum.WalkSpeed ~= targetSpeed then
        hum.WalkSpeed = targetSpeed
    end
end)


-- ============================================================
-- BAGIAN 2: GENERATOR RENAME & INDEXING
-- PERF FIX: Gunakan cache table agar tidak scan seluruh workspace
-- berulang-ulang setiap ada perubahan kecil
-- ============================================================

-- Cache: list generator yang sudah ditemukan { instance = obj, ... }
local generatorCache = {}
local renameCooldown = false

-- Bangun ulang cache dari scratch (hanya dipanggil saat load & map baru)
local function rebuildGeneratorCache()
    generatorCache = {}
    for _, obj in ipairs(workspace:GetDescendants()) do
        if (obj.Name == "Generator" or obj.Name:match("^Generator%d+$"))
            and not obj.Name:match("^GeneratorPoint") then
            table.insert(generatorCache, obj)
        end
    end
end

local function refreshGeneratorNames()
    if renameCooldown then return end
    renameCooldown = true

    -- Bersihkan cache dari instance yang sudah tidak valid
    local valid = {}
    for _, obj in ipairs(generatorCache) do
        if obj and obj.Parent then
            table.insert(valid, obj)
        end
    end
    generatorCache = valid

    -- Rename dari cache, tidak perlu scan seluruh workspace lagi
    for i, obj in ipairs(generatorCache) do
        obj.Name = "Generator" .. i
    end

    task.delay(0.3, function()
        renameCooldown = false
    end)
end

-- Jalankan sekali saat load
task.spawn(function()
    rebuildGeneratorCache()
    refreshGeneratorNames()
end)

-- Monitor jika ada instance baru masuk workspace
-- PERF FIX: hanya rebuild cache jika yang masuk Map (bukan setiap Generator)
workspace.DescendantAdded:Connect(function(desc)
    if desc.Name == "Map" then
        -- Map baru = rebuild penuh
        task.wait(0.5)
        rebuildGeneratorCache()
        refreshGeneratorNames()
    elseif desc.Name == "Generator" and not desc.Name:match("^GeneratorPoint") then
        -- Generator baru: masukkan ke cache saja, lalu rename
        task.wait(0.2)
        if desc and desc.Parent then
            table.insert(generatorCache, desc)
            refreshGeneratorNames()
        end
    end
end)

-- Re-index jika ada yang dihapus (generator selesai direpair)
-- PERF FIX: hapus dari cache, tidak perlu scan ulang
workspace.DescendantRemoving:Connect(function(desc)
    if desc.Name:match("^Generator%d+$") and not desc.Name:match("^GeneratorPoint") then
        -- Buang dari cache
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
-- FIX: Cari generator lewat workspace descendants,
-- tidak hardcode path Rooftop
-- ============================================================
local genRemote = ReplicatedStorage
    :WaitForChild("Remotes")
    :WaitForChild("Generator")
    :WaitForChild("SkillCheckResultEvent")

local function getClosestGeneratorAndPoint()
    local character = localPlayer.Character
    if not character then return nil, nil end
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil, nil end

    local closestGen   = nil
    local closestPoint = nil
    local minGenDist   = 5 -- stud

    -- PERF FIX: loop cache saja (jumlah kecil), bukan seluruh workspace:GetDescendants()
    for _, obj in ipairs(generatorCache) do
        if obj and obj.Parent then
            local part
            if obj:IsA("Model") then
                part = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
            elseif obj:IsA("BasePart") then
                part = obj
            end

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

    -- Cari GeneratorPoint terdekat di dalam generator tersebut
    local minPointDist = 1 -- stud
    for i = 1, 4 do
        local pointName = "GeneratorPoint" .. i
        -- pcall karena path bisa saja tidak ada
        pcall(function()
            local point = closestGen:FindFirstChild(pointName)
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

-- FIX frame drop: gunakan debounce, bukan task.wait di dalam Heartbeat
local skillCooldown  = false
local SKILL_INTERVAL = 0.1

RunService.Heartbeat:Connect(function()
    if skillCooldown then return end

    -- FIX: pcall seluruh blok agar aman jika PlayerGui belum ready
    pcall(function()
        local playerGui = localPlayer.PlayerGui
        local skillGui  = playerGui:FindFirstChild("SkillCheckPromptGui")
        if not skillGui then return end

        local checkFrame = skillGui:FindFirstChild("Check")
        if not (checkFrame and checkFrame.Visible) then return end

        local targetGen, targetPoint = getClosestGeneratorAndPoint()
        if not (targetGen and targetPoint) then return end

        skillCooldown = true

        -- FIX: Args 3 & 4 adalah instance dari workspace yang ditemukan
        local args = {
            [1] = "neutral",
            [2] = 0,
            [3] = targetGen,   -- Generator instance
            [4] = targetPoint  -- GeneratorPoint instance
        }

        -- FIX: table.unpack menggantikan unpack yang deprecated
        genRemote:FireServer(table.unpack(args))

        task.delay(SKILL_INTERVAL, function()
            skillCooldown = false
        end)
    end)
end)


-- ============================================================
-- BAGIAN 4: VAULT SPEED
-- ============================================================
local VAULT_SPEED = 1.20

local function setVaultSpeed(char)
    if not char then return end
    if char:GetAttribute("vaultspeed") ~= VAULT_SPEED then
        char:SetAttribute("vaultspeed", VAULT_SPEED)
    end
end

-- Hook attribute changed agar langsung counter override
local function hookVault(char)
    setVaultSpeed(char)
    char:GetAttributeChangedSignal("vaultspeed"):Connect(function()
        setVaultSpeed(char)
    end)
end

if localPlayer.Character then
    task.spawn(hookVault, localPlayer.Character)
end

localPlayer.CharacterAdded:Connect(function(char)
    task.wait(0.5)
    hookVault(char)
end)

print("[CORE] Speed | SkillCheck | VaultSpeed (" .. VAULT_SPEED .. ") | Generator Indexer — Active")
-- ============================================================
-- ESP / CHARMS — Team-colored character outlines
-- Outline warna ikut team, auto-update jika team berubah
-- ============================================================
-- (Players, RunService, localPlayer sudah dideklarasikan di atas)

-- ============================================================
-- CONFIG
-- ============================================================
local ESP_ENABLED       = true
local OUTLINE_THICKNESS = 2        -- ketebalan outline (1-5)
local OUTLINE_TRANSPARENCY = 0     -- 0 = solid, 1 = invisible
local DEFAULT_COLOR     = Color3.fromRGB(255, 255, 255) -- warna jika tidak ada team
local ENEMY_COLOR       = nil      -- nil = pakai warna team, set Color3 untuk override musuh
local SELF_OUTLINE      = false    -- tampilkan outline di karakter sendiri

-- ============================================================
-- STATE
-- ============================================================
-- esp[player] = { highlight = Highlight, teamConn = RBXScriptConnection }
local esp = {}

-- ============================================================
-- UTILS
-- ============================================================
local function getTeamColor(player)
    if player.Team then
        return player.TeamColor.Color
    end
    return DEFAULT_COLOR
end

local function isSameTeam(player)
    if not localPlayer.Team or not player.Team then return false end
    return localPlayer.Team == player.Team
end

-- ============================================================
-- HIGHLIGHT MANAGEMENT
-- ============================================================
-- (createHighlight/SelectionBox dihapus — tidak dipakai dan lebih berat dari Highlight)

-- Roblox Highlight object (lebih proper, nempel di karakter)
local function createCharHighlight(char, color)
    -- Hapus highlight lama jika ada
    local old = char:FindFirstChildOfClass("Highlight")
    if old then old:Destroy() end

    local hl = Instance.new("Highlight")
    hl.FillTransparency    = 1           -- tidak ada fill, cuma outline
    hl.OutlineTransparency = OUTLINE_TRANSPARENCY
    hl.OutlineColor        = color
    hl.Adornee             = char
    hl.DepthMode           = Enum.HighlightDepthMode.AlwaysOnTop -- tembus tembok
    hl.Parent              = char
    return hl
end

-- ============================================================
-- ATTACH ESP KE SATU PLAYER
-- ============================================================
local function attachESP(player)
    if player == localPlayer and not SELF_OUTLINE then return end
    if esp[player] then return end -- sudah ada

    esp[player] = {
        charConn  = nil,
        teamConn  = nil,
        highlight = nil,
    }

    local function applyToChar(char)
        -- Hapus highlight lama
        if esp[player] and esp[player].highlight then
            pcall(function() esp[player].highlight:Destroy() end)
            esp[player].highlight = nil
        end

        if not char then return end
        if not ESP_ENABLED then return end

        local color = getTeamColor(player)
        local hl = createCharHighlight(char, color)
        if esp[player] then
            esp[player].highlight = hl
        end
    end

    -- Apply ke karakter yang sudah ada
    if player.Character then
        task.spawn(applyToChar, player.Character)
    end

    -- Apply saat respawn
    esp[player].charConn = player.CharacterAdded:Connect(function(char)
        task.wait(0.1) -- tunggu karakter load
        applyToChar(char)
    end)

    -- Update warna jika team berubah
    esp[player].teamConn = player:GetPropertyChangedSignal("Team"):Connect(function()
        task.wait(0.05)
        local char = player.Character
        if char then
            applyToChar(char)
        end
    end)

    -- Update jika TeamColor berubah (bisa beda dari Team)
    esp[player].teamColorConn = player:GetPropertyChangedSignal("TeamColor"):Connect(function()
        local char = player.Character
        if char then
            applyToChar(char)
        end
    end)
end

-- ============================================================
-- LEPAS ESP DARI PLAYER
-- ============================================================
local function detachESP(player)
    local data = esp[player]
    if not data then return end

    if data.charConn      then data.charConn:Disconnect()      end
    if data.teamConn      then data.teamConn:Disconnect()      end
    if data.teamColorConn then data.teamColorConn:Disconnect() end

    -- Hapus highlight dari karakter
    pcall(function()
        if player.Character then
            local hl = player.Character:FindFirstChildOfClass("Highlight")
            if hl then hl:Destroy() end
        end
    end)
    pcall(function()
        if data.highlight then data.highlight:Destroy() end
    end)

    esp[player] = nil
end

-- ============================================================
-- INIT: Pasang ke semua player yang sudah ada
-- ============================================================
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= localPlayer or SELF_OUTLINE then
        task.spawn(attachESP, player)
    end
end

Players.PlayerAdded:Connect(function(player)
    attachESP(player)
end)

Players.PlayerRemoving:Connect(function(player)
    detachESP(player)
end)

-- ============================================================
-- UPDATE LOOP: Sinkronisasi warna jika highlight hilang
-- (game kadang hapus Highlight saat karakter diload ulang)
-- Throttled — tidak tiap frame
-- ============================================================
local syncThrottle = 0
local SYNC_INTERVAL = 1.0 -- cek tiap 1 detik

RunService.Heartbeat:Connect(function(dt)
    syncThrottle = syncThrottle + dt
    if syncThrottle < SYNC_INTERVAL then return end
    syncThrottle = 0

    if not ESP_ENABLED then return end

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= localPlayer or SELF_OUTLINE then
            local char = player.Character
            if char then
                local hl = char:FindFirstChildOfClass("Highlight")
                -- Jika highlight hilang atau warnanya beda dari team sekarang, refresh
                local expectedColor = getTeamColor(player)
                if not hl or hl.OutlineColor ~= expectedColor then
                    pcall(function()
                        local data = esp[player]
                        if not data then
                            attachESP(player)
                            return
                        end
                        local newHl = createCharHighlight(char, expectedColor)
                        data.highlight = newHl
                    end)
                end
            end
        end
    end
end)

-- ============================================================
-- TOGGLE (panggil dari script lain jika perlu)
-- ESP:Toggle() atau langsung set ESP_ENABLED
-- ============================================================
local ESP = {}

function ESP:Toggle(state)
    ESP_ENABLED = (state == nil) and (not ESP_ENABLED) or state

    if not ESP_ENABLED then
        -- Hapus semua highlight
        for _, player in ipairs(Players:GetPlayers()) do
            pcall(function()
                if player.Character then
                    local hl = player.Character:FindFirstChildOfClass("Highlight")
                    if hl then hl:Destroy() end
                end
            end)
        end
    else
        -- Pasang ulang semua
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= localPlayer or SELF_OUTLINE then
                local char = player.Character
                if char then
                    local color = getTeamColor(player)
                    pcall(createCharHighlight, char, color)
                end
            end
        end
    end

    return ESP_ENABLED
end

function ESP:SetThickness(n)
    OUTLINE_THICKNESS = n
    -- Apply ke semua highlight yang ada
    for _, player in ipairs(Players:GetPlayers()) do
        pcall(function()
            if player.Character then
                local hl = player.Character:FindFirstChildOfClass("Highlight")
                -- Highlight tidak punya LineThickness, re-create untuk apply ulang
                if hl then
                    local color = hl.OutlineColor
                    hl:Destroy()
                    createCharHighlight(player.Character, color)
                end
            end
        end)
    end
end

print("[ESP] Charms active — team-colored outlines ON")
return ESP