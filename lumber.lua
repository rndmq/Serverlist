print('loading')

repeat
    wait(0.1)
until game:IsLoaded()

game:GetService('Workspace').Stores.WoodRUs.Parts.PREMIUMSELECTION.SurfaceGui.TextLabel.Text = 'Dark X V5.0'

pcall(function()
    _G.Players = game.Players
    _G.LocalPlayer = _G.Players.LocalPlayer
    _G.Character = _G.LocalPlayer.Character
    _G.Humanoid = _G.Character.Humanoid
    _G.RootPart = _G.Character.HumanoidRootPart
    _G.Land = game.Workspace.Properties
end)
spawn(function()
    while task.wait(0.1) do
        pcall(function()
            _G.Players = game.Players
            _G.LocalPlayer = _G.Players.LocalPlayer
            _G.Character = _G.LocalPlayer.Character
            _G.Humanoid = _G.Character.Humanoid
            _G.RootPart = _G.Character.HumanoidRootPart
            _G.Land = game.Workspace.Properties
        end)
    end
end)

local v = loadstring(game:HttpGet('https://pastebin.com/raw/gfRaKGuw'))()

repeat
    wait()
until v ~= nil

_G.Lava = nil

pcall(function()
    local v1 = next
    local v2, v3 = Workspace.Region_Volcano:GetChildren()

    for _, v4 in v1, v2, v3 do
        if v4:FindFirstChild('Lava') then
            if v4.Lava.CFrame == CFrame.new(-1675.2002, 255.002533, 1284.19983, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268) then
                wait()

                _G.Lava = v4.Lava
            end
        end
    end

    _G.Lava.Size = Vector3.new(0, 0, 0)
end)

if v == 'welcome to use dark x' then
    wait(0.2)
    spawn(function()
        local v5 = next
        local v6, v7 = _G.LocalPlayer.PlayerGui:GetChildren()

        for _, v8 in v5, v6, v7 do
            if v8.Name ~= 'Chat' then
                if v8.Name ~= 'TargetGui' then
                    local v9 = next
                    local v10, v11 = v8:GetDescendants()

                    for _, v12 in v9, v10, v11 do
                        Instance.new('UICorner', v12).CornerRadius = UDim.new(0, 5)

                        if v12.Name == 'DropShadow' then
                            v12:Destroy()
                        end
                        if v12:IsA('TextButton') or v12:IsA('Frame') or v12:IsA('ScrollingFrame') then
                            v12.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                        end
                        if v12:IsA('TextLabel') or v12:IsA('TextButton') or v12:IsA('TextBox') then
                            v12.TextColor3 = Color3.fromRGB(225, 225, 225)
                            v12.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                        end
                    end
                end
            end
        end
    end)
    game:GetService('ReplicatedStorage'):WaitForChild('LoadSaveRequests'):WaitForChild('GetMetaData'):InvokeServer(_G.LocalPlayer)
    game:GetService('Players').LocalPlayer:GetMouse()

    _G.Menu = {
        TeleportTargetPlayer = nil,
        IsFlying = false,
        FlySpeed = 200,
        Fly = false,
        AlwaysDay = false,
        AlwaysNight = false,
        NoFog = false,
        SelectedTree = {
            'Generic',
        },
        BringTreeCount = 1,
        TreePlaceLocation = nil,
        SuperStrength = false,
        StopChopTree = false,
        SelectedSawmill = nil,
        SaveSlot = 1,
        FastLoad = false,
        ErasedItem = 'Structure',
        ErasedPlayer = _G.LocalPlayer.Name,
        AutoBuyLocation = nil,
        AutoBuyAmount = 1,
        AutoBuyItem = nil,
        AutoBuyStopped = false,
        StoreName = 'All',
        WalkSpeed = 50,
        JumpBoost = 100,
        DupeAxeCount = 1,
        AutoDupeAxe = false,
        TeleportTargetPlayer = _G.LocalPlayer.Name,
        TeleportStopped = false,
        ItemBox = nil,
        StopSort = false,
        ProcessingTree = false,
        SortingItems = false,
        SortItemsX = 5,
        SortItemsZ = 5,
        WoodVerticalTeleport = false,
        BringPhantomGetAxe = nil,
        CarColor = nil,
        StopSpawnCar = false,
        SpawningCar = false,
        AutoFillTree = nil,
        PaintSawmill = nil,
        CopyLandToPlayer = nil,
        CopiedSave = nil,
        CopyBaseWaitLoad = false,
        CopyTime = 1,
        UseOwnTime = false,
        AutoGetShark = false,
        ProcessChoppedWood = false,
        DeleteAllStoreItems = false,
        AutoSellSign = false,
        KillTargetPlayer = nil,
        KillMethod = nil,
        KillTool = nil,
        SelectedBlueprint = 'Floor2',
        WaterInvincible = false,
        AutoChop = false,
        AutoChopLink = nil,
        SuperBuildSave = 1,
        CopiedPastSave = 1,
        AxeFly = nil,
        AxeDrop = nil,
        AutoChopEnabled = false,
        AutoPickupAxe = false,
        AxeType = nil,
        SuperWire = false,
        TreeSize = 'big',
        SaveSize = 1,
        DupeWood = false,
        InfiniteJump = false,
        AutoDupeSign = false,
        DupeSignPlayer = nil,
        AutoFillPlayer = _G.LocalPlayer,
        SaveBasePlayer = _G.LocalPlayer,
        AutoBuildWood = nil,
    }

    -- ===== UI: Fluent (https://github.com/dawid-scripts/Fluent) =====
    -- Adapter ini meniru API UI lama (CreateTab / Section / Button / Label / Toggle /
    -- TextBox / KeyBind / Slider / DropDown) supaya kode fitur di bawah tidak perlu diubah.
    local Fluent = loadstring(game:HttpGet('https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua'))()
    local Window = nil
    local uid = 0
    local function NextId(prefix)
        uid = uid + 1
        return prefix .. uid
    end

    -- Callback dari Fluent bisa kepanggil saat elemen baru dibuat; kita abaikan sampai siap
    local function Guard(cb)
        local ready = false
        local fn = function(...)
            if ready and cb then
                return cb(...)
            end
        end
        return fn, function() ready = true end
    end

    local function PlayerNames()
        local names = {}
        for _, plr in ipairs(game:GetService('Players'):GetPlayers()) do
            table.insert(names, plr.Name)
        end
        return names
    end

    local u = {}

    u.Notify = function(_, title, content, confirm, cb)
        if confirm == true then
            Window:Dialog({
                Title = title,
                Content = content,
                Buttons = {
                    {Title = 'Confirm', Callback = function() if cb then cb() end end},
                    {Title = 'Cancel', Callback = function() end},
                },
            })
        else
            Fluent:Notify({Title = title, Content = content, Duration = 5})
        end
    end
    u.ToggleUI = function(_)
        if Window then Window:Minimize() end
    end
    u.DestroyUI = function(_)
        Fluent:Destroy()
    end

    local function MakeSection(sec)
        return {
            Button = function(_, name, cb)
                sec:AddButton({Title = name, Callback = cb or function() end})
            end,

            Label = function(_, text)
                local para = sec:AddParagraph({Title = text, Content = ''})
                -- objek lama punya properti .Text yang bisa diubah (mis. 'Selected')
                local proxy = {}
                setmetatable(proxy, {
                    __index = function(_, k)
                        if k == 'Text' then return text end
                    end,
                    __newindex = function(_, k, v)
                        if k ~= 'Text' then return end
                        text = v
                        if not pcall(function() para:SetTitle(v) end) then
                            pcall(function()
                                for _, d in ipairs(para.Frame:GetDescendants()) do
                                    if d:IsA('TextLabel') and d.Text ~= '' then
                                        d.Text = v
                                        break
                                    end
                                end
                            end)
                        end
                    end,
                })
                return proxy
            end,

            Toggle = function(_, name, default, cb)
                local fn, ready = Guard(cb)
                local tg = sec:AddToggle(NextId('Toggle'), {Title = name, Default = default or false, Callback = fn})
                ready()
                if default and cb then cb(true) end -- sama seperti UI lama
                return {
                    SetState = function(_, v)
                        if v == nil then v = not tg.Value end
                        tg:SetValue(v)
                    end,
                }
            end,

            TextBox = function(_, name, default, cb)
                local fn, ready = Guard(cb)
                local input = sec:AddInput(NextId('Input'), {
                    Title = name,
                    Default = default,
                    Placeholder = default,
                    Numeric = false,
                    Finished = true,
                    Callback = function(v)
                        if v == nil or v == '' then v = default end
                        fn(v)
                    end,
                })
                ready()
                return input
            end,

            KeyBind = function(_, name, key, cb)
                local fn, ready = Guard(cb)
                local kb
                kb = sec:AddKeybind(NextId('Keybind'), {
                    Title = name,
                    Mode = 'Toggle',
                    Default = key,
                    Callback = function()
                        fn(tostring(kb and kb.Value or key))
                    end,
                })
                ready()
                return kb
            end,

            Slider = function(_, name, default, min, max, isFloat, cb)
                min = min or 1
                max = max or 100
                default = default or min
                local fn, ready = Guard(cb)
                local sl = sec:AddSlider(NextId('Slider'), {
                    Title = name,
                    Default = default,
                    Min = min,
                    Max = max,
                    Rounding = isFloat and 1 or 0,
                    Callback = fn,
                })
                ready()
                return {
                    SetState = function(_, v) sl:SetValue(v) end,
                }
            end,

            DropDown = function(_, name, options, dynamic, _, cb)
                local values = options or {}
                if dynamic then values = PlayerNames() end
                local fn, ready = Guard(function(v)
                    if v ~= nil and v ~= '' then cb(v) end
                end)
                local dd = sec:AddDropdown(NextId('Dropdown'), {
                    Title = name,
                    Values = values,
                    Multi = false,
                    Callback = fn,
                })
                ready()
                if dynamic then
                    -- UI lama refresh daftar pemain tiap dibuka; di Fluent kita refresh saat ada yang masuk/keluar
                    local Players = game:GetService('Players')
                    local function refresh()
                        values = PlayerNames()
                        dd:SetValues(values)
                    end
                    Players.PlayerAdded:Connect(refresh)
                    Players.PlayerRemoving:Connect(function()
                        task.defer(refresh)
                    end)
                end
                return {
                    AddOption = function(_, o)
                        table.insert(values, o)
                        dd:SetValues(values)
                    end,
                    SetOptions = function(_, t)
                        values = t or {}
                        dd:SetValues(values)
                    end,
                }
            end,
        }
    end

    u.Create = function(_, title)
        Window = Fluent:CreateWindow({
            Title = title,
            SubTitle = '',
            TabWidth = 160,
            Size = UDim2.fromOffset(580, 460),
            Acrylic = false,
            Theme = 'Dark',
            MinimizeKey = Enum.KeyCode.LeftControl,
        })
        local win = {}
        function win:CreateTab(name, _icon)
            local tab = Window:AddTab({Title = name, Icon = ''})
            return {
                Section = function(_, secTitle)
                    return MakeSection(tab:AddSection(secTitle))
                end,
            }
        end
        return win, nil, nil
    end

    local v53 = u
    local v54, _, _ = u.Create(v53, 'Dark X V5.0')

    _G.Notify = function(p68)
        u:Notify('Dark X', p68, false)
    end
    _G.Mouse = _G.LocalPlayer:GetMouse()
    _G.Fly = function(p69)
        repeat
            wait()
        until _G.LocalPlayer and _G.Character and _G.Character:FindFirstChild('Head') and _G.Character:FindFirstChild('Humanoid')

        local u41 = {
            f = 0,
            b = 0,
            l = 0,
            r = 0,
        }
        local u42 = {
            f = 0,
            b = 0,
            l = 0,
            r = 0,
        }
        local u43 = 500

        if not _G.Humanoid.SeatPart then
            _G.Humanoid.PlatformStand = true
        end
        if _G.Humanoid.SeatPart then
            CarFly = _G.Humanoid.SeatPart

            local _Weld = Instance.new('Weld', _G.RootPart)
            local _Weld2 = Instance.new('Weld', _G.Humanoid.SeatPart)

            _Weld.Part0 = _G.RootPart
            _Weld.Part1 = _G.Humanoid.SeatPart
            _Weld2.Part0 = _G.RootPart
            _Weld2.Part1 = _G.Humanoid.SeatPart
        end

        Fly = function()
            local _BodyGyro = Instance.new('BodyGyro', _G.RootPart)

            _BodyGyro.P = 90000
            _BodyGyro.maxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
            _BodyGyro.CFrame = _G.RootPart.CFrame

            local _BodyVelocity = Instance.new('BodyVelocity', _G.RootPart)

            _BodyVelocity.Velocity = Vector3.new(0, 0.1, 0)
            _BodyVelocity.maxForce = Vector3.new(9000000000, 9000000000, 9000000000)

            local __continue_break_1 = false

            while true do
                local v55

                if true then
                    wait()

                    v55 = _G.Menu.FlySpeed

                    local v56 = 50

                    if u41.l + u41.r ~= 0 or u41.f + u41.b ~= 0 then
                        if u43 < v55 then
                            v55 = u43
                        end
                    elseif u41.l + u41.r ~= 0 or u41.f + u41.b ~= 0 then
                        v55 = v56
                    else
                        v55 = v56 - 50

                        local _ = v55 < 0
                    end
                end
                if u41.l + u41.r ~= 0 or u41.f + u41.b ~= 0 then
                    _BodyVelocity.Velocity = (game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (u41.f + u41.b) + (game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(u41.l + u41.r, (u41.f + u41.b) * 0.2, 0).p - game.Workspace.CurrentCamera.CoordinateFrame.p)) * v55
                    u42 = {
                        f = u41.f,
                        b = u41.b,
                        l = u41.l,
                        r = u41.r,
                    }
                elseif (u41.l + u41.r == 0 or u41.f + u41.b == 0) and v55 ~= 0 then
                    _BodyVelocity.Velocity = (game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (u42.f + u42.b) + (game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(u42.l + u42.r, (u42.f + u42.b) * 0.2, 0).p - game.Workspace.CurrentCamera.CoordinateFrame.p)) * v55
                else
                    _BodyVelocity.Velocity = Vector3.new(0, 0.1, 0)
                end

                _BodyGyro.CFrame = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((u41.f + u41.b) * 50 * v55 / u43), 0, 0)

                if _G.Menu.IsFlying then
                else
                    break
                end
            end

            _BodyGyro:Destroy()
            _BodyVelocity:Destroy()
            pcall(function()
                local v57 = next
                local v58, v59 = _G.Humanoid.SeatPart:GetChildren()

                for _, v60 in v57, v58, v59 do
                    if v60.Name == 'Weld' then
                        v60:Destroy()
                    end
                end

                local v61 = next
                local v62, v63 = _G.RootPart:GetChildren()

                for _, v64 in v61, v62, v63 do
                    if v64:IsA('Weld') then
                        v64:Destroy()
                    end
                end

                _G.RootPart.CFrame = CFrame.new(CarFly.CFrame.p)
            end)

            _G.Humanoid.PlatformStand = false

            return
        end

        _G.Mouse.KeyDown:Connect(function(p70)
            if p70:lower() ~= 'w' then
                if p70:lower() ~= 'a' then
                    if p70:lower() ~= 's' then
                        if p70:lower() == 'd' then
                            isSDown = true
                            u41.r = 1
                        end
                    else
                        isSDown = true
                        u41.b = -1
                    end
                else
                    isADown = true
                    u41.l = -1
                end
            else
                isWDown = true
                u41.f = 1
            end
        end)
        _G.Mouse.KeyUp:Connect(function(p71)
            if p71:lower() ~= 'w' then
                if p71:lower() ~= 'a' then
                    if p71:lower() ~= 's' then
                        if p71:lower() == 'd' then
                            isDDown = false
                            u41.r = 0
                        end
                    else
                        isSDown = false
                        u41.b = 0
                    end
                else
                    isADown = false
                    u41.l = 0
                end
            else
                isWDown = false
                u41.f = 0
            end
        end)

        if p69 then
            if p69 then
                _G.Menu.IsFlying = true

                Fly()
            end
        else
            _G.Menu.IsFlying = false
            _G.Humanoid.PlatformStand = false
        end
    end
    _G.PullItems = game.ReplicatedStorage.Interaction.ClientIsDragging

    local u44 = function(p72)
        if p72:FindFirstChildOfClass('MeshPart') then
            p72.PrimaryPart = p72:FindFirstChildOfClass('MeshPart')

            return
        else
            p72.PrimaryPart = p72:FindFirstChildOfClass('Part') or (p72:FindFirstChildOfClass('MeshPart') or p72:FindFirstChild('Main'))

            return
        end
    end
    local u45 = function(p73, p74)
        u44(p73)
        spawn(function()
            for _ = 1, 10 do
                p73.PrimaryPart.Velocity = Vector3.new(0, 0, 0)
                p73.PrimaryPart.RotVelocity = Vector3.new(0, 0, 0)

                game.ReplicatedStorage.TestPing:InvokeServer()
                task.wait()
            end
        end)

        if identifyexecutor() ~= 'Krampus' then
            if tostring(p73.Parent) ~= 'Plank' then
                for _ = 1, 3 do
                    game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(p73)

                    if p73:FindFirstChild('WoodSection') then
                        p73:PivotTo(p74)
                    else
                        u44(p73)

                        p73.PrimaryPart.CFrame = p74
                    end

                    game.ReplicatedStorage.TestPing:InvokeServer()
                    task.wait()
                end

                return
            else
                for _ = 1, 6 do
                    game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(p73)
                    u44(p73)

                    p73.PrimaryPart.CFrame = p74

                    game.ReplicatedStorage.TestPing:InvokeServer()
                    task.wait()
                end

                return
            end
        else
            print(p73.PrimaryPart)

            repeat
                game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(p73)
                task.wait(0.2)
            until isnetworkowner(p73.PrimaryPart)

            game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(p73)

            local v65 = p73

            if p73.FindFirstChild(v65, 'WoodSection') then
                local v66 = p73

                p73.PivotTo(v66, p74)
            else
                p73.PrimaryPart.CFrame = p74
            end

            return
        end
    end

    _G.Wear = nil
    _G.Noclip = function(p75)
        if p75 then
            _G.Wear = game:GetService('RunService').Stepped:connect(function()
                local v67 = next
                local v68, v69 = _G.Character:GetChildren()

                for _, v70 in v67, v68, v69 do
                    if v70:IsA('Part') or v70:IsA('BasePart') then
                        v70.CanCollide = false
                    end
                end
            end)

            return
        else
            if _G.Wear then
                _G.Wear:Disconnect()

                _G.Wear = nil
            end

            return
        end
    end
    _G.GetToolDamage = function(p76)
        local _Value = p76.ToolName.Value

        return require(game.ReplicatedStorage.AxeClasses['AxeClass_' .. _Value]).new()
    end
    _G.Teleport = function(p77)
        if _G.Humanoid.SeatPart == nil then
            _G.Character:PivotTo(p77)
        else
            spawn(function()
                for _ = 1, 20 do
                    wait()
                    _G.Humanoid.SeatPart.Parent:PivotTo(p77)
                    _G.PullItems:FireServer(_G.Humanoid.SeatPart.Parent.Main)
                end
            end)
        end
    end
    _G.GetTool = function()
        local v71 = next
        local v72, v73 = _G.LocalPlayer.Backpack:GetChildren()
        local v74 = 0
        local v75 = {}

        for _, v76 in v71, v72, v73 do
            if v76:IsA('Tool') then
                if v76.Name ~= 'BlueprintTool' then
                    v74 = v74 + 1

                    table.insert(v75, v76)
                end
            end
        end

        if _G.Character:FindFirstChildOfClass('Tool') then
            table.insert(v75, _G.Character:FindFirstChildOfClass('Tool'))

            v74 = v74 + 1
        end
        if v74 == 0 then
            return nil
        else
            return v75
        end
    end
    _G.CheckAxe = function(p78)
        _G.WoodType = p78

        local v77 = _G.GetTool()

        if v77 == nil then
            return _G.Notify('you need one axe')
        end

        for _, v78 in next, v77 do
            local v79 = _G.GetToolDamage(v78)

            if v79.SpecialTrees and v79.SpecialTrees[_G.WoodType ] then
                local _Damage = v79.SpecialTrees[_G.WoodType ].Damage

                if _G.WoodType ~= 'LoneCave' or v78.ToolName.Value == 'EndTimesAxe' then
                    return v78, _Damage
                else
                    return _G.Notify('you need one end times axe')
                end
            else
                local _Damage2 = v79.Damage

                if _Damage2 <= 0 then
                    v78 = nil
                end
                if _G.WoodType ~= 'LoneCave' or v78.ToolName.Value == 'EndTimesAxe' then
                    return v78, _Damage2
                else
                    return _G.Notify('you need one end times axe')
                end
            end
        end
    end
    _G.FindWood = function(p79)
        local v80 = next
        local v81, v82 = Workspace:GetChildren()
        local v83 = {}

        for _, v84 in v80, v81, v82 do
            if v84.Name == 'TreeRegion' then
                local v85 = next
                local v86, v87 = v84:GetChildren()

                for _, v88 in v85, v86, v87 do
                    if v88:FindFirstChild('TreeClass') then
                        if tostring(v88.TreeClass.Value) == p79 then
                            if v88:FindFirstChild('Owner') then
                                if v88.Owner.Value == nil or v88.Owner.Value == _G.LocalPlayer then
                                    if v88:FindFirstChild('WoodSection') then
                                        local v89 = next
                                        local v90, v91 = v88:GetChildren()

                                        for _, v92 in v89, v90, v91 do
                                            if v92:FindFirstChild('ID') then
                                                if v92.ID.Value == 1 then
                                                    if v92.Size.Y > 0.5 then
                                                        table.insert(v83, v88)
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end

        if #v83 ~= 0 then
            return v83
        else
            return false
        end
    end
    _G.GetSuitableWood = function(p80)
        local v93 = _G.FindWood(p80)

        if v93 == false then
            return false
        else
            local v94 = _G.Menu.TreeSize == 'big' and 0 or math.huge
            local v95 = nil

            for _, v96 in next, v93 do
                local v97 = next
                local v98, v99 = v96:GetChildren()
                local v100 = 0

                for _, v101 in v97, v98, v99 do
                    if v101.Name == 'WoodSection' then
                        v100 = v100 + 1
                    end
                end

                if _G.Menu.TreeSize ~= 'big' then
                    if v100 < v94 then
                        if v100 ~= 0 then
                            v95 = v96
                            v94 = v100
                        end
                    end
                elseif v94 < v100 then
                    v95 = v96
                    v94 = v100
                end
            end

            local v102 = next
            local v103, v104 = v95:GetChildren()

            for _, v105 in v102, v103, v104 do
                if v105.Name ~= 'WoodSection' then
                elseif v105.ID.Value ~= 1 then
                else
                    return v105
                end
            end

            return
        end
    end
    _G.Chop = function(p81, p82, p83, p84, p85)
        game:GetService('ReplicatedStorage').Interaction.RemoteProxy:FireServer(p81, {
            tool = p82,
            faceVector = Vector3.new(-1, 0, 0),
            height = p84 or 0.3,
            sectionId = p83 or 1,
            hitPoints = p85,
            cooldown = -14,
            cuttingClass = 'Axe',
        })
    end

    game.Workspace.ChildAdded:Connect(function(p86)
        if p86:IsA('Part') and (p86:WaitForChild('BodyPosition') and p86:WaitForChild('BodyGyro')) then
            if _G.Menu.SuperStrength then
                p86.BrickColor = BrickColor.new('Really red')
                p86:WaitForChild('BodyPosition').P = 100500
                p86:WaitForChild('BodyPosition').D = 1040
                p86:WaitForChild('BodyPosition').MaxForce = Vector3.new(90000, 90000, 90000) * math.huge
                p86:WaitForChild('BodyGyro').P = 1400
                p86:WaitForChild('BodyGyro').D = 1040
                p86:WaitForChild('BodyGyro').MaxTorque = Vector3.new(9000, 9000, 9000) * math.huge
            else
                p86.BrickColor = BrickColor.new('Deep blue')
                p86:WaitForChild('BodyPosition').P = 10000
                p86:WaitForChild('BodyPosition').D = 800
                p86:WaitForChild('BodyPosition').MaxForce = Vector3.new(1, 1, 1) * 17000
                p86:WaitForChild('BodyGyro').P = 1200
                p86:WaitForChild('BodyGyro').D = 140
                p86:WaitForChild('BodyGyro').MaxTorque = Vector3.new(1, 1, 1) * 200
            end
        end
    end)

    _G.MyClonedPart = nil

    local u46 = nil

    _G.BringTree = function(p87)
        _G.TreeType = p87

        local v106 = _G
        local v107 = _G
        local v108, v109 = _G.CheckAxe(_G.TreeType)

        v107.Damage = v109
        v106.Axe = v108

        if _G.Damage ~= nil then
            _G.Wood = _G.GetSuitableWood(_G.TreeType)
            _G.TreeAdded = nil
            _G.TreeChopDone = false

            if _G.Wood ~= false then
                _G.TreeAdded = Workspace.LogModels.ChildAdded:Connect(function(p88)
                    p88:WaitForChild('Owner', 60)
                    p88:WaitForChild('Owner', 60)

                    p88.PrimaryPart = p88:WaitForChild('WoodSection', 60)

                    if p88:WaitForChild('Owner', 60).Value == _G.LocalPlayer and p88.TreeClass.Value == _G.TreeType then
                        _G.TreeChopDone = true

                        u45(p88, _G.Menu.TreePlaceLocation)

                        if _G.Menu.SelectedTree == 'LoneCave' then
                            game:GetService('ReplicatedStorage').Interaction.ClientInteracted:FireServer(_G.LocalPlayer.Backpack:FindFirstChild('Tool') or _G.Character:FindFirstChild('Tool'), 'Drop tool', _G.Menu.TreePlaceLocation)

                            _G.Humanoid.Health = 0

                            wait()

                            repeat
                                wait()
                            until _G.Character:FindFirstChild('Head') and _G.Humanoid.Health >= 20

                            _G.Teleport(_G.Menu.TreePlaceLocation)
                            wait(2)
                            pcall(function()
                                u46:Disconnect()

                                u46 = nil
                            end)
                        end

                        pcall(function()
                            _G.TreeAdded:Disconnect()

                            _G.TreeAdded = nil
                        end)
                    end
                end)

                if _G.TreeType == 'LoneCave' then
                    u46 = game.Workspace.PlayerModels.ChildAdded:Connect(function(p89)
                        p89:WaitForChild('Owner')

                        if p89:FindFirstChild('ToolName') and (tostring(p89.ToolName.Value) == 'EndTimesAxe' and p89:WaitForChild('Owner').Value == _G.LocalPlayer) then
                            repeat
                                wait()
                            until _G.Character:FindFirstChild('Head') and 20 <= _G.Humanoid.Health

                            wait(0.1)
                            game:GetService('ReplicatedStorage'):WaitForChild('Interaction'):WaitForChild('ClientInteracted'):FireServer(unpack({
                                p89,
                                'Pick up tool',
                            }))
                        end
                    end)

                    local _Part = Instance.new('Part', game.Workspace)

                    _Part.CanCollide = false
                    _Part.Anchored = true
                    _Part.Color = Color3.fromRGB(0, 217, 255)
                    _Part.Transparency = 1
                    _Part.Size = Vector3.new(2, 2, 2)
                    _Part.CFrame = _G.RootPart.CFrame
                    _Part.Material = Enum.Material.Marble
                    _Part.Name = 'Part'
                    game:GetService('Workspace').CurrentCamera.CameraSubject = _Part

                    _G.Teleport(CFrame.new(-1456.40442, 433.399719, 1285.89697))

                    repeat
                        pcall(function()
                            firetouchinterest(_G.RootPart, _G.Lava, 0)
                            firetouchinterest(_G.RootPart, _G.Lava, 1)
                        end)
                        task.wait()
                    until _G.RootPart:FindFirstChild('LavaFire')

                    wait()

                    _G.Lava.CFrame = CFrame.new(-1675.2002, 255.002533, 1284.19983, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)

                    _G.RootPart:FindFirstChild('LavaFire'):Destroy()

                    local v110 = _G.Character.Torso:Clone()

                    v110.Name = 'HumanoidRootPart'
                    v110.Transparency = 1
                    v110.Parent = _G.Character

                    pcall(function()
                        _Part:Destroy()
                    end)

                    game:GetService('Workspace').CurrentCamera.CameraSubject = _G.Humanoid
                end

                spawn(function()
                    local __continue_break_2 = false

                    while true do
                        game['Run Service'].Heartbeat:wait()

                        if _G.Character:FindFirstChild('Head') and 30 < _G.Humanoid.Health then
                            _G.Teleport(_G.Wood.CFrame + Vector3.new(3, 5, 0))
                        end
                        if _G.TreeChopDone then
                            break
                        end
                    end

                    return
                end)

                while true do
                    if _G.Character:FindFirstChild('Head') and _G.Humanoid.Health < 20 then
                        repeat
                            task.wait()
                        until _G.Character:FindFirstChild('Head') and 20 < _G.Humanoid.Health and _G.Character:FindFirstChildOfClass('Tool')

                        wait()

                        local v111 = _G
                        local v112 = _G
                        local v113, v114 = _G.CheckAxe(_G.TreeType)

                        v112.Damage = v114
                        v111.Axe = v113
                    end

                    spawn(function()
                        _G.Chop(_G.Wood.Parent.CutEvent, _G.Axe, 1, 0.3, _G.Damage)
                    end)

                    if _G.Menu.StopChopTree == true then
                        break
                    end

                    task.wait()

                    if _G.TreeChopDone then
                        break
                    end
                end

                if _G.Menu.StopChopTree == true then
                    _G.TreeAdded:Disconnect()

                    _G.TreeAdded = nil
                end

                return
            else
                return _G.Notify('not find ' .. _G.TreeType)
            end
        else
            return
        end
    end
    _G.Light = game:GetService('Lighting')
    _G.LoadSaveServer = game.ReplicatedStorage.LoadSaveRequests
    _G.CanLoad = function()
        if not _G.LoadSaveServer.ClientMayLoad:InvokeServer(_G.LocalPlayer) then
            _G.Notify('Load is on cooldown. Waiting...')

            repeat
                wait()
            until _G.LoadSaveServer.ClientMayLoad:InvokeServer(_G.LocalPlayer)
        end

        return true
    end
    _G.Load = function(p90)
        _G.CanLoad()
        wait()
        _G.LoadSaveServer.RequestLoad:InvokeServer(p90, _G.LocalPlayer)
    end
    _G.SaveBase = function(p91)
        u:Notify('Dark X', 'Are you sure you want to replace all existing data', true, function()
            _G.LoadSaveServer.RequestSave:InvokeServer(p91, _G.LocalPlayer)
            _G.Notify('Slot saved successfully')
        end)
    end
    _G.ExpandLand = function(p92)
        local v115 = next
        local v116, v117 = _G.Land:GetChildren()
        local v118 = nil

        for _, v119 in v115, v116, v117 do
            if v119:FindFirstChild('Owner') then
                if v119.Owner.Value == _G.LocalPlayer then
                    v118 = v119
                end
            end
        end

        game:GetService('ReplicatedStorage').PropertyPurchasing.ClientExpandedProperty:FireServer(v118, p92)
    end
    _G.EraseSelectedItem = function()
        _G.Erase = false

        local v120 = next
        local v121, v122 = game.Workspace.PlayerModels:GetChildren()

        for _, v123 in v120, v121, v122 do
            if v123:FindFirstChild('Owner') then
                if tostring(v123.Owner.Value) == _G.Menu.ErasedPlayer then
                    if v123:FindFirstChild('Type') then
                        if v123.Type.Value == _G.Menu.ErasedItem then
                            _G.Erase = true

                            game.ReplicatedStorage.Interaction.DestroyStructure:FireServer(v123)

                            repeat
                                task.wait()
                            until v123.Parent == nil

                            task.wait()
                        end
                    end
                end
            end
        end

        if not _G.Erase then
            _G.Notify('Failed to find a selected type')
        end
    end
    _G.CollectSave = function()
        _G.Load(math.huge)
    end
    _G.SellSign = function()
        local v124 = next
        local v125, v126 = game.Workspace.PlayerModels:GetChildren()

        for _, v127 in v124, v125, v126 do
            if v127:FindFirstChild('Owner') then
                if v127.Owner.Value == _G.LocalPlayer then
                    if v127:FindFirstChild('ItemName') then
                        if v127.ItemName.Value == 'PropertySoldSign' then
                            _G.Teleport(CFrame.new(v127.Main.CFrame.p) + Vector3.new(0, 0, 2))
                            game.ReplicatedStorage.Interaction.ClientInteracted:FireServer(v127, 'Take down sold sign')

                            for _ = 1, 30 do
                                _G.PullItems:FireServer(v127)

                                v127.Main.CFrame = CFrame.new(314.54, -0.5, 86.823)

                                game['Run Service'].Heartbeat:wait()
                            end
                        end
                    end
                end
            end
        end
    end
    _G.CheckAxeMaxed = function()
        local v128 = next
        local v129, v130 = _G.LocalPlayer.Backpack:GetChildren()
        local v131 = 0

        for _, v132 in v128, v129, v130 do
            if v132:IsA('Tool') then
                if v132.Name ~= 'BlueprintTool' then
                    v131 = v131 + 1
                end
            end
        end

        if _G.Character:FindFirstChildOfClass('Tool') then
            v131 = v131 + 1
        end

        print(v131)

        if v131 >= 9 then
            return true
        else
            return
        end
    end

    local v133 = next
    local v134, v135 = Workspace:GetChildren()
    local u47 = u
    local u48 = u44
    local u49 = u45

    for _, v136 in v133, v134, v135 do
        if v136.Name == 'TreeRegion' then
            local v137 = next
            local v138, v139 = v136:GetChildren()

            for _, v140 in v137, v138, v139 do
                if v140:FindFirstChild('TreeClass') then
                    if v140:FindFirstChild('Owner') then
                        if tostring(v140.TreeClass.Value) == 'Spooky' or tostring(v140.TreeClass.Value) == 'SpookyNeon' then
                            if v140.Owner.Value == nil or tostring(v140.Owner.Value) == _G.LocalPlayer then
                                if v140:FindFirstChild('WoodSection') then
                                    _G.Notify('Find Spooky /SpookyNeon wood')
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    spawn(function()
        while task.wait(20) do
            local v141 = next
            local v142, v143 = Workspace:GetChildren()

            for _, v144 in v141, v142, v143 do
                if v144.Name == 'TreeRegion' then
                    local v145 = next
                    local v146, v147 = v144:GetChildren()

                    for _, v148 in v145, v146, v147 do
                        if v148:FindFirstChild('TreeClass') then
                            if v148:FindFirstChild('Owner') then
                                if tostring(v148.TreeClass.Value) == 'Spooky' or tostring(v148.TreeClass.Value) == 'SpookyNeon' then
                                    if v148.Owner.Value == nil or tostring(v148.Owner.Value) == _G.LocalPlayer then
                                        if v148:FindFirstChild('WoodSection') then
                                            _G.Notify('Find Spooky /SpookyNeon wood')
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end)
    spawn(function()
        while task.wait() do
            if _G.Menu.AutoSellSign then
                _G.CollectSave()

                local v149 = _G.GetLand()

                game.ReplicatedStorage.PropertyPurchasing.ClientPurchasedProperty:FireServer(v149, v149.OriginSquare.CFrame.p + Vector3.new(0, 3, 0))
                _G.Load(_G.Menu.SaveSlot)
                _G.SellSign()
            end
        end
    end)
    spawn(function()
        while task.wait() do
            if _G.Menu.AutoDupeSign then
                _G.CollectSave()

                local u50 = _G.GetLand()

                pcall(function()
                    game.ReplicatedStorage.PropertyPurchasing.ClientPurchasedProperty:FireServer(u50, u50.OriginSquare.CFrame.p + Vector3.new(0, 3, 0))
                end)
                _G.CollectSave()

                local v150 = next
                local v151, v152 = game.Workspace.PlayerModels:GetChildren()

                for _, v153 in v150, v151, v152 do
                    if v153:FindFirstChild('ItemName') then
                        if v153.ItemName.Value == 'PropertySoldSign' then
                            v153:WaitForChild('Owner')

                            if v153:WaitForChild('Owner').Value == _G.LocalPlayer or v153:WaitForChild('Owner').Value == nil then
                                _G.Teleport(CFrame.new(v153.Main.CFrame.p) + Vector3.new(0, 3, 2))
                                game.ReplicatedStorage.Interaction.ClientInteracted:FireServer(v153, 'Take down sold sign')
                                game.ReplicatedStorage.Interaction.ClientInteracted:FireServer(v153, 'Take down sold sign')
                                wait()
                                _G.PullItems:FireServer(v153)

                                for _ = 1, 30 do
                                    _G.PullItems:FireServer(v153)
                                    v153:PivotTo(game.Players[_G.Menu.DupeSignPlayer ].Character.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0))
                                    task.wait()
                                end
                            end
                        end
                    end
                end

                task.wait()
            end
        end
    end)

    _G.SellWood = function()
        local _CFrame = _G.RootPart.CFrame

        for _ = 1, 10 do
            local v154 = next
            local v155, v156 = game:GetService('Workspace').LogModels:GetChildren()

            for _, u51 in v154, v155, v156 do
                if u51:FindFirstChild('Owner') then
                    if u51.Owner.Value == _G.LocalPlayer then
                        _G.Teleport(u51.WoodSection.CFrame)

                        for _ = 1, 20 do
                            _G.PullItems:FireServer(u51)
                            u51:PivotTo(CFrame.new(315, 0, 85.4999924))
                            game['Run Service'].Heartbeat:wait()
                        end

                        task.wait(0.3)
                        _G.Teleport(CFrame.new(315, 0, 85.4999924))

                        local v157 = next
                        local v158, v159 = u51:GetChildren()

                        for _, u52 in v157, v158, v159 do
                            if u52.Name == 'WoodSection' then
                                spawn(function()
                                    for _ = 1, 20 do
                                        _G.Teleport(CFrame.new(315, 0, 85.4999924))
                                        _G.PullItems:FireServer(u51)
                                        u52:PivotTo(CFrame.new(315, 0, 85.4999924))
                                        game['Run Service'].Heartbeat:wait()
                                    end
                                end)
                                game['Run Service'].Heartbeat:wait()
                            end
                        end
                    end

                    task.wait()
                end
            end

            task.wait()
        end

        _G.Teleport(_CFrame)
    end

    spawn(function()
        while task.wait() do
            spawn(function()
                _G.Humanoid.JumpPower = _G.Menu.JumpBoost
            end)

            if _G.Menu.AlwaysDay then
                _G.Light.TimeOfDay = '12:00:00'
                _G.Light.Brightness = 2
            end
            if _G.Menu.AlwaysNight then
                _G.Light.TimeOfDay = '2:00:00'
            end
            if _G.Menu.NoFog then
                _G.Light.FogEnd = 1000000
            end

            spawn(function()
                local v160 = next
                local v161, v162 = _G.LocalPlayer.Backpack:GetChildren()
                local v163 = 0

                for _, v164 in v160, v161, v162 do
                    if v164:IsA('Tool') then
                        if v164.Name ~= 'BlueprintTool' then
                            v163 = v163 + 1
                        end
                    end
                end

                if _G.Character:FindFirstChildOfClass('Tool') then
                    v163 = v163 + 1
                end
                if v163 > 10 then
                    wait(1)

                    _G.Humanoid.Health = 0

                    _G.Notify('your have too much axe')
                end
            end)

            if _G.Menu.PaintSawmill ~= nil and not _G.Menu.PaintSawmill:FindFirstChild('Particles') then
                _G.Notify('maybe you move your sawmill or destroy please reselect')

                _G.Menu.PaintSawmill = nil
                _G.Sawmill.Text = 'not select'
            end
            if _G.Menu.SelectedSawmill ~= nil and not _G.Menu.SelectedSawmill:FindFirstChild('Particles') then
                _G.Notify('maybe you move your sawmill or destroy please reselect')

                _G.Menu.SelectedSawmill = nil
                _G.ProcessTreeSawmill.Text = 'not select'
            end

            spawn(function()
                if _G.Menu.DeleteStoreItem then
                    local v165 = next
                    local v166, v167 = game:GetService('Workspace').Stores:GetChildren()

                    for _, u53 in v165, v166, v167 do
                        spawn(function()
                            if u53.Name == 'ShopItems' then
                                local v168 = next
                                local v169, v170 = u53:GetChildren()

                                for _, u54 in v168, v169, v170 do
                                    if u54:FindFirstChild('Owner') then
                                        spawn(function()
                                            pcall(function()
                                                u54.Main.CanCollide = false

                                                for _ = 1, 20 do
                                                    u54.Main.Velocity = Vector3.new(10000000000000, 10000000000000, 10000000000000)

                                                    task.wait(0.1)
                                                end
                                            end)
                                        end)
                                    end
                                end
                            end
                        end)
                    end

                    wait()
                end
            end)
            spawn(function()
                if _G.Menu.AutoPickupAxe and (_G.Humanoid.Health >= 20 and _G.CheckAxeMaxed() ~= true) then
                    local v171 = next
                    local v172, v173 = workspace.PlayerModels:GetChildren()

                    for _, v174 in v171, v172, v173 do
                        if v174:FindFirstChild('Owner') then
                            if v174.Owner.Value == _G.LocalPlayer then
                                if v174:FindFirstChild('ToolName') then
                                    if tostring(v174.ToolName.Value) == _G.Menu.AxeType then
                                        game:GetService('ReplicatedStorage'):WaitForChild('Interaction'):WaitForChild('ClientInteracted'):FireServer(unpack({
                                            v174,
                                            'Pick up tool',
                                        }))
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end)

    local _Player = v54:CreateTab('Player', '5012544693')
    local _Player2 = _Player:Section('Player')
    local u55 = 100

    spawn(function()
        while true do
            wait()

            if _G.Humanoid == nil then
                repeat
                    wait()
                until _G.Humanoid ~= nil

                _G.Humanoid:GetPropertyChangedSignal('WalkSpeed'):Connect(function()
                    if _G.Humanoid.WalkSpeed ~= u55 then
                        _G.Humanoid.WalkSpeed = u55
                    end
                end)
            end
        end
    end)
    _G.Humanoid:GetPropertyChangedSignal('WalkSpeed'):Connect(function()
        if _G.Humanoid.WalkSpeed ~= u55 then
            _G.Humanoid.WalkSpeed = u55
        end
    end)
    _Player2:Slider('WalkSpeed', 50, 16, 500, false, function(p93)
        u55 = p93
        _G.Humanoid.WalkSpeed = u55
    end)
    _Player2:Slider('JumpPower', 100, 60, 500, false, function(p94)
        _G.Menu.JumpBoost = p94
    end)
    _Player2:Slider('HipHeight', 0, 0, 500, false, function(p95)
        _G.Humanoid.HipHeight = p95
    end)
    _Player2:Slider('Zoom Distance', 100, 1, 2000, false, function(p96)
        _G.LocalPlayer.CameraMaxZoomDistance = p96
    end)
    _Player2:Slider('FOV', 70, 70, 150, false, function(p97)
        game.Workspace.Camera.FieldOfView = p97
    end)
    _Player2:Slider('Fly Speed', 200, 50, 500, false, function(p98)
        _G.Menu.FlySpeed = p98
    end)
    _Player2:KeyBind('Fly Key', 'Q', function()
        if _G.Menu.Fly ~= false then
            _G.Menu.Fly = false

            _G.Fly(false)
        else
            _G.Menu.Fly = true

            _G.Fly(true)
        end
    end)
    _Player2:Toggle('NoClip', false, function(p99)
        _G.Noclip(p99)
    end)
    _Player2:Toggle('Infinite Jump', false, function(p100)
        if p100 then
            _G.Menu.InfiniteJump = game:GetService('UserInputService').JumpRequest:Connect(function()
                _G.Humanoid:ChangeState('Jumping')
            end)
        else
            _G.Menu.InfiniteJump:Disconnect()

            _G.Menu.InfiniteJump = nil
        end
    end)
    _Player2:Toggle('Light', false, function(p101)
        if p101 then
            _G.Glow = Instance.new('PointLight', _G.Character.Head)
            _G.Glow.Name = 'dark'
            _G.Glow.Range = 150
            _G.Glow.Brightness = 1.7
        else
            pcall(function()
                _G.Character.Head.dark:Destroy()
            end)
        end
    end)
    _Player2:Button('Safe Death', function()
        _G.Teleport(CFrame.new(0, -380, 0))
    end)

    local _Tp = _Player:Section('Tp')

    _Tp:DropDown('Select the player', {}, true, false, function(p102)
        _G.Menu.TeleportTargetPlayer = p102
    end)
    _Tp:Button('Tp to Base', function()
        _G.Base = nil

        local v175 = next
        local v176, v177 = _G.Land:GetChildren()

        for _, v178 in v175, v176, v177 do
            if tostring(v178.Owner.Value) == _G.Menu.TeleportTargetPlayer then
                _G.Base = v178

                _G.Teleport(v178.OriginSquare.CFrame + Vector3.new(0, 5, 0))
            end
        end

        if _G.Base == nil then
            _G.Notify('Player Not Have Base')
        end
    end)
    _Tp:Button('Tp to Player', function()
        _G.Teleport(_G.Players[_G.Menu.TeleportTargetPlayer ].Character.HumanoidRootPart.CFrame)
    end)
    _Tp:DropDown('Tp To Place', {
        'Spawn',
        'Wood R Us',
        'Land Store',
        'Bridge',
        'Dock',
        'Palm',
        'Cave',
        'The Den',
        'Volcano',
        'Swamp',
        'Fancy Furnishings',
        'Boxed Cars',
        'Links Logic',
        'Bobs Shack',
        'Fine Arts Store',
        'Ice Mountain',
        'Shrine Of Sight',
        'Strange Man',
        'Volcano Win',
        'Ski Lodge',
        'Fur Wood',
    }, false, false, function(p103)
        if p103 == 'Wood R Us' then
            _G.Teleport(CFrame.new(270, 4, 60))
        elseif p103 == 'Spawn' then
            _G.Teleport(CFrame.new(174, 10.5, 66))
        elseif p103 == 'Land Store' then
            _G.Teleport(CFrame.new(270, 3, -98))
        elseif p103 == 'Bridge' then
            _G.Teleport(CFrame.new(112, 37, -892))
        elseif p103 == 'Dock' then
            _G.Teleport(CFrame.new(1136, 0, -206))
        elseif p103 == 'Palm' then
            _G.Teleport(CFrame.new(2614, -4, -34))
        elseif p103 == 'Cave' then
            _G.Teleport(CFrame.new(3590, -177, 415))
        elseif p103 == 'Volcano' then
            _G.Teleport(CFrame.new(-1588, 623, 1069))
        elseif p103 == 'Swamp' then
            _G.Teleport(CFrame.new(-1216, 131, -822))
        elseif p103 == 'Fancy Furnishings' then
            _G.Teleport(CFrame.new(486, 3, -1722))
        elseif p103 == 'Boxed Cars' then
            _G.Teleport(CFrame.new(509, 3, -1458))
        elseif p103 == 'Ice Mountain' then
            _G.Teleport(CFrame.new(1487, 415, 3259))
        elseif p103 == 'Links Logic' then
            _G.Teleport(CFrame.new(4615, 7, -794))
        elseif p103 == 'Bobs Shack' then
            _G.Teleport(CFrame.new(292, 8, -2544))
        elseif p103 == 'Fine Arts Store' then
            _G.Teleport(CFrame.new(5217, -166, 721))
        elseif p103 == 'Shrine Of Sight' then
            _G.Teleport(CFrame.new(-1608, 195, 928))
        elseif p103 == 'Strange Man' then
            _G.Teleport(CFrame.new(1071, 16, 1141))
        elseif p103 == 'Volcano Win' then
            _G.Teleport(CFrame.new(-1667, 349, 1474))
        elseif p103 == 'Ski Lodge' then
            _G.Teleport(CFrame.new(1244, 59, 2290))
        elseif p103 == 'Fur Wood' then
            _G.Teleport(CFrame.new(-1080, -5, -942))
        elseif p103 == 'The Den' then
            _G.Teleport(CFrame.new(330.259735, 45.7998505, 1943.30823, 0.972010553, -8.07546598e-8, 0.234937176, 7.63610259e-8, 1, 2.77986647e-8, -0.234937176, -9.080551419999999e-9, 0.972010553))
        end
    end)

    local _funny = _Player:Section('funny')

    _funny:Toggle('Fire', false, function(p104)
        if p104 then
            Instance.new('Fire', _G.Character.Head)
        else
            _G.Character.Head:FindFirstChild('Fire'):Destroy()
        end
    end)
    _funny:Toggle('Sparkles', false, function(p105)
        if p105 then
            Instance.new('Sparkles', _G.Character.Head)
        else
            _G.Character.Head:FindFirstChild('Sparkles'):Destroy()
        end
    end)

    _G.AutoGetSharkAxe = nil
    _G.AutoGetSharkAxe = function(p106)
        if p106 then
            _G.AutoGetSharkAxe = game.Workspace.PlayerModels.ChildAdded:Connect(function(p107)
                local _Main = p107:WaitForChild('Main', 60)
                local _CFrame2 = _G.RootPart.CFrame

                if _Main:FindFirstChild('Mesh') and _Main.Mesh.TextureId == 'rbxassetid://273892918' then
                    repeat
                        wait()
                    until p107:FindFirstChild('ToolName')

                    if p107.Owner.Value == nil then
                        _G.Notify('Calming Rukiryaxe')
                        _G.Teleport(p107.Main.CFrame)

                        repeat
                            task.wait()
                            _G.PullItems:FireServer(p107)
                            game.ReplicatedStorage.Interaction.ClientInteracted:FireServer(p107, 'Pick up tool')
                        until tostring(p107.Parent) ~= 'PlayerModels'
                    end

                    _G.Teleport(_CFrame2)
                end
            end)
        else
            pcall(function()
                _G.AutoGetSharkAxe:Disconnect()

                _G.AutoGetSharkAxe = nil
            end)
        end
    end

    local _ScreenGui3 = Instance.new('ScreenGui')
    local _Frame19 = Instance.new('Frame')
    local _UICorner27 = Instance.new('UICorner')
    local _ScrollingFrame4 = Instance.new('ScrollingFrame')
    local _UIGridLayout = Instance.new('UIGridLayout')

    _ScreenGui3.Name = 'DarkX'
    _ScreenGui3.Parent = game:GetService('RunService'):IsStudio() and game.Players.LocalPlayer:WaitForChild('PlayerGui') or game:WaitForChild('CoreGui')
    _ScreenGui3.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    _ScreenGui3.Enabled = false
    _Frame19.Name = 'MainC'
    _Frame19.Parent = _ScreenGui3
    _Frame19.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
    _Frame19.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _Frame19.BorderSizePixel = 0
    _Frame19.Position = UDim2.new(0.382168919, 0, 0.256493509, 0)
    _Frame19.Size = UDim2.new(0, 451, 0, 450)
    _Frame19.Active = true
    _Frame19.Draggable = true
    _UICorner27.CornerRadius = UDim.new(0, 5)
    _UICorner27.Name = 'MainC'
    _UICorner27.Parent = _Frame19
    _ScrollingFrame4.Name = 'Holder'
    _ScrollingFrame4.Parent = _Frame19
    _ScrollingFrame4.Active = true
    _ScrollingFrame4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _ScrollingFrame4.BackgroundTransparency = 1
    _ScrollingFrame4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _ScrollingFrame4.BorderSizePixel = 0
    _ScrollingFrame4.Position = UDim2.new(0.0133037698, 0, 0.0222222228, 0)
    _ScrollingFrame4.Size = UDim2.new(0, 437, 0, 431)
    _ScrollingFrame4.ScrollBarThickness = 3
    _UIGridLayout.Name = 'HolderC'
    _UIGridLayout.Parent = _ScrollingFrame4
    _UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder

    _UIGridLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
        _ScrollingFrame4.CanvasSize = UDim2.new(0, 0, 0, _UIGridLayout.AbsoluteContentSize.Y + 14)
    end)

    CreateSlot = function(p108)
        assert(p108, 'An immage is required')

        local _ImageLabel5 = Instance.new('ImageLabel')
        local _UICorner28 = Instance.new('UICorner')

        _ImageLabel5.Name = 'ImageSlot'
        _ImageLabel5.Parent = _ScrollingFrame4
        _ImageLabel5.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
        _ImageLabel5.BorderColor3 = Color3.fromRGB(0, 0, 0)
        _ImageLabel5.BorderSizePixel = 0
        _ImageLabel5.Position = UDim2.new(0, 0, 0.00928074215, 0)
        _ImageLabel5.Size = UDim2.new(0, 100, 0, 100)
        _UICorner28.CornerRadius = UDim.new(0, 5)
        _UICorner28.Name = 'ImageSlotC'
        _UICorner28.Parent = _ImageLabel5
        _ImageLabel5.Image = p108 or ''
    end

    local v179 = next
    local v180, v181 = game:GetService('ReplicatedStorage').ClientItemInfo:GetChildren()

    for _, v182 in v179, v180, v181 do
        if v182:FindFirstChild('ItemImage') then
            CreateSlot(v182.ItemImage.Value)
        end
    end

    local _World = v54:CreateTab('World', '6034287522'):Section('World')

    _World:Toggle('Always Day', false, function(p109)
        _G.Menu.AlwaysDay = p109
    end)
    _World:Toggle('Always Night', false, function(p110)
        _G.Menu.AlwaysNight = p110
    end)
    _World:Toggle('Remove Fog', false, function(p111)
        _G.Menu.NoFog = p111
    end)

    _G.Light.GlobalShadows = false

    _World:Toggle('Always Shadows', true, function(p112)
        _G.Light.GlobalShadows = p112
    end)
    _World:Toggle('Walk On Water', false, function(p113)
        local v183 = next
        local v184, v185 = game.Workspace.Water:GetChildren()

        for _, v186 in v183, v184, v185 do
            if v186.ClassName == 'Part' then
                v186.CanCollide = p113
            end
        end

        local v187 = next
        local v188, v189 = game.Workspace.Bridge.VerticalLiftBridge.WaterModel:GetChildren()

        for _, v190 in v187, v188, v189 do
            if v190:IsA('BasePart') then
                v190.CanCollide = p113
            end
        end
    end)
    _World:Toggle('Remove Water', false, function(p114)
        local v191 = next
        local v192, v193 = game.Workspace.Water:GetChildren()

        for _, v194 in v191, v192, v193 do
            if v194.Name == 'Water' then
                if p114 then
                    v194.Transparency = 1
                else
                    v194.Transparency = 0
                end
            end
        end
    end)
    _World:Button('Remove Volcano Boulders', function()
        game:GetService('Workspace').Region_Volcano.PartSpawner:Destroy()
    end)
    _World:Toggle('Bridge', false, function(p115)
        local v195 = next
        local v196, v197 = game:GetService('Workspace').Bridge.VerticalLiftBridge.Lift:GetChildren()

        for _, v198 in v195, v196, v197 do
            if p115 then
                v198.CFrame = v198.CFrame + Vector3.new(0, -26, 0)
            else
                v198.CFrame = v198.CFrame + Vector3.new(0, 26, 0)
            end
        end
    end)
    _World:Toggle('Auto Calm Rukiryaxe ', false, function(p116)
        _G.AutoGetSharkAxe(p116)

        _G.Menu.AutoGetSharkAxe = p116
    end)
    _World:Toggle('Water Gold Mode ', false, function(p117)
        _G.Menu.WaterInvincible = p117
    end)
    _World:Toggle('Leaked item  ', false, function(p118)
        _ScreenGui3.Enabled = p118
    end)
    _World:Button('Bring Swamp Bridge', function()
        local _CFrame3 = _G.RootPart.CFrame
        local _Slab = game:GetService('Workspace').Region_Mountainside.SlabRegen:FindFirstChild('Slab')

        if _Slab and not _Slab.PrimaryPart then
            _Slab.PrimaryPart = _Slab.PushMe
        end

        wait()

        for _ = 1, 6 do
            _G.PullItems:FireServer(_Slab.PrimaryPart)
            _Slab:PivotTo(_CFrame3)
            _G.PullItems:FireServer(_Slab.Slider)
            task.wait()
        end
    end)

    _G.ProcessTree = function(p119)
        local v199 = _G
        local v200 = _G
        local v201, v202 = _G.CheckAxe(p119.TreeClass.Value)

        v200.Damage = v202
        v199.Axe = v201

        if _G.Damage then
            _G.Sawmill = _G.Menu.SelectedSawmill.Particles.CFrame + Vector3.new(0.7, 0, 0)
            _G.Keep = nil

            local _CFrame4 = _G.LocalPlayer.Character.HumanoidRootPart.CFrame
            local v203 = next
            local v204, v205 = p119:GetChildren()

            for _, v206 in v203, v204, v205 do
                if tostring(p119.TreeClass.Value) == 'Pine' or tostring(p119.TreeClass.Value) == 'Fir' then
                    local v207 = v206:GetChildren()
                    local v208 = 0

                    for _, v209 in next, v207 do
                        if v209.Name == 'WoodSection' then
                            v208 = v208 + 1
                        end
                    end

                    if v208 >= 2 then
                        for _, v210 in next, v207 do
                            if v210.Name == 'WoodSection' then
                                if v210:WaitForChild('ID').Value ~= 1 then
                                    if #v210:FindFirstChild('ChildIDs'):GetChildren() == 0 then
                                        if v210:FindFirstChild('ParentID') then
                                            if v210.ParentID.Value == 1 then
                                                local v211 = _G

                                                if _G.Keep or not v210 then
                                                    v210 = _G.Keep
                                                end

                                                v211.Keep = v210
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                elseif v206.Name == 'WoodSection' then
                    if v206:WaitForChild('ID').Value ~= 1 then
                        if #v206:FindFirstChild('ChildIDs'):GetChildren() == 0 then
                            if v206:FindFirstChild('ParentID') then
                                if v206.ParentID.Value ~= 1 then
                                    local v212 = _G
                                    local v213

                                    if _G.Keep or not v206 then
                                        v213 = _G.Keep
                                    else
                                        v213 = v206
                                    end

                                    v212.Keep = v213

                                    if v206.Size.Z < _G.Keep.Size.Z then
                                        wait()

                                        _G.Keep = v206
                                    end
                                end
                            end
                        end
                    end
                end
            end

            _G.Burn = nil

            local v214 = next
            local v215, v216 = _G.Keep.Parent:GetChildren()

            for _, v217 in v214, v215, v216 do
                if v217.Name == 'WoodSection' then
                    if v217:WaitForChild('ID').Value == _G.Keep.ParentID.Value then
                        wait()

                        _G.Burn = v217
                    end
                end
            end

            if _G.Burn and _G.Keep then
                local _BoxHandleAdornment = Instance.new('BoxHandleAdornment', _G.Keep)

                _BoxHandleAdornment.Name = 'Selection'
                _BoxHandleAdornment.Adornee = _BoxHandleAdornment.Parent
                _BoxHandleAdornment.AlwaysOnTop = true
                _BoxHandleAdornment.ZIndex = 0
                _BoxHandleAdornment.Size = _BoxHandleAdornment.Parent.Size
                _BoxHandleAdornment.Transparency = 0
                _BoxHandleAdornment.Color = BrickColor.new('Lime green')
                _G.Menu.Fly = true

                spawn(function()
                    _G.Fly(true)
                end)

                _G.OldFlySpeed = _G.Menu.FlySpeed
                _G.Menu.FlySpeed = 0

                _G.Teleport(p119.WoodSection.CFrame)

                repeat
                    spawn(function()
                        _G.PullItems:FireServer(p119)
                        p119:PivotTo(CFrame.new(-1665.86548, 355.800415, 1478.47742))
                        pcall(function()
                            spawn(function()
                                _G.Lava.Size = Vector3.new(0, 0, 0)
                                _G.Lava.Size = Vector3.new(0, 0, 0)
                            end)

                            _G.Lava.CFrame = _G.Burn.CFrame
                            _G.Lava.Size = Vector3.new(0, 0, 0)
                            _G.Lava.Size = Vector3.new(0, 0, 0)
                            _G.Lava.Size = Vector3.new(0, 0, 0)
                        end)
                    end)
                    game['Run Service'].Heartbeat:wait()
                until _G.Burn:FindFirstChild('LavaFire')

                _G.Lava.CFrame = CFrame.new(-1675.2002, 255.002533, 1284.19983, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)

                _G.Burn:FindFirstChild('LavaFire'):Destroy()

                local u56 = false

                _G.Burn.AncestryChanged:Connect(function()
                    u56 = true
                end)
                _G.PullItems:FireServer(p119)

                for _ = 1, 30 do
                    _G.PullItems:FireServer(p119)

                    p119.WoodSection.Velocity = Vector3.new(0, 0, 0)
                    p119.WoodSection.RotVelocity = Vector3.new(0, 0, 0)

                    p119:PivotTo(CFrame.new(-904, 150, -3396))
                    _G.PullItems:FireServer(p119)
                    task.wait()
                end

                _G.Teleport(_G.Burn.CFrame)

                repeat
                    _G.PullItems:FireServer(p119)
                    _G.Burn:PivotTo(CFrame.new(315, 5, 85.4999924))
                    _G.PullItems:FireServer(p119)
                    game['Run Service'].Heartbeat:wait()
                until u56

                _G.Done = false

                local v218 = game:GetService('Workspace').LogModels.ChildAdded:Connect(function(p120)
                    if p120:WaitForChild('Owner', 1).Value == _G.LocalPlayer then
                        _G.Done = true
                    end
                end)

                _G.Menu.Fly = false

                spawn(function()
                    _G.Fly(false)
                end)

                _G.Menu.FlySpeed = _G.OldFlySpeed

                _G.Teleport(CFrame.new(p119.WoodSection.CFrame.p) + Vector3.new(3, 0, 0))
                spawn(function()
                    repeat
                        _G.PullItems:FireServer(p119)

                        _G.Keep.Velocity = Vector3.new()
                        _G.Keep.RotVelocity = Vector3.new()

                        _G.Keep:PivotTo(_G.Sawmill)
                        game['Run Service'].Heartbeat:wait()
                    until _G.Done == true
                end)

                repeat
                    _G.Teleport(CFrame.new(p119.WoodSection.CFrame.p) + Vector3.new(5, 0, 0))
                    _G.Chop(p119.CutEvent, _G.Axe, 1, 0.3, _G.Damage)
                    game['Run Service'].Heartbeat:wait()
                until _G.Done == true or p119.Parent == nil

                v218:Disconnect()
                _G.Teleport(_CFrame4)

                return
            else
                return _G.Notify('cant mod this wood')
            end
        else
            return _G.Notify('you need one axe')
        end
    end

    local _Wood = v54:CreateTab('Wood', '6034503369')
    local _BringTree = _Wood:Section('Bring Tree')

    _BringTree:DropDown('Select Tree', {
        'Generic',
        'GoldSwampy',
        'CaveCrawler',
        'Cherry',
        'Frost',
        'Volcano',
        'Oak',
        'Walnut',
        'Birch',
        'SnowGlow',
        'Pine',
        'GreenSwampy',
        'Koa',
        'Palm',
        'LoneCave',
        'Spooky',
        'SpookyNeon',
    }, false, false, function(p121)
        _G.Menu.SelectedTree = p121
    end)
    _BringTree:DropDown('Select TreeGetMethod', {
        'Largest',
        'Smallest',
    }, false, false, function(p122)
        if p122 == 'Largest' then
            _G.Menu.TreeSize = 'big'
        else
            _G.Menu.TreeSize = 'Smallest'
        end
    end)
    _BringTree:TextBox('Tree Amount', '1', function(p123)
        _G.Menu.BringTreeCount = tonumber(p123)
    end)
    _BringTree:Button('Bring', function()
        _G.Menu.TreePlaceLocation = _G.RootPart.CFrame
        _G.Menu.StopChopTree = false

        for _ = 1, _G.Menu.BringTreeCountdo
            _G.BringTree(_G.Menu.SelectedTree)
            task.wait()
        end

        if _G.Menu.SelectedTree ~= 'LoneCave' then
            _G.Teleport(_G.Menu.TreePlaceLocation)
        end
    end)
    _BringTree:Button('Abort', function()
        _G.Menu.StopChopTree = true
    end)
    _BringTree:Button('tp to Spooky /SpookyNeon  tree', function()
        local v219 = next
        local v220, v221 = Workspace:GetChildren()

        for _, v222 in v219, v220, v221 do
            if v222.Name == 'TreeRegion' then
                local v223 = next
                local v224, v225 = v222:GetChildren()

                for _, v226 in v223, v224, v225 do
                    if v226:FindFirstChild('TreeClass') then
                        if v226:FindFirstChild('Owner') then
                            if tostring(v226.TreeClass.Value) == 'Spooky' or tostring(v226.TreeClass.Value) == 'SpookyNeon' then
                                if v226.Owner.Value == nil or tostring(v226.Owner.Value) == _G.LocalPlayer then
                                    if v226:FindFirstChild('WoodSection') then
                                        _G.Teleport(v226.WoodSection.CFrame)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end)

    _G.SelectSawmill = function()
        local u57 = nil

        _G.Notify('Click one  Sawmill')

        local v227 = _G.Mouse.Button1Up:Connect(function()
            wait()

            local _Parent = _G.Mouse.Target.Parent

            if _Parent:FindFirstChild('Settings') and _Parent.Settings:FindFirstChild('DimZ') then
                u57 = _Parent

                _G.Notify('Sawmill Selected')
            elseif _Parent.Parent:FindFirstChild('Settings') and _Parent.Parent.Settings:FindFirstChild('DimZ') then
                u57 = _Parent.Parent

                _G.Notify('Sawmill Selected')
            end
        end)

        repeat
            task.wait(0.1)
        until u57 ~= nil

        v227:Disconnect()

        return u57
    end

    local _Mod = _Wood:Section('Mod')

    _G.ProcessTreeSawmill = _Mod:Label('Please Selecet one Sawmill')

    _Mod:Button('select Sawmill', function()
        _G.Menu.SelectedSawmill = _G.SelectSawmill()
        _G.ProcessTreeSawmill.Text = 'Selected'
    end)
    _Mod:Button('Mod Wood', function()
        if _G.Menu.SelectedSawmill ~= nil then
            local u58 = nil

            if _G.Menu.ProcessingTree ~= true then
                _G.Menu.ProcessingTree = true

                _G.Notify('Click one Wood ')

                local v228 = _G.Mouse.Button1Up:Connect(function()
                    wait()

                    local _Parent2 = _G.Mouse.Target.Parent

                    if _Parent2:FindFirstChild('Owner') and (_Parent2.Owner.Value == _G.LocalPlayer and _Parent2:FindFirstChild('WoodSection')) and not (_Parent2:FindFirstAncestor('TreeRegion') or _Parent2:FindFirstChild('RootCut')) then
                        wait()

                        u58 = _Parent2

                        _G.Notify('Wood Selected')
                    end
                end)

                repeat
                    task.wait(0.1)
                until u58 ~= nil

                v228:Disconnect()
                _G.ProcessTree(u58)

                _G.Menu.ProcessingTree = false

                return
            else
                return _G.Notify('you are using this feature')
            end
        else
            return _G.Notify('select Sawmail At First')
        end
    end)
    _Mod:Button('Mod Sawmill', function()
        if not _G.LocalPlayer.PlayerBlueprints.Blueprints:FindFirstChild('Floor2') then
            local v229 = game.Workspace.PlayerModels.ChildAdded:connect(function(p124)
                spawn(function()
                    if p124.Type.Value == 'Blueprint' then
                        game:GetService('ReplicatedStorage').Interaction.ClientInteracted:FireServer(p124, 'Open box')
                    end
                end)
            end)

            _G.AutoBuyV2('Floor2', 1)
            wait(1)
            v229:Disconnect()
        end

        local v230 = nil
        local v231 = _G.Menu.SelectedSawmill.Conveyor.Model:GetChildren()
        local _Y = _G.Menu.SelectedSawmill.Main.Orientation.Y

        for v232 = _G.Menu.SelectedSawmill.ItemName.Value:match('Sawmill4L') and #v231 - 1 or #v231, #v231 do
            break
        end

        v230 = v231[v232]

        local v233 = 0.4

        for _ = 1, 4 do
            v233 = v233 + 0.2

            local _ClientPlacedBlueprint = game.ReplicatedStorage.PlaceStructure.ClientPlacedBlueprint
            local _FireServer = _ClientPlacedBlueprint.FireServer
            local v234 = 'Floor2'
            local _new = CFrame.new
            local _p = v230.CFrame.p
            local _new2 = Vector3.new
            local v235 = _Y == 0 and -v233 or (_Y == 180 and v233 and v233 or 0)
            local v236 = 1.5
            local v237 = _Y == -90 and -v233

            if not v237 then
                if _Y == 90 then
                    v237 = v233
                else
                    v237 = false
                end
            end

            _FireServer(_ClientPlacedBlueprint, v234, _new(_p + _new2(v235, v236, v237)) * CFrame.Angles(math.rad((_Y == 180 or _Y == 0) and 90 or 45), math.rad((_Y == 180 or _Y == 0) and 0 or 90), math.rad((_Y == 180 or _Y == 0) and 90 or 45)), _G.LocalPlayer)
            task.wait(1.5)
        end
    end)
    _Mod:Button('Max Sawmill Settings', function()
        if _G.Menu.SelectedSawmill ~= nil then
            for _ = 1, 20 do
                game:GetService('ReplicatedStorage').Interaction.RemoteProxy:FireServer(_G.Menu.SelectedSawmill.ButtonRemote_XUp)
                task.wait(1)
                game:GetService('ReplicatedStorage').Interaction.RemoteProxy:FireServer(_G.Menu.SelectedSawmill.ButtonRemote_YUp)
                task.wait(1)
            end

            return
        else
            return _G.Notify('select Sawmail At First')
        end
    end)
    _Mod:Button('Lowest Sawmill Settings', function()
        if _G.Menu.SelectedSawmill ~= nil then
            for _ = 1, 20 do
                game:GetService('ReplicatedStorage').Interaction.RemoteProxy:FireServer(_G.Menu.SelectedSawmill.ButtonRemote_XDown)
                task.wait(1)
                game:GetService('ReplicatedStorage').Interaction.RemoteProxy:FireServer(_G.Menu.SelectedSawmill.ButtonRemote_YDown)
                task.wait(1)
            end

            return
        else
            return _G.Notify('select Sawmail At First')
        end
    end)

    _G.GetEgg = function()
        local _CFrame5 = _G.RootPart.CFrame
        local v238 = next
        local v239, v240 = Workspace:GetChildren()
        local v241 = nil

        for _, v242 in v238, v239, v240 do
            if v242.Name == 'TreeRegion' then
                local v243 = next
                local v244, v245 = v242:GetChildren()

                for _, v246 in v243, v244, v245 do
                    if v246:FindFirstChild('TreeClass') then
                        if tostring(v246.TreeClass.Value) == 'Oak' then
                            if v246:FindFirstChild('Owner') then
                                if v246.Owner.Value == nil or v246.Owner.Value == _G.LocalPlayer then
                                    if v246:FindFirstChild('WoodSection') then
                                        local v247 = next
                                        local v248, v249 = v246:GetChildren()

                                        for _, v250 in v247, v248, v249 do
                                            if v250.Name == 'WoodSection' then
                                                local v251 = v250.Size.X * 4 * v250.Size.Z

                                                if v250:FindFirstChild('ID') then
                                                    if v251 > 8 then
                                                        if #v250.ChildIDs:GetChildren() == 0 then
                                                            if v250.Size.Y > 4 then
                                                                v241 = v250
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end

        local u59 = false
        local v252 = Workspace.LogModels.ChildAdded:Connect(function(p125)
            p125:WaitForChild('Owner', 60)
            p125:WaitForChild('Owner', 60)

            p125.PrimaryPart = p125:WaitForChild('WoodSection', 60)

            if p125:WaitForChild('Owner', 60).Value == _G.LocalPlayer and tostring(p125.TreeClass.Value) == 'Oak' then
                u59 = true

                _G.Teleport(p125.WoodSection.CFrame)
                u49(p125, workspace.Egger.Pedestal.Zone.CFrame)
                _G.Teleport(workspace.Egger.Pedestal.Zone.CFrame + Vector3.new(5, 0, 0))
            end
        end)
        local _Oak, v253 = _G.CheckAxe('Oak')

        repeat
            game['Run Service'].Heartbeat:wait()
            _G.Teleport(v241.CFrame + Vector3.new(3, 0, 0))
            _G.Chop(v241.Parent.CutEvent, _Oak, v241.ID.Value, v241.Size.Y - 4 / (v241.Size.X * v241.Size.X) + 0.01, v253)
        until u59

        v252:Disconnect()

        local u60 = false
        local v254 = workspace.PlayerModels.ChildAdded:Connect(function(p126)
            p126:WaitForChild('Owner', 60)
            p126:WaitForChild('Owner', 60)

            p126.PrimaryPart = p126:WaitForChild('Main', 60)

            if p126:WaitForChild('Owner', 60).Value == _G.LocalPlayer and tostring(p126.ItemName.Value) == 'HuntEgg1' then
                u60 = true

                wait(1)
                _G.Teleport(p126.Main.CFrame)
                u49(p126, _CFrame5)
                _G.Teleport(_CFrame5)
            end
        end)

        repeat
            wait()
        until u60

        v254:Disconnect()
    end
    _G.AutoMoney = function(p127)
        if p127 then
            _G.AlreadyProcessed = false
            _G.TreeJoined = game.Workspace.LogModels.ChildAdded:Connect(function(p128)
                local _Owner = p128:WaitForChild('Owner', 60)

                p128.PrimaryPart = p128:FindFirstChild('WoodSection')
                _G.SellPlanks = nil

                if _Owner.Value == _G.LocalPlayer and _Owner.Value == _G.TreeType then
                    _G.AlreadyProcessed = false

                    if _G.Menu.ProcessChoppedWood then
                        _G.ProcessTree(p128)

                        _G.SellPlanks = game.Workspace.PlayerModels.ChildAdded:connect(function(p129)
                            if p129:FindFirstChild('Owner') and (p129.Owner.Value == _G.LocalPlayer and not p129:FindFirstChild('TreeClass')) and p129:FindFirstChild('WoodSection') then
                                repeat
                                    wait()
                                until p129:FindFirstChild('TreeClass')

                                _G.Teleport(p129.WoodSection.CFrame)

                                for _ = 1, 2 do
                                    for _ = 1, 10 do
                                        _G.PullItems:FireServer(p129)
                                        task.wait()
                                    end

                                    p129:PivotTo(CFrame.new(315, 0, 84))
                                    game.ReplicatedStorage.TestPing:InvokeServer()
                                    game.ReplicatedStorage.TestPing:InvokeServer()
                                    task.wait()
                                end
                            end

                            _G.Teleport(CFrame.new(315, 0, 84))

                            _G.AlreadyProcessed = true

                            wait(0.2)

                            _G.AlreadyProcessed = false

                            pcall(function()
                                _G.SellPlanks:Disconnect()

                                _G.SellPlanks = nil
                            end)
                        end)
                    else
                        _G.SellWood()

                        _G.AlreadyProcessed = true
                    end
                end
            end)

            while task.wait(0.1) do
                if p127 then
                    _G.AlreadyProcessed = false

                    _G.BringTree(_G.Menu.SelectedTree)
                    task.wait()

                    _G.AlreadyProcessed = false
                    _G.AlreadyProcessed = false

                    task.wait(0.2)

                    if _G.AlreadyProcessed ~= true then
                        break
                    end
                end
            end
        else
            _G.TreeJoined:Disconnect()

            _G.TreeJoined = nil
        end
    end
    _G.ChopDone = false
    _G.AutoChop = function(p130)
        if p130 then
            _G.Menu.AutoChopLink = game:GetService('Workspace').LogModels.ChildAdded:Connect(function(p131)
                if p131:WaitForChild('Owner').Value == _G.LocalPlayer then
                    _G.ChopDone = true
                end
            end)
            _G.Menu.AutoChop = _G.Mouse.Button1Up:Connect(function()
                if _G.Mouse.Target.Name ~= 'WoodSection' or tostring(_G.Mouse.Target.Parent.Owner.Value) ~= 'nil' and not _G.LocalPlayer.Name then
                else
                    _G.SelectedWood = _G.Mouse.Target
                    _G.ChopDone = false
                    _G.ChopLocation = _G.SelectedWood.CFrame:pointToObjectSpace(_G.Mouse.Hit.p).Y + _G.SelectedWood.Size.Y / 2

                    local v255 = _G
                    local v256 = _G
                    local v257, v258 = _G.CheckAxe(_G.SelectedWood.Parent.TreeClass.Value)

                    v256.Damage = v258
                    v255.Axe = v257

                    if _G.Damage then
                        while _G.Menu.AutoChopEnabled do
                            _G.Chop(_G.SelectedWood.Parent.CutEvent, _G.Axe, _G.SelectedWood.ID.Value, _G.ChopLocation, _G.Damage)
                            task.wait()

                            if _G.ChopDone == true then
                                break
                            end
                        end

                        _G.ChopDone = false

                        if _G.ChopDone then
                            _G.Notify('Finished Cutting')
                        end
                    else
                        return _G.Notify('you need one axe')
                    end
                end

                return
            end)

            return
        else
            _G.Menu.AutoChop:Disconnect()
            _G.Menu.AutoChopLink:Disconnect()

            return
        end
    end

    _Mod:Button('Get egg', function()
        _G.GetEgg()
    end)
    _Mod:Toggle('Auto Farm', false, function(p132)
        _G.AutoMoney(p132)
    end)
    _Mod:Toggle('Mod Cut Wood', false, function(p133)
        if p133 and _G.Menu.SelectedSawmill == nil then
            return _G.Notify('select Sawmail At First')
        else
            _G.Menu.ProcessChoppedWood = p133

            return
        end
    end)

    local _Misc = _Wood:Section('Misc')

    _Misc:Toggle('One Unit Cutter', false, function(p134)
        if p134 then
            _G.ChoppedPlank = nil
            _G.PlankAdded = game:GetService('Workspace').PlayerModels.ChildAdded:Connect(function(p135)
                if p135:WaitForChild('TreeClass') and p135:WaitForChild('WoodSection') then
                    _G.ChoppedPlank = p135

                    task.wait()
                end
            end)
            _G.ChopTree = _G.Mouse.Button1Up:Connect(function()
                local _Target = _G.Mouse.Target

                if _Target.Name == 'WoodSection' then
                    _G.ChoppedPlank = _Target.Parent

                    _G.Teleport(_Target.CFrame + Vector3.new(0, 3, -3))

                    local v259 = _G
                    local v260 = _G
                    local v261, v262 = _G.CheckAxe(_G.ChoppedPlank.TreeClass.Value)

                    v260.Damage = v262
                    v259.Axe = v261

                    while p134 ~= false do
                        _G.Chop(_G.ChoppedPlank.CutEvent, _G.Axe, 1, 1, _G.Damage)

                        if _G.ChoppedPlank:FindFirstChild('Cut') then
                            _G.Teleport(_G.ChoppedPlank:FindFirstChild('Cut').CFrame + Vector3.new(0, 3, -3))
                        end

                        task.wait()

                        if _G.ChoppedPlank.WoodSection.Size.X <= 1.88 and _G.ChoppedPlank.WoodSection.Size.Y <= 1.88 and _G.ChoppedPlank.WoodSection.Size.Z <= 1.88 then
                            break
                        end
                    end
                end
            end)

            return
        else
            _G.PlankAdded:Disconnect()
            _G.ChopTree:Disconnect()

            return
        end
    end)
    _Misc:Button('Cut Tree Joints', function()
        local u61 = nil

        _G.Notify('Click one Wood')

        local v263 = _G.Mouse.Button1Up:Connect(function()
            wait()

            local _Parent3 = _G.Mouse.Target.Parent

            if _Parent3:FindFirstChild('Owner') and (_Parent3.Owner.Value == _G.LocalPlayer and _Parent3:FindFirstChild('WoodSection')) and not (_Parent3:FindFirstAncestor('TreeRegion') or _Parent3:FindFirstChild('RootCut')) then
                wait()

                u61 = _Parent3

                _G.Notify('Clicked')
            end
        end)

        repeat
            task.wait(0.1)
        until u61 ~= nil

        v263:Disconnect()

        _G.TreeToChop = {}

        local v264 = next
        local v265 = u61
        local v266, v267 = u61.GetChildren(v265)

        for _, v268 in v264, v266, v267 do
            if v268:FindFirstChild('Tree Weld') then
                table.insert(_G.TreeToChop, v268)
            end
        end

        local v269 = _G
        local v270 = _G
        local v271, v272 = _G.CheckAxe(u61.TreeClass.Value)

        v270.Damage = v272
        v269.Axe = v271

        if _G.Damage then
            local u62 = false
            local u63 = game:GetService('Workspace').LogModels.ChildAdded:Connect(function(p136)
                p136:WaitForChild('Owner')

                if p136.Owner.Value == _G.LocalPlayer then
                    u62 = true
                end
            end)

            for _, v273 in next, _G.TreeToChopdo
                _G.Teleport(CFrame.new(v273.Parent.WoodSection.CFrame.p) - Vector3.new(3, 0, 0))

                repeat
                    local v274 = _G
                    local v275 = _G
                    local v276, v277 = _G.CheckAxe(v273.Parent.TreeClass.Value)

                    v275.Damage = v277
                    v274.Axe = v276

                    _G.Chop(v273.Parent.CutEvent, _G.Axe, v273.ID.Value, v273.Size.Y - 0.1, _G.Damage)
                    game['Run Service'].Heartbeat:wait()
                until u62 == true

                u62 = false

                task.wait(0.1)
            end

            pcall(function()
                u63:Disconnect()

                u63 = nil
            end)

            return
        else
            return _G['you need one axe']
        end
    end)
    _Misc:Toggle('Auto Chop', false, function(p137)
        _G.Menu.AutoChopEnabled = p137

        _G.AutoChop(p137)
    end)
    _Misc:Toggle('Hard Dragger', false, function(p138)
        _G.Menu.SuperStrength = p138
    end)
    _Misc:Toggle('View phantom tree', false, function(p139)
        if p139 then
            local v278 = next
            local v279, v280 = game.Workspace:GetChildren()
            local v281 = nil

            for _, v282 in v278, v279, v280 do
                if v282.Name == 'TreeRegion' then
                    if v282:FindFirstChildOfClass('Model') then
                        if v282.Model.TreeClass.Value == 'LoneCave' then
                            game.Workspace.Camera.CameraSubject = v282.Model.WoodSection
                            v281 = true
                        end
                    end
                end
            end

            if v281 then
            else
                return _G.Notify('Not Found Phantom Tree ')
            end
        else
            game.Workspace.Camera.CameraSubject = _G.Humanoid
        end

        return
    end)

    _G.ClickSellPlank = nil
    _G.MouseMove = nil

    _Misc:Toggle('Click to Sell Plank', false, function(p140)
        if p140 then
            _G.ClickSellWoodSelect = Instance.new('SelectionBox', game.Workspace.PlayerModels)
            _G.MouseMove = _G.Mouse.Move:Connect(function()
                _G.Click = _G.Mouse.Target

                if _G.Click.Parent:FindFirstChild('Owner') and _G.Click.Parent.Owner.Value == _G.LocalPlayer and (_G.Click.Parent:FindFirstChild('TreeClass') and _G.Click:FindFirstAncestor('PlayerModels')) then
                    _G.ClickSellWoodSelect.LineThickness = 0.1
                    _G.ClickSellWoodSelect.Adornee = _G.Mouse.Target
                    _G.ClickSellWoodSelect.Color3 = Color3.new(1, 0, 0)
                else
                    _G.ClickSellWoodSelect.Adornee = game.Workspace.PlayerModels
                end
            end)
            _G.ClickSellPlank = _G.Mouse.Button1Up:Connect(function()
                _G.Click2 = _G.Mouse.Target

                if _G.Click2.Parent:FindFirstChild('Owner') and _G.Click2.Parent.Owner.Value == _G.LocalPlayer and (_G.Click2.Parent:FindFirstChild('TreeClass') and _G.Click2.Parent:FindFirstAncestor('PlayerModels')) and _G.Click2.Parent:FindFirstChild('WoodSection') then
                    local _CFrame6 = _G.RootPart.CFrame

                    _G.Teleport(_G.Click2.Parent.WoodSection.CFrame)
                    spawn(function()
                        for _ = 1, 30 do
                            if _G.Click2.Parent:FindFirstChild('Owner') then
                                if _G.Click2.Parent.Owner.Value == _G.LocalPlayer then
                                    if _G.Click2.Parent:FindFirstChild('TreeClass') then
                                        if _G.Click2.Parent:FindFirstAncestor('PlayerModels') then
                                            if _G.Click2.Parent:FindFirstChild('WoodSection') then
                                                pcall(function()
                                                    _G.PullItems:FireServer(_G.Click2.Parent)
                                                    _G.Click2.Parent:PivotTo(CFrame.new(315, 0, 85.4999924))
                                                end)
                                                game['Run Service'].Heartbeat:wait()
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end)
                    wait(0.2)
                    _G.Teleport(_CFrame6)
                    task.wait(0.5)

                    _G.Click2.Anchored = true
                end
            end)
        else
            pcall(function()
                _G.ClickSellWoodSelect:Destroy()
            end)
            _G.ClickSellPlank:Disconnect()
            _G.MouseMove:Disconnect()

            _G.ClickSellPlank = nil
            _G.MouseMove = nil
        end
    end)
    _Misc:Button('Bring All Tree', function()
        local _CFrame7 = _G.RootPart.CFrame
        local v283 = next
        local v284, v285 = game:GetService('Workspace').LogModels:GetChildren()

        for _, v286 in v283, v284, v285 do
            if v286:FindFirstChild('Owner') then
                if v286.Owner.Value == _G.LocalPlayer then
                    _G.Teleport(v286.WoodSection.CFrame)

                    for _ = 1, 20 do
                        _G.PullItems:FireServer(v286)
                        v286:PivotTo(_CFrame7)
                        game:GetService('RunService').Stepped:wait()
                    end
                end

                task.wait()
            end
        end

        task.wait()
        _G.Teleport(_CFrame7)
        _G.Notify('Done')
    end)
    _Misc:Button('Sell All Tree', function()
        _G.SellWood()
        _G.Notify('Done')
    end)
    _Misc:Button('Bring All Plank', function()
        local _CFrame8 = _G.RootPart.CFrame
        local v287 = next
        local v288, v289 = game.Workspace.PlayerModels:GetChildren()

        for _, v290 in v287, v288, v289 do
            if v290.Name == 'Plank' then
                if v290:findFirstChild('Owner') then
                    if v290.Owner.Value == _G.LocalPlayer then
                        local v291 = next
                        local v292, v293 = v290:GetChildren()

                        for _, v294 in v291, v292, v293 do
                            if v294.Name == 'WoodSection' then
                                _G.Teleport(v294.CFrame)

                                for _ = 1, 30 do
                                    _G.PullItems:FireServer(v290)
                                    v290:PivotTo(_CFrame8)
                                    game:GetService('RunService').Stepped:wait()
                                end
                            end
                        end

                        task.wait()
                    end
                end
            end
        end

        _G.Teleport(_CFrame8)
        _G.Notify('Done')
    end)
    _Misc:Button('Sell All Plank', function()
        local _CFrame9 = _G.RootPart.CFrame
        local v295 = next
        local v296, v297 = game.Workspace.PlayerModels:GetChildren()

        for _, u64 in v295, v296, v297 do
            if u64.Name == 'Plank' and u64:findFirstChild('Owner') then
                if u64.Owner.Value == _G.LocalPlayer then
                    local v298 = next
                    local v299, v300 = u64:GetChildren()

                    for _, v301 in v298, v299, v300 do
                        if v301.Name == 'WoodSection' then
                            _G.Teleport(v301.CFrame)
                            spawn(function()
                                for _ = 1, 100 do
                                    _G.PullItems:FireServer(u64)
                                    u64:PivotTo(CFrame.new(315, 0, 84))
                                    task.wait()
                                end
                            end)
                        end
                    end

                    task.wait(0.5)
                end

                task.wait()
            end
        end

        _G.Teleport(_CFrame9)
        _G.Notify('Done')
    end)

    _G.GetLand = function()
        local v302 = next
        local v303, v304 = _G.Land:GetChildren()
        local v305 = nil

        for _, v306 in v302, v303, v304 do
            if v306:FindFirstChild('Owner') then
                if v306.Owner.Value == nil then
                    v305 = v306
                end
            end
        end

        return v305
    end
    _G.SelectingLand = _G.LocalPlayer.PlayerGui.PropertyPurchasingGUI.PropertyPurchasingClient
    _G.SelectedEnvironment = getsenv(_G.SelectingLand)
    _G.OldClick = _G.SelectedEnvironment.enterPurchaseMode
    getsenv(_G.SelectingLand).enterPurchaseMode = function(...)
        if _G.Menu.FastLoad then
            setupvalue(_G.SelectedEnvironment.rotate, 3, 0)
            setupvalue(_G.OldClick, 10, _G.GetLand())

            return
        else
            return _G.OldClick(...)
        end
    end

    local _Slot = v54:CreateTab('Slot', '6031090999')
    local _Slot2 = _Slot:Section('Slot')

    _Slot2:Slider('select slot', 1, 1, 6, false, function(p141)
        _G.Menu.SaveSlot = p141
    end)
    _Slot2:Toggle('Fast Load', false, function(p142)
        _G.Menu.FastLoad = p142
    end)
    _Slot2:Button('Load Base', function()
        _G.Load(_G.Menu.SaveSlot)
    end)
    _Slot2:Button('Save Base', function()
        _G.SaveBase(_G.Menu.SaveSlot)
    end)
    _Slot2:Button('Sell Sold Sign', function()
        _G.SellSign()
    end)
    _Slot2:Toggle('Auto Farm Sold Sign', false, function(p143)
        _G.Menu.AutoSellSign = p143
    end)

    local _SoldSign = _Slot:Section('Sold Sign')

    _SoldSign:DropDown('Select the player', {}, true, false, function(p144)
        _G.Menu.DupeSignPlayer = p144
    end)
    _SoldSign:Toggle('Sold Sign Dupe', false, function(p145)
        _G.Menu.AutoDupeSign = p145
    end)

    local u65 = {
        '-240, 19, 204, 1, 0, 0, 0, 1, 0, 0, 0, 1',
        '-61, 19, 526, 1, 0, 0, 0, 1, 0, 0, 0, 1',
    }

    FindHillPlot = function()
        local v307 = next
        local v308, v309 = Workspace.Properties:GetChildren()

        for _, v310 in v307, v308, v309 do
            if v310:FindFirstChild('Owner') then
                if v310.Owner.Value == nil then
                    if table.find(u65, tostring(v310.OriginSquare.CFrame)) then
                        return v310
                    end
                end
            end
        end

        return false
    end

    game:GetService('ReplicatedStorage'):WaitForChild('LoadSaveRequests'):WaitForChild('GetMetaData'):InvokeServer(_G.LocalPlayer)

    _G.DupeItem = function(p146)
        _G.CanLoad()
        task.spawn(function()
            game:GetService('ReplicatedStorage').LoadSaveRequests.RequestLoad:InvokeServer(_G.Menu.SaveSlot, _G.LocalPlayer)
        end)

        local u66 = FindHillPlot()

        if p146 then
            u66.OriginSquare.Color = Color3.fromRGB(225, 0, 0)
        end

        repeat
            task.wait()
        until Workspace.Effects:FindFirstChild('StructureModel')

        if p146 then
            task.spawn(function()
                game:GetService('ReplicatedStorage').PropertyPurchasing.ClientPurchasedProperty:FireServer(u66, u66.OriginSquare.Position)
            end)
        end

        local v311 = next
        local v312, v313 = Workspace.Effects.StructureModel:GetChildren()
        local u67 = 0

        for _, v314 in v311, v312, v313 do
            if v314:IsA('Model') then
                u67 = u67 + 1
            end
        end

        if _G.Menu.DupeWood then
        else
            local v315 = tick()

            wait()

            local v316 = (tick() - v315) * 50
            local v317 = tick()

            wait()

            local v318 = (v316 + (tick() - v317) * 50) / 2
            local v319 = next
            local v320, v321 = workspace.Effects.StructureModel:GetChildren()
            local v322 = {}
            local v323 = {}
            local v324 = {}

            for _, v325 in v319, v320, v321 do
                if v325:IsA('Model') then
                    local v326 = next
                    local v327, v328 = v325:GetChildren()

                    for _, v329 in v326, v327, v328 do
                        if #v329.Parent:GetChildren() ~= 1 or table.find(v322, v329.Parent) then
                            if not table.find(v323, v329.Parent) then
                                if #v329.Parent:GetChildren() > 1 or v329.Name == 'BuildDependentWood' then
                                    table.insert(v323, v329.Parent)
                                elseif v329.Name ~= 'WoodSection' or table.find(v322, v329.Parent) then
                                    if not table.find(v324, v329.Parent) then
                                        table.insert(v324, v329.Parent)
                                    end
                                else
                                    table.insert(v322, v329.Parent)
                                end
                            end
                        elseif v329.ClassName == 'MeshPart' or v329:FindFirstChild('Mesh') then
                            table.insert(v322, v329.Parent)
                        elseif not table.find(v323, v329.Parent) then
                            if #v329.Parent:GetChildren() > 1 or v329.Name == 'BuildDependentWood' then
                                table.insert(v323, v329.Parent)
                            elseif v329.Name ~= 'WoodSection' or table.find(v322, v329.Parent) then
                                if not table.find(v324, v329.Parent) then
                                    table.insert(v324, v329.Parent)
                                end
                            else
                                table.insert(v322, v329.Parent)
                            end
                        end
                    end
                end
            end

            local v330 = math.floor(#v324 / 40)
            local v331 = math.floor(#v323 / 500)
            local v332 = math.floor(#v322 / 1000)
            local v333 = (v330 + v331 + v332) / math.floor(v318)
            local v334 = game:GetService('ReplicatedStorage'):WaitForChild('LoadSaveRequests'):WaitForChild('GetMetaData'):InvokeServer(_G.LocalPlayer)
            local v335 = {}

            for v336 = 1, #v334 do
                if v334[v336].SaveMeta[#v334[v336].SaveMeta] then
                    local _NumKeys = v334[v336].SaveMeta[#v334[v336].SaveMeta].NumKeys

                    v335[#v335 + 1] = _NumKeys
                end
            end

            u67 = u67 - math.floor(v333) * v335[_G.Menu.SaveSlot ]

            if v335[_G.Menu.SaveSlot ] >= 2 then
            else
                return _G.Notify('Data size is to low !!!')
            end
        end

        Workspace.PlayerModels.ChildAdded:Connect(function(p147)
            if p147:WaitForChild('Owner', 1) and p147.Owner.Value == _G.LocalPlayer and (p147.Name ~= 'Wire' or not p147:FindFirstChild('ItemName')) then
                u67 = u67 - 1
            end
        end)

        repeat
            task.wait()
        until u67 <= 0

        spawn(function()
            _G.LocalPlayer:remove()
        end)
        game:Shutdown()

        return
    end

    local _DupeSlot = _Slot:Section('Dupe Slot')

    _DupeSlot:Toggle('Dupe Wood', false, function(p148)
        _G.Menu.DupeWood = p148
    end)
    _DupeSlot:Button('Center Dupe', function()
        _G.DupeItem(false)
    end)
    _DupeSlot:Button('Max Land Dupe', function()
        _G.DupeItem(true)
    end)
    _DupeSlot:Button('Remove Ownership', function()
        _G.Load(math.huge)
        _G.Notify('done')
    end)

    local _DupePower = _Slot:Section('Dupe Power')

    _DupePower:Slider('Power slot', 1, 1, 6, false, function(p149)
        _G.Menu.SuperBuildSave = p149
    end)
    _DupePower:Button('Dupe Power To Build With ease', function()
        if _G.LocalPlayer.SuperBlueprint.Value then
            if _G.LocalPlayer.CurrentSaveSlot.Value ~= _G.Menu.SuperBuildSave then
                _G.Load(_G.Menu.SuperBuildSave)
            end

            repeat
                task.wait()
            until _G.LocalPlayer.CurrentlySavingOrLoading.Value ~= true

            _G.Load(math.huge)

            repeat
                wait()
            until _G.LocalPlayer.OwnsProperty.Value == false and not _G.LocalPlayer.CurrentlySavingOrLoading.Value

            local v337 = _G.GetLand()

            _G.Teleport(v337.OriginSquare.CFrame + Vector3.new(0, 3, 0))
            game.ReplicatedStorage.PropertyPurchasing.ClientPurchasedProperty:FireServer(v337, v337.OriginSquare.CFrame.p + Vector3.new(0, 3, 0))
            _G.Notify('now save your slot')

            return
        else
            return _G.Notify('You need to own the power to be able to dupe it')
        end
    end)

    local _Land = _Slot:Section('Land')

    _Land:Button('Free Land', function()
        local v338 = _G.GetLand()

        _G.Teleport(v338.OriginSquare.CFrame + Vector3.new(0, 3, 0))
        game.ReplicatedStorage.PropertyPurchasing.ClientPurchasedProperty:FireServer(v338, v338.OriginSquare.CFrame.p + Vector3.new(0, 3, 0))
    end)
    _Land:Button('Free Land(buy it but free)', function()
        setidentity(2)
        getsenv(_G.LocalPlayer.PlayerGui.PropertyPurchasingGUI.PropertyPurchasingClient).enterPurchaseMode(0)
    end)
    _Land:Button('Max Land', function()
        local v339 = next
        local v340, v341 = _G.Land:GetChildren()
        local v342 = nil

        for _, v343 in v339, v340, v341 do
            if v343:FindFirstChild('Owner') then
                if v343.Owner.Value == _G.LocalPlayer then
                    v342 = v343.OriginSquare
                end
            end
        end

        if not v342 then
            local v344 = _G.GetLand()

            _G.Teleport(v344.OriginSquare.CFrame + Vector3.new(0, 3, 0))
            game.ReplicatedStorage.PropertyPurchasing.ClientPurchasedProperty:FireServer(v344, v344.OriginSquare.CFrame.p + Vector3.new(0, 3, 0))
        end

        wait(0.5)
        _G.ExpandLand(CFrame.new(v342.Position.X + 40, v342.Position.Y, v342.Position.Z))
        _G.ExpandLand(CFrame.new(v342.Position.X - 40, v342.Position.Y, v342.Position.Z))
        _G.ExpandLand(CFrame.new(v342.Position.X, v342.Position.Y, v342.Position.Z + 40))
        _G.ExpandLand(CFrame.new(v342.Position.X, v342.Position.Y, v342.Position.Z - 40))
        _G.ExpandLand(CFrame.new(v342.Position.X + 40, v342.Position.Y, v342.Position.Z + 40))
        _G.ExpandLand(CFrame.new(v342.Position.X + 40, v342.Position.Y, v342.Position.Z - 40))
        _G.ExpandLand(CFrame.new(v342.Position.X - 40, v342.Position.Y, v342.Position.Z + 40))
        _G.ExpandLand(CFrame.new(v342.Position.X - 40, v342.Position.Y, v342.Position.Z - 40))
        _G.ExpandLand(CFrame.new(v342.Position.X + 80, v342.Position.Y, v342.Position.Z))
        _G.ExpandLand(CFrame.new(v342.Position.X - 80, v342.Position.Y, v342.Position.Z))
        _G.ExpandLand(CFrame.new(v342.Position.X, v342.Position.Y, v342.Position.Z + 80))
        _G.ExpandLand(CFrame.new(v342.Position.X, v342.Position.Y, v342.Position.Z - 80))
        _G.ExpandLand(CFrame.new(v342.Position.X + 80, v342.Position.Y, v342.Position.Z + 80))
        _G.ExpandLand(CFrame.new(v342.Position.X + 80, v342.Position.Y, v342.Position.Z - 80))
        _G.ExpandLand(CFrame.new(v342.Position.X - 80, v342.Position.Y, v342.Position.Z + 80))
        _G.ExpandLand(CFrame.new(v342.Position.X - 80, v342.Position.Y, v342.Position.Z - 80))
        _G.ExpandLand(CFrame.new(v342.Position.X + 40, v342.Position.Y, v342.Position.Z + 80))
        _G.ExpandLand(CFrame.new(v342.Position.X - 40, v342.Position.Y, v342.Position.Z + 80))
        _G.ExpandLand(CFrame.new(v342.Position.X + 80, v342.Position.Y, v342.Position.Z + 40))
        _G.ExpandLand(CFrame.new(v342.Position.X + 80, v342.Position.Y, v342.Position.Z - 40))
        _G.ExpandLand(CFrame.new(v342.Position.X - 80, v342.Position.Y, v342.Position.Z + 40))
        _G.ExpandLand(CFrame.new(v342.Position.X - 80, v342.Position.Y, v342.Position.Z - 40))
        _G.ExpandLand(CFrame.new(v342.Position.X + 40, v342.Position.Y, v342.Position.Z - 80))
        _G.ExpandLand(CFrame.new(v342.Position.X - 40, v342.Position.Y, v342.Position.Z - 80))
    end)

    _G.LandArt = false

    _Land:Toggle('Land Art', false, function(p150)
        _G.LandArt = p150

        local v345 = next
        local v346, v347 = _G.Land:GetChildren()
        local v348 = {}
        local v349 = nil
        local u68 = nil

        for _, v350 in v345, v346, v347 do
            if v350:FindFirstChild('Owner') then
                if v350.Owner.Value == _G.LocalPlayer then
                    if v350:IsA('Part') then
                        table.insert(v348, v350.CFrame)
                    end

                    v349 = v350.OriginSquare
                    u68 = v350
                end
            end
        end

        if v349 then
            local v351 = {
                CFrame.new(v349.Position.X + 40, v349.Position.Y, v349.Position.Z),
                CFrame.new(v349.Position.X - 40, v349.Position.Y, v349.Position.Z),
                CFrame.new(v349.Position.X, v349.Position.Y, v349.Position.Z + 40),
                CFrame.new(v349.Position.X, v349.Position.Y, v349.Position.Z - 40),
                CFrame.new(v349.Position.X + 40, v349.Position.Y, v349.Position.Z + 40),
                CFrame.new(v349.Position.X + 40, v349.Position.Y, v349.Position.Z - 40),
                CFrame.new(v349.Position.X - 40, v349.Position.Y, v349.Position.Z + 40),
                CFrame.new(v349.Position.X - 40, v349.Position.Y, v349.Position.Z - 40),
                CFrame.new(v349.Position.X + 80, v349.Position.Y, v349.Position.Z),
                CFrame.new(v349.Position.X - 80, v349.Position.Y, v349.Position.Z),
                CFrame.new(v349.Position.X, v349.Position.Y, v349.Position.Z + 80),
                CFrame.new(v349.Position.X, v349.Position.Y, v349.Position.Z - 80),
                CFrame.new(v349.Position.X + 80, v349.Position.Y, v349.Position.Z + 80),
                CFrame.new(v349.Position.X + 80, v349.Position.Y, v349.Position.Z - 80),
                CFrame.new(v349.Position.X - 80, v349.Position.Y, v349.Position.Z + 80),
                CFrame.new(v349.Position.X - 80, v349.Position.Y, v349.Position.Z - 80),
                CFrame.new(v349.Position.X + 40, v349.Position.Y, v349.Position.Z + 80),
                CFrame.new(v349.Position.X - 40, v349.Position.Y, v349.Position.Z + 80),
                CFrame.new(v349.Position.X + 80, v349.Position.Y, v349.Position.Z + 40),
                CFrame.new(v349.Position.X + 80, v349.Position.Y, v349.Position.Z - 40),
                CFrame.new(v349.Position.X - 80, v349.Position.Y, v349.Position.Z + 40),
                CFrame.new(v349.Position.X - 80, v349.Position.Y, v349.Position.Z - 40),
                CFrame.new(v349.Position.X + 40, v349.Position.Y, v349.Position.Z - 80),
                CFrame.new(v349.Position.X - 40, v349.Position.Y, v349.Position.Z - 80),
            }
            local _Folder = Instance.new('Folder', game.Workspace)

            _Folder.Name = 'darkprview'

            for _, v352 in next, v351 do
                if not table.find(v348, v352) then
                    local v353 = v349:Clone()

                    v353.Parent = _Folder
                    v353.CFrame = v352
                    v353.Name = 'Dark'
                    v353.Transparency = 0.5
                end
            end

            local _SelectionBox = Instance.new('SelectionBox', u68)
            local v354 = _G.Mouse.Move:Connect(function()
                if _G.Mouse.Target.Name == 'Dark' then
                    _SelectionBox.LineThickness = 0.1
                    _SelectionBox.Adornee = _G.Mouse.Target
                end
            end)
            local v355 = _G.Mouse.Button1Down:Connect(function()
                if _G.Mouse.Target.Name == 'Dark' then
                    game.ReplicatedStorage.PropertyPurchasing.ClientExpandedProperty:FireServer(u68, _G.Mouse.Target.CFrame)
                    _G.Mouse.Target:Destroy()
                end
            end)
            local v356 = _SelectionBox

            repeat
                task.wait()
            until u68.Owner.Value ~= _G.LocalPlayer or _G.LandArt == false

            local v357 = next
            local v358, v359 = Workspace:GetChildren()

            for _, v360 in v357, v358, v359 do
                if v360.Name == 'darkprview' then
                    v360:Destroy()
                end
            end

            v354:Disconnect()
            v355:Disconnect()
            v356:Destroy()

            return
        else
            return _G.Notify('u need  a land ')
        end
    end)

    _G.ClickGetLand = false
    _G.ClickLand = nil

    _Land:Toggle('Click to Get Land', false, function(p151)
        _G.ClickGetLand = p151

        if _G.ClickGetLand then
            _G.ClickLand = _G.Mouse.Button1Down:Connect(function()
                if _G.Mouse.Target.Parent:FindFirstChild('Owner') and _G.Mouse.Target.Parent.Parent == _G.Land then
                    if _G.Mouse.Target.Parent:FindFirstChild('Owner').Value ~= nil then
                        _G.Notify('This Land already Have Owner')
                    else
                        _G.Teleport(_G.Mouse.Target.Parent.OriginSquare.CFrame + Vector3.new(0, 3, 0))
                        game.ReplicatedStorage.PropertyPurchasing.ClientPurchasedProperty:FireServer(_G.Mouse.Target.Parent, _G.Mouse.Target.Parent.OriginSquare.CFrame.p + Vector3.new(0, 3, 0))
                        _G.Notify('Done')
                    end
                end
            end)
        else
            _G.ClickLand:Disconnect()

            _G.ClickLand = nil
        end
    end)

    _G.DupeAxe = function()
        _G.CanLoad()
        wait()

        if _G.Menu.Fly then
            _G.Fly(false)

            _G.Menu.Fly = false
        end

        _G.Humanoid:UnequipTools()
        _G.Teleport(CFrame.new(0, -380, 0))

        repeat
            wait()
        until not _G.Character:FindFirstChild('Head')

        _G.Load(_G.LocalPlayer.CurrentSaveSlot.Value)

        game:GetService('Workspace').CurrentCamera.CameraSubject = _G.Character

        task.wait()
    end
    _G.GetAllAxes = function()
        local v361 = next
        local v362, v363 = game:GetService('ReplicatedStorage').AxeClasses:GetChildren()
        local v364 = {}

        for _, v365 in v361, v362, v363 do
            if v365.Name ~= 'AxeSuperClass' then
                table.insert(v364, string.split(v365.Name, 'AxeClass_')[2])
            end
        end

        return v364
    end

    _Land:Toggle('Wire Mod', false, function(p152)
        _G.Menu.SuperWire = p152
    end)

    local _Axe = _Slot:Section('Axe')

    _Axe:DropDown('Select the Axe', _G.GetAllAxes(), false, false, function(p153)
        _G.Menu.AxeType = p153
    end)
    _Axe:Toggle('Auto Pick Up Axe', false, function(p154)
        _G.Menu.AutoPickupAxe = p154
    end)

    local _AxeDupe = _Slot:Section('Axe Dupe')

    _AxeDupe:TextBox('Amount', '1', function(p155)
        _G.Menu.DupeAxeCount = tonumber(p155)
    end)
    _AxeDupe:Button('Dupe Axe', function()
        for _ = 1, _G.Menu.DupeAxeCountdo
            _G.DupeAxe()
        end
    end)
    _AxeDupe:Toggle('Auto Dupe Axe', false, function(p156)
        _G.Menu.AutoDupeAxe = p156

        repeat
            _G.DupeAxe()
        until _G.Menu.AutoDupeAxe == false
    end)

    local _Wipe = _Slot:Section('Wipe')

    _Wipe:DropDown('Select the player', {}, true, false, function(p157)
        _G.Menu.ErasedPlayer = p157
    end)
    _Wipe:DropDown('Select the Type', {
        'Structure',
        'Blueprint',
        'Wire',
        'Tool',
        'Furniture',
        'Loose Item',
        'Gift',
        'Plank',
    }, false, false, function(p158)
        _G.Menu.ErasedItem = p158

        if p158 == 'Plank' then
            _G.Menu.ErasedItem = 'TreeClass'
        end
    end)
    _Wipe:Button('Wipe', function()
        _G.EraseSelectedItem()
    end)

    _G.ClickDeleteItem = nil

    _Wipe:Toggle('Click to Delete', false, function(p159)
        if p159 then
            _G.ClickDeleteItem = _G.Mouse.Button1Down:Connect(function()
                if _G.Mouse.Target.Parent:FindFirstChild('Owner') and _G.Mouse.Target.Parent.Parent == game.Workspace.PlayerModels and tostring(_G.Mouse.Target.Parent:FindFirstChild('Owner').Value) == _G.Menu.ErasedPlayer then
                    game.ReplicatedStorage.Interaction.DestroyStructure:FireServer(_G.Mouse.Target.Parent)

                    repeat
                        task.wait()
                    until _G.Mouse.Target.Parent == nil
                end
            end)
        else
            _G.ClickDeleteItem:Disconnect()

            _G.ClickDeleteItem = nil
        end
    end)

    _G.GetStoreId = {
        WoodRus = {
            Character = game.Workspace.Stores.WoodRUs.Thom,
            Name = 'Thom',
            ID = tonumber(7),
        },
        FurnitureStore = {
            Character = game.Workspace.Stores.FurnitureStore.Corey,
            Name = 'Corey',
            ID = tonumber(8),
        },
        CarStore = {
            Character = game.Workspace.Stores.CarStore.Jenny,
            Name = 'Jenny',
            ID = tonumber(9),
        },
        ShackShop = {
            Character = game.Workspace.Stores.ShackShop.Bob,
            Name = 'Bob',
            ID = tonumber(10),
        },
        FineArt = {
            Character = game.Workspace.Stores.FineArt.Timothy,
            Name = 'Timothy',
            ID = tonumber(11),
        },
        LogicStore = {
            Character = game.Workspace.Stores.LogicStore.Lincoln,
            Name = 'Lincoln',
            ID = tonumber(12),
        },
    }
    _G.FoundItem = function(p160)
        local v366 = next
        local v367, v368 = game.Workspace.Stores:GetChildren()
        local v369 = nil
        local v370 = nil

        for _, v371 in v366, v367, v368 do
            if v371.Name == 'ShopItems' then
                if v371:FindFirstChild('Box') then
                    local v372 = next
                    local v373, v374 = v371:GetChildren()

                    for _, v375 in v372, v373, v374 do
                        if v375.BoxItemName.Value ~= p160 then
                        else
                            local v376 = next
                            local v377, v378 = v371:GetChildren()

                            for _, v379 in v376, v377, v378 do
                                if v379.BoxItemName.Value == 'Bed1' or v379.BoxItemName.Value == 'Seat_Couch' then
                                    v369 = _G.GetStoreId.FurnitureStore
                                    v370 = game.Workspace.Stores.FurnitureStore.Counter.CFrame + Vector3.new(0, 0.6, 0)
                                elseif v379.BoxItemName.Value == 'Sawmill' or v379.BoxItemName.Value == 'Sawmill2' then
                                    v369 = _G.GetStoreId.WoodRus
                                    v370 = game.Workspace.Stores.WoodRUs.Counter.CFrame + Vector3.new(0, 0.6, 0)
                                elseif v379.BoxItemName.Value == 'Trailer2' or v379.BoxItemName.Value == 'UtilityTruck2' then
                                    v369 = _G.GetStoreId.CarStore
                                    v370 = game.Workspace.Stores.CarStore.Counter.CFrame + Vector3.new(0, 0.6, 0)
                                elseif v379.BoxItemName.Value == 'CanOfWorms' or v379.BoxItemName.Value == 'Dynamite' then
                                    v369 = _G.GetStoreId.ShackShop
                                    v370 = game.Workspace.Stores.ShackShop.Counter.CFrame + Vector3.new(0, 0.6, 0)
                                elseif v379.BoxItemName.Value == 'Painting1' or v379.BoxItemName.Value == 'Painting2' then
                                    v369 = _G.GetStoreId.FineArt
                                    v370 = game.Workspace.Stores.FineArt.Counter.CFrame + Vector3.new(0, 0.6, 0)
                                elseif v379.BoxItemName.Value == 'GateXOR' or v379.BoxItemName.Value == 'NeonWireOrange' then
                                    v369 = _G.GetStoreId.LogicStore
                                    v370 = game.Workspace.Stores.LogicStore.Counter.CFrame + Vector3.new(0, 0.6, 0)
                                end
                            end

                            return v375, v369, v370
                        end
                    end
                end
            end
        end
    end
    _G.TeleportItem = nil
    _G.Buy = function(p161)
        local v380 = _G
        local v381 = _G
        local v382 = _G
        local v383, v384, v385 = _G.FoundItem(p161)

        v382.Cashier = v385
        v381.MerchantId = v384
        v380.Item = v383

        if _G.Item == nil then
            _G.Notify('Wait for the item to refresh')

            while _G.Menu.AutoBuyStopped ~= true do
                task.wait()

                local v386 = _G
                local v387 = _G
                local v388 = _G
                local v389, v390, v391 = _G.FoundItem(p161)

                v388.Cashier = v391
                v387.MerchantId = v390
                v386.Item = v389

                if _G.Item ~= nil then
                    break
                end
            end
        end

        _G.Teleport(_G.Item.Main.CFrame - Vector3.new(1, -3, 1))
        u49(_G.Item, _G.Cashier)
        spawn(function()
            _G.Teleport(_G.Cashier + Vector3.new(5, 0, 5))
        end)
        wait()

        repeat
            game.ReplicatedStorage.NPCDialog.PlayerChatted:InvokeServer(_G.MerchantId, 'ConfirmPurchase')
            wait()
        until _G.Item.Owner.Value == _G.LocalPlayer and _G.Item.Parent ~= 'ShopItem' and not _G.Item:FindFirstChild('BoxItemName')
    end
    _G.TeleportItem = nil
    _G.AutoBuyV2 = function(p162, p163, p164, _)
        _G.AutoAmount = p163

        if p164 then
            _G.AutoAmount = 9000000000
        end
        if p164 == false and _G.ItemPrice(p162, p163) > _G.LocalPlayer.leaderstats.Money.Value then
            return _G.Notify('you not have enough money')
        else
            local u69 = false

            _G.TeleportItem = game.Workspace.PlayerModels.ChildAdded:Connect(function(p165)
                p165:WaitForChild('Owner', 60)

                if p165.Owner.Value == _G.LocalPlayer then
                    pcall(function()
                        for _ = 1, 15 do
                            game:GetService('ReplicatedStorage').Interaction.ClientIsDragging:FireServer(p165)
                            p165:PivotTo(_G.Menu.AutoBuyLocation)
                            game:GetService('RunService').Stepped:wait()
                        end

                        u69 = true
                    end)
                end
            end)
            _G.Amount = 0

            for _ = 1, _G.AutoAmountdo
                u69 = false

                if _G.Menu.AutoBuyStopped ~= true then
                    _G.Buy(p162)

                    _G.Amount = _G.Amount + 1
                    _G.LocalPlayer.PlayerGui.MoneyDisplayGui.Text.Text = 'Autobuying:' .. tostring(_G.Amount) .. '/' .. tostring(p163)

                    repeat
                        task.wait()
                    until u69

                    task.wait()
                end
            end

            wait()

            _G.LocalPlayer.PlayerGui.MoneyDisplayGui.Text.Text = tostring(_G.LocalPlayer.leaderstats.Money.Value)

            spawn(function()
                pcall(function()
                    _G.TeleportItem:Disconnect()

                    _G.TeleportItem = nil
                end)
            end)

            return
        end
    end
    _G.GetItemName = function()
        _G.AllItems = {}

        local v392 = next
        local v393, v394 = game.Workspace.Stores:GetChildren()

        for _, v395 in v392, v393, v394 do
            if v395.Name == 'ShopItems' then
                if v395:FindFirstChild('Box') then
                    local v396 = next
                    local v397, v398 = v395:GetChildren()

                    for _, v399 in v396, v397, v398 do
                        if not table.find(_G.AllItems, v399.BoxItemName.Value) then
                            table.insert(_G.AllItems, v399.BoxItemName.Value)
                        end
                    end
                end
            end
        end

        return _G.AllItems
    end
    _G.ItemPrice = function(p166, p167)
        _G.Price = 0

        local v400 = next
        local v401, v402 = game.ReplicatedStorage.ClientItemInfo:GetChildren()

        for _, v403 in v400, v401, v402 do
            if v403.Name == p166 then
                if v403:FindFirstChild('Price') then
                    _G.Price = v403.Price.Value * p167
                end
            end
        end

        return _G.Price
    end
    _G.UpgradeItemName = function()
        _G.AllObjects = _G.GetItemName()
        _G.ProductPrice = {
            'Rukiryaxe--' .. _G.ItemPrice('BagOfSand', 1) + _G.ItemPrice('CanOfWorms', 1) + _G.ItemPrice('LightBulb', 1),
        }

        for _, v404 in next, _G.AllObjectsdo
            table.insert(_G.ProductPrice, v404 .. '--' .. _G.ItemPrice(v404, 1))
        end

        return _G.ProductPrice
    end
    _G.GetAllStoreNames = function()
        _G.StoreName = {
            'All',
        }

        local v405 = next
        local v406, v407 = game.Workspace.Stores:GetChildren()

        for _, v408 in v405, v406, v407 do
            if v408:FindFirstChild('Counter') then
                table.insert(_G.StoreName, v408.Name)
            end
        end

        return _G.StoreName
    end
    _G.GetStoreItems = function(p168)
        if p168 == 'All' then
            return _G.UpgradeItemName()
        end

        _G.Name = {}

        local v409 = next
        local v410, v411 = game.Workspace.Stores:GetChildren()

        for _, v412 in v409, v410, v411 do
            if v412.Name == 'ShopItems' then
                if v412:FindFirstChild('Box') then
                    local v413 = next
                    local v414, v415 = v412:GetChildren()

                    for _, v416 in v413, v414, v415 do
                        if v416.BoxItemName.Value == 'Bed1' or v416.BoxItemName.Value == 'Seat_Couch' then
                            if p168 == 'FurnitureStore' then
                                local v417 = next
                                local v418, v419 = v412:GetChildren()

                                for _, v420 in v417, v418, v419 do
                                    if not table.find(_G.Name, v420.BoxItemName.Value) then
                                        table.insert(_G.Name, v420.BoxItemName.Value)
                                    end
                                end
                            end
                        elseif v416.BoxItemName.Value == 'Sawmill' or v416.BoxItemName.Value == 'Sawmill2' then
                            if p168 == 'WoodRUs' then
                                local v421 = next
                                local v422, v423 = v412:GetChildren()

                                for _, v424 in v421, v422, v423 do
                                    if not table.find(_G.Name, v424.BoxItemName.Value) then
                                        table.insert(_G.Name, v424.BoxItemName.Value)
                                    end
                                end
                            end
                        elseif v416.BoxItemName.Value == 'Trailer2' or v416.BoxItemName.Value == 'UtilityTruck2' then
                            if p168 == 'CarStore' then
                                local v425 = next
                                local v426, v427 = v412:GetChildren()

                                for _, v428 in v425, v426, v427 do
                                    if not table.find(_G.Name, v428.BoxItemName.Value) then
                                        table.insert(_G.Name, v428.BoxItemName.Value)
                                    end
                                end
                            end
                        elseif v416.BoxItemName.Value == 'CanOfWorms' or v416.BoxItemName.Value == 'Dynamite' then
                            if p168 == 'ShackShop' then
                                local v429 = next
                                local v430, v431 = v412:GetChildren()

                                for _, v432 in v429, v430, v431 do
                                    if not table.find(_G.Name, v432.BoxItemName.Value) then
                                        table.insert(_G.Name, v432.BoxItemName.Value)
                                    end
                                end
                            end
                        elseif v416.BoxItemName.Value == 'Painting1' or v416.BoxItemName.Value == 'Painting2' then
                            if p168 == 'FineArt' then
                                local v433 = next
                                local v434, v435 = v412:GetChildren()

                                for _, v436 in v433, v434, v435 do
                                    if not table.find(_G.Name, v436.BoxItemName.Value) then
                                        table.insert(_G.Name, v436.BoxItemName.Value)
                                    end
                                end
                            end
                        elseif v416.BoxItemName.Value == 'GateXOR' or v416.BoxItemName.Value == 'NeonWireOrange' then
                            if p168 == 'LogicStore' then
                                local v437 = next
                                local v438, v439 = v412:GetChildren()

                                for _, v440 in v437, v438, v439 do
                                    if not table.find(_G.Name, v440.BoxItemName.Value) then
                                        table.insert(_G.Name, v440.BoxItemName.Value)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end

        return _G.Name
    end
    _G.UpgradeSelectedItemName = function(p169)
        _G.Item = {}

        if p169 == 'All' then
            return _G.GetStoreItems(p169)
        end

        local v441 = _G.GetStoreItems(p169)

        for _, v442 in next, v441 do
            table.insert(_G.Item, v442 .. '--' .. _G.ItemPrice(v442, 1))
        end

        return _G.Item
    end

    local _AutoBuy = v54:CreateTab('Auto Buy ', '6031289461')
    local _AutoBuy2 = _AutoBuy:Section('Auto Buy')

    _AutoBuy2:DropDown('Select Store', _G.GetAllStoreNames(), false, false, function(p170)
        _G.Menu.StoreName = p170

        _G.ItemSelect:SetOptions(_G.UpgradeSelectedItemName(_G.Menu.StoreName))
    end)

    _G.ItemSelect = _AutoBuy2:DropDown('Select Item', _G.UpgradeSelectedItemName(_G.Menu.StoreName), false, false, function(p171)
        _G.Menu.AutoBuyItem = p171
    end)

    _AutoBuy2:TextBox('Amount', '1', function(p172)
        _G.Menu.AutoBuyAmount = tonumber(p172)
    end)
    _AutoBuy2:Button('Buy', function()
        _G.Menu.AutoBuyStopped = false
        _G.Menu.AutoBuyLocation = _G.RootPart.CFrame

        if string.split(_G.Menu.AutoBuyItem, '--')[1] ~= 'Rukiryaxe' then
            _G.AutoBuyV2(string.split(_G.Menu.AutoBuyItem, '--')[1], _G.Menu.AutoBuyAmount)
            _G.Teleport(_G.Menu.AutoBuyLocation)
        else
            local _ = _G.RootPart.CFrame

            if _G.ItemPrice('BagOfSand', 1) + _G.ItemPrice('CanOfWorms', 1) + _G.ItemPrice('LightBulb', 1) <= _G.LocalPlayer.leaderstats.Money.Value then
                _G.AutoOpenBox = game.Workspace.PlayerModels.ChildAdded:Connect(function(p173)
                    p173:WaitForChild('Owner', 60)
                    wait(1)

                    if tostring(p173.Owner.Value) == tostring(_G.LocalPlayer) and p173:FindFirstChild('PurchasedBoxItemName') and (tostring(p173.PurchasedBoxItemName.Value) == 'BagOfSand' or tostring(p173.PurchasedBoxItemName.Value) == 'CanOfWorms' or tostring(p173.PurchasedBoxItemName.Value) == 'LightBulb') then
                        game:GetService('ReplicatedStorage').Interaction.ClientInteracted:FireServer(p173, 'Open box')
                    end
                end)
                _G.GetAxe = nil
                _G.GetAxe = game.Workspace.PlayerModels.ChildAdded:Connect(function(p174)
                    local _Main2 = p174:WaitForChild('Main', 60)
                    local _CFrame10 = _G.RootPart.CFrame

                    if _Main2:FindFirstChild('Mesh') and _Main2.Mesh.TextureId == 'rbxassetid://273892918' then
                        repeat
                            wait()
                        until p174:FindFirstChild('ToolName')

                        if p174.Owner.Value == nil then
                            _G.Notify('Calming Rukiryaxe')
                            _G.Teleport(p174.Main.CFrame)

                            repeat
                                task.wait()
                                _G.PullItems:FireServer(p174)
                                game.ReplicatedStorage.Interaction.ClientInteracted:FireServer(p174, 'Pick up tool')
                            until tostring(p174.Parent) ~= 'PlayerModels'
                        end

                        _G.Teleport(_CFrame10)
                        pcall(function()
                            _G.AutoOpenBox:Disconnect()

                            _G.AutoOpenBox = nil

                            _G.GetAxe:Disconnect()

                            _G.GetAxe = nil
                        end)
                    end
                end)
                _G.Menu.AutoBuyLocation = CFrame.new(319, 43, 1914)

                _G.AutoBuyV2('BagOfSand', 1)
                wait(1)

                _G.Menu.AutoBuyLocation = CFrame.new(317, 43, 1918)

                _G.AutoBuyV2('CanOfWorms', 1)
                wait(1)

                _G.Menu.AutoBuyLocation = CFrame.new(322, 43, 1916)

                _G.AutoBuyV2('LightBulb', 1)
            else
                return _G.Notify('you not have enough money')
            end
        end

        return
    end)
    _AutoBuy2:Button('Abort', function()
        _G.Menu.AutoBuyStopped = true
    end)
    _AutoBuy2:Toggle('Loop Auto Buy', false, function(p175)
        if p175 then
            _G.Menu.AutoBuyStopped = false
            _G.Menu.AutoBuyLocation = _G.RootPart.CFrame

            _G.AutoBuyV2(string.split(_G.Menu.AutoBuyItem, '--')[1], 0, true)
            _G.Teleport(_G.Menu.AutoBuyLocation)
        else
            _G.Menu.AutoBuyStopped = true
        end
    end)

    local _Other = _AutoBuy:Section('Other')

    _Other:Toggle('Auto Buy All BluePrints', false, function(p176)
        if p176 then
            local v443 = game.Workspace.PlayerModels.ChildAdded:connect(function(p177)
                spawn(function()
                    if p177.Type.Value == 'Blueprint' then
                        game:GetService('ReplicatedStorage').Interaction.ClientInteracted:FireServer(p177, 'Open box')
                    end
                end)
            end)

            _G.Menu.AutoBuyStopped = false

            local v444 = next
            local v445, v446 = game.ReplicatedStorage.ClientItemInfo:GetChildren()

            for _, v447 in v444, v445, v446 do
                if v447:FindFirstChild('WoodCost') then
                    if not _G.LocalPlayer.PlayerBlueprints.Blueprints:FindFirstChild(v447.Name) then
                        _G.AutoBuyV2(v447.Name, 1)
                    end
                end
            end

            wait(1)
            v443:Disconnect()
        else
            _G.Menu.AutoBuyStopped = true
        end
    end)
    _Other:Button('Toll Bridge', function()
        game.ReplicatedStorage.NPCDialog.PlayerChatted:InvokeServer({
            ID = 15,
            Character = 'name',
            Name = 'name',
            Dialog = 'Dialog',
        }, 'ConfirmPurchase')
    end)
    _Other:Button('Ferry Ticket', function()
        game.ReplicatedStorage.NPCDialog.PlayerChatted:InvokeServer({
            ID = 13,
            Character = 'name',
            Name = 'name',
            Dialog = 'Dialog',
        }, 'ConfirmPurchase')
    end)
    _Other:Button('Power Of Ease', function()
        game.ReplicatedStorage.NPCDialog.PlayerChatted:InvokeServer({
            ID = 3,
            Character = 'name',
            Name = 'name',
            Dialog = 'Dialog',
        }, 'ConfirmPurchase')
    end)

    local _ScreenGui4 = Instance.new('ScreenGui')
    local _Frame20 = Instance.new('Frame')

    _ScreenGui4.Parent = game.CoreGui
    _ScreenGui4.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    _Frame20.Parent = _ScreenGui4
    _Frame20.BackgroundColor3 = Color3.fromRGB(4, 0, 255)
    _Frame20.BackgroundTransparency = 0.8
    _Frame20.BorderColor3 = Color3.new(0.09, 0.137, 0.776)
    _Frame20.BorderSizePixel = 2
    _Frame20.Position = UDim2.new(0, 0, 0, 0)
    _Frame20.Size = UDim2.new(0, 0, 0, 0)
    _Frame20.Name = 'Lasso Tool'
    _G.InsideBox = function(p178, p179)
        local _X = p179.AbsolutePosition.X
        local _Y2 = p179.AbsolutePosition.Y
        local _X2 = p179.AbsoluteSize.X
        local _Y3 = p179.AbsoluteSize.Y
        local v448 = _X <= p178.X and p178.X <= _X + _X2
        local v449 = p178.X <= _X and p178.X >= _X + _X2
        local v450 = _Y2 <= p178.Y and p178.Y <= _Y2 + _Y3
        local v451 = p178.Y <= _Y2 and p178.Y >= _Y2 + _Y3

        if v448 and v450 or v449 and v450 then
            v451 = v450
        elseif not (v448 and v451) then
            if not v449 then
                v451 = v449
            end
        end

        return v451
    end
    _G.SortMouseMove = nil
    _G.SortMouseClick = nil

    local u70 = false

    _G.BoxTeleport = function(p180, p181, p182, p183)
        _G.Menu.StopSort = false

        local v452 = 0
        local u71 = {}

        u70 = false

        local v453 = next
        local v454, v455 = game:GetService('Workspace').PlayerModels:GetChildren()

        for _, v456 in v453, v454, v455 do
            if v456:FindFirstChild(p183) then
                if v456[p183].Value == p180 then
                    if v456:FindFirstChild('SelectionBox') then
                        if v456:FindFirstChild('Owner') then
                            if tostring(v456.Owner.Value) == _G.Menu.TeleportTargetPlayer then
                                table.insert(u71, v456)
                                u48(v456)

                                local _BodyVelocity2 = Instance.new('BodyVelocity', v456.PrimaryPart)

                                _BodyVelocity2.Velocity = Vector3.new(0, 0, 0)
                                _BodyVelocity2.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                                _BodyVelocity2.P = 9000
                                _BodyVelocity2.Name = 'freeze1'
                            end
                        end
                    end
                end
            end
        end

        local _Part2 = Instance.new('Part', game.Workspace)

        _Part2.Size = Vector3.new(u71[1].PrimaryPart.Size.X * p181, u71[1].PrimaryPart.Size.Y * math.ceil(#u71 / (p181 * p182)), u71[1].PrimaryPart.Size.Z * p182)
        _Part2.Transparency = 1
        _Part2.CanCollide = false
        _Part2.Anchored = true
        _Part2.Name = 'preview'

        local v457 = _Part2.Position + Vector3.new(-(_Part2.Size.X / 2 + u71[1].PrimaryPart.Size.X / 2), -(_Part2.Size.Y / 2 + u71[1].PrimaryPart.Size.Y / 2), -(_Part2.Size.Z / 2 + u71[1].PrimaryPart.Size.Z / 2))

        for v458 = 1, math.ceil(#u71 / (p181 * p182))do
            local v459 = v458

            for v460 = 1, p181 do
                local _ = v460

                for v461 = 1, p182 do
                    v452 = v452 + 1

                    if u71[v452] then
                        local v462 = u71[v452]:Clone()

                        v462.PrimaryPart.CanCollide = false
                        v462.PrimaryPart.Transparency = 0.5
                        v462.PrimaryPart.Orientation = Vector3.new(0, 0, 0)
                        v462.PrimaryPart.Position = Vector3.new(v457.X + v460 * u71[1].PrimaryPart.Size.X, v457.Y + v459 * u71[1].PrimaryPart.Size.Y, v457.Z + v461 * u71[1].PrimaryPart.Size.Z)
                        v462.Parent = _Part2

                        v462:FindFirstChild('SelectionBox'):Destroy()

                        local _WeldConstraint = Instance.new('WeldConstraint', v462.PrimaryPart)

                        _WeldConstraint.Part0 = v462.PrimaryPart
                        _WeldConstraint.Part1 = _Part2

                        local v463 = next
                        local v464, v465 = v462:GetChildren()

                        for _, v466 in v463, v464, v465 do
                            if v466.Name:match('Decal') then
                                v466.Transparency = 1
                            end
                        end
                    end
                end
            end
        end

        if _G.Mouse.Target.Name ~= 'Ground' and _G.Mouse.Target.Name ~= 'preview' then
            _Part2.CFrame = CFrame.new(_G.Mouse.Hit.X + p181 / 2 * u71[1].PrimaryPart.Size.X, _G.Mouse.Hit.Y + _Part2.Size.Y / 2, _G.Mouse.Hit.Z + p182 / 2 * u71[1].PrimaryPart.Size.Z)
        end

        _G.SortMouseMove = _G.Mouse.Move:Connect(function()
            if _G.Mouse.Target.Name ~= 'Ground' then
                _Part2.CFrame = CFrame.new(_G.Mouse.Hit.X + p181 / 2 * u71[1].PrimaryPart.Size.X, _G.Mouse.Hit.Y + _Part2.Size.Y / 2, _G.Mouse.Hit.Z + p182 / 2 * u71[1].PrimaryPart.Size.Z)
            end
        end)
        _G.SortMouseClick = _G.Mouse.Button1Down:Connect(function()
            pcall(function()
                _G.SortMouseMove:Disconnect()

                _G.SortMouseMove = nil
            end)
            pcall(function()
                _G.SortMouseClick:Disconnect()

                _G.SortMouseClick = nil
            end)

            _G.Menu.TeleportStopped = false

            local v467 = next
            local v468, v469 = game.Workspace:FindFirstChild('preview'):GetChildren()
            local u72 = 0
            local __continue_break_3 = false

            for _, u73 in v467, v468, v469 do
                if _G.Menu.StopSort == true then
                    break
                else
                    u72 = u72 + 1

                    if u73:FindFirstChildOfClass('Part') and not u71[u72]:FindFirstChild('ItemName') then
                        pcall(function()
                            u71[u72]:FindFirstChild('SelectionBox'):Destroy()
                        end)

                        _G.Humanoid.PlatformStand = true

                        local _BodyPosition = Instance.new('BodyPosition', u71[u72].PrimaryPart)

                        _BodyPosition.MaxForce = Vector3.new(100, 100, 100)
                        _BodyPosition.Position = u73.PrimaryPart.Position
                        _BodyPosition.P = 100000
                        _BodyPosition.Name = 'freeze2'

                        _G.Teleport(CFrame.new(u71[u72].PrimaryPart.Position.X, _G.RootPart.Size.Y, u71[u72].PrimaryPart.Position.Z) + Vector3.new(2, 1, 2))
                        pcall(function()
                            u71[u72]:FindFirstChild('SelectionBox'):Destroy()
                        end)
                        u49(u71[u72], u73.PrimaryPart.CFrame)

                        u71[u72].PrimaryPart.Velocity = Vector3.new(0, 0, 0)
                        u71[u72].PrimaryPart.RotVelocity = Vector3.new(0, 0, 0)

                        task.wait()
                        pcall(function()
                            u71[u72]:FindFirstChild('SelectionBox'):Destroy()
                        end)
                        pcall(function()
                            _BodyPosition:Destroy()
                            u71[u72].PrimaryPart:FindFirstChild('freeze1'):Destroy()
                        end)
                        task.wait()
                    else
                        pcall(function()
                            local _p2 = u73.PrimaryPart.CFrame.p
                            local v470

                            repeat
                                game:GetService('ReplicatedStorage').PlaceStructure.ClientPlacedStructure:FireServer(u71[u72].ItemName.Value, u73.PrimaryPart.CFrame, u71[u72].Owner.Value, nil, u71[u72], true)

                                v470 = u71[u72].PrimaryPart.CFrame.p

                                task.wait(0.1)
                            until (v470 - _p2).Magnitude <= 5
                        end)
                        pcall(function()
                            u71[u72]:FindFirstChild('SelectionBox'):Destroy()
                        end)
                    end

                    task.wait()
                end
            end

            u70 = true
            _G.Menu.StopSort = false
        end)

        repeat
            task.wait()
        until u70 == true

        pcall(function()
            local v471 = next
            local v472, v473 = game:GetService('Workspace').PlayerModels:GetChildren()

            for _, v474 in v471, v472, v473 do
                if v474:FindFirstChild(p183) then
                    if v474[p183].Value == p180 then
                        if v474:FindFirstChild('SelectionBox') then
                            if v474:FindFirstChild('Owner') then
                                if tostring(v474.Owner.Value) == _G.Menu.TeleportTargetPlayer then
                                    table.insert(u71, v474)

                                    if not v474.PrimaryPart then
                                        v474.PrimaryPart = v474:FindFirstChildOfClass('Part')
                                    end

                                    v474.PrimaryPart.BodyPosition:Destroy()
                                    v474.PrimaryPart.BodyVelocity:Destroy()
                                end
                            end
                        end
                    end
                end
            end
        end)
        pcall(function()
            game:GetService('Workspace'):FindFirstChild('preview'):Destroy()

            _G.Humanoid.PlatformStand = false
        end)
    end

    local _Items = v54:CreateTab('Items', '6035030083')
    local _Position = _Items:Section('Position')

    _Position:DropDown('Select the player', {}, true, false, function(p184)
        _G.Menu.TeleportTargetPlayer = p184
    end)
    _Position:Button('Set Position', function()
        pcall(function()
            game.Workspace.darkx:Destroy()
        end)

        local _Part3 = Instance.new('Part', game.Workspace)

        _Part3.CanCollide = false
        _Part3.Anchored = true
        _Part3.Shape = Enum.PartType.Ball
        _Part3.Color = Color3.fromRGB(0, 217, 255)
        _Part3.Transparency = 0
        _Part3.Size = Vector3.new(2, 2, 2)
        _Part3.CFrame = _G.RootPart.CFrame
        _Part3.Material = Enum.Material.Marble
        _Part3.Name = 'darkx'
    end)
    _Position:Button('Delete Position', function()
        pcall(function()
            game.Workspace.darkx:Destroy()
        end)
    end)

    local _selectItem = _Items:Section('select Item')

    _G.ClickSelectItem = nil

    _selectItem:Toggle('Click To Select', false, function(p185)
        if p185 then
            _G.ClickSelectItem = _G.Mouse.Button1Up:Connect(function()
                local _Target2 = _G.Mouse.Target

                if _Target2.Parent:FindFirstChild('Owner') and tostring(_Target2.Parent.Owner.Value) == _G.Menu.TeleportTargetPlayer and _Target2.Parent:FindFirstAncestor('PlayerModels') then
                    if _Target2.Parent:FindFirstChild('SelectionBox') then
                        _Target2.Parent:FindFirstChild('SelectionBox'):Destroy()
                    else
                        local _SelectionBox2 = Instance.new('SelectionBox', _Target2.Parent)

                        _SelectionBox2.LineThickness = 0.05
                        _SelectionBox2.Adornee = _Target2.Parent
                    end
                end
            end)
        else
            _G.ClickSelectItem:Disconnect()

            _G.ClickSelectItem = nil
        end
    end)
    _selectItem:Toggle('Group Select', false, function(p186)
        if p186 then
            _G.ClickSelectSameTypeItem = _G.Mouse.Button1Up:Connect(function()
                local _Target3 = _G.Mouse.Target

                if _Target3.Parent:FindFirstChild('Owner') and tostring(_Target3.Parent.Owner.Value) == _G.Menu.TeleportTargetPlayer and _Target3.Parent:FindFirstAncestor('PlayerModels') then
                    local v475 = next
                    local v476, v477 = game:GetService('Workspace').PlayerModels:GetChildren()

                    for _, v478 in v475, v476, v477 do
                        if v478:FindFirstChild('Owner') then
                            if tostring(v478.Owner.Value) == _G.Menu.TeleportTargetPlayer then
                                if v478:FindFirstChild('ItemName') and (_Target3.Parent:FindFirstChild('ItemName') and v478:FindFirstChild('DraggableItem')) then
                                    if v478.ItemName.Value == _Target3.Parent.ItemName.Value then
                                        if v478:FindFirstChild('SelectionBox') then
                                            v478:FindFirstChild('SelectionBox'):Destroy()
                                        else
                                            local _SelectionBox3 = Instance.new('SelectionBox', v478)

                                            _SelectionBox3.LineThickness = 0.05
                                            _SelectionBox3.Adornee = v478
                                        end
                                    end
                                elseif v478:FindFirstChild('PurchasedBoxItemName') and _Target3.Parent:FindFirstChild('PurchasedBoxItemName') then
                                    if v478.PurchasedBoxItemName.Value == _Target3.Parent.PurchasedBoxItemName.Value then
                                        if v478:FindFirstChild('SelectionBox') then
                                            v478:FindFirstChild('SelectionBox'):Destroy()
                                        else
                                            local _SelectionBox4 = Instance.new('SelectionBox', v478)

                                            _SelectionBox4.LineThickness = 0.05
                                            _SelectionBox4.Adornee = v478
                                        end
                                    end
                                elseif v478:FindFirstChild('TreeClass') then
                                    if _Target3.Parent:FindFirstChild('TreeClass') then
                                        if v478.TreeClass.Value == _Target3.Parent.TreeClass.Value then
                                            if v478:FindFirstChild('SelectionBox') then
                                                v478:FindFirstChild('SelectionBox'):Destroy()
                                            else
                                                local _SelectionBox5 = Instance.new('SelectionBox', v478)

                                                _SelectionBox5.LineThickness = 0.05
                                                _SelectionBox5.Adornee = v478
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        else
            _G.ClickSelectSameTypeItem:Disconnect()

            _G.ClickSelectSameTypeItem = nil
        end
    end)
    _selectItem:Toggle('Lasso Tool', false, function(p187)
        if p187 then
            _G.Menu.ItemBox = game:GetService('UserInputService').InputBegan:Connect(function(p188)
                if p188.UserInputType == Enum.UserInputType.MouseButton1 then
                    _Frame20.Visible = true
                    _Frame20.Position = UDim2.new(0, _G.Mouse.X, 0, _G.Mouse.Y)

                    while game:GetService('UserInputService'):IsMouseButtonPressed(Enum.UserInputType.MouseButton1) or game:GetService('UserInputService'):IsMouseButtonPressed(Enum.UserInputType.MouseButton1) and game:GetService('UserInputService'):IsMouseButtonPressed(Enum.UserInputType.MouseButton2) do
                        game:GetService('RunService').RenderStepped:wait()
                        task.wait()

                        _Frame20.Size = UDim2.new(0, _G.Mouse.X, 0, _G.Mouse.Y) - _Frame20.Position

                        for _, v479 in pairs(workspace.PlayerModels:GetChildren())do
                            if v479:FindFirstChild('Owner') and tostring(v479.Owner.Value) == _G.Menu.TeleportTargetPlayer and v479:FindFirstChild('WoodSection') then
                                local v480, v481 = game.Workspace.CurrentCamera:WorldToScreenPoint(v479.WoodSection.CFrame.p)

                                if v481 and _G.InsideBox(v480, _Frame20) and not v479:FindFirstChild('SelectionBox') then
                                    local _SelectionBox6 = Instance.new('SelectionBox', v479)

                                    _SelectionBox6.LineThickness = 0.05
                                    _SelectionBox6.Adornee = v479
                                end
                            end
                            if v479:FindFirstChild('Owner') and tostring(v479.Owner.Value) == _G.Menu.TeleportTargetPlayer and v479:FindFirstChild('DraggableItem') or v479:FindFirstChild('PurchasedBoxItemName') then
                                local v482, v483 = game.Workspace.CurrentCamera:WorldToScreenPoint(v479.Main.CFrame.p)

                                if v483 then
                                    if _G.InsideBox(v482, _Frame20) then
                                        if not v479:FindFirstChild('SelectionBox') then
                                            local _SelectionBox7 = Instance.new('SelectionBox', v479)

                                            _SelectionBox7.LineThickness = 0.05
                                            _SelectionBox7.Adornee = v479
                                        end
                                    end
                                end
                            end
                        end
                    end
                end

                _Frame20.Size = UDim2.new(0, 1, 0, 1)
                _Frame20.Visible = false
            end)
        else
            _Frame20.Visible = false

            _G.Menu.ItemBox:Disconnect()

            _G.Menu.ItemBox = nil
        end
    end)
    _selectItem:Button('Deselect All Item', function()
        local v484 = next
        local v485, v486 = game:GetService('Workspace').PlayerModels:GetChildren()

        for _, v487 in v484, v485, v486 do
            if v487:FindFirstChild('Owner') then
                if tostring(v487.Owner.Value) == _G.Menu.TeleportTargetPlayer then
                    if v487:FindFirstChild('SelectionBox') then
                        v487:FindFirstChild('SelectionBox'):Destroy()
                    end
                end
            end
        end
    end)

    local _Item = _Items:Section('Item')

    _Item:Button('Make Selected Plank Size To 1', function()
        local v488 = next
        local v489, v490 = game:GetService('Workspace').PlayerModels:GetChildren()

        for _, v491 in v488, v489, v490 do
            if v491:FindFirstChild('Owner') then
                if tostring(v491.Owner.Value) == _G.Menu.TeleportTargetPlayer then
                    if v491:FindFirstChild('SelectionBox') then
                        if v491:FindFirstChild('WoodSection') then
                            v491.WoodSection.Size = Vector3.new(1, 1, 1)
                        end
                    end
                end
            end
        end
    end)
    _Item:Button('Tp All Selected Item', function()
        if game.Workspace:FindFirstChild('darkx') then
            _G.TeleportedThing = {}

            local v492 = next
            local v493, v494 = game:GetService('Workspace').PlayerModels:GetChildren()

            for _, v495 in v492, v493, v494 do
                if v495:FindFirstChild('Owner') then
                    if tostring(v495.Owner.Value) == _G.Menu.TeleportTargetPlayer then
                        if v495:FindFirstChild('SelectionBox') then
                            if not v495.PrimaryPart then
                                v495.PrimaryPart = v495:FindFirstChildOfClass('Part')
                            end

                            table.insert(_G.TeleportedThing, v495)
                        end
                    end
                end
            end

            _G.Menu.TeleportStopped = false

            local _CFrame11 = _G.RootPart.CFrame
            local __continue_break_4 = false

            for _, u74 in next, _G.TeleportedThingdo
                if _G.Menu.TeleportStopped ~= true then
                    u74:FindFirstChild('SelectionBox'):Destroy()

                    u74.PrimaryPart.Anchored = false

                    if u74:FindFirstChildOfClass('Part') and u74:FindFirstChild('WoodSection') or u74:FindFirstChild('PurchasedBoxItemName') then
                        u74.PrimaryPart.Anchored = false

                        _G.Teleport(CFrame.new(u74.PrimaryPart.Position.X, _G.RootPart.Position.Y, u74.PrimaryPart.Position.Z) + Vector3.new(1, 0, 0))

                        u74.PrimaryPart.Velocity = Vector3.new(0, 0, 0)
                        u74.PrimaryPart.RotVelocity = Vector3.new(0, 0, 0)

                        if u74:FindFirstChild('WoodSection') then
                            if _G.WoodVerticalTeleport then
                                u49(u74, game.Workspace.darkx.CFrame)
                            else
                                u49(u74, game.Workspace.darkx.CFrame * CFrame.Angles(-90, 0, 90))
                            end
                        else
                            u49(u74, game.Workspace.darkx.CFrame)
                        end

                        game:GetService('RunService').Stepped:wait()
                        task.wait()
                        task.wait()
                        pcall(function()
                            u74:FindFirstChild('SelectionBox'):Destroy()
                        end)
                    else
                        pcall(function()
                            u74:FindFirstChild('SelectionBox'):Destroy()
                        end)
                        pcall(function()
                            if u74:FindFirstChild('ItemName') then
                                local _p3 = game.Workspace.darkx.CFrame.p
                                local v496

                                repeat
                                    game:GetService('ReplicatedStorage').PlaceStructure.ClientPlacedStructure:FireServer(u74.ItemName.Value, game.Workspace.darkx.CFrame, u74.Owner.Value, nil, u74, true)

                                    v496 = u74.PrimaryPart.CFrame.p

                                    task.wait(0.1)
                                until (v496 - _p3).Magnitude <= 5
                            end
                        end)
                        wait()
                    end
                else
                    break
                end
            end

            _G.Teleport(_CFrame11)

            _G.Menu.Fly = false

            spawn(function()
                _G.Fly(false)
            end)
            _G.Noclip(false)

            _G.Menu.FlySpeed = _G.OldFlySpeed

            return
        else
            return _G.Notify('Please Set Position')
        end
    end)
    _Item:Toggle('Standing Wood', false, function(p189)
        _G.Menu.WoodVerticalTeleport = p189
    end)
    _Item:Button('Abort', function()
        _G.Menu.TeleportStopped = true
    end)

    local _BoxSort = _Items:Section('Box Sort')

    _BoxSort:TextBox('X', '5', function(p190)
        _G.Menu.SortItemsX = tonumber(p190)
    end)
    _BoxSort:TextBox('Z', '5', function(p191)
        _G.Menu.SortItemsZ = tonumber(p191)
    end)
    _BoxSort:Button('Start', function()
        local v497 = {}
        local v498 = {}
        local v499 = {}

        if _G.Menu.SortingItems ~= true then
            _G.Menu.SortingItems = true

            local v500 = next
            local v501, v502 = game:GetService('Workspace').PlayerModels:GetChildren()

            for _, v503 in v500, v501, v502 do
                if v503:FindFirstChild('Owner') then
                    if tostring(v503.Owner.Value) == _G.Menu.TeleportTargetPlayer then
                        if v503:FindFirstChild('SelectionBox') then
                            if v503:FindFirstChild('ItemName') then
                                if not table.find(v498, v503.ItemName.Value) then
                                    table.insert(v498, v503.ItemName.Value)
                                end
                            elseif v503:FindFirstChild('PurchasedBoxItemName') then
                                if not table.find(v497, v503.PurchasedBoxItemName.Value) then
                                    table.insert(v497, v503.PurchasedBoxItemName.Value)
                                end
                            elseif v503:FindFirstChild('TreeClass') then
                                if not table.find(v499, v503.TreeClass.Value) then
                                    table.insert(v499, v503.TreeClass.Value)
                                end
                            end
                        end
                    end
                end
            end
            for _, v504 in next, v497 do
                _G.BoxTeleport(v504, _G.Menu.SortItemsX, _G.Menu.SortItemsZ, 'PurchasedBoxItemName')
                task.wait()
            end
            for _, v505 in next, v498 do
                _G.BoxTeleport(v505, _G.Menu.SortItemsX, _G.Menu.SortItemsZ, 'ItemName')
                task.wait()
            end
            for _, v506 in next, v499 do
                _G.BoxTeleport(v506, _G.Menu.SortItemsX, _G.Menu.SortItemsZ, 'TreeClass')
                task.wait()
            end

            _G.Menu.SortingItems = false

            return
        else
            return _G.Notify('you are using this feature')
        end
    end)
    _BoxSort:Button('Abort', function()
        _G.Menu.StopSort = true
        u70 = true
        _G.Humanoid.PlatformStand = false

        game:GetService('Workspace'):FindFirstChild('preview'):Destroy()
        pcall(function()
            _G.SortMouseMove:Disconnect()

            _G.SortMouseMove = nil
        end)

        _G.Humanoid.PlatformStand = false

        pcall(function()
            _G.Menu.SortingItems = false
            game:GetService('Workspace').CurrentCamera.CameraSubject = _G.Humanoid
        end)
        _G.Teleport(oldpos)

        _G.Menu.Fly = false

        spawn(function()
            _G.Fly(false)
        end)
        _G.Noclip(false)

        _G.Menu.FlySpeed = _G.OldFlySpeed
    end)

    _G.ModifyCarProperties = function(p192, p193)
        local v507 = next
        local v508, v509 = game:GetService('Workspace').PlayerModels:GetChildren()

        for _, v510 in v507, v508, v509 do
            if v510:FindFirstChild('Owner') then
                if v510.Owner.Value == _G.LocalPlayer then
                    if v510:FindFirstChild('Type') then
                        if v510.Type.Value == 'Vehicle' then
                            if v510:FindFirstChild('Configuration') then
                                v510.Configuration[p193].Value = p192
                            end
                        end
                    end
                end
            end
        end
    end

    local _Vehicle = v54:CreateTab('Vehicle', '6034754441')
    local _Vehicle2 = _Vehicle:Section('Vehicle')

    _Vehicle2:Slider('Vehicle Speed', 1, 1, 5, false, function(p194)
        _G.ModifyCarProperties(p194, 'MaxSpeed')
    end)
    _Vehicle2:Slider('Steer Angle', 0.7, 0.7, 5, true, function(p195)
        _G.ModifyCarProperties(p195, 'SteerAngle')
    end)
    _Vehicle2:Button('Flip Vehicle', function()
        if _G.Humanoid.SeatPart or _G.Humanoid.SeatPart == 'DriveSeat' then
            _G.Humanoid.SeatPart.Parent:PivotTo(_G.Humanoid.SeatPart.Parent.PrimaryPart.CFrame * CFrame.Angles(math.rad(-180), 0, 0) + Vector3.new(0, 5, 0))

            return
        else
            _G.Notify('You need to sit in the vehicles driver seat')

            return
        end
    end)

    local _VehicleSpawner = _Vehicle:Section('Vehicle Spawner')

    _VehicleSpawner:DropDown('Select Color', {
        'Medium stone grey',
        'Sand green',
        'Sand red',
        'Faded green',
        'Dark grey metallic',
        'Dark grey',
        'Earth yellow',
        'Earth orange',
        'Silver',
        'Brick yellow',
        'Dark red',
        'Hot pink',
    }, false, false, function(p196)
        _G.Menu.CarColor = p196
    end)
    _VehicleSpawner:Button('Start Vehicle Spawner', function()
        if _G.Menu.SpawningCar ~= true then
            if _G.Menu.CarColor ~= nil then
                _G.Notify('Click a spawn pad')

                _G.Menu.StopSpawnCar = false
                _G.SpawnSuccess = false
                _G.CarSpawnCheck = game:GetService('Workspace').PlayerModels.ChildAdded:connect(function(p197)
                    if p197:WaitForChild('Owner') and (p197.Owner.Value == _G.LocalPlayer and p197:WaitForChild('PaintParts')) and p197.PaintParts:WaitForChild('Part').BrickColor.Name == _G.Menu.CarColor then
                        _G.SpawnSuccess = true
                    end
                end)
                _G.Menu.SpawningCar = true
                _G.SelectedCar = nil

                local v511 = _G.Mouse.Button1Up:Connect(function()
                    if _G.Mouse.Target.Parent.Owner.Value == _G.LocalPlayer and _G.Mouse.Target.Parent.Type.Value == 'Vehicle Spot' then
                        _G.SelectedCar = _G.Mouse.Target
                    end
                end)

                repeat
                    wait()
                until _G.SelectedCar ~= nil

                while true do
                    if _G.Menu.StopSpawnCar then
                        _G.Notify('Aborted')

                        break
                    end

                    game:GetService('ReplicatedStorage').Interaction.RemoteProxy:FireServer(_G.SelectedCar.Parent.ButtonRemote_SpawnButton)
                    task.wait(1)

                    if _G.SpawnSuccess == true then
                        break
                    end
                end

                v511:Disconnect()
                _G.CarSpawnCheck:Disconnect()

                if not _G.Menu.StopSpawnCar then
                    _G.Notify('Finished spawning vehicle')
                end

                _G.Menu.SpawningCar = false

                return
            else
                return _G.Notify('No car color selected')
            end
        else
            return _G.Notify('you are using this feature')
        end
    end)
    _VehicleSpawner:Button('Abort', function()
        _G.Menu.StopSpawnCar = true
    end)

    _G.GetWood = function()
        local v512 = next
        local v513, v514 = game:GetService('Workspace').PlayerModels:GetChildren()

        for _, v515 in v512, v513, v514 do
            if v515:FindFirstChild('Owner') then
                if v515:FindFirstChild('WoodSection') then
                    if tostring(v515.Owner.Value) ~= _G.Menu.AutoFillPlayer then
                    elseif tostring(v515.TreeClass.Value) ~= _G.Menu.AutoFillTree then
                    else
                        return v515
                    end
                end
            end
        end
    end
    _G.FillAllBlueprints = function()
        local _CFrame12 = _G.RootPart.CFrame
        local v516 = next
        local v517, v518 = game:GetService('Workspace').PlayerModels:GetChildren()

        for _, v519 in v516, v517, v518 do
            if v519:FindFirstChild('Owner') then
                if v519:FindFirstChild('Main') then
                    if v519:FindFirstChild('Type') then
                        if v519.Type.Value == 'Blueprint' then
                            if v519.Owner.Value == _G.LocalPlayer then
                                local v520 = _G.GetWood()

                                _G.Teleport(v520.WoodSection.CFrame)

                                for _ = 1, 2 do
                                    for _ = 1, 5 do
                                        _G.PullItems:FireServer(v520)
                                        task.wait()
                                    end

                                    v520:PivotTo(v519.Main.CFrame)
                                    task.wait(0.1)
                                end

                                task.wait()
                            end
                        end
                    end
                end
            end
        end

        _G.Teleport(_CFrame12)
    end
    _G.Paint = function(p198)
        if _G.Menu.AutoFillTree ~= nil then
            local _CFrame13 = _G.RootPart.CFrame

            _G.BlueprintName = p198.ItemName.Value

            if p198:FindFirstChild('MainCFrame') then
                _G.OldLocation = p198.MainCFrame.Value
            else
                _G.OldLocation = p198.PrimaryPart.CFrame
            end

            _G.WoodSize = nil

            local v521 = next
            local v522, v523 = game:GetService('ReplicatedStorage').ClientItemInfo:GetChildren()

            for _, v524 in v521, v522, v523 do
                if v524.Name == _G.BlueprintName then
                    local v525 = next
                    local v526, v527 = v524:GetChildren()

                    for _, v528 in v525, v526, v527 do
                        if v528.Name == 'WoodCost' then
                            _G.WoodSize = v528.Value
                        end
                    end
                end
            end

            if _G.LocalPlayer.SuperBlueprint.Value then
                _G.WoodSize = 1
            end

            local v529 = _G
            local v530 = _G
            local v531, v532 = _G.CheckAxe(tonumber(_G.Menu.AutoFillTree))

            v530.Damage = v532
            v529.Axe = v531

            if _G.Damage then
                _G.WoodSizeAlt = nil
                _G.SelectedWood = nil

                local v533 = next
                local v534, v535 = game.Workspace:GetChildren()

                for _, v536 in v533, v534, v535 do
                    if v536.Name == 'TreeRegion' then
                        local v537 = next
                        local v538, v539 = v536:GetChildren()

                        for _, v540 in v537, v538, v539 do
                            if v540:FindFirstChild('WoodSection') then
                                if v540:FindFirstChild('TreeClass') then
                                    if v540:FindFirstChild('TreeClass').Value == _G.Menu.AutoFillTree then
                                        local v541 = next
                                        local v542, v543 = v540:GetChildren()

                                        for _, v544 in v541, v542, v543 do
                                            if v544.Name == 'WoodSection' then
                                                if v544.Size.X * v544.Size.Y * v544.Size.Z > _G.WoodSize then
                                                    if #v544.ChildIDs:GetChildren() == 0 then
                                                        if v544.Size.X < 9000000000 then
                                                            _G.WoodSizeAlt = v544.Size.X
                                                            _G.SelectedWood = v544
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end

                if _G.SelectedWood and _G.WoodSizeAlt then
                    _G.AddedWood = nil
                    _G.AddedTree = game.Workspace.LogModels.ChildAdded:connect(function(p199)
                        p199:WaitForChild('Owner')

                        if p199.Owner.Value == _G.LocalPlayer and (p199.TreeClass.Value == _G.Menu.AutoFillTree and p199:FindFirstChild('WoodSection')) then
                            _G.AddedWood = p199
                        end
                    end)
                    _G.ChopLocation = _G.WoodSize / (_G.SelectedWood.Size.X * _G.SelectedWood.Size.X) + 0.01

                    repeat
                        game['Run Service'].Heartbeat:wait()
                        _G.Teleport(_G.SelectedWood.CFrame + Vector3.new(4, 2, 2))
                        _G.Chop(_G.SelectedWood.Parent.CutEvent, _G.Axe, _G.SelectedWood.ID.Value, _G.SelectedWood.Size.Y - _G.ChopLocation, _G.Damage)
                    until _G.AddedWood ~= nil

                    pcall(function()
                        _G.AddedTree:Disconnect()

                        _G.AddedTree = nil
                    end)

                    _G.FillDone = false
                    _G.CheckSuccess = game.Workspace.PlayerModels.ChildAdded:Connect(function(p200)
                        p200:WaitForChild('Owner')

                        if p200.Owner.Value == _G.LocalPlayer and (p200:FindFirstChild('Type') and p200.Type.Value == 'Structure') and p200:FindFirstChild('BlueprintWoodClass') then
                            game.ReplicatedStorage.PlaceStructure.ClientPlacedStructure:FireServer(p200.ItemName.Value, _G.OldLocation, _G.LocalPlayer, _G.Menu.AutoFillTree, p200, true, nil)

                            _G.FillDone = true
                        end
                    end)
                    _G.PlankAdded = game:GetService('Workspace').PlayerModels.ChildAdded:connect(function(p201)
                        p201:WaitForChild('Owner')

                        if p201:FindFirstChild('Owner') and (p201.Owner.Value == _G.LocalPlayer and p201:FindFirstChild('WoodSection')) then
                            repeat
                                task.wait()
                            until p201:FindFirstChild('TreeClass')

                            p201.WoodSection.Anchored = true

                            local v545 = {
                                _G.BlueprintName,
                                p201.WoodSection.CFrame,
                                _G.LocalPlayer,
                                p198,
                                true,
                            }

                            game:GetService('ReplicatedStorage'):WaitForChild('PlaceStructure'):WaitForChild('ClientPlacedBlueprint'):FireServer(unpack(v545))
                        end
                    end)

                    repeat
                        _G.PullItems:FireServer(_G.AddedWood)
                        _G.AddedWood:PivotTo(_G.Menu.PaintSawmill.Particles.CFrame)
                        _G.PullItems:FireServer(_G.AddedWood)
                        task.wait(2)
                    until _G.AddedWood.Parent == nil
                    repeat
                        task.wait()
                    until _G.FillDone == true

                    pcall(function()
                        _G.PlankAdded:Disconnect()

                        _G.PlankAdded = nil

                        _G.CheckSuccess:Disconnect()

                        _G.CheckSuccess = nil
                    end)
                    _G.Notify('done')
                    _G.Teleport(_CFrame13)

                    return
                else
                    return _G.Notify('Not Find  right tree')
                end
            else
                return _G.Notify('you need one axe')
            end
        else
            return _G.Notify('select Wood At First')
        end
    end

    local _AutoBuild = v54:CreateTab('AutoBuild', '6034281908')
    local _AutoFiller = _AutoBuild:Section('Auto Filler')

    _AutoFiller:DropDown('Select the player', {}, true, false, function(p202)
        _G.Menu.AutoFillPlayer = p202
    end)
    _AutoFiller:DropDown('Select Wood Type', {
        'Generic',
        'GoldSwampy',
        'CaveCrawler',
        'Cherry',
        'Frost',
        'Volcano',
        'Oak',
        'Walnut',
        'Birch',
        'SnowGlow',
        'Pine',
        'GreenSwampy',
        'Koa',
        'Palm',
        'LoneCave',
        'Spooky',
        'SpookyNeon',
    }, false, false, function(p203)
        _G.Menu.AutoFillTree = p203
    end)

    _G.AutoFill = false

    _AutoFiller:Toggle('Auto Build Loops', false, function(p204)
        _G.AutoFill = p204

        while task.wait() do
            if _G.AutoFill == true then
                _G.FillAllBlueprints()
            end
        end
    end)
    _AutoFiller:Button('Fill All blueprint', function()
        _G.FillAllBlueprints()
    end)
    _AutoFiller:Toggle('Click to Fill', false, function(p205)
        if p205 then
            _G.ClickBlueprint = _G.Mouse.Button1Up:Connect(function()
                local _Target4 = _G.Mouse.Target

                if tostring(_Target4.Parent.Owner.Value) == _G.Menu.AutoFillPlayer and (_Target4.Parent:FindFirstChild('Type') and _Target4.Parent.Type.Value == 'Blueprint' and _Target4.Parent:FindFirstChild('Main')) then
                    local v546 = _G.GetWood()
                    local _CFrame14 = _G.RootPart.CFrame

                    _G.Teleport(v546.WoodSection.CFrame)
                    _G.PullItems:FireServer(v546)

                    for _ = 1, 2 do
                        for _ = 1, 5 do
                            _G.PullItems:FireServer(v546)
                            task.wait()
                        end

                        v546:PivotTo(_Target4.Parent.Main.CFrame)
                        task.wait(0.1)
                    end

                    _G.Teleport(_CFrame14)
                end
            end)
        else
            _G.ClickBlueprint:Disconnect()

            _G.ClickBlueprint = nil
        end
    end)

    local _Paint = _AutoBuild:Section('Paint')

    _G.Sawmill = _Paint:Label('Please Selecet one Sawmill')

    _Paint:Button('Click To Select Sawmill', function()
        local u75 = nil

        _G.Notify('Click one  Sawmill')

        local v547 = _G.Mouse.Button1Up:Connect(function()
            wait()

            local _Parent4 = _G.Mouse.Target.Parent

            if _Parent4:FindFirstChild('Settings') and _Parent4.Settings:FindFirstChild('DimZ') then
                u75 = _Parent4

                _G.Notify('Sawmill Selected')
            elseif _Parent4.Parent:FindFirstChild('Settings') and _Parent4.Parent.Settings:FindFirstChild('DimZ') then
                u75 = _Parent4.Parent

                _G.Notify('Sawmill Selected')
            end
        end)

        repeat
            task.wait(0.1)
        until u75 ~= nil

        _G.Menu.PaintSawmill = u75
        _G.Sawmill.Text = 'Selected'

        v547:Disconnect()
    end)
    _Paint:Toggle('Paint Tool', false, function(p206)
        if _G.Menu.PaintSawmill ~= nil then
            if p206 then
                _G.ClickBlueprint = _G.Mouse.Button1Up:Connect(function()
                    if _G.Mouse.Target.Parent.Owner.Value == _G.LocalPlayer and (_G.Mouse.Target.Parent:FindFirstChild('Type') and _G.Mouse.Target.Parent.Type.Value == 'Blueprint') then
                        _G.Paint(_G.Mouse.Target.Parent)
                    end
                end)
            else
                _G.ClickBlueprint:Disconnect()

                _G.ClickBlueprint = nil
            end

            return
        else
            return _G.Notify['select Sawmail At First']
        end
    end)

    _G.GetOwnBlueprints = function()
        local v548 = next
        local v549, v550 = _G.LocalPlayer.PlayerBlueprints.Blueprints:GetChildren()
        local v551 = {}

        for _, v552 in v548, v549, v550 do
            table.insert(v551, v552.Name)
        end

        return v551
    end
    _G.ReadFile = function(p207)
        local v553 = next
        local v554, v555 = string.split(p207, '/')
        local v556 = {}

        for _, v557 in v553, v554, v555 do
            if v557 ~= '' then
                table.insert(v556, v557)
            end
        end

        return v556
    end
    _G.FillBlueprint = function(p208)
        local _CFrame15 = _G.RootPart.CFrame

        _G.Teleport(_G.GetWood().WoodSection.CFrame)
        _G.PullItems:FireServer(_G.GetWood())

        for _ = 1, 2 do
            for _ = 1, 5 do
                _G.PullItems:FireServer(_G.GetWood())
                task.wait()
            end

            _G.GetWood():PivotTo(p208.Main.CFrame)
            task.wait(0.1)
        end

        _G.Teleport(_CFrame15)
    end

    local _BuildingTool = _AutoBuild:Section('Building Tool')

    _BuildingTool:DropDown('Select the player', {}, true, false, function(p209)
        _G.Menu.SaveBasePlayer = p209
    end)

    _G.WoodType = nil
    _G.WoodType = _BuildingTool:DropDown('All Plank(Click to get Count)', {}, false, false, function(p210)
        _G.Menu.AutoBuildWood = p210

        local v558 = next
        local v559, v560 = game.Workspace:FindFirstChild('Preview'):GetChildren()
        local v561 = 0

        for _, v562 in v558, v559, v560 do
            if v562:FindFirstChild('woodclass') then
                if v562.woodclass.Value == p210 then
                    v561 = v561 + 1
                end
            end
        end

        _G.Notify(v561 .. ' Plank')
    end)

    _BuildingTool:TextBox('Save Base', 'File Name', function(p211)
        local v563 = next
        local v564, v565 = _G.Land:GetChildren()
        local v566 = ''
        local v567 = nil

        for _, v568 in v563, v564, v565 do
            if tostring(v568.Owner.Value) == _G.Menu.SaveBasePlayer then
                v567 = v568.OriginSquare.CFrame.p
            end
        end

        local v569 = next
        local v570, v571 = workspace.PlayerModels:GetChildren()

        for _, v572 in v569, v570, v571 do
            if v572:FindFirstChild('Owner') then
                if tostring(v572.Owner.Value) == _G.Menu.SaveBasePlayer then
                    if v572:FindFirstChild('BlueprintWoodClass') then
                        if v572:FindFirstChild('MainCFrame') then
                            v566 = v566 .. 'CFrame' .. tostring(v572.MainCFrame.Value - v567) .. 'Blueprint' .. tostring(v572.ItemName.Value) .. 'Wood' .. tostring(v572.BlueprintWoodClass.Value) .. '/'
                        end
                    end
                end
            end
        end

        writefile(p211, v566)
        _G.Notify('success')
    end)

    _G.CheckBlueprint = function()
        local v573 = next
        local v574, v575 = workspace.PlayerModels:GetChildren()
        local v576 = 0

        for _, v577 in v573, v574, v575 do
            if v577:FindFirstChild('BuildDependentWood') then
                if not v577:FindFirstChild('BlueprintWoodClass') then
                    v576 = v576 + 1
                end
            end
        end

        return 50 > v576
    end

    _BuildingTool:TextBox('load Base', 'File Name', function(p212)
        local u76 = nil

        pcall(function()
            u76 = readfile(p212)
        end)

        if u76 == nil then
            return _G.Notify('not find file')
        else
            if game.Workspace:FindFirstChild('Preview') then
                game.Workspace:FindFirstChild('Preview'):Destroy()
            end

            local _Folder2 = Instance.new('Folder', game.Workspace)

            _Folder2.Name = 'Preview'

            local v578 = next
            local v579, v580 = _G.Land:GetChildren()
            local v581 = nil

            for _, v582 in v578, v579, v580 do
                if v582.Owner.Value == _G.LocalPlayer then
                    v581 = v582.OriginSquare.CFrame.p
                end
            end

            local v583 = next
            local v584, v585 = _G.ReadFile(u76)
            local v586 = {}

            for _, v587 in v583, v584, v585 do
                local _Blueprint = v587:split('Blueprint')
                local v588 = next
                local v589, v590 = tostring(_Blueprint[1]:split('CFrame')[2]):split(',')
                local v591 = {}

                for _, v592 in v588, v589, v590 do
                    if v592 ~= '' then
                        table.insert(v591, v592)
                    end
                end

                local v593 = {}

                table.insert(v593, _Blueprint[2]:split('Wood')[1])

                local v594 = next
                local v595, v596 = game:GetService('ReplicatedStorage').ClientItemInfo:GetChildren()

                for _, v597 in v594, v595, v596 do
                    if v597:FindFirstChild('ItemName') then
                        if tostring(v597.ItemName.Parent) == v593[1] then
                            if v597:FindFirstChildOfClass('Model') then
                                local v598 = v597.Model:Clone()

                                v598.Parent = _Folder2
                                v598.Name = v593[1]

                                v598:PivotTo(CFrame.new(tonumber(v591[1]), tonumber(v591[2]), tonumber(v591[3]), tonumber(v591[4]), tonumber(v591[5]), tonumber(v591[6]), tonumber(v591[7]), tonumber(v591[8]), tonumber(v591[9]), tonumber(v591[10]), tonumber(v591[11]), tonumber(v591[12])) + v581)

                                local _StringValue = Instance.new('StringValue', v598)

                                _StringValue.Name = 'woodclass'
                                _StringValue.Value = _Blueprint[2]:split('Wood')[2]

                                if not table.find(v586, _Blueprint[2]:split('Wood')[2]) then
                                    table.insert(v586, _Blueprint[2]:split('Wood')[2])
                                end
                            end
                        end
                    end
                end
            end

            print(v586)
            _G.WoodType:SetOptions(v586)
            _G.Notify('load success')

            return
        end
    end)
    _BuildingTool:Button('select blueprint', function()
        local v599 = next
        local v600, v601 = game.Workspace:FindFirstChild('Preview'):GetChildren()

        for _, v602 in v599, v600, v601 do
            if v602:FindFirstChild('SelectionBox') then
                v602:Destroy()
            end
        end

        if _G.Menu.AutoBuildWood ~= nil then
            if game.Workspace:FindFirstChild('Preview') then
                local v603 = next
                local v604, v605 = game.Workspace:FindFirstChild('Preview'):GetChildren()
                local v606 = 0

                for _, v607 in v603, v604, v605 do
                    if v607:FindFirstChild('woodclass') then
                        if tostring(v607.woodclass.Value) == _G.Menu.AutoBuildWood then
                            if v606 <= 50 then
                                local _SelectionBox8 = Instance.new('SelectionBox', v607)

                                _SelectionBox8.LineThickness = 0.1
                                _SelectionBox8.Adornee = v607
                                v606 = v606 + 1
                            end
                        end
                    end
                end

                _G.Notify('Click Build if u already build done and fill it then click this button again')

                return
            else
                return _G.Notify('load ur file at first')
            end
        else
            return _G.Notify('select Wood At First')
        end
    end)

    _G.BaseAddBlueprint = nil

    _BuildingTool:Button('Build!', function()
        if game.Workspace:FindFirstChild('Preview') then
            local v608 = next
            local v609, v610 = game.Workspace:FindFirstChild('Preview'):GetChildren()
            local v611 = {}

            for _, v612 in v608, v609, v610 do
                if not table.find(v611, v612.Name) then
                    table.insert(v611, v612.Name)
                end
            end
            for _, v613 in next, v611 do
                if _G.LocalPlayer.PlayerBlueprints.Blueprints:FindFirstChild(v613) then
                    return _G.Notify('u need ' .. v613 .. ' BluePrint')
                end
            end

            local v614 = next
            local v615, v616 = game.Workspace:FindFirstChild('Preview'):GetChildren()
            local v617 = false

            for _, v618 in v614, v615, v616 do
                if v618:FindFirstChild('SelectionBox') then
                    v617 = true
                end
            end

            if v617 == false then
                return _G.Notify('select blueprint at first')
            else
                local u77 = false

                _G.BaseAddBlueprint = game.Workspace.PlayerModels.ChildAdded:Connect(function(p213)
                    if p213:FindFirstChild('Owner') and (p213.Owner.Value == _G.LocalPlayer and p213:FindFirstChild('BuildDependentWood')) then
                        u77 = true
                    end
                end)

                local v619 = next
                local v620, v621 = game.Workspace.Preview:GetChildren()

                for _, v622 in v619, v620, v621 do
                    if v622:IsA('Model') then
                        if v622:FindFirstChild('Main') then
                            if v622:FindFirstChild('SelectionBox') then
                                repeat
                                    task.wait()
                                    game:GetService('ReplicatedStorage'):WaitForChild('PlaceStructure'):WaitForChild('ClientPlacedBlueprint'):FireServer(v622.Name, v622.Main.CFrame, _G.LocalPlayer)
                                until u77 == true

                                v622:Destroy()

                                if _G.CheckBlueprint == false then
                                    repeat
                                        wait()
                                    until _G.CheckBlueprint == true
                                end

                                task.wait()
                            end
                        end
                    end
                end

                pcall(function()
                    _G.BaseAddBlueprint:Disconnect()

                    _G.BaseAddBlueprint = nil
                end)

                return
            end
        else
            return _G.Notify('load ur file at first')
        end
    end)

    local _BluePrintPlace = _AutoBuild:Section('BluePrint Place')
    local _SelectBluePrintType = _BluePrintPlace:DropDown('Select BluePrint Type', _G.GetOwnBlueprints(), false, false, function(p214)
        _G.Menu.BlueprintName = p214
    end)

    _G.LocalPlayer.PlayerBlueprints.Blueprints.ChildAdded:Connect(function(_)
        _SelectBluePrintType:SetOptions(_G.GetOwnBlueprints())
    end)
    _BluePrintPlace:Label('R T   to Use Rotate to Place B Abort')
    _BluePrintPlace:Button('Go!', function()
        local u78 = _G.Menu.BlueprintName
        local u79 = game.ReplicatedStorage.ClientItemInfo[u78].Model:Clone()

        u79.Parent = Workspace
        u79.Name = 'Dark XBlueprint'

        local v623 = next
        local v624, v625 = u79:GetChildren()
        local u80 = nil
        local u81 = 0
        local u82 = false
        local u83 = 0
        local u84 = false
        local u85 = 0
        local u86 = false
        local u87 = nil

        for _, v626 in v623, v624, v625 do
            if v626.Name == 'BuildDependentWood' then
                v626.Transparency = 0
            end
        end

        local v627 = {
            Function = game:GetService('UserInputService').InputBegan:Connect(function(p215)
                if p215.KeyCode ~= Enum.KeyCode.R then
                    if p215.KeyCode == Enum.KeyCode.T then
                        u84 = true

                        while u84 do
                            u85 = u85 + 1

                            task.wait()
                        end
                    end
                else
                    u82 = true

                    while u82 do
                        u83 = u83 + 1

                        task.wait()
                    end
                end
            end),
        }
        local u88 = v627
        local v628 = {
            Function = game:GetService('UserInputService').InputEnded:Connect(function(p216)
                if p216.KeyCode == Enum.KeyCode.R or p216.KeyCode == Enum.KeyCode.T then
                    u84 = false
                    u86 = false
                    u82 = false
                end
            end),
        }
        local u89 = v628
        local v629 = {
            Function = game:GetService('UserInputService').InputBegan:Connect(function(p217)
                if p217.KeyCode ~= Enum.KeyCode.E then
                    if p217.KeyCode == Enum.KeyCode.B then
                        pcall(function()
                            u79:Destroy()
                            u88.Function:Disconnect()

                            u88 = nil

                            u89.Function:Disconnect()

                            u89 = nil

                            u87.Function:Disconnect()

                            u87 = nil

                            u80.Function:Disconnect()

                            u80 = nil
                        end)
                    end
                else
                    game:GetService('ReplicatedStorage'):WaitForChild('PlaceStructure'):WaitForChild('ClientPlacedBlueprint'):FireServer(u78, u79.Main.CFrame, _G.LocalPlayer)
                end
            end),
        }
        local _ = v629
        local v630 = {
            Function = game:GetService('RunService').RenderStepped:Connect(function()
                if u79.Parent then
                    u79:PivotTo(CFrame.new(_G.Mouse.Hit.Position.X, _G.Mouse.Hit.Position.Y, _G.Mouse.Hit.Position.Z) * CFrame.Angles(u81, math.rad(u83), math.rad(u85)))

                    return
                else
                    return
                end
            end),
        }
        local _ = v630
    end)

    local u90 = nil
    local _wireart = _AutoBuild:Section('wire art')

    _wireart:TextBox('Url', '', function(p218)
        u90 = loadstring(game:HttpGet(p218))()
    end)

    local u91 = 'Wire'

    _wireart:DropDown('Select Wire', {
        'NeonWirePinky',
        'NeonWireOrange',
        'NeonWireRed',
        'NeonWireViolet',
        'NeonWireWhite',
        'NeonWireYellow',
        'NeonWireBlue',
        'NeonWireCyan',
        'NeonWireGreen',
        'IcicleWireBlue',
        'IcicleWireAmber',
        'IcicleWireRed',
        'IcicleWireGreen',
        'IcicleWireMagenta',
        'IcicleWireHalloween',
        'Wire',
    }, false, false, function(p219)
        u91 = p219
    end)

    _G.WireLocation = function(p220)
        _G.Wire = p220
        _G.Distance = 0
        _G.ReturnWire = {}
        _G.AllWires = {}

        local v631 = nil

        for _, v632 in next, _G.Wiredo
            if v631 == nil then
                table.insert(_G.AllWires, v632)

                v631 = v632
            elseif _G.Distance + (v632 - v631).magnitude <= game:GetService('ReplicatedStorage').ClientItemInfo:FindFirstChild(u91).OtherInfo.MaxLength.Value then
                _G.Distance = _G.Distance + (v632 - v631).magnitude

                table.insert(_G.AllWires, v632)

                v631 = v632
            else
                table.insert(_G.ReturnWire, _G.AllWires)

                _G.AllWires = {}
                _G.Distance = 0

                table.insert(_G.AllWires, v631)

                _G.Distance = (v632 - v631).magnitude

                table.insert(_G.AllWires, v632)

                v631 = v632
            end
        end

        if #_G.AllWires > 0 then
            table.insert(_G.ReturnWire, _G.AllWires)
        end

        return _G.ReturnWire
    end
    drawLine = function(p221, p222, p223)
        local _magnitude = (p221 - p222).magnitude
        local _Part4 = Instance.new('Part')

        _Part4.Anchored = true
        _Part4.CFrame = CFrame.new(p221, p222) * CFrame.Angles(-math.pi / 2, 0, 0) * CFrame.new(0, _magnitude / 2, 0)
        _Part4.Size = Vector3.new(math.max(p223, 0.2), _magnitude, math.max(p223, 0.2))
        _Part4.TopSurface = Enum.SurfaceType.Smooth
        _Part4.BottomSurface = Enum.SurfaceType.Smooth
        Instance.new('CylinderMesh', _Part4).Scale = Vector3.new(math.min(p223 / 0.2, 1), 1, math.min(p223 / 0.2, 1))

        return _Part4
    end
    drawBall = function(p224, p225)
        local _Part5 = Instance.new('Part')

        _Part5.Anchored = true
        _Part5.Shape = Enum.PartType.Ball
        _Part5.Size = Vector3.new(1, 1, 1) * math.max(p225, 0.2)
        _Part5.CFrame = CFrame.new(p224)
        _Part5.TopSurface = Enum.SurfaceType.Smooth
        _Part5.BottomSurface = Enum.SurfaceType.Smooth

        local _SpecialMesh = Instance.new('SpecialMesh', _Part5)

        _SpecialMesh.MeshType = Enum.MeshType.Sphere
        _SpecialMesh.Scale = Vector3.new(1, 1, 1) * math.min(p225 / 0.2, 1)
        _Part5.CanCollide = false

        return _Part5
    end
    drawEnd = function(p226, p227, p228)
        local _Part6 = Instance.new('Part')

        _Part6.Anchored = true
        _Part6.Shape = Enum.PartType.Cylinder
        _Part6.Size = Vector3.new(0.4, 1, 1) * p227
        _Part6.CFrame = CFrame.new(p226) * p228
        _Part6.TopSurface = Enum.SurfaceType.Smooth
        _Part6.BottomSurface = Enum.SurfaceType.Smooth

        return _Part6
    end

    local u92 = nil

    _wireart:Button('preview', function()
        if u90 ~= nil then
            u92 = _G.RootPart.Position

            local _Model = Instance.new('Model')

            _Model.Name = 'Dark X Wire art'

            local v633 = next
            local v634, v635 = _G.WireLocation(u90)

            for _, v636 in v633, v634, v635 do
                local v637 = {}

                for _, v638 in next, v636 do
                    table.insert(v637, v638 + (u92 + Vector3.new(0, 5, 0)))
                end

                _Model.Parent = game.Workspace

                for v639, v640 in pairs(v637)do
                    if 1 < v639 and v639 < #v637 then
                        local v641 = drawBall(v640, game:GetService('ReplicatedStorage').ClientItemInfo:FindFirstChild('Wire').OtherInfo.Thickness.Value)

                        v641.Parent = _Model
                        v641.Name = 'Point' .. v639
                        v641.Parent = _Model
                    end
                    if v639 < #v637 then
                        local v642 = drawLine(v640, v637[v639 + 1], game:GetService('ReplicatedStorage').ClientItemInfo:FindFirstChild('Wire').OtherInfo.Thickness.Value)

                        v642.Parent = _Model
                        v642.Name = 'Line' .. v639
                        v642.Parent = _Model
                    end
                end

                local _CFrame16 = _Model.Line1.CFrame
                local v643 = (_CFrame16 - _CFrame16.p) * CFrame.Angles(0, 0, -math.pi / 2)

                drawEnd(v637[1], game:GetService('ReplicatedStorage').ClientItemInfo:FindFirstChild('Wire').OtherInfo.Thickness.Value, v643).Parent = _Model

                local v644 = _Model['Line' .. #v637 - 1].CFrame * CFrame.Angles(0, 0, math.pi / 2)
                local v645 = v644 - v644.p

                drawEnd(v637[#v637], game:GetService('ReplicatedStorage').ClientItemInfo:FindFirstChild('Wire').OtherInfo.Thickness.Value, v645).Parent = _Model
            end

            return
        else
            return _G.Notify('u need wire art')
        end
    end)
    _wireart:Button('destroy preview', function()
        pcall(function()
            game.Workspace['Dark X Wire art']:Destroy()
        end)

        u92 = nil
    end)

    _G.CheckWire = function(p229, p230)
        local v646 = next
        local v647, v648 = workspace.PlayerModels:GetChildren()
        local v649 = {}

        for _, v650 in v646, v647, v648 do
            if v650:FindFirstChild('Owner') then
                if v650.Owner.Value == _G.LocalPlayer then
                    if v650:FindFirstChild('PurchasedBoxItemName') then
                        if tostring(v650.PurchasedBoxItemName.Value) == p229 then
                            table.insert(v649, v650)
                        end
                    end
                end
            end
        end

        return #v649 >= p230 and true or #v649
    end

    _wireart:Button('put', function()
        pcall(function()
            game.Workspace['Dark X Wire art']:Destroy()
        end)

        if _G.CheckWire(u91, #_G.WireLocation(u90)) ~= true then
            print('buy')

            _G.Menu.AutoBuyLocation = _G.RootPart.CFrame

            _G.AutoBuyV2(u91, #_G.WireLocation(u90) - _G.CheckWire(u91, #_G.WireLocation(u90)))
            task.wait()
        end

        _G.Teleport(_G.Menu.AutoBuyLocation)

        local v651 = next
        local v652, v653 = _G.WireLocation(u90)

        for _, v654 in v651, v652, v653 do
            local v655 = {}

            for _, v656 in next, v654 do
                table.insert(v655, v656 + (u92 + Vector3.new(0, 5, 0)))
            end

            local v657 = next
            local v658, v659 = workspace.PlayerModels:GetChildren()
            local v660 = nil

            for _, v661 in v657, v658, v659 do
                if v661:FindFirstChild('Owner') then
                    if v661.Owner.Value == _G.LocalPlayer then
                        if v661:FindFirstChild('PurchasedBoxItemName') then
                            if tostring(v661.PurchasedBoxItemName.Value) == u91 then
                                v660 = v661
                            end
                        end
                    end
                end
            end

            local v662 = {
                game:GetService('ReplicatedStorage'):WaitForChild('ClientItemInfo')[u91],
                v655,
                _G.LocalPlayer,
                v660,
                true,
            }

            game:GetService('ReplicatedStorage'):WaitForChild('PlaceStructure'):WaitForChild('ClientPlacedWire'):FireServer(unpack(v662))
            task.wait(2)
        end

        u92 = nil
    end)

    _G.GetCar = function()
        local v663 = next
        local v664, v665 = game.Workspace.PlayerModels:GetChildren()
        local v666 = 0
        local v667 = {}
        local v668 = 0
        local v669 = {}

        for _, v670 in v663, v664, v665 do
            if v670:FindFirstChild('Owner') then
                if v670.Owner.Value == _G.LocalPlayer then
                    if v670:FindFirstChild('Seat') then
                        v666 = v666 + 1

                        table.insert(v667, v670)
                    end
                end
            end
        end

        if v666 == 0 then
            local v671 = next
            local v672, v673 = game.Workspace.PlayerModels:GetChildren()

            for _, v674 in v671, v672, v673 do
                if v674:FindFirstChild('Owner') then
                    if v674.Owner.Value == _G.LocalPlayer then
                        if v674:FindFirstChild('ButtonRemote_SpawnButton') then
                            if v674:FindFirstChild('SpawnButton') then
                                v668 = v668 + 1

                                table.insert(v669, v674)
                            end
                        end
                    end
                end
            end

            if v668 == 0 then
                return nil
            else
                return v669, false
            end
        else
            return v667, true
        end
    end
    _G.MessWithPlayer = function()
        if _G.Menu.KillTool ~= 'Axe' or _G.GetTool ~= nil then
            if _G.Menu.KillTool ~= 'Vehicle' or _G.GetCar() ~= nil then
                if _G.Players:FindFirstChild(tostring(_G.Menu.KillTargetPlayer)) then
                    if tostring(_G.Menu.KillTargetPlayer) ~= tostring(_G.LocalPlayer) then
                        if _G.Humanoid.SeatPart ~= nil or _G.Menu.KillTool ~= 'Vehicle' then
                            if _G.Players[_G.Menu.KillTargetPlayer ].Character.Humanoid.SeatPart == nil then
                                if tostring(_G.Humanoid.SeatPart) == 'DriveSeat' or _G.Menu.KillTool ~= 'Vehicle' then
                                    local _CFrame17 = _G.RootPart.CFrame

                                    if _G.Menu.KillTool == 'Vehicle' then
                                        car = _G.Humanoid.SeatPart.Parent

                                        game:GetService('ReplicatedStorage').Interaction.UpdateUserSettings:FireServer('UserPermission', _G.Players[_G.Menu.KillTargetPlayer ].UserId, 'Sit', true)

                                        repeat
                                            _G.Teleport(_G.Players[_G.Menu.KillTargetPlayer ].Character.PrimaryPart.CFrame * CFrame.Angles(math.rad(-180), 0, 0) + Vector3.new(0, 2, 0))
                                            task.wait(1)
                                        until _G.Players[_G.Menu.KillTargetPlayer ].Character.Humanoid.SeatPart == car.Seat

                                        if _G.Menu.KillMethod ~= 'Hard Kill' then
                                            if _G.Menu.KillMethod ~= 'Kill' then
                                                local _ = _G.Menu.KillMethod ~= 'Bring'
                                            else
                                                _G.Teleport(CFrame.new(0, -50, 0))
                                                wait(1)
                                                game.ReplicatedStorage.Interaction.DestroyStructure:FireServer(car)
                                                wait(0.3)
                                            end
                                        else
                                            _G.Teleport(CFrame.new(-1675, 500, 1282))
                                            wait(1)
                                            game.ReplicatedStorage.Interaction.DestroyStructure:FireServer(car)
                                            wait(0.3)
                                        end
                                    end

                                    _G.Teleport(_CFrame17)

                                    return
                                else
                                    return _G.Notify("You Need To Be In The Driver's Seat")
                                end
                            else
                                return _G.Notify('Selected Player Is Seated!')
                            end
                        else
                            return _G.Notify('pls sit in a car')
                        end
                    else
                        return _G.Notify('You Cannot Perform This Action On Yourself!')
                    end
                else
                    return _G.Notify('Selected Player Has Left The Game!')
                end
            else
                return _G.Notify('You Need A Vehicle To Use This Feature.')
            end
        else
            return _G.Notify('You Need An Axe To Use This Feature.')
        end
    end
    _G.AxeFly = function(p231)
        if p231 then
            _G.Menu.AxeDrop = game.Workspace.PlayerModels.ChildAdded:Connect(function(p232)
                if p232:WaitForChild('Owner') and (p232.Owner.Value == _G.LocalPlayer and p232:WaitForChild('Main')) and p232:WaitForChild('ToolName') then
                    local _BodyAngularVelocity = Instance.new('BodyAngularVelocity', p232.Main)
                    local _BodyPosition2 = Instance.new('BodyPosition', p232.Main)

                    _BodyPosition2.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    _BodyPosition2.Position = _G.Mouse.Hit.p
                    _BodyPosition2.P = 1000000
                    _BodyAngularVelocity.P = 9000000000
                    _BodyAngularVelocity.MaxTorque = Vector3.new(0, 9999999, 0)
                    _BodyAngularVelocity.AngularVelocity = Vector3.new(0, 9999999, 0)
                    _BodyAngularVelocity.P = 9999999

                    local v675 = 0

                    while p232:FindFirstChild('Main') do
                        game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(p232)

                        p232.Main.CFrame = CFrame.new(_G.Mouse.Hit.p) * CFrame.Angles(math.rad(20 * v675), 0, 0)
                        v675 = v675 + 1

                        task.wait(0.5)

                        if (_G.Character.Head.CFrame.p - p232:WaitForChild('Main').CFrame.p).Magnitude >= 15 or 40 <= v675 then
                            break
                        end
                    end

                    game:GetService('ReplicatedStorage').Interaction.ClientInteracted:FireServer(p232, 'Pick up tool')
                    _G.Character:WaitForChild('Tool')
                    _G.Humanoid:UnequipTools()
                end
            end)
            _G.Menu.AxeFly = _G.Mouse.Button1Up:Connect(function()
                game:GetService('ReplicatedStorage').Interaction.ClientInteracted:FireServer(_G.LocalPlayer.Backpack:FindFirstChild('Tool') or _G.Character:FindFirstChild('Tool'), 'Drop tool', _G.LocalPlayer.Character['Right Arm'].CFrame - Vector3.new(5, 0, 0))
            end)

            return
        else
            _G.Menu.AxeDrop:Disconnect()
            _G.Menu.AxeFly:Disconnect()

            return
        end
    end

    local _Player3 = v54:CreateTab('Troll', '8769279408'):Section('Player')

    _Player3:DropDown('Select the player', {}, true, false, function(p233)
        _G.Menu.KillTargetPlayer = p233
    end)
    _Player3:DropDown('Method', {
        'Kill',
        'Hard Kill',
        'Bring',
    }, false, false, function(p234)
        _G.Menu.KillMethod = p234
    end)
    _Player3:DropDown('select tool', {
        'Vehicle',
    }, false, false, function(p235)
        _G.Menu.KillTool = p235
    end)
    _Player3:Button('Kill!', function()
        _G.MessWithPlayer()
    end)
    _Player3:Toggle('Delete all Shop items', false, function(p236)
        _G.Menu.DeleteStoreItem = p236
    end)
    _Player3:Toggle('Tomahawk Axe Fling', false, function(p237)
        _G.AxeFly(p237)
    end)

    local _Credits = v54:CreateTab('Settings', '6031280882'):Section('Credits')

    _Credits:Label('UI Made by silent ben8x')
    _Credits:Label('Devs : silent ben8x and Thchjh')
    _Credits:Label('UI: Fluent by dawid-scripts')

    Window:SelectTab(1)

    _Credits:KeyBind('Toggle UI', 'RightShift', function(_)
        u47:ToggleUI()
    end)
    _G.Notify('Dark X load success')
    wait(2)
    _G.Notify('our discord: https://discord.gg/6aP9akd5rX')

    local u93 = nil

    u93 = hookmetamethod(game, '__namecall', function(p238, ...)
        if getnamecallmethod() ~= 'FireServer' or (not _G.Menu.WaterInvincible or p238.Name ~= 'DamageHumanoid') then
            return u93(p238, ...)
        else
            return
        end
    end)

    local u94 = nil

    u94 = hookmetamethod(game, '__namecall', function(...)
        local v684 = {...}
        local v685 = getnamecallmethod()

        if v685 == 'FindPartOnRayWithIgnoreList' and (v684[3][2] and _G.Menu.SuperWire) then
            rawset(v684, 2, Ray.new(Vector3.new(0, 0, 0), Vector3.new(0, 0, 0)))
        end

        setnamecallmethod(v685)

        return u94(unpack(v684))
    end)

    return
else
    return _G.LocalPlayer:Kick('you are using old dark x')
end
