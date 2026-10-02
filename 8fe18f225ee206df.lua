-- ts file was generated at discord.gg/25ms

print('loading')

repeat
    wait(0.1)
until game:IsLoaded()

game:GetService('Workspace').Stores.WoodRUs.Parts.PREMIUMSELECTION.SurfaceGui.TextLabel.Text = 'Dark X V5.0'

pcall(function()
    _G['\u{73a9}\u{5bb6}'] = game.Players
    _G['\u{81ea}\u{5df1}'] = _G['\u{73a9}\u{5bb6}'].LocalPlayer
    _G['\u{81ea}\u{5df1}\u{89d2}\u{8272}'] = _G['\u{81ea}\u{5df1}'].Character
    _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'] = _G['\u{81ea}\u{5df1}\u{89d2}\u{8272}'].Humanoid
    _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}'] = _G['\u{81ea}\u{5df1}\u{89d2}\u{8272}'].HumanoidRootPart
    _G['\u{571f}\u{5730}'] = game.Workspace.Properties
end)
spawn(function()
    while task.wait(0.1) do
        pcall(function()
            _G['\u{73a9}\u{5bb6}'] = game.Players
            _G['\u{81ea}\u{5df1}'] = _G['\u{73a9}\u{5bb6}'].LocalPlayer
            _G['\u{81ea}\u{5df1}\u{89d2}\u{8272}'] = _G['\u{81ea}\u{5df1}'].Character
            _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'] = _G['\u{81ea}\u{5df1}\u{89d2}\u{8272}'].Humanoid
            _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}'] = _G['\u{81ea}\u{5df1}\u{89d2}\u{8272}'].HumanoidRootPart
            _G['\u{571f}\u{5730}'] = game.Workspace.Properties
        end)
    end
end)

local v = loadstring(game:HttpGet('https://pastebin.com/raw/gfRaKGuw'))()

repeat
    wait()
until v ~= nil

_G['\u{5ca9}\u{6d46}'] = nil

pcall(function()
    local v1 = next
    local v2, v3 = Workspace.Region_Volcano:GetChildren()

    for _, v4 in v1, v2, v3 do
        if v4:FindFirstChild('Lava') then
            if v4.Lava.CFrame == CFrame.new(-1675.2002, 255.002533, 1284.19983, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268) then
                wait()

                _G['\u{5ca9}\u{6d46}'] = v4.Lava
            end
        end
    end

    _G['\u{5ca9}\u{6d46}'].Size = Vector3.new(0, 0, 0)
end)

if v == 'welcome to use dark x' then
    wait(0.2)
    spawn(function()
        local v5 = next
        local v6, v7 = _G['\u{81ea}\u{5df1}'].PlayerGui:GetChildren()

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
    game:GetService('ReplicatedStorage'):WaitForChild('LoadSaveRequests'):WaitForChild('GetMetaData'):InvokeServer(_G['\u{81ea}\u{5df1}'])
    game:GetService('Players').LocalPlayer:GetMouse()

    _G['\u{83dc}\u{5355}'] = {
        ['\u{4f20}\u{9001}\u{7684}\u{73a9}\u{5bb6}'] = nil,
        ['\u{6b63}\u{5728}\u{98de}\u{884c}'] = false,
        ['\u{98de}\u{884c}\u{901f}\u{5ea6}'] = 200,
        ['\u{98de}\u{884c}'] = false,
        ['\u{7ec8}\u{65e5}\u{767d}\u{5929}'] = false,
        ['\u{7ec8}\u{65e5}\u{9ed1}\u{591c}'] = false,
        ['\u{6d88}\u{9664}\u{96fe}'] = false,
        ['\u{9009}\u{62e9}\u{7684}\u{6811}'] = {
            'Generic',
        },
        ['\u{5e26}\u{6765}\u{6811}\u{7684}\u{6570}\u{91cf}'] = 1,
        ['\u{6811}\u{653e}\u{7f6e}\u{7684}\u{5730}\u{70b9}'] = nil,
        ['\u{5927}\u{529b}'] = false,
        ['\u{505c}\u{6b62}\u{780d}\u{6811}'] = false,
        ['\u{9009}\u{62e9}\u{7684}\u{952f}\u{6728}\u{673a}'] = nil,
        ['\u{5b58}\u{6863}'] = 1,
        ['\u{5feb}\u{901f}\u{52a0}\u{8f7d}'] = false,
        ['\u{64e6}\u{53bb}\u{7684}\u{4e1c}\u{897f}'] = 'Structure',
        ['\u{64e6}\u{53bb}\u{7684}\u{73a9}\u{5bb6}'] = _G['\u{81ea}\u{5df1}'].Name,
        ['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}\u{7684}\u{5730}\u{70b9}'] = nil,
        ['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}\u{7684}\u{6570}\u{91cf}'] = 1,
        ['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}\u{7684}\u{7269}\u{54c1}'] = nil,
        ['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}\u{505c}\u{6b62}'] = false,
        ['\u{5546}\u{5e97}\u{540d}\u{5b57}'] = 'All',
        ['\u{884c}\u{8d70}\u{901f}\u{5ea6}'] = 50,
        ['\u{8df3}\u{8dc3}\u{63d0}\u{5347}'] = 100,
        ['\u{590d}\u{5236}\u{65a7}\u{5934}\u{6570}\u{91cf}'] = 1,
        ['\u{81ea}\u{52a8}\u{590d}\u{5236}\u{65a7}\u{5934}'] = false,
        ['\u{4f20}\u{9001}\u{7684}\u{73a9}\u{5bb6}'] = _G['\u{81ea}\u{5df1}'].Name,
        ['\u{4f20}\u{9001}\u{505c}\u{6b62}'] = false,
        ['\u{7269}\u{54c1}\u{6846}'] = nil,
        ['\u{505c}\u{6b62}\u{6574}\u{7406}'] = false,
        ['\u{6b63}\u{5728}\u{5904}\u{7406}\u{6811}'] = false,
        ['\u{6b63}\u{5728}\u{6574}\u{7406}\u{7269}\u{54c1}'] = false,
        ['\u{6574}\u{7406}\u{7269}\u{54c1}X'] = 5,
        ['\u{6574}\u{7406}\u{7269}\u{54c1}Z'] = 5,
        ['\u{6728}\u{5934}\u{7ad6}\u{7740}\u{4f20}\u{9001}'] = false,
        ['\u{5e26}\u{6765}\u{5e7b}\u{5f71}\u{62ff}\u{65a7}\u{5934}'] = nil,
        ['\u{6c7d}\u{8f66}\u{7684}\u{989c}\u{8272}'] = nil,
        ['\u{505c}\u{6b62}\u{751f}\u{6210}\u{8f66}'] = false,
        ['\u{6b63}\u{5728}\u{751f}\u{6210}\u{8f66}'] = false,
        ['\u{81ea}\u{52a8}\u{586b}\u{5145}\u{7684}\u{6811}'] = nil,
        ['\u{6cb9}\u{6f06}\u{7684}\u{952f}\u{6728}\u{673a}'] = nil,
        ['\u{590d}\u{5236}\u{571f}\u{5730}\u{5230}\u{73a9}\u{5bb6}'] = nil,
        ['\u{590d}\u{5236}\u{7684}\u{5b58}\u{6863}'] = nil,
        ['\u{590d}\u{5236}\u{57fa}\u{5730}\u{7b49}\u{5f85}\u{52a0}\u{8f7d}'] = false,
        ['\u{590d}\u{5236}\u{65f6}\u{95f4}'] = 1,
        ['\u{4f7f}\u{7528}\u{81ea}\u{5df1}\u{65f6}\u{95f4}'] = false,
        ['\u{81ea}\u{52a8}\u{83b7}\u{5f97}\u{9ca8}\u{9c7c}'] = false,
        ['\u{5904}\u{7406}\u{780d}\u{597d}\u{7684}\u{6728}\u{5934}'] = false,
        ['\u{5220}\u{9664}\u{6240}\u{6709}\u{5546}\u{5e97}\u{7269}\u{54c1}'] = false,
        ['\u{81ea}\u{52a8}\u{5356}\u{6807}\u{5fd7}\u{724c}'] = false,
        ['\u{6740}\u{6b7b}\u{7684}\u{73a9}\u{5bb6}'] = nil,
        ['\u{6740}\u{6b7b}\u{7684}\u{65b9}\u{6cd5}'] = nil,
        ['\u{6740}\u{6b7b}\u{7684}\u{5de5}\u{5177}'] = nil,
        ['\u{9009}\u{62e9}\u{7684}\u{84dd}\u{56fe}'] = 'Floor2',
        ['\u{6c34}\u{4e2d}\u{65e0}\u{654c}'] = false,
        ['\u{81ea}\u{52a8}\u{780d}'] = false,
        ['\u{81ea}\u{52a8}\u{780d}\u{7684}\u{94fe}\u{63a5}'] = nil,
        ['\u{6709}\u{8d85}\u{7ea7}\u{5efa}\u{9020}\u{7684}\u{5b58}\u{6863}'] = 1,
        ['\u{590d}\u{5236}\u{8fc7}\u{53bb}\u{7684}\u{5b58}\u{6863}'] = 1,
        ['\u{65a7}\u{5934}\u{98de}\u{884c}'] = nil,
        ['\u{65a7}\u{5934}\u{6389}\u{843d}'] = nil,
        ['\u{81ea}\u{52a8}\u{780d}\u{5f00}\u{542f}'] = false,
        ['\u{81ea}\u{52a8}\u{6361}\u{65a7}\u{5934}'] = false,
        ['\u{65a7}\u{5934}\u{7c7b}\u{578b}'] = nil,
        ['\u{8d85}\u{7ea7}\u{7535}\u{7ebf}'] = false,
        ['\u{6811}\u{7684}\u{5927}\u{5c0f}'] = 'big',
        ['\u{5b58}\u{6863}\u{5927}\u{5c0f}'] = 1,
        ['\u{590d}\u{5236}\u{6728}\u{5934}'] = false,
        ['\u{65e0}\u{9650}\u{8df3}\u{8dc3}'] = false,
        ['\u{81ea}\u{52a8}\u{590d}\u{5236}\u{6807}\u{5fd7}'] = false,
        ['\u{590d}\u{5236}\u{6807}\u{5fd7}\u{7684}\u{73a9}\u{5bb6}'] = nil,
        ['\u{81ea}\u{52a8}\u{586b}\u{5145}\u{7684}\u{73a9}\u{5bb6}'] = _G['\u{81ea}\u{5df1}'],
        ['\u{4fdd}\u{5b58}\u{57fa}\u{5730}\u{7684}\u{73a9}\u{5bb6}'] = _G['\u{81ea}\u{5df1}'],
        ['\u{81ea}\u{52a8}\u{5efa}\u{9020}\u{7684}\u{6728}\u{5934}'] = nil,
    }

    local u = {}
    local u1 = game:GetService('Players').LocalPlayer:GetMouse()

    u.CurrentNoti = nil
    u.CurrentColorPicker = nil
    u.CurrentTab = nil
    u.Tabs = {}
    u.flags = {}
    u.Connections = {}
    u.Destroyed = false

    local u2 = nil

    SwitchTab = function(p1, p2)
        if u2 then
            return
        elseif u.CurrentTab and u.CurrentTab[1] == p1 then
            return
        elseif u.CurrentTab then
            u2 = true
            u.CurrentTab[2].Visible = false

            Tween(p1.Icon, 0.2, {ImageTransparency = 0})
            Tween(p1.Title, 0.2, {TextTransparency = 0})
            Tween(u.CurrentTab[1].Icon, 0.2, {ImageTransparency = 0.65})
            Tween(u.CurrentTab[1].Title, 0.2, {TextTransparency = 0.65})

            p2.Visible = true

            task.wait(0.2)

            u.CurrentTab = {p1, p2}
            u2 = false

            return
        else
            u.CurrentTab = {p1, p2}
            p1.Title.TextTransparency = 0
            p1.Icon.ImageTransparency = 0
            p2.Visible = true

            return
        end
    end
    Drag = function(p3, p4)
        local u3 = nil
        local u4 = nil
        local u5 = nil
        local u6 = nil
        local u7 = function(p5)
            local v13 = p5.Position - u5

            p3.Position = UDim2.new(u6.X.Scale, u6.X.Offset + v13.X, u6.Y.Scale, u6.Y.Offset + v13.Y)
        end

        (p4 or p3).InputBegan:Connect(function(p6)
            if p6.UserInputType == Enum.UserInputType.MouseButton1 then
                u3 = true
                u5 = p6.Position
                u6 = p3.Position

                p6.Changed:Connect(function()
                    if p6.UserInputState == Enum.UserInputState.End then
                        u3 = false
                    end
                end)
            end
        end)
        p3.InputChanged:Connect(function(p7)
            if p7.UserInputType == Enum.UserInputType.MouseMovement then
                u4 = p7
            end
        end)
        game:GetService('UserInputService').InputChanged:Connect(function(p8)
            if p8 == u4 and u3 then
                u7(p8)
            end
        end)
    end
    Pop = function(p9)
        local _Size = p9.Size

        p9.Size = p9.Size - UDim2.new(0, 10, 0, 10)
        p9.TextSize = 0

        Tween(p9, 0.2, {Size = _Size})
        Tween(p9, 0.2, {TextSize = 15})
        task.wait(0.2)
        Tween(p9, 0.2, {TextSize = 13})
    end
    Tween = function(p10, p11, p12, ...)
        game:GetService('TweenService'):Create(p10, TweenInfo.new(p11, ...), p12):Play()
    end
    u.GetState = function(_, p13)
        return u.flags[p13].State
    end
    u.UpdateToggle = function(_, p14, p15)
        local v14 = p15 or not u:GetState(p14)

        if v14 ~= u:GetState(p14) then
            print('Test1')
            u.flags[p14]:SetState(v14)

            return
        else
            return
        end
    end
    u.Create = function(_, p16)
        assert(p16, 'A title is required')

        local u8 = {
            Background = Color3.fromRGB(24, 24, 24),
            Accent = Color3.fromRGB(10, 10, 10),
            LightContrast = Color3.fromRGB(20, 20, 20),
            DarkContrast = Color3.fromRGB(14, 14, 14),
            TextColor = Color3.fromRGB(255, 255, 255),
            Glow = Color3.fromRGB(0, 0, 0),
        }

        pcall(function()
            if game:GetService('Players').LocalPlayer.PlayerGui:FindFirstChild('Aurora') then
                game:GetService('Players').LocalPlayer.PlayerGui:FindFirstChild('Aurora'):Destroy()
            elseif game:GetService('CoreGui'):FindFirstChild('Aurora') then
                game:GetService('CoreGui'):FindFirstChild('Aurora'):Destroy()
            end
        end)

        local _ScreenGui = Instance.new('ScreenGui')
        local _Frame = Instance.new('Frame')
        local _UICorner = Instance.new('UICorner')
        local _Frame2 = Instance.new('Frame')
        local _UICorner2 = Instance.new('UICorner')
        local _TextLabel = Instance.new('TextLabel')
        local _Frame3 = Instance.new('Frame')
        local _Frame4 = Instance.new('Frame')
        local _UICorner3 = Instance.new('UICorner')
        local _Frame5 = Instance.new('Frame')
        local _ImageLabel = Instance.new('ImageLabel')
        local _ScrollingFrame = Instance.new('ScrollingFrame')
        local _UIListLayout = Instance.new('UIListLayout')
        local _ScreenGui2 = Instance.new('ScreenGui')

        _ScreenGui2.Name = 'Close'
        _ScreenGui2.Parent = game:GetService('CoreGui')
        _ScreenGui2.ResetOnSpawn = false
        _ScreenGui.Name = 'Aurora'
        _ScreenGui.Parent = game:WaitForChild('CoreGui')
        _ScreenGui.ResetOnSpawn = false
        _Frame.Name = 'Main'
        _Frame.Parent = _ScreenGui
        _Frame.BackgroundColor3 = u8.Background
        _Frame.BorderSizePixel = 0
        _Frame.Position = UDim2.new(0.352971852, 0, 0.3160173, 0)
        _Frame.Size = UDim2.new(0, 564, 0, 340)
        _Frame.ClipsDescendants = false
        _Frame.Active = true
        _Frame.Draggable = true

        local _TextButton = Instance.new('TextButton')

        _TextButton.Name = 'Open'
        _TextButton.Parent = _ScreenGui2
        _TextButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        _TextButton.Position = UDim2.new(0.00829315186, 0, 0.31107837, 0)
        _TextButton.Size = UDim2.new(0, 61, 0, 32)
        _TextButton.Font = Enum.Font.SourceSans
        _TextButton.Text = 'Open/Close'
        _TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        _TextButton.TextSize = 14
        _TextButton.Active = true
        _TextButton.Draggable = true

        _TextButton.MouseButton1Click:Connect(function()
            _ScreenGui.Enabled = not _ScreenGui.Enabled
        end)

        _UICorner.CornerRadius = UDim.new(0, 5)
        _UICorner.Name = 'MainC'
        _UICorner.Parent = _Frame
        _Frame2.Name = 'Top'
        _Frame2.Parent = _Frame
        _Frame2.BackgroundColor3 = u8.Accent
        _Frame2.BorderSizePixel = 0
        _Frame2.Position = UDim2.new(0.000134948292, 0, -0.00162963872, 0)
        _Frame2.Size = UDim2.new(0, 563, 0, 30)
        _Frame2.ZIndex = 3
        _UICorner2.CornerRadius = UDim.new(0, 5)
        _UICorner2.Name = 'TopC'
        _UICorner2.Parent = _Frame2
        _TextLabel.Name = 'Title'
        _TextLabel.Parent = _Frame2
        _TextLabel.BackgroundColor3 = u8.TextColor
        _TextLabel.BackgroundTransparency = 1
        _TextLabel.BorderSizePixel = 0
        _TextLabel.Position = UDim2.new(1.08410582e-7, 0, 0.0333333351, 0)
        _TextLabel.Size = UDim2.new(0, 553, 0, 27)
        _TextLabel.ZIndex = 3
        _TextLabel.Font = Enum.Font.GothamBold
        _TextLabel.Text = string.format('  %s', p16)
        _TextLabel.TextColor3 = u8.TextColor
        _TextLabel.TextSize = 15
        _TextLabel.TextXAlignment = Enum.TextXAlignment.Left
        _Frame3.Name = 'TopBar'
        _Frame3.Parent = _Frame
        _Frame3.BackgroundColor3 = u8.Accent
        _Frame3.BorderSizePixel = 0
        _Frame3.Position = UDim2.new(0.001907998, 0, 0.0513115376, 0)
        _Frame3.Size = UDim2.new(0, 562, 0, 12)
        _Frame3.ZIndex = 2
        _Frame4.Name = 'Side'
        _Frame4.Parent = _Frame
        _Frame4.BackgroundColor3 = u8.DarkContrast
        _Frame4.BorderSizePixel = 0
        _Frame4.Position = UDim2.new(0.001907998, 0, 0.00311943493, 0)
        _Frame4.Size = UDim2.new(0, 130, 0, 338)
        _UICorner3.CornerRadius = UDim.new(0, 5)
        _UICorner3.Name = 'SideC'
        _UICorner3.Parent = _Frame4
        _Frame5.Name = 'SideBar'
        _Frame5.Parent = _Frame
        _Frame5.BackgroundColor3 = u8.DarkContrast
        _Frame5.BorderSizePixel = 0
        _Frame5.Position = UDim2.new(0.211127862, 0, 0.00311943493, 0)
        _Frame5.Size = UDim2.new(0, 12, 0, 338)
        _ImageLabel.Name = 'Glow'
        _ImageLabel.Parent = _Frame
        _ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
        _ImageLabel.BackgroundTransparency = 1
        _ImageLabel.BorderSizePixel = 0
        _ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
        _ImageLabel.Size = UDim2.new(1, 47, 1, 47)
        _ImageLabel.ZIndex = 0
        _ImageLabel.Image = 'rbxassetid://6014261993'
        _ImageLabel.ImageColor3 = Color3.fromRGB(0, 0, 0)
        _ImageLabel.ImageTransparency = 0.5
        _ImageLabel.ScaleType = Enum.ScaleType.Slice
        _ImageLabel.SliceCenter = Rect.new(49, 49, 450, 450)
        _ScrollingFrame.Name = 'TabHolder'
        _ScrollingFrame.Parent = _Frame4
        _ScrollingFrame.Active = true
        _ScrollingFrame.BackgroundColor3 = u8.TextColor
        _ScrollingFrame.BackgroundTransparency = 1
        _ScrollingFrame.BorderSizePixel = 0
        _ScrollingFrame.Position = UDim2.new(0.0384615399, 0, 0.115384616, 0)
        _ScrollingFrame.Size = UDim2.new(0, 119, 0, 294)
        _ScrollingFrame.ZIndex = 2
        _ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
        _ScrollingFrame.ScrollBarThickness = 1
        _UIListLayout.Name = 'TabHolderLL'
        _UIListLayout.Parent = _ScrollingFrame
        _UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        _UIListLayout.Padding = UDim.new(0, 10)
        u.Notify = function(_, p17, p18, p19, p20)
            local u9 = p20 or function() end
            local u10 = p19 or false

            assert(p17, 'A title is required')
            assert(p18, 'A message is required')

            local _Frame6 = Instance.new('Frame')
            local _UICorner4 = Instance.new('UICorner')
            local _ImageLabel2 = Instance.new('ImageLabel')
            local _TextLabel2 = Instance.new('TextLabel')
            local _TextLabel3 = Instance.new('TextLabel')
            local _ImageButton = Instance.new('ImageButton')
            local _ImageButton2 = Instance.new('ImageButton')
            local _Frame7 = Instance.new('Frame')
            local _UICorner5 = Instance.new('UICorner')

            _Frame6.Name = 'Notify'
            _Frame6.Parent = _ScreenGui
            _Frame6.BackgroundColor3 = u8.Background
            _Frame6.BorderSizePixel = 0
            _Frame6.ClipsDescendants = true
            _Frame6.Position = u.CurrentNoti and u.CurrentNoti.Position or UDim2.new(0, 0, 0, 0)
            _Frame6.Size = UDim2.new(0, 0, 0, 60)
            _Frame6.Active = true
            _Frame6.Draggable = true
            _UICorner4.CornerRadius = UDim.new(0, 5)
            _UICorner4.Name = 'NotifyC'
            _UICorner4.Parent = _Frame6
            _ImageLabel2.Name = 'Glow'
            _ImageLabel2.Parent = _Frame6
            _ImageLabel2.AnchorPoint = Vector2.new(0.5, 0.5)
            _ImageLabel2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            _ImageLabel2.BackgroundTransparency = 1
            _ImageLabel2.BorderSizePixel = 0
            _ImageLabel2.Position = UDim2.new(0.5, 0, 0.5, 0)
            _ImageLabel2.Size = UDim2.new(1, 47, 1, 47)
            _ImageLabel2.ZIndex = 0
            _ImageLabel2.Image = 'rbxassetid://6014261993'
            _ImageLabel2.ImageColor3 = Color3.fromRGB(0, 0, 0)
            _ImageLabel2.ImageTransparency = 0.5
            _ImageLabel2.ScaleType = Enum.ScaleType.Slice
            _ImageLabel2.SliceCenter = Rect.new(49, 49, 450, 450)
            _TextLabel2.Name = 'Text'
            _TextLabel2.Parent = _Frame6
            _TextLabel2.BackgroundTransparency = 1
            _TextLabel2.Position = UDim2.new(0, 10, 1, -24)
            _TextLabel2.Size = UDim2.new(1, -40, 0, 16)
            _TextLabel2.ZIndex = 4
            _TextLabel2.Font = Enum.Font.Gotham
            _TextLabel2.Text = p18
            _TextLabel2.TextColor3 = u8.TextColor
            _TextLabel2.TextSize = 12
            _TextLabel2.TextXAlignment = Enum.TextXAlignment.Left
            _TextLabel3.Name = 'Title'
            _TextLabel3.Parent = _Frame6
            _TextLabel3.BackgroundTransparency = 1
            _TextLabel3.Position = UDim2.new(0, 10, 0, 8)
            _TextLabel3.Size = UDim2.new(1, -40, 0, 16)
            _TextLabel3.ZIndex = 4
            _TextLabel3.Font = Enum.Font.GothamMedium
            _TextLabel3.Text = p17
            _TextLabel3.TextColor3 = u8.TextColor
            _TextLabel3.TextSize = 14
            _TextLabel3.TextXAlignment = Enum.TextXAlignment.Left

            if u10 then
                _ImageButton.Name = 'Accept'
                _ImageButton.Parent = _Frame6
                _ImageButton.BackgroundTransparency = 1
                _ImageButton.Position = UDim2.new(1, -26, 0, 8)
                _ImageButton.Size = UDim2.new(0, 16, 0, 16)
                _ImageButton.ZIndex = 4
                _ImageButton.Image = 'rbxassetid://5012538259'
                _ImageButton2.Name = 'Decline'
                _ImageButton2.Parent = _Frame6
                _ImageButton2.BackgroundTransparency = 1
                _ImageButton2.Position = UDim2.new(1, -26, 1, -24)
                _ImageButton2.Size = UDim2.new(0, 16, 0, 16)
                _ImageButton2.ZIndex = 4
                _ImageButton2.Image = 'rbxassetid://5012538583'
            end

            _Frame7.Name = 'Flash'
            _Frame7.Parent = _Frame6
            _Frame7.BackgroundColor3 = u8.TextColor
            _Frame7.BorderSizePixel = 0
            _Frame7.ClipsDescendants = true
            _Frame7.Position = UDim2.new(-0.008, 0, -0.014, 0)
            _Frame7.Size = UDim2.new(0, 0, 0, 60)
            _Frame7.ZIndex = 4
            _UICorner5.CornerRadius = UDim.new(0, 5)
            _UICorner5.Name = 'FlashC'
            _UICorner5.Parent = _Frame7

            Drag(_Frame6)

            local v15 = game:GetService('TextService'):GetTextSize(p18, 12, Enum.Font.Gotham, Vector2.new(math.huge, 16))
            local u11 = function(p21, p22)
                Tween(p22, 0.2, {
                    Size = p21.Size,
                })
                task.wait(0.2)
                Tween(p21, 0.2, {
                    Size = UDim2.new(0, 0, 0, 60),
                })
                task.wait(0.2)
                p21:Destroy()

                u.CurrentNoti = nil
            end

            if u.CurrentNoti then
                u11(u.CurrentNoti, u.CurrentNoti.Flash)
            end

            u.CurrentNoti = _Frame6

            Tween(_Frame6, 0.3, {
                Size = UDim2.new(0, v15.X + 70, 0, 60),
            })
            Tween(_Frame7, 0.3, {
                Size = UDim2.new(0, v15.X + 70, 0, 60),
            })
            task.wait(0.3)
            Tween(_Frame7, 0.2, {
                Size = UDim2.new(0, 0, 0, 60),
            })

            if u10 then
                _ImageButton.MouseButton1Click:Connect(function()
                    u9(true)
                    u11(u.CurrentNoti, u.CurrentNoti.Flash)
                end)
                _ImageButton2.MouseButton1Click:Connect(function()
                    u9(false)
                    u11(u.CurrentNoti, u.CurrentNoti.Flash)
                end)
            end

            task.spawn(function()
                if not u10 then
                    task.wait(10)
                    u11(_Frame6, _Frame7)
                end
            end)
        end
        u.ProgressBar = function(_, p23, p24, p25)
            local u12 = p25 or false
            local u13 = p24 or 100

            assert(p23, 'A name is required to create a progress bar')

            local _Frame8 = Instance.new('Frame')
            local _UICorner6 = Instance.new('UICorner')
            local _TextLabel4 = Instance.new('TextLabel')
            local _Frame9 = Instance.new('Frame')
            local _UICorner7 = Instance.new('UICorner')
            local _TextLabel5 = Instance.new('TextLabel')
            local _ImageLabel3 = Instance.new('ImageLabel')
            local _Frame10 = Instance.new('Frame')
            local _UICorner8 = Instance.new('UICorner')
            local _Frame11 = Instance.new('Frame')
            local _UICorner9 = Instance.new('UICorner')

            _Frame8.Name = 'ProgressBar'
            _Frame8.Parent = _ScreenGui
            _Frame8.BackgroundColor3 = u8.Background
            _Frame8.BorderSizePixel = 0
            _Frame8.Position = UDim2.new(0, 15, 0, 851)
            _Frame8.Size = UDim2.new(0, 0, 0, 60)
            _Frame8.ClipsDescendants = true
            _UICorner6.CornerRadius = UDim.new(0, 5)
            _UICorner6.Name = 'ProgressBarC'
            _UICorner6.Parent = _Frame8
            _TextLabel4.Name = 'Title'
            _TextLabel4.Parent = _Frame8
            _TextLabel4.BackgroundTransparency = 1
            _TextLabel4.Position = UDim2.new(0, 10, 0, 8)
            _TextLabel4.Size = UDim2.new(0.936842084, -40, 0, 16)
            _TextLabel4.ZIndex = 4
            _TextLabel4.Font = Enum.Font.GothamMedium
            _TextLabel4.Text = p23
            _TextLabel4.TextColor3 = u8.TextColor
            _TextLabel4.TextSize = 14
            _TextLabel4.TextXAlignment = Enum.TextXAlignment.Left
            _Frame9.Name = 'Flash'
            _Frame9.Parent = _Frame8
            _Frame9.BackgroundColor3 = u8.TextColor
            _Frame9.BorderSizePixel = 0
            _Frame9.ClipsDescendants = true
            _Frame9.Position = UDim2.new(-0.008, 0, -0.014, 0)
            _Frame9.Size = UDim2.new(0, 0, 0, 60)
            _Frame9.ZIndex = 5
            _UICorner7.CornerRadius = UDim.new(0, 5)
            _UICorner7.Name = 'FlashC'
            _UICorner7.Parent = _Frame9
            _TextLabel5.Name = 'Number'
            _TextLabel5.Parent = _Frame8
            _TextLabel5.BackgroundTransparency = 1
            _TextLabel5.Position = UDim2.new(0, 156, 0, 8)
            _TextLabel5.Size = UDim2.new(0.300000012, -40, 0, 16)
            _TextLabel5.ZIndex = 4
            _TextLabel5.Font = Enum.Font.GothamMedium
            _TextLabel5.Text = u12 and '0%' or string.format('0/%s', tostring(u13))
            _TextLabel5.TextColor3 = u8.TextColor
            _TextLabel5.TextSize = 14
            _TextLabel5.TextXAlignment = Enum.TextXAlignment.Right
            _ImageLabel3.Name = 'Glow'
            _ImageLabel3.Parent = _Frame8
            _ImageLabel3.AnchorPoint = Vector2.new(0.5, 0.5)
            _ImageLabel3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            _ImageLabel3.BackgroundTransparency = 1
            _ImageLabel3.BorderSizePixel = 0
            _ImageLabel3.Position = UDim2.new(0.5, 0, 0.483333319, 0)
            _ImageLabel3.Size = UDim2.new(1, 47, 1.0333333, 47)
            _ImageLabel3.ZIndex = 0
            _ImageLabel3.Image = 'rbxassetid://6014261993'
            _ImageLabel3.ImageColor3 = Color3.fromRGB(0, 0, 0)
            _ImageLabel3.ImageTransparency = 0.5
            _ImageLabel3.ScaleType = Enum.ScaleType.Slice
            _ImageLabel3.SliceCenter = Rect.new(49, 49, 450, 450)
            _Frame10.Name = 'Inner'
            _Frame10.Parent = _Frame8
            _Frame10.BackgroundColor3 = u8.LightContrast
            _Frame10.Position = UDim2.new(0.0526314974, 0, 0.683333337, 0)
            _Frame10.Size = UDim2.new(0, 164, 0, 4)
            _Frame10.BorderSizePixel = 0
            _UICorner8.CornerRadius = UDim.new(0, 10)
            _UICorner8.Name = 'InnerC'
            _UICorner8.Parent = _Frame10
            _Frame11.Name = 'Fill'
            _Frame11.Parent = _Frame10
            _Frame11.BackgroundColor3 = u8.TextColor
            _Frame11.Position = UDim2.new(-0.00834411383, 0, -0.0666666627, 0)
            _Frame11.Size = UDim2.new(0, 0, 0, 4)
            _Frame11.BorderSizePixel = 0
            _UICorner9.CornerRadius = UDim.new(0, 10)
            _UICorner9.Name = 'FillC'
            _UICorner9.Parent = _Frame11

            local v16 = {}
            local u14 = function(p26)
                if p26 then
                    Tween(_Frame8, 0.3, {
                        Size = UDim2.new(0, 190, 0, 60),
                    })
                    Tween(_Frame9, 0.3, {
                        Size = UDim2.new(0, 190, 0, 60),
                    })
                    task.wait(0.3)
                    Tween(_Frame9, 0.2, {
                        Size = UDim2.new(0, 0, 0, 60),
                    })
                else
                    Tween(_Frame9, 0.2, {
                        Size = UDim2.new(0, 190, 0, 60),
                    })
                    task.wait(0.2)
                    Tween(_Frame8, 0.3, {
                        Size = UDim2.new(0, 0, 0, 60),
                    })
                    task.wait(0.2)
                    _Frame8:Destroy()
                end
            end

            _TextLabel5:GetPropertyChangedSignal('Text'):Connect(function()
                if _TextLabel5.Text == '100%' or _TextLabel5.Text == string.format('%s/%s', tostring(u13), tostring(u13)) then
                    u14(false)
                end
            end)

            v16.UpdateProgress = function(_, _)
                local v17 = u12 and tonumber(string.split(_TextLabel5.Text, '%')[1]) + 1 or string.split(_TextLabel5.Text, '/')[1] + 1
                local v18 = v17 / u13
                local v19 = math.floor(v18 * 100)
                local v20 = math.clamp(v18, 0, 1)

                _Frame11:TweenSize(UDim2.new(v20, 0, 0, 4), 'Out', 'Sine', 0.1, false)
                Tween(_Frame11, 0.2, {
                    Size = UDim2.new(v20, 0, 0, 4),
                })

                _TextLabel5.Text = u12 and v19 .. '%' or string.format('%s/%s', tostring(v17), tostring(u13))
            end
            v16.RemoveProgressBar = function()
                u14(false)
            end

            u14(true)
            Drag(_Frame8)

            return v16
        end
        u.DestroyUI = function(_)
            if u.Destroyed then
                return
            else
                for _, v21 in next, u.Connections do
                    if typeof(v21) == 'connection' then
                        v21:Disconnect()
                    end
                end

                u.Destroyed = true

                _ScreenGui:Destroy()

                return
            end
        end
        u.ToggleUI = function(_)
            _ScreenGui.Enabled = not _ScreenGui.Enabled
        end

        Drag(_Frame, _Frame2)

        local v22 = _UIListLayout

        _UIListLayout.GetPropertyChangedSignal(v22, 'AbsoluteContentSize'):Connect(function()
            _ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout.AbsoluteContentSize.Y + 12)
        end)

        return {
            CreateTab = function(_, p27, p28)
                assert(p27, 'A title is required to create a tab')
                assert(p28, 'An icon is required to create a tab')

                local _TextButton2 = Instance.new('TextButton')
                local _TextLabel6 = Instance.new('TextLabel')
                local _ImageLabel4 = Instance.new('ImageLabel')
                local _ScrollingFrame2 = Instance.new('ScrollingFrame')
                local _UIListLayout2 = Instance.new('UIListLayout')

                _TextButton2.Name = 'Tab'
                _TextButton2.Parent = _ScrollingFrame
                _TextButton2.BackgroundTransparency = 1
                _TextButton2.BorderSizePixel = 0
                _TextButton2.Size = UDim2.new(1, 0, 0, 26)
                _TextButton2.ZIndex = 3
                _TextButton2.AutoButtonColor = false
                _TextButton2.Font = Enum.Font.Gotham
                _TextButton2.Text = ''
                _TextButton2.TextSize = 14
                _TextLabel6.Name = 'Title'
                _TextLabel6.Parent = _TextButton2
                _TextLabel6.AnchorPoint = Vector2.new(0, 0.5)
                _TextLabel6.BackgroundTransparency = 1
                _TextLabel6.Position = UDim2.new(-0.145299152, 40, 0.5, 0)
                _TextLabel6.Size = UDim2.new(0.145299152, 76, 1, 0)
                _TextLabel6.ZIndex = 3
                _TextLabel6.Font = Enum.Font.Gotham
                _TextLabel6.Text = p27
                _TextLabel6.TextColor3 = u8.TextColor
                _TextLabel6.TextSize = 12
                _TextLabel6.TextTransparency = 0.65
                _TextLabel6.TextXAlignment = Enum.TextXAlignment.Left
                _ImageLabel4.Name = 'Icon'
                _ImageLabel4.Parent = _TextButton2
                _ImageLabel4.AnchorPoint = Vector2.new(0, 0.5)
                _ImageLabel4.BackgroundTransparency = 1
                _ImageLabel4.Position = UDim2.new(-0.102564111, 12, 0.5, 0)
                _ImageLabel4.Size = UDim2.new(0, 17, 0, 17)
                _ImageLabel4.ZIndex = 3
                _ImageLabel4.Image = string.format('rbxassetid://%s', p28)
                _ImageLabel4.ImageTransparency = 0.65
                _ImageLabel4.ScaleType = Enum.ScaleType.Fit
                _ImageLabel4.ImageColor3 = u8.TextColor
                _ScrollingFrame2.Name = string.format('Holder_%s', p27)
                _ScrollingFrame2.Parent = _Frame
                _ScrollingFrame2.Active = true
                _ScrollingFrame2.BackgroundColor3 = u8.Background
                _ScrollingFrame2.BorderSizePixel = 0
                _ScrollingFrame2.Position = UDim2.new(0.248226956, 0, 0.120588236, 0)
                _ScrollingFrame2.Size = UDim2.new(0, 416, 0, 291)
                _ScrollingFrame2.ScrollBarThickness = 1
                _ScrollingFrame2.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
                _ScrollingFrame2.Visible = false
                _UIListLayout2.Name = 'HolderLL'
                _UIListLayout2.Parent = _ScrollingFrame2
                _UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
                _UIListLayout2.Padding = UDim.new(0, 10)

                local v23 = _UIListLayout2

                _UIListLayout2.GetPropertyChangedSignal(v23, 'AbsoluteContentSize'):Connect(function()
                    _ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout2.AbsoluteContentSize.Y + 1)
                end)

                u.SelectPage = function(_, p29)
                    if p27 == p29 then
                        SwitchTab(_TextButton2, _ScrollingFrame2)
                    end
                end

                if not u.CurrentTab then
                    SwitchTab(_TextButton2, _ScrollingFrame2)
                end

                _TextButton2.MouseButton1Click:Connect(function()
                    SwitchTab(_TextButton2, _ScrollingFrame2)
                end)

                return {
                    Section = function(_, p30)
                        assert(p30, 'A title is required to create a section')

                        local _Frame12 = Instance.new('Frame')
                        local _UICorner10 = Instance.new('UICorner')
                        local _TextLabel7 = Instance.new('TextLabel')
                        local _UIListLayout3 = Instance.new('UIListLayout')
                        local _UIPadding = Instance.new('UIPadding')

                        _Frame12.Name = string.format('Section_%s', p30)
                        _Frame12.Parent = _ScrollingFrame2
                        _Frame12.BackgroundColor3 = u8.LightContrast
                        _Frame12.BorderSizePixel = 0
                        _Frame12.Size = UDim2.new(0, 409, 0, 119)
                        _UICorner10.CornerRadius = UDim.new(0, 4)
                        _UICorner10.Name = 'SectionC'
                        _UICorner10.Parent = _Frame12
                        _TextLabel7.Name = 'Title'
                        _TextLabel7.Parent = _Frame12
                        _TextLabel7.BackgroundTransparency = 1
                        _TextLabel7.BorderSizePixel = 0
                        _TextLabel7.Position = UDim2.new(0.0220048912, 0, -0.0309278332, 0)
                        _TextLabel7.Size = UDim2.new(0.982885063, 0, 0.0182648394, 20)
                        _TextLabel7.ZIndex = 2
                        _TextLabel7.Font = Enum.Font.GothamMedium
                        _TextLabel7.Text = string.format(' %s', p30)
                        _TextLabel7.TextColor3 = u8.TextColor
                        _TextLabel7.TextSize = 13
                        _TextLabel7.TextXAlignment = Enum.TextXAlignment.Left
                        _UIListLayout3.Name = 'SectionLL'
                        _UIListLayout3.Parent = _Frame12
                        _UIListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
                        _UIListLayout3.Padding = UDim.new(0, 4)
                        _UIListLayout3.HorizontalAlignment = Enum.HorizontalAlignment.Center
                        _UIPadding.Name = 'SectionP'
                        _UIPadding.Parent = _Frame12
                        _UIPadding.PaddingTop = UDim.new(0, 4)

                        local v24 = _UIListLayout3

                        _UIListLayout3.GetPropertyChangedSignal(v24, 'AbsoluteContentSize'):Connect(function()
                            _Frame12.Size = UDim2.new(0, 409, 0, _UIListLayout3.AbsoluteContentSize.Y + 14)
                        end)

                        return {
                            Button = function(_, p31, p32)
                                local u15 = p32 or function() end

                                assert(p31, 'a name is required to create a button')

                                local _TextButton3 = Instance.new('TextButton')
                                local _UICorner11 = Instance.new('UICorner')

                                _TextButton3.Name = 'Btn'
                                _TextButton3.Parent = _Frame12
                                _TextButton3.BackgroundColor3 = u8.DarkContrast
                                _TextButton3.BorderSizePixel = 0
                                _TextButton3.Position = UDim2.new(0.0244497284, 0, 0.115571238, 0)
                                _TextButton3.Size = UDim2.new(0.975856602, 0, 0, 30)
                                _TextButton3.AutoButtonColor = false
                                _TextButton3.Font = Enum.Font.Gotham
                                _TextButton3.TextColor3 = u8.TextColor
                                _TextButton3.TextSize = 13
                                _TextButton3.Text = p31
                                _UICorner11.CornerRadius = UDim.new(0, 3)
                                _UICorner11.Name = 'BtnC'
                                _UICorner11.Parent = _TextButton3
                                u.flags[p31] = {
                                    State = _TextButton3.Text,
                                    ChangeText = function(_, p33)
                                        if _TextButton3.Text ~= p33 then
                                            _TextButton3.Text = p33
                                            u.flags[p31].State = p33

                                            return
                                        else
                                            return
                                        end
                                    end,
                                }

                                local u16 = false

                                _TextButton3.MouseButton1Click:Connect(function()
                                    if u16 then
                                        return
                                    else
                                        u16 = true

                                        Pop(_TextButton3)
                                        spawn(u15)

                                        u16 = false

                                        return
                                    end
                                end)

                                return _TextButton3
                            end,
                            Label = function(_, p34)
                                assert(p34, 'A name is required to create a label')

                                local _TextLabel8 = Instance.new('TextLabel')
                                local _UICorner12 = Instance.new('UICorner')
                                local _UIPadding2 = Instance.new('UIPadding')

                                _TextLabel8.Name = 'Label'
                                _TextLabel8.Parent = _Frame12
                                _TextLabel8.BackgroundColor3 = u8.DarkContrast
                                _TextLabel8.BorderSizePixel = 0
                                _TextLabel8.Position = UDim2.new(0.0120716793, 0, 0.340642005, 0)
                                _TextLabel8.Size = UDim2.new(0.975856662, 0, -0.010416667, 30)
                                _TextLabel8.Font = Enum.Font.Gotham
                                _TextLabel8.Text = p34
                                _TextLabel8.TextWrapped = true
                                _TextLabel8.TextColor3 = u8.TextColor
                                _TextLabel8.TextSize = 12
                                _TextLabel8.TextYAlignment = Enum.TextYAlignment.Top
                                _UICorner12.CornerRadius = UDim.new(0, 3)
                                _UICorner12.Name = 'LabelC'
                                _UICorner12.Parent = _TextLabel8
                                _UIPadding2.Parent = _TextLabel8
                                _UIPadding2.PaddingLeft = UDim.new(0, 5)
                                _UIPadding2.PaddingTop = UDim.new(0, 5)
                                _UIPadding2.PaddingRight = UDim.new(0, 5)
                                _TextLabel8.Size = UDim2.new(_TextLabel8.Size.X.Scale, _TextLabel8.Size.X.Offset, 0, math.huge)
                                _TextLabel8.Size = UDim2.new(_TextLabel8.Size.X.Scale, _TextLabel8.Size.X.Offset, 0, _TextLabel8.TextBounds.Y + 12)

                                return _TextLabel8
                            end,
                            Toggle = function(_, p35, p36, p37)
                                local u17 = p37 or function() end
                                local v25 = p36 or false

                                assert(p35, 'A name is required to create a toggle')

                                local _TextButton4 = Instance.new('TextButton')
                                local _UICorner13 = Instance.new('UICorner')
                                local _Frame13 = Instance.new('Frame')
                                local _UICorner14 = Instance.new('UICorner')
                                local _Frame14 = Instance.new('Frame')
                                local _UICorner15 = Instance.new('UICorner')

                                _TextButton4.Name = 'Toggle'
                                _TextButton4.Parent = _Frame12
                                _TextButton4.BackgroundColor3 = u8.DarkContrast
                                _TextButton4.BorderSizePixel = 0
                                _TextButton4.Position = UDim2.new(0.0244497284, 0, 0.115571238, 0)
                                _TextButton4.Size = UDim2.new(0.975856602, 0, 0, 30)
                                _TextButton4.AutoButtonColor = false
                                _TextButton4.Font = Enum.Font.Gotham
                                _TextButton4.Text = string.format('  %s', p35)
                                _TextButton4.TextColor3 = u8.TextColor
                                _TextButton4.TextSize = 13
                                _TextButton4.TextXAlignment = Enum.TextXAlignment.Left
                                _UICorner13.CornerRadius = UDim.new(0, 3)
                                _UICorner13.Name = 'ToggleC'
                                _UICorner13.Parent = _TextButton4
                                _Frame13.Name = 'Inner'
                                _Frame13.Parent = _TextButton4
                                _Frame13.BackgroundColor3 = u8.LightContrast
                                _Frame13.BorderSizePixel = 0
                                _Frame13.Position = UDim2.new(0.877277315, 0, 0.166969255, 0)
                                _Frame13.Size = UDim2.new(0, 41, 0, 19)
                                _Frame13.ZIndex = 3
                                _UICorner14.CornerRadius = UDim.new(1, 0)
                                _UICorner14.Name = 'InnerC'
                                _UICorner14.Parent = _Frame13
                                _Frame14.Name = 'Circle'
                                _Frame14.Parent = _Frame13
                                _Frame14.BackgroundColor3 = u8.TextColor
                                _Frame14.BorderSizePixel = 0
                                _Frame14.Position = UDim2.new(0.100000001, 0, 0.158000007, 0)
                                _Frame14.Size = UDim2.new(0, 13, 0, 13)
                                _Frame14.ZIndex = 3
                                _UICorner15.CornerRadius = UDim.new(5, 0)
                                _UICorner15.Name = 'CircleC'
                                _UICorner15.Parent = _Frame14

                                local v27 = {
                                    State = v25,
                                    SetState = function(_, p38)
                                        local v26 = p38 or not u.flags[p35].State

                                        if v26 ~= u.flags[p35].State then
                                            Tween(_Frame14, 0.2, {
                                                Position = UDim2.new(v26 and 0.55 or 0.1, 0, 0.158, 0),
                                            })
                                            task.wait(0.2)

                                            u.flags[p35].State = v26

                                            u17(v26)

                                            return
                                        else
                                            return 'State is already set'
                                        end
                                    end,
                                }

                                u.flags[p35] = v27

                                if v25 then
                                    u.flags[p35]:SetState(true)
                                end

                                _TextButton4.MouseButton1Click:Connect(function()
                                    u.flags[p35]:SetState()
                                end)
                            end,
                            TextBox = function(_, p39, p40, p41)
                                local u18 = p41 or function() end

                                assert(p39, 'A name is required to create a textbox')
                                assert(p40, 'Default text is required to create a textbox')

                                local _TextButton5 = Instance.new('TextButton')
                                local _UICorner16 = Instance.new('UICorner')
                                local _TextBox = Instance.new('TextBox')
                                local _UICorner17 = Instance.new('UICorner')
                                local _UIListLayout4 = Instance.new('UIListLayout')
                                local _UIPadding3 = Instance.new('UIPadding')

                                _TextButton5.Name = 'TextBox'
                                _TextButton5.Parent = _Frame12
                                _TextButton5.BackgroundColor3 = u8.DarkContrast
                                _TextButton5.BorderSizePixel = 0
                                _TextButton5.Position = UDim2.new(0.0244497284, 0, 0.115571238, 0)
                                _TextButton5.Size = UDim2.new(0.975856602, 0, 0, 30)
                                _TextButton5.AutoButtonColor = false
                                _TextButton5.Font = Enum.Font.Gotham
                                _TextButton5.Text = string.format('  %s', p39)
                                _TextButton5.TextColor3 = u8.TextColor
                                _TextButton5.TextSize = 13
                                _TextButton5.TextXAlignment = Enum.TextXAlignment.Left
                                _UICorner16.CornerRadius = UDim.new(0, 3)
                                _UICorner16.Name = 'TextBoxC'
                                _UICorner16.Parent = _TextButton5
                                _TextBox.Name = 'Input'
                                _TextBox.Parent = _TextButton5
                                _TextBox.BackgroundColor3 = u8.LightContrast
                                _TextBox.ClipsDescendants = true
                                _TextBox.Position = UDim2.new(0, 280, 0, 7)
                                _TextBox.Size = UDim2.new(0, 111, 0, 16)
                                _TextBox.ZIndex = 3
                                _TextBox.Font = Enum.Font.GothamMedium
                                _TextBox.Text = p40
                                _TextBox.TextColor3 = u8.TextColor
                                _TextBox.TextSize = 12
                                _UICorner17.CornerRadius = UDim.new(0, 3)
                                _UICorner17.Name = 'InputC'
                                _UICorner17.Parent = _TextBox
                                _UIListLayout4.Name = 'TextBoxLL'
                                _UIListLayout4.Parent = _TextButton5
                                _UIListLayout4.HorizontalAlignment = Enum.HorizontalAlignment.Right
                                _UIListLayout4.SortOrder = Enum.SortOrder.LayoutOrder
                                _UIListLayout4.VerticalAlignment = Enum.VerticalAlignment.Center
                                _UIPadding3.Name = 'TextBoxP'
                                _UIPadding3.Parent = _TextButton5
                                _UIPadding3.PaddingRight = UDim.new(0, 8)

                                _TextBox.FocusLost:Connect(function()
                                    if _TextBox.Text == '' then
                                        _TextBox.Text = p40
                                    end

                                    u18(_TextBox.Text)
                                end)

                                return _TextButton5
                            end,
                            KeyBind = function(_, p42, p43, p44)
                                local u19 = p44 or function() end

                                assert(p42, 'A name is required to create a keybind')
                                assert(p43, 'A default key is required to create a keybind')

                                local _TextButton6 = Instance.new('TextButton')
                                local _UICorner18 = Instance.new('UICorner')
                                local _TextButton7 = Instance.new('TextButton')
                                local _UICorner19 = Instance.new('UICorner')
                                local _UIListLayout5 = Instance.new('UIListLayout')
                                local _UIPadding4 = Instance.new('UIPadding')

                                _TextButton6.Name = 'KeyBind'
                                _TextButton6.Parent = _Frame12
                                _TextButton6.BackgroundColor3 = u8.DarkContrast
                                _TextButton6.BorderSizePixel = 0
                                _TextButton6.Position = UDim2.new(0.0244497284, 0, 0.115571238, 0)
                                _TextButton6.Size = UDim2.new(0.975856602, 0, 0, 30)
                                _TextButton6.AutoButtonColor = false
                                _TextButton6.Font = Enum.Font.Gotham
                                _TextButton6.Text = string.format('  %s', p42)
                                _TextButton6.TextColor3 = u8.TextColor
                                _TextButton6.TextSize = 13
                                _TextButton6.TextXAlignment = Enum.TextXAlignment.Left
                                _UICorner18.CornerRadius = UDim.new(0, 3)
                                _UICorner18.Name = 'TextBoxC'
                                _UICorner18.Parent = _TextButton6
                                _TextButton7.Name = 'Input'
                                _TextButton7.Parent = _TextButton6
                                _TextButton7.BackgroundColor3 = u8.LightContrast
                                _TextButton7.ClipsDescendants = true
                                _TextButton7.Position = UDim2.new(0, 280, 0, 7)
                                _TextButton7.Size = UDim2.new(0, 111, 0, 16)
                                _TextButton7.ZIndex = 3
                                _TextButton7.AutoButtonColor = false
                                _TextButton7.Font = Enum.Font.GothamMedium
                                _TextButton7.Text = p43
                                _TextButton7.TextColor3 = u8.TextColor
                                _TextButton7.TextSize = 12
                                _UICorner19.CornerRadius = UDim.new(0, 3)
                                _UICorner19.Name = 'InputC'
                                _UICorner19.Parent = _TextButton7
                                _UIListLayout5.Name = 'KeyBindLL'
                                _UIListLayout5.Parent = _TextButton6
                                _UIListLayout5.HorizontalAlignment = Enum.HorizontalAlignment.Right
                                _UIListLayout5.SortOrder = Enum.SortOrder.LayoutOrder
                                _UIListLayout5.VerticalAlignment = Enum.VerticalAlignment.Center
                                _UIPadding4.Name = 'KeyBindP'
                                _UIPadding4.Parent = _TextButton6
                                _UIPadding4.PaddingRight = UDim.new(0, 8)

                                local u20 = {
                                    Return = true,
                                    Space = true,
                                    Tab = true,
                                    Backquote = true,
                                    CapsLock = true,
                                    Escape = true,
                                    Unknown = true,
                                }
                                local u21 = {
                                    RightControl = 'Right Ctrl',
                                    LeftControl = 'Left Ctrl',
                                    LeftShift = 'Left Shift',
                                    RightShift = 'Right Shift',
                                    Semicolon = ';',
                                    Quote = '"',
                                    LeftBracket = '[',
                                    RightBracket = ']',
                                    Equals = '=',
                                    Minus = '-',
                                    RightAlt = 'Right Alt',
                                    LeftAlt = 'Left Alt',
                                }

                                if typeof(p43) == 'string' then
                                    p43 = Enum.KeyCode[p43] or p43
                                end

                                local u22 = p43 and (u21[p43.Name] or (p43.Name or 'None')) or 'None'

                                u.Connections[#u.Connections + 1] = game:GetService('UserInputService').InputBegan:Connect(function(p45, p46)
                                    if u.Destroyed then
                                        return
                                    elseif p46 then
                                        return
                                    elseif p45.UserInputType == Enum.UserInputType.Keyboard then
                                        if p45.KeyCode == p43 then
                                            u19(p43.Name)

                                            return
                                        else
                                            return
                                        end
                                    else
                                        return
                                    end
                                end)

                                _TextButton7.MouseButton1Click:Connect(function()
                                    _TextButton7.Text = '...'

                                    task.wait()

                                    local v28 = game.UserInputService.InputEnded:Wait()

                                    if v28.UserInputType == Enum.UserInputType.Keyboard then
                                        if u20[tostring(v28.KeyCode.Name)] then
                                            _TextButton7.Text = u22

                                            return
                                        else
                                            p43 = Enum.KeyCode[tostring(v28.KeyCode.Name)]
                                            _TextButton7.Text = u21[tostring(v28.KeyCode.Name)] or tostring(v28.KeyCode.Name)

                                            return
                                        end
                                    else
                                        _TextButton7.Text = u22

                                        return
                                    end
                                end)

                                return _TextButton6
                            end,
                            Slider = function(_, p47, p48, p49, p50, p51, p52)
                                local u23 = p52 or function() end
                                local u24 = p51 or false
                                local u25 = p49 or 1
                                local u26 = p50 or 100
                                local u27 = p48 or u25

                                assert(p47, 'A name is required to create a slider')

                                local _TextButton8 = Instance.new('TextButton')
                                local _UICorner20 = Instance.new('UICorner')
                                local _TextLabel9 = Instance.new('TextLabel')
                                local _TextBox2 = Instance.new('TextBox')
                                local _TextLabel10 = Instance.new('TextLabel')
                                local _Frame15 = Instance.new('Frame')
                                local _UICorner21 = Instance.new('UICorner')
                                local _Frame16 = Instance.new('Frame')
                                local _UICorner22 = Instance.new('UICorner')
                                local _Frame17 = Instance.new('Frame')
                                local _UICorner23 = Instance.new('UICorner')

                                _TextButton8.Name = 'Slider'
                                _TextButton8.Parent = _Frame12
                                _TextButton8.BackgroundColor3 = u8.DarkContrast
                                _TextButton8.BorderSizePixel = 0
                                _TextButton8.Position = UDim2.new(-0.0195600521, 0, 0.136772648, 0)
                                _TextButton8.Size = UDim2.new(0.976000011, 0, 0, 50)
                                _TextButton8.AutoButtonColor = false
                                _TextButton8.Font = Enum.Font.Gotham
                                _TextButton8.Text = ''
                                _TextButton8.TextColor3 = u8.TextColor
                                _TextButton8.TextSize = 13
                                _TextButton8.TextXAlignment = Enum.TextXAlignment.Left
                                _UICorner20.CornerRadius = UDim.new(0, 3)
                                _UICorner20.Name = 'SliderC'
                                _UICorner20.Parent = _TextButton8
                                _TextLabel9.Name = 'Title'
                                _TextLabel9.Parent = _TextButton8
                                _TextLabel9.BackgroundTransparency = 1
                                _TextLabel9.Position = UDim2.new(0, 8, 0, 6)
                                _TextLabel9.Size = UDim2.new(0.740490735, 0, 0, 16)
                                _TextLabel9.ZIndex = 3
                                _TextLabel9.Font = Enum.Font.Gotham
                                _TextLabel9.Text = p47
                                _TextLabel9.TextColor3 = u8.TextColor
                                _TextLabel9.TextSize = 13
                                _TextLabel9.TextTransparency = 0.1
                                _TextLabel9.TextXAlignment = Enum.TextXAlignment.Left
                                _TextBox2.Name = 'Number'
                                _TextBox2.Parent = _TextButton8
                                _TextBox2.BackgroundTransparency = 1
                                _TextBox2.BorderSizePixel = 0
                                _TextBox2.Position = UDim2.new(1.00250506, -30, 0, 6)
                                _TextBox2.Size = UDim2.new(0, 20, 0, 16)
                                _TextBox2.ZIndex = 3
                                _TextBox2.Font = Enum.Font.GothamMedium
                                _TextBox2.Text = tostring(u27)
                                _TextBox2.TextColor3 = u8.TextColor
                                _TextBox2.TextSize = 12
                                _TextBox2.TextXAlignment = Enum.TextXAlignment.Right
                                _TextLabel10.Name = 'Outer'
                                _TextLabel10.Parent = _TextButton8
                                _TextLabel10.BackgroundTransparency = 1
                                _TextLabel10.BorderColor3 = Color3.fromRGB(27, 42, 53)
                                _TextLabel10.Position = UDim2.new(0, 9, 0, 28)
                                _TextLabel10.Size = UDim2.new(1.00751531, -20, 0, 16)
                                _TextLabel10.ZIndex = 3
                                _TextLabel10.Text = ''
                                _Frame15.Name = 'Inner'
                                _Frame15.Parent = _TextLabel10
                                _Frame15.BackgroundColor3 = u8.LightContrast
                                _Frame15.BorderSizePixel = 0
                                _Frame15.Position = UDim2.new(-0.00263030501, 0, 0.375, 0)
                                _Frame15.Size = UDim2.new(1, 0, 0, 4)
                                _Frame15.ZIndex = 3
                                _UICorner21.CornerRadius = UDim.new(0, 10)
                                _UICorner21.Name = 'InnerC'
                                _UICorner21.Parent = _Frame15
                                _Frame16.Name = 'Fill'
                                _Frame16.Parent = _Frame15
                                _Frame16.BackgroundColor3 = u8.TextColor
                                _Frame16.BorderSizePixel = 0
                                _Frame16.Position = UDim2.new(0.00012392737, 0, 0, 0)
                                _Frame16.Size = UDim2.new(0.379879832, 0, 0, 4)
                                _Frame16.ZIndex = 3
                                _UICorner22.CornerRadius = UDim.new(0, 10)
                                _UICorner22.Name = 'FillC'
                                _UICorner22.Parent = _Frame16
                                _Frame17.Name = 'Circle'
                                _Frame17.Parent = _Frame16
                                _Frame17.BackgroundColor3 = u8.TextColor
                                _Frame17.Position = UDim2.new(0.979818106, 0, -0.75, 0)
                                _Frame17.Size = UDim2.new(0, 10, 0, 10)
                                _Frame17.ZIndex = 3
                                _Frame17.Transparency = 1
                                _UICorner23.CornerRadius = UDim.new(0, 9999)
                                _UICorner23.Name = 'CircleC'
                                _UICorner23.Parent = _Frame17

                                local u28 = {
                                    SetState = function(_, p53)
                                        local v29 = (u1.X - _Frame15.AbsolutePosition.X) / _Frame15.AbsoluteSize.X

                                        if p53 then
                                            v29 = (p53 - u25) / (u26 - u25)
                                        end

                                        local v30 = math.clamp(v29, 0, 1)
                                        local v31

                                        if u24 then
                                            v31 = p53 or tonumber(string.format('%.1f', tostring(u25 + (u26 - u25) * v30)))
                                        else
                                            v31 = p53 or math.floor(u25 + (u26 - u25) * v30)
                                        end

                                        _TextBox2.Text = tostring(v31)

                                        Tween(_Frame16, 0.1, {
                                            Size = UDim2.new(v30, 0, 1, 0),
                                        })
                                        u23(tonumber(v31))
                                    end,
                                }
                                local v32 = u28

                                u28.SetState(v32, u27)

                                local u29 = false
                                local u30 = false

                                _TextLabel10.InputBegan:Connect(function(p54)
                                    if p54.UserInputType == Enum.UserInputType.MouseButton1 then
                                        Tween(_Frame17, 0.2, {Transparency = 0})
                                        u28:SetState()

                                        u29 = true
                                    end
                                end)
                                game:GetService('UserInputService').InputEnded:Connect(function(p55)
                                    if u29 and p55.UserInputType == Enum.UserInputType.MouseButton1 then
                                        u29 = false

                                        task.wait(1)

                                        if not u29 then
                                            Tween(_Frame17, 0.2, {Transparency = 1})
                                        end
                                    end
                                end)
                                game:GetService('UserInputService').InputChanged:Connect(function(p56)
                                    if u29 and p56.UserInputType == Enum.UserInputType.MouseMovement then
                                        u28:SetState()
                                    end
                                end)
                                _TextLabel10.InputBegan:Connect(function(p57)
                                    if p57.UserInputType == Enum.UserInputType.Touch then
                                        Tween(_Frame17, 0.2, {Transparency = 0})
                                        u28:SetState()

                                        u29 = true
                                    end
                                end)
                                game:GetService('UserInputService').InputEnded:Connect(function(p58)
                                    if u29 and p58.UserInputType == Enum.UserInputType.Touch then
                                        u29 = false

                                        task.wait(1)

                                        if not u29 then
                                            Tween(_Frame17, 0.2, {Transparency = 1})
                                        end
                                    end
                                end)
                                game:GetService('UserInputService').InputChanged:Connect(function(p59)
                                    if u29 and p59.UserInputType == Enum.UserInputType.Touch then
                                        u28:SetState()
                                    end
                                end)
                                _TextBox2.Focused:Connect(function()
                                    u30 = true
                                end)
                                _TextBox2.FocusLost:Connect(function()
                                    if not tonumber(_TextBox2.Text) then
                                        _TextBox2.Text = u27
                                    end
                                    if tonumber(_TextBox2.Text) < u25 then
                                        u28:SetState(u25)
                                    end

                                    u30 = false
                                end)

                                local v33 = _TextBox2

                                _TextBox2.GetPropertyChangedSignal(v33, 'Text'):Connect(function()
                                    if u30 then
                                        if _TextBox2.Text ~= '' then
                                            local _ = _TextBox2.Text

                                            if not tonumber(_TextBox2.Text) then
                                                _TextBox2.Text = ''
                                            end
                                            if u26 < tonumber(_TextBox2.Text) then
                                                u28:SetState(u26)
                                            end

                                            u28:SetState(tonumber(_TextBox2.Text))

                                            return
                                        else
                                            return
                                        end
                                    else
                                        return
                                    end
                                end)

                                return u28
                            end,
                            DropDown = function(_, p60, p61, p62, p63, p64)
                                local u31 = p64 or function() end
                                local v34 = p61 or {}
                                local u32 = p62 or false
                                local u33 = p63 or false

                                assert(p60, 'a name is required to create a dropdown')

                                local _TextButton9 = Instance.new('TextButton')
                                local _UICorner24 = Instance.new('UICorner')
                                local _TextBox3 = Instance.new('TextBox')
                                local _ImageButton3 = Instance.new('ImageButton')
                                local _Frame18 = Instance.new('Frame')
                                local _UICorner25 = Instance.new('UICorner')
                                local _ScrollingFrame3 = Instance.new('ScrollingFrame')
                                local _UIListLayout6 = Instance.new('UIListLayout')

                                _TextButton9.Name = 'DropDown'
                                _TextButton9.Parent = _Frame12
                                _TextButton9.BackgroundColor3 = u8.DarkContrast
                                _TextButton9.BorderSizePixel = 0
                                _TextButton9.Position = UDim2.new(0.0244497284, 0, 0.115571238, 0)
                                _TextButton9.Size = UDim2.new(0.975856602, 0, 0, 30)
                                _TextButton9.AutoButtonColor = false
                                _TextButton9.Font = Enum.Font.Gotham
                                _TextButton9.Text = ''
                                _TextButton9.TextColor3 = u8.TextColor
                                _TextButton9.TextSize = 13
                                _TextButton9.TextXAlignment = Enum.TextXAlignment.Left
                                _UICorner24.CornerRadius = UDim.new(0, 3)
                                _UICorner24.Name = 'DropDownC'
                                _UICorner24.Parent = _TextButton9
                                _TextBox3.Name = 'Search'
                                _TextBox3.Parent = _TextButton9
                                _TextBox3.AnchorPoint = Vector2.new(0, 0.5)
                                _TextBox3.BackgroundTransparency = 1
                                _TextBox3.Position = UDim2.new(-0.00751628308, 10, 0.5, 1)
                                _TextBox3.Size = UDim2.new(1.00501084, -42, 1, 0)
                                _TextBox3.ZIndex = 3
                                _TextBox3.Font = Enum.Font.Gotham
                                _TextBox3.Text = p60
                                _TextBox3.TextColor3 = u8.TextColor
                                _TextBox3.TextSize = 13
                                _TextBox3.TextTransparency = 0.1
                                _TextBox3.TextXAlignment = Enum.TextXAlignment.Left
                                _TextBox3.ClipsDescendants = true
                                _ImageButton3.Name = 'Arrow'
                                _ImageButton3.Parent = _TextButton9
                                _ImageButton3.BackgroundTransparency = 1
                                _ImageButton3.BorderSizePixel = 0
                                _ImageButton3.Position = UDim2.new(1.00501096, -28, 0.5, -9)
                                _ImageButton3.Size = UDim2.new(0, 18, 0, 18)
                                _ImageButton3.ZIndex = 3
                                _ImageButton3.Image = 'rbxassetid://5012539403'
                                _ImageButton3.SliceCenter = Rect.new(2, 2, 298, 298)
                                _ImageButton3.ImageColor3 = u8.TextColor
                                _Frame18.Name = 'DropdownHolder'
                                _Frame18.Parent = _Frame12
                                _Frame18.BackgroundColor3 = u8.Background
                                _Frame18.BorderSizePixel = 0
                                _Frame18.ClipsDescendants = true
                                _Frame18.Position = UDim2.new(0.0120000485, 0, 0.430878669, 0)
                                _Frame18.Size = UDim2.new(0.976000011, 0, 0, 0)
                                _Frame18.Visible = false
                                _UICorner25.CornerRadius = UDim.new(0, 3)
                                _UICorner25.Name = 'DropdownHolderC'
                                _UICorner25.Parent = _Frame18
                                _ScrollingFrame3.Name = 'OptionHolder'
                                _ScrollingFrame3.Parent = _Frame18
                                _ScrollingFrame3.Active = true
                                _ScrollingFrame3.BackgroundColor3 = u8.TextColor
                                _ScrollingFrame3.BackgroundTransparency = 1
                                _ScrollingFrame3.BorderSizePixel = 0
                                _ScrollingFrame3.Position = UDim2.new(0.0100202896, 0, 0.0178573243, 0)
                                _ScrollingFrame3.Size = UDim2.new(0, 388, 0, 132)
                                _ScrollingFrame3.CanvasSize = UDim2.new(0, 0, 0, 0)
                                _ScrollingFrame3.ScrollBarThickness = 1
                                _ScrollingFrame3.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
                                _UIListLayout6.Name = 'OptionHolderLL'
                                _UIListLayout6.Parent = _ScrollingFrame3
                                _UIListLayout6.SortOrder = Enum.SortOrder.LayoutOrder
                                _UIListLayout6.Padding = UDim.new(0, 4)

                                local u34 = false
                                local u35 = false
                                local u36 = {}
                                local u37 = function()
                                    local v35 = next
                                    local v36, v37 = _ScrollingFrame3:GetChildren()

                                    for _, v38 in v35, v36, v37 do
                                        if v38:IsA('TextButton') then
                                            v38.Visible = true
                                        end
                                    end
                                end
                                local u38 = function(p65)
                                    if p65 == '' then
                                        u37()
                                    end

                                    local v39 = next
                                    local v40, v41 = _ScrollingFrame3:GetChildren()

                                    for _, v42 in v39, v40, v41 do
                                        if v42:IsA('TextButton') then
                                            v42.Visible = v42.Text:lower():match(p65:lower()) and true or false
                                        end
                                    end
                                end
                                local u39 = function()
                                    u34 = not u34

                                    if u34 then
                                        u37()

                                        _Frame18.Visible = true
                                    end

                                    Tween(_Frame18, 0.2, {
                                        Size = UDim2.new(0.976, 0, 0, u34 and 140 or 0),
                                    })
                                    task.wait(0.2)

                                    if not u34 then
                                        _Frame18.Visible = false
                                    end
                                end
                                local u40 = function()
                                    local v43 = next
                                    local v44, v45 = game:GetService('Players'):GetChildren()
                                    local v46 = {}

                                    for _, v47 in v43, v44, v45 do
                                        table.insert(v46, v47.Name)
                                    end

                                    return v46
                                end

                                if u32 then
                                    v34 = u40() or v34
                                end

                                u36.AddOption = function(_, p66)
                                    local _TextButton10 = Instance.new('TextButton')
                                    local _UICorner26 = Instance.new('UICorner')
                                    local _UIPadding5 = Instance.new('UIPadding')

                                    _TextButton10.Name = 'Option'
                                    _TextButton10.Parent = _ScrollingFrame3
                                    _TextButton10.BackgroundColor3 = u8.DarkContrast
                                    _TextButton10.BorderSizePixel = 0
                                    _TextButton10.Size = UDim2.new(0.976405919, 0, 0, 30)
                                    _TextButton10.AutoButtonColor = false
                                    _TextButton10.Font = Enum.Font.Gotham
                                    _TextButton10.Text = p66
                                    _TextButton10.TextColor3 = u8.TextColor
                                    _TextButton10.TextSize = 13
                                    _TextButton10.TextXAlignment = Enum.TextXAlignment.Left
                                    _TextButton10.TextTransparency = 0
                                    _UICorner26.CornerRadius = UDim.new(0, 3)
                                    _UICorner26.Name = 'OptionC'
                                    _UICorner26.Parent = _TextButton10
                                    _UIPadding5.Name = 'OptionP'
                                    _UIPadding5.Parent = _TextButton10
                                    _UIPadding5.PaddingLeft = UDim.new(0, 8)

                                    _TextButton10.MouseButton1Click:Connect(function()
                                        _TextBox3.Text = u33 and p60 or _TextButton10.Text

                                        u31(_TextButton10.Text)
                                        u39()
                                    end)
                                end
                                u36.SetOptions = function(_, p67)
                                    local v48 = next
                                    local v49, v50 = _ScrollingFrame3:GetChildren()

                                    for _, v51 in v48, v49, v50 do
                                        if v51:IsA('TextButton') then
                                            v51:Destroy()
                                        end
                                    end
                                    for _, v52 in next, p67 do
                                        u36:AddOption(v52)
                                    end
                                end

                                _TextBox3.Focused:Connect(function()
                                    u35 = true
                                end)
                                _TextBox3.FocusLost:Connect(function()
                                    if _TextBox3.Text == '' and (multi and Selected[1]) then
                                        _TextBox3.Text = SetSearchText(_TextBox3)
                                    end
                                    if _TextBox3.Text == '' then
                                        _TextBox3.Text = p60
                                    end
                                    if _TextBox3.Text:sub(1, 8) ~= 'Selected' then
                                        u35 = false

                                        return
                                    else
                                        return
                                    end
                                end)
                                _TextBox3:GetPropertyChangedSignal('Text'):Connect(function()
                                    if u34 then
                                        if _TextBox3.Text == p60 or _TextBox3.Text == '' or _TextBox3.Text:sub(1, 8) == 'Selected' then
                                            return
                                        elseif u35 then
                                            u38(_TextBox3.Text)

                                            return
                                        else
                                            return
                                        end
                                    else
                                        return
                                    end
                                end)
                                _UIListLayout6:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
                                    _ScrollingFrame3.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout6.AbsoluteContentSize.Y + 1)
                                end)
                                _ImageButton3.MouseButton1Click:Connect(function()
                                    if u32 then
                                        u36:SetOptions(u40())
                                    end

                                    u39()
                                end)
                                u36:SetOptions(v34)

                                return u36
                            end,
                        }
                    end,
                }
            end,
        }
    end

    local v53 = u
    local v54, _, _ = u.Create(v53, 'Dark X V5.0')

    _G['\u{63d0}\u{9192}'] = function(p68)
        u:Notify('Dark X', p68, false)
    end
    _G['\u{9f20}\u{6807}'] = _G['\u{81ea}\u{5df1}']:GetMouse()
    _G['\u{98de}\u{884c}'] = function(p69)
        repeat
            wait()
        until _G['\u{81ea}\u{5df1}'] and _G['\u{81ea}\u{5df1}\u{89d2}\u{8272}'] and _G['\u{81ea}\u{5df1}\u{89d2}\u{8272}']:FindFirstChild('Head') and _G['\u{81ea}\u{5df1}\u{89d2}\u{8272}']:FindFirstChild('Humanoid')

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

        if not _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].SeatPart then
            _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].PlatformStand = true
        end
        if _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].SeatPart then
            CarFly = _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].SeatPart

            local _Weld = Instance.new('Weld', _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}'])
            local _Weld2 = Instance.new('Weld', _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].SeatPart)

            _Weld.Part0 = _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}']
            _Weld.Part1 = _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].SeatPart
            _Weld2.Part0 = _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}']
            _Weld2.Part1 = _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].SeatPart
        end

        Fly = function()
            local _BodyGyro = Instance.new('BodyGyro', _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}'])

            _BodyGyro.P = 90000
            _BodyGyro.maxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
            _BodyGyro.CFrame = _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}'].CFrame

            local _BodyVelocity = Instance.new('BodyVelocity', _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}'])

            _BodyVelocity.Velocity = Vector3.new(0, 0.1, 0)
            _BodyVelocity.maxForce = Vector3.new(9000000000, 9000000000, 9000000000)

            local __continue_break_1 = false

            while true do
                local v55

                if true then
                    wait()

                    v55 = _G['\u{83dc}\u{5355}']['\u{98de}\u{884c}\u{901f}\u{5ea6}']

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

                if _G['\u{83dc}\u{5355}']['\u{6b63}\u{5728}\u{98de}\u{884c}'] then
                else
                    break
                end
            end

            _BodyGyro:Destroy()
            _BodyVelocity:Destroy()
            pcall(function()
                local v57 = next
                local v58, v59 = _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].SeatPart:GetChildren()

                for _, v60 in v57, v58, v59 do
                    if v60.Name == 'Weld' then
                        v60:Destroy()
                    end
                end

                local v61 = next
                local v62, v63 = _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}']:GetChildren()

                for _, v64 in v61, v62, v63 do
                    if v64:IsA('Weld') then
                        v64:Destroy()
                    end
                end

                _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}'].CFrame = CFrame.new(CarFly.CFrame.p)
            end)

            _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].PlatformStand = false

            return
        end

        _G['\u{9f20}\u{6807}'].KeyDown:Connect(function(p70)
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
        _G['\u{9f20}\u{6807}'].KeyUp:Connect(function(p71)
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
                _G['\u{83dc}\u{5355}']['\u{6b63}\u{5728}\u{98de}\u{884c}'] = true

                Fly()
            end
        else
            _G['\u{83dc}\u{5355}']['\u{6b63}\u{5728}\u{98de}\u{884c}'] = false
            _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].PlatformStand = false
        end
    end
    _G['\u{62c9}\u{4e1c}\u{897f}'] = game.ReplicatedStorage.Interaction.ClientIsDragging

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

    _G['\u{7a7f}'] = nil
    _G['\u{7a7f}\u{5899}'] = function(p75)
        if p75 then
            _G['\u{7a7f}'] = game:GetService('RunService').Stepped:connect(function()
                local v67 = next
                local v68, v69 = _G['\u{81ea}\u{5df1}\u{89d2}\u{8272}']:GetChildren()

                for _, v70 in v67, v68, v69 do
                    if v70:IsA('Part') or v70:IsA('BasePart') then
                        v70.CanCollide = false
                    end
                end
            end)

            return
        else
            if _G['\u{7a7f}'] then
                _G['\u{7a7f}']:Disconnect()

                _G['\u{7a7f}'] = nil
            end

            return
        end
    end
    _G['\u{83b7}\u{5f97}\u{5de5}\u{5177}\u{7684}\u{4f24}\u{5bb3}'] = function(p76)
        local _Value = p76.ToolName.Value

        return require(game.ReplicatedStorage.AxeClasses['AxeClass_' .. _Value]).new()
    end
    _G['\u{4f20}\u{9001}'] = function(p77)
        if _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].SeatPart == nil then
            _G['\u{81ea}\u{5df1}\u{89d2}\u{8272}']:PivotTo(p77)
        else
            spawn(function()
                for _ = 1, 20 do
                    wait()
                    _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].SeatPart.Parent:PivotTo(p77)
                    _G['\u{62c9}\u{4e1c}\u{897f}']:FireServer(_G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].SeatPart.Parent.Main)
                end
            end)
        end
    end
    _G['\u{83b7}\u{5f97}\u{5de5}\u{5177}'] = function()
        local v71 = next
        local v72, v73 = _G['\u{81ea}\u{5df1}'].Backpack:GetChildren()
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

        if _G['\u{81ea}\u{5df1}\u{89d2}\u{8272}']:FindFirstChildOfClass('Tool') then
            table.insert(v75, _G['\u{81ea}\u{5df1}\u{89d2}\u{8272}']:FindFirstChildOfClass('Tool'))

            v74 = v74 + 1
        end
        if v74 == 0 then
            return nil
        else
            return v75
        end
    end
    _G['\u{68c0}\u{67e5}\u{65a7}\u{5934}'] = function(p78)
        _G['\u{6728}\u{5934}\u{79cd}\u{7c7b}'] = p78

        local v77 = _G['\u{83b7}\u{5f97}\u{5de5}\u{5177}']()

        if v77 == nil then
            return _G['\u{63d0}\u{9192}']('you need one axe')
        end

        for _, v78 in next, v77 do
            local v79 = _G['\u{83b7}\u{5f97}\u{5de5}\u{5177}\u{7684}\u{4f24}\u{5bb3}'](v78)

            if v79.SpecialTrees and v79.SpecialTrees[_G['\u{6728}\u{5934}\u{79cd}\u{7c7b}'] ] then
                local _Damage = v79.SpecialTrees[_G['\u{6728}\u{5934}\u{79cd}\u{7c7b}'] ].Damage

                if _G['\u{6728}\u{5934}\u{79cd}\u{7c7b}'] ~= 'LoneCave' or v78.ToolName.Value == 'EndTimesAxe' then
                    return v78, _Damage
                else
                    return _G['\u{63d0}\u{9192}']('you need one end times axe')
                end
            else
                local _Damage2 = v79.Damage

                if _Damage2 <= 0 then
                    v78 = nil
                end
                if _G['\u{6728}\u{5934}\u{79cd}\u{7c7b}'] ~= 'LoneCave' or v78.ToolName.Value == 'EndTimesAxe' then
                    return v78, _Damage2
                else
                    return _G['\u{63d0}\u{9192}']('you need one end times axe')
                end
            end
        end
    end
    _G['\u{627e}\u{6728}\u{5934}'] = function(p79)
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
                                if v88.Owner.Value == nil or v88.Owner.Value == _G['\u{81ea}\u{5df1}'] then
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
    _G['\u{83b7}\u{5f97}\u{9002}\u{5408}\u{7684}\u{6728}\u{5934}'] = function(p80)
        local v93 = _G['\u{627e}\u{6728}\u{5934}'](p80)

        if v93 == false then
            return false
        else
            local v94 = _G['\u{83dc}\u{5355}']['\u{6811}\u{7684}\u{5927}\u{5c0f}'] == 'big' and 0 or math.huge
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

                if _G['\u{83dc}\u{5355}']['\u{6811}\u{7684}\u{5927}\u{5c0f}'] ~= 'big' then
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
    _G['\u{780d}'] = function(p81, p82, p83, p84, p85)
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
            if _G['\u{83dc}\u{5355}']['\u{5927}\u{529b}'] then
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

    _G['\u{81ea}\u{5df1}\u{514b}\u{9686}\u{7684}\u{65b9}\u{5757}'] = nil

    local u46 = nil

    _G['\u{5e26}\u{6765}\u{6811}'] = function(p87)
        _G['\u{6811}\u{7684}\u{79cd}\u{7c7b}'] = p87

        local v106 = _G
        local v107 = _G
        local v108, v109 = _G['\u{68c0}\u{67e5}\u{65a7}\u{5934}'](_G['\u{6811}\u{7684}\u{79cd}\u{7c7b}'])

        v107['\u{4f24}\u{5bb3}'] = v109
        v106['\u{65a7}\u{5934}'] = v108

        if _G['\u{4f24}\u{5bb3}'] ~= nil then
            _G['\u{6728}\u{5934}'] = _G['\u{83b7}\u{5f97}\u{9002}\u{5408}\u{7684}\u{6728}\u{5934}'](_G['\u{6811}\u{7684}\u{79cd}\u{7c7b}'])
            _G['\u{6811}\u{52a0}\u{5165}'] = nil
            _G['\u{6811}\u{780d}\u{597d}\u{4e86}'] = false

            if _G['\u{6728}\u{5934}'] ~= false then
                _G['\u{6811}\u{52a0}\u{5165}'] = Workspace.LogModels.ChildAdded:Connect(function(p88)
                    p88:WaitForChild('Owner', 60)
                    p88:WaitForChild('Owner', 60)

                    p88.PrimaryPart = p88:WaitForChild('WoodSection', 60)

                    if p88:WaitForChild('Owner', 60).Value == _G['\u{81ea}\u{5df1}'] and p88.TreeClass.Value == _G['\u{6811}\u{7684}\u{79cd}\u{7c7b}'] then
                        _G['\u{6811}\u{780d}\u{597d}\u{4e86}'] = true

                        u45(p88, _G['\u{83dc}\u{5355}']['\u{6811}\u{653e}\u{7f6e}\u{7684}\u{5730}\u{70b9}'])

                        if _G['\u{83dc}\u{5355}']['\u{9009}\u{62e9}\u{7684}\u{6811}'] == 'LoneCave' then
                            game:GetService('ReplicatedStorage').Interaction.ClientInteracted:FireServer(_G['\u{81ea}\u{5df1}'].Backpack:FindFirstChild('Tool') or _G['\u{81ea}\u{5df1}\u{89d2}\u{8272}']:FindFirstChild('Tool'), 'Drop tool', _G['\u{83dc}\u{5355}']['\u{6811}\u{653e}\u{7f6e}\u{7684}\u{5730}\u{70b9}'])

                            _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].Health = 0

                            wait()

                            repeat
                                wait()
                            until _G['\u{81ea}\u{5df1}\u{89d2}\u{8272}']:FindFirstChild('Head') and _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].Health >= 20

                            _G['\u{4f20}\u{9001}'](_G['\u{83dc}\u{5355}']['\u{6811}\u{653e}\u{7f6e}\u{7684}\u{5730}\u{70b9}'])
                            wait(2)
                            pcall(function()
                                u46:Disconnect()

                                u46 = nil
                            end)
                        end

                        pcall(function()
                            _G['\u{6811}\u{52a0}\u{5165}']:Disconnect()

                            _G['\u{6811}\u{52a0}\u{5165}'] = nil
                        end)
                    end
                end)

                if _G['\u{6811}\u{7684}\u{79cd}\u{7c7b}'] == 'LoneCave' then
                    u46 = game.Workspace.PlayerModels.ChildAdded:Connect(function(p89)
                        p89:WaitForChild('Owner')

                        if p89:FindFirstChild('ToolName') and (tostring(p89.ToolName.Value) == 'EndTimesAxe' and p89:WaitForChild('Owner').Value == _G['\u{81ea}\u{5df1}']) then
                            repeat
                                wait()
                            until _G['\u{81ea}\u{5df1}\u{89d2}\u{8272}']:FindFirstChild('Head') and 20 <= _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].Health

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
                    _Part.CFrame = _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}'].CFrame
                    _Part.Material = Enum.Material.Marble
                    _Part.Name = 'Part'
                    game:GetService('Workspace').CurrentCamera.CameraSubject = _Part

                    _G['\u{4f20}\u{9001}'](CFrame.new(-1456.40442, 433.399719, 1285.89697))

                    repeat
                        pcall(function()
                            firetouchinterest(_G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}'], _G['\u{5ca9}\u{6d46}'], 0)
                            firetouchinterest(_G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}'], _G['\u{5ca9}\u{6d46}'], 1)
                        end)
                        task.wait()
                    until _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}']:FindFirstChild('LavaFire')

                    wait()

                    _G['\u{5ca9}\u{6d46}'].CFrame = CFrame.new(-1675.2002, 255.002533, 1284.19983, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)

                    _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}']:FindFirstChild('LavaFire'):Destroy()

                    local v110 = _G['\u{81ea}\u{5df1}\u{89d2}\u{8272}'].Torso:Clone()

                    v110.Name = 'HumanoidRootPart'
                    v110.Transparency = 1
                    v110.Parent = _G['\u{81ea}\u{5df1}\u{89d2}\u{8272}']

                    pcall(function()
                        _Part:Destroy()
                    end)

                    game:GetService('Workspace').CurrentCamera.CameraSubject = _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}']
                end

                spawn(function()
                    local __continue_break_2 = false

                    while true do
                        game['Run Service'].Heartbeat:wait()

                        if _G['\u{81ea}\u{5df1}\u{89d2}\u{8272}']:FindFirstChild('Head') and 30 < _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].Health then
                            _G['\u{4f20}\u{9001}'](_G['\u{6728}\u{5934}'].CFrame + Vector3.new(3, 5, 0))
                        end
                        if _G['\u{6811}\u{780d}\u{597d}\u{4e86}'] then
                            break
                        end
                    end

                    return
                end)

                while true do
                    if _G['\u{81ea}\u{5df1}\u{89d2}\u{8272}']:FindFirstChild('Head') and _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].Health < 20 then
                        repeat
                            task.wait()
                        until _G['\u{81ea}\u{5df1}\u{89d2}\u{8272}']:FindFirstChild('Head') and 20 < _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].Health and _G['\u{81ea}\u{5df1}\u{89d2}\u{8272}']:FindFirstChildOfClass('Tool')

                        wait()

                        local v111 = _G
                        local v112 = _G
                        local v113, v114 = _G['\u{68c0}\u{67e5}\u{65a7}\u{5934}'](_G['\u{6811}\u{7684}\u{79cd}\u{7c7b}'])

                        v112['\u{4f24}\u{5bb3}'] = v114
                        v111['\u{65a7}\u{5934}'] = v113
                    end

                    spawn(function()
                        _G['\u{780d}'](_G['\u{6728}\u{5934}'].Parent.CutEvent, _G['\u{65a7}\u{5934}'], 1, 0.3, _G['\u{4f24}\u{5bb3}'])
                    end)

                    if _G['\u{83dc}\u{5355}']['\u{505c}\u{6b62}\u{780d}\u{6811}'] == true then
                        break
                    end

                    task.wait()

                    if _G['\u{6811}\u{780d}\u{597d}\u{4e86}'] then
                        break
                    end
                end

                if _G['\u{83dc}\u{5355}']['\u{505c}\u{6b62}\u{780d}\u{6811}'] == true then
                    _G['\u{6811}\u{52a0}\u{5165}']:Disconnect()

                    _G['\u{6811}\u{52a0}\u{5165}'] = nil
                end

                return
            else
                return _G['\u{63d0}\u{9192}']('not find ' .. _G['\u{6811}\u{7684}\u{79cd}\u{7c7b}'])
            end
        else
            return
        end
    end
    _G['\u{706f}\u{5149}'] = game:GetService('Lighting')
    _G['\u{52a0}\u{8f7d}\u{4fdd}\u{5b58}\u{670d}\u{52a1}\u{5668}'] = game.ReplicatedStorage.LoadSaveRequests
    _G['\u{662f}\u{5426}\u{53ef}\u{4ee5}\u{52a0}\u{8f7d}'] = function()
        if not _G['\u{52a0}\u{8f7d}\u{4fdd}\u{5b58}\u{670d}\u{52a1}\u{5668}'].ClientMayLoad:InvokeServer(_G['\u{81ea}\u{5df1}']) then
            _G['\u{63d0}\u{9192}']('Load is on cooldown. Waiting...')

            repeat
                wait()
            until _G['\u{52a0}\u{8f7d}\u{4fdd}\u{5b58}\u{670d}\u{52a1}\u{5668}'].ClientMayLoad:InvokeServer(_G['\u{81ea}\u{5df1}'])
        end

        return true
    end
    _G['\u{52a0}\u{8f7d}'] = function(p90)
        _G['\u{662f}\u{5426}\u{53ef}\u{4ee5}\u{52a0}\u{8f7d}']()
        wait()
        _G['\u{52a0}\u{8f7d}\u{4fdd}\u{5b58}\u{670d}\u{52a1}\u{5668}'].RequestLoad:InvokeServer(p90, _G['\u{81ea}\u{5df1}'])
    end
    _G['\u{4fdd}\u{5b58}\u{57fa}\u{5730}'] = function(p91)
        u:Notify('Dark X', 'Are you sure you want to replace all existing data', true, function()
            _G['\u{52a0}\u{8f7d}\u{4fdd}\u{5b58}\u{670d}\u{52a1}\u{5668}'].RequestSave:InvokeServer(p91, _G['\u{81ea}\u{5df1}'])
            _G['\u{63d0}\u{9192}']('Slot saved successfully')
        end)
    end
    _G['\u{6269}\u{5927}\u{571f}\u{5730}'] = function(p92)
        local v115 = next
        local v116, v117 = _G['\u{571f}\u{5730}']:GetChildren()
        local v118 = nil

        for _, v119 in v115, v116, v117 do
            if v119:FindFirstChild('Owner') then
                if v119.Owner.Value == _G['\u{81ea}\u{5df1}'] then
                    v118 = v119
                end
            end
        end

        game:GetService('ReplicatedStorage').PropertyPurchasing.ClientExpandedProperty:FireServer(v118, p92)
    end
    _G['\u{64e6}\u{9664}\u{9009}\u{62e9}\u{7684}\u{7269}\u{54c1}'] = function()
        _G['\u{64e6}\u{9664}'] = false

        local v120 = next
        local v121, v122 = game.Workspace.PlayerModels:GetChildren()

        for _, v123 in v120, v121, v122 do
            if v123:FindFirstChild('Owner') then
                if tostring(v123.Owner.Value) == _G['\u{83dc}\u{5355}']['\u{64e6}\u{53bb}\u{7684}\u{73a9}\u{5bb6}'] then
                    if v123:FindFirstChild('Type') then
                        if v123.Type.Value == _G['\u{83dc}\u{5355}']['\u{64e6}\u{53bb}\u{7684}\u{4e1c}\u{897f}'] then
                            _G['\u{64e6}\u{9664}'] = true

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

        if not _G['\u{64e6}\u{9664}'] then
            _G['\u{63d0}\u{9192}']('Failed to find a selected type')
        end
    end
    _G['\u{6536}\u{6863}'] = function()
        _G['\u{52a0}\u{8f7d}'](math.huge)
    end
    _G['\u{5356}\u{6807}\u{5fd7}'] = function()
        local v124 = next
        local v125, v126 = game.Workspace.PlayerModels:GetChildren()

        for _, v127 in v124, v125, v126 do
            if v127:FindFirstChild('Owner') then
                if v127.Owner.Value == _G['\u{81ea}\u{5df1}'] then
                    if v127:FindFirstChild('ItemName') then
                        if v127.ItemName.Value == 'PropertySoldSign' then
                            _G['\u{4f20}\u{9001}'](CFrame.new(v127.Main.CFrame.p) + Vector3.new(0, 0, 2))
                            game.ReplicatedStorage.Interaction.ClientInteracted:FireServer(v127, 'Take down sold sign')

                            for _ = 1, 30 do
                                _G['\u{62c9}\u{4e1c}\u{897f}']:FireServer(v127)

                                v127.Main.CFrame = CFrame.new(314.54, -0.5, 86.823)

                                game['Run Service'].Heartbeat:wait()
                            end
                        end
                    end
                end
            end
        end
    end
    _G['\u{68c0}\u{67e5}\u{65a7}\u{5934}\u{662f}\u{5426}\u{6700}\u{5927}'] = function()
        local v128 = next
        local v129, v130 = _G['\u{81ea}\u{5df1}'].Backpack:GetChildren()
        local v131 = 0

        for _, v132 in v128, v129, v130 do
            if v132:IsA('Tool') then
                if v132.Name ~= 'BlueprintTool' then
                    v131 = v131 + 1
                end
            end
        end

        if _G['\u{81ea}\u{5df1}\u{89d2}\u{8272}']:FindFirstChildOfClass('Tool') then
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
                            if v140.Owner.Value == nil or tostring(v140.Owner.Value) == _G['\u{81ea}\u{5df1}'] then
                                if v140:FindFirstChild('WoodSection') then
                                    _G['\u{63d0}\u{9192}']('Find Spooky /SpookyNeon wood')
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
                                    if v148.Owner.Value == nil or tostring(v148.Owner.Value) == _G['\u{81ea}\u{5df1}'] then
                                        if v148:FindFirstChild('WoodSection') then
                                            _G['\u{63d0}\u{9192}']('Find Spooky /SpookyNeon wood')
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
            if _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{5356}\u{6807}\u{5fd7}\u{724c}'] then
                _G['\u{6536}\u{6863}']()

                local v149 = _G['\u{83b7}\u{5f97}\u{571f}\u{5730}']()

                game.ReplicatedStorage.PropertyPurchasing.ClientPurchasedProperty:FireServer(v149, v149.OriginSquare.CFrame.p + Vector3.new(0, 3, 0))
                _G['\u{52a0}\u{8f7d}'](_G['\u{83dc}\u{5355}']['\u{5b58}\u{6863}'])
                _G['\u{5356}\u{6807}\u{5fd7}']()
            end
        end
    end)
    spawn(function()
        while task.wait() do
            if _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{590d}\u{5236}\u{6807}\u{5fd7}'] then
                _G['\u{6536}\u{6863}']()

                local u50 = _G['\u{83b7}\u{5f97}\u{571f}\u{5730}']()

                pcall(function()
                    game.ReplicatedStorage.PropertyPurchasing.ClientPurchasedProperty:FireServer(u50, u50.OriginSquare.CFrame.p + Vector3.new(0, 3, 0))
                end)
                _G['\u{6536}\u{6863}']()

                local v150 = next
                local v151, v152 = game.Workspace.PlayerModels:GetChildren()

                for _, v153 in v150, v151, v152 do
                    if v153:FindFirstChild('ItemName') then
                        if v153.ItemName.Value == 'PropertySoldSign' then
                            v153:WaitForChild('Owner')

                            if v153:WaitForChild('Owner').Value == _G['\u{81ea}\u{5df1}'] or v153:WaitForChild('Owner').Value == nil then
                                _G['\u{4f20}\u{9001}'](CFrame.new(v153.Main.CFrame.p) + Vector3.new(0, 3, 2))
                                game.ReplicatedStorage.Interaction.ClientInteracted:FireServer(v153, 'Take down sold sign')
                                game.ReplicatedStorage.Interaction.ClientInteracted:FireServer(v153, 'Take down sold sign')
                                wait()
                                _G['\u{62c9}\u{4e1c}\u{897f}']:FireServer(v153)

                                for _ = 1, 30 do
                                    _G['\u{62c9}\u{4e1c}\u{897f}']:FireServer(v153)
                                    v153:PivotTo(game.Players[_G['\u{83dc}\u{5355}']['\u{590d}\u{5236}\u{6807}\u{5fd7}\u{7684}\u{73a9}\u{5bb6}'] ].Character.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0))
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

    _G['\u{5356}\u{6728}\u{5934}'] = function()
        local _CFrame = _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}'].CFrame

        for _ = 1, 10 do
            local v154 = next
            local v155, v156 = game:GetService('Workspace').LogModels:GetChildren()

            for _, u51 in v154, v155, v156 do
                if u51:FindFirstChild('Owner') then
                    if u51.Owner.Value == _G['\u{81ea}\u{5df1}'] then
                        _G['\u{4f20}\u{9001}'](u51.WoodSection.CFrame)

                        for _ = 1, 20 do
                            _G['\u{62c9}\u{4e1c}\u{897f}']:FireServer(u51)
                            u51:PivotTo(CFrame.new(315, 0, 85.4999924))
                            game['Run Service'].Heartbeat:wait()
                        end

                        task.wait(0.3)
                        _G['\u{4f20}\u{9001}'](CFrame.new(315, 0, 85.4999924))

                        local v157 = next
                        local v158, v159 = u51:GetChildren()

                        for _, u52 in v157, v158, v159 do
                            if u52.Name == 'WoodSection' then
                                spawn(function()
                                    for _ = 1, 20 do
                                        _G['\u{4f20}\u{9001}'](CFrame.new(315, 0, 85.4999924))
                                        _G['\u{62c9}\u{4e1c}\u{897f}']:FireServer(u51)
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

        _G['\u{4f20}\u{9001}'](_CFrame)
    end

    spawn(function()
        while task.wait() do
            spawn(function()
                _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].JumpPower = _G['\u{83dc}\u{5355}']['\u{8df3}\u{8dc3}\u{63d0}\u{5347}']
            end)

            if _G['\u{83dc}\u{5355}']['\u{7ec8}\u{65e5}\u{767d}\u{5929}'] then
                _G['\u{706f}\u{5149}'].TimeOfDay = '12:00:00'
                _G['\u{706f}\u{5149}'].Brightness = 2
            end
            if _G['\u{83dc}\u{5355}']['\u{7ec8}\u{65e5}\u{9ed1}\u{591c}'] then
                _G['\u{706f}\u{5149}'].TimeOfDay = '2:00:00'
            end
            if _G['\u{83dc}\u{5355}']['\u{6d88}\u{9664}\u{96fe}'] then
                _G['\u{706f}\u{5149}'].FogEnd = 1000000
            end

            spawn(function()
                local v160 = next
                local v161, v162 = _G['\u{81ea}\u{5df1}'].Backpack:GetChildren()
                local v163 = 0

                for _, v164 in v160, v161, v162 do
                    if v164:IsA('Tool') then
                        if v164.Name ~= 'BlueprintTool' then
                            v163 = v163 + 1
                        end
                    end
                end

                if _G['\u{81ea}\u{5df1}\u{89d2}\u{8272}']:FindFirstChildOfClass('Tool') then
                    v163 = v163 + 1
                end
                if v163 > 10 then
                    wait(1)

                    _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].Health = 0

                    _G['\u{63d0}\u{9192}']('your have too much axe')
                end
            end)

            if _G['\u{83dc}\u{5355}']['\u{6cb9}\u{6f06}\u{7684}\u{952f}\u{6728}\u{673a}'] ~= nil and not _G['\u{83dc}\u{5355}']['\u{6cb9}\u{6f06}\u{7684}\u{952f}\u{6728}\u{673a}']:FindFirstChild('Particles') then
                _G['\u{63d0}\u{9192}']('maybe you move your sawmill or destroy please reselect')

                _G['\u{83dc}\u{5355}']['\u{6cb9}\u{6f06}\u{7684}\u{952f}\u{6728}\u{673a}'] = nil
                _G['\u{952f}\u{6728}\u{673a}'].Text = 'not select'
            end
            if _G['\u{83dc}\u{5355}']['\u{9009}\u{62e9}\u{7684}\u{952f}\u{6728}\u{673a}'] ~= nil and not _G['\u{83dc}\u{5355}']['\u{9009}\u{62e9}\u{7684}\u{952f}\u{6728}\u{673a}']:FindFirstChild('Particles') then
                _G['\u{63d0}\u{9192}']('maybe you move your sawmill or destroy please reselect')

                _G['\u{83dc}\u{5355}']['\u{9009}\u{62e9}\u{7684}\u{952f}\u{6728}\u{673a}'] = nil
                _G['\u{5904}\u{7406}\u{6811}\u{952f}\u{6728}\u{673a}'].Text = 'not select'
            end

            spawn(function()
                if _G['\u{83dc}\u{5355}']['\u{5220}\u{9664}\u{5546}\u{5e97}\u{7269}\u{54c1}'] then
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
                if _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{6361}\u{65a7}\u{5934}'] and (_G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].Health >= 20 and _G['\u{68c0}\u{67e5}\u{65a7}\u{5934}\u{662f}\u{5426}\u{6700}\u{5927}']() ~= true) then
                    local v171 = next
                    local v172, v173 = workspace.PlayerModels:GetChildren()

                    for _, v174 in v171, v172, v173 do
                        if v174:FindFirstChild('Owner') then
                            if v174.Owner.Value == _G['\u{81ea}\u{5df1}'] then
                                if v174:FindFirstChild('ToolName') then
                                    if tostring(v174.ToolName.Value) == _G['\u{83dc}\u{5355}']['\u{65a7}\u{5934}\u{7c7b}\u{578b}'] then
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

            if _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'] == nil then
                repeat
                    wait()
                until _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'] ~= nil

                _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}']:GetPropertyChangedSignal('WalkSpeed'):Connect(function()
                    if _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].WalkSpeed ~= u55 then
                        _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].WalkSpeed = u55
                    end
                end)
            end
        end
    end)
    _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}']:GetPropertyChangedSignal('WalkSpeed'):Connect(function()
        if _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].WalkSpeed ~= u55 then
            _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].WalkSpeed = u55
        end
    end)
    _Player2:Slider('WalkSpeed', 50, 16, 500, false, function(p93)
        u55 = p93
        _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].WalkSpeed = u55
    end)
    _Player2:Slider('JumpPower', 100, 60, 500, false, function(p94)
        _G['\u{83dc}\u{5355}']['\u{8df3}\u{8dc3}\u{63d0}\u{5347}'] = p94
    end)
    _Player2:Slider('HipHeight', 0, 0, 500, false, function(p95)
        _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].HipHeight = p95
    end)
    _Player2:Slider('Zoom Distance', 100, 1, 2000, false, function(p96)
        _G['\u{81ea}\u{5df1}'].CameraMaxZoomDistance = p96
    end)
    _Player2:Slider('FOV', 70, 70, 150, false, function(p97)
        game.Workspace.Camera.FieldOfView = p97
    end)
    _Player2:Slider('Fly Speed', 200, 50, 500, false, function(p98)
        _G['\u{83dc}\u{5355}']['\u{98de}\u{884c}\u{901f}\u{5ea6}'] = p98
    end)
    _Player2:KeyBind('Fly Key', 'Q', function()
        if _G['\u{83dc}\u{5355}']['\u{98de}\u{884c}'] ~= false then
            _G['\u{83dc}\u{5355}']['\u{98de}\u{884c}'] = false

            _G['\u{98de}\u{884c}'](false)
        else
            _G['\u{83dc}\u{5355}']['\u{98de}\u{884c}'] = true

            _G['\u{98de}\u{884c}'](true)
        end
    end)
    _Player2:Toggle('NoClip', false, function(p99)
        _G['\u{7a7f}\u{5899}'](p99)
    end)
    _Player2:Toggle('Infinite Jump', false, function(p100)
        if p100 then
            _G['\u{83dc}\u{5355}']['\u{65e0}\u{9650}\u{8df3}\u{8dc3}'] = game:GetService('UserInputService').JumpRequest:Connect(function()
                _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}']:ChangeState('Jumping')
            end)
        else
            _G['\u{83dc}\u{5355}']['\u{65e0}\u{9650}\u{8df3}\u{8dc3}']:Disconnect()

            _G['\u{83dc}\u{5355}']['\u{65e0}\u{9650}\u{8df3}\u{8dc3}'] = nil
        end
    end)
    _Player2:Toggle('Light', false, function(p101)
        if p101 then
            _G['\u{53d1}\u{5149}'] = Instance.new('PointLight', _G['\u{81ea}\u{5df1}\u{89d2}\u{8272}'].Head)
            _G['\u{53d1}\u{5149}'].Name = 'dark'
            _G['\u{53d1}\u{5149}'].Range = 150
            _G['\u{53d1}\u{5149}'].Brightness = 1.7
        else
            pcall(function()
                _G['\u{81ea}\u{5df1}\u{89d2}\u{8272}'].Head.dark:Destroy()
            end)
        end
    end)
    _Player2:Button('Safe Death', function()
        _G['\u{4f20}\u{9001}'](CFrame.new(0, -380, 0))
    end)

    local _Tp = _Player:Section('Tp')

    _Tp:DropDown('Select the player', {}, true, false, function(p102)
        _G['\u{83dc}\u{5355}']['\u{4f20}\u{9001}\u{7684}\u{73a9}\u{5bb6}'] = p102
    end)
    _Tp:Button('Tp to Base', function()
        _G['\u{57fa}\u{5730}'] = nil

        local v175 = next
        local v176, v177 = _G['\u{571f}\u{5730}']:GetChildren()

        for _, v178 in v175, v176, v177 do
            if tostring(v178.Owner.Value) == _G['\u{83dc}\u{5355}']['\u{4f20}\u{9001}\u{7684}\u{73a9}\u{5bb6}'] then
                _G['\u{57fa}\u{5730}'] = v178

                _G['\u{4f20}\u{9001}'](v178.OriginSquare.CFrame + Vector3.new(0, 5, 0))
            end
        end

        if _G['\u{57fa}\u{5730}'] == nil then
            _G['\u{63d0}\u{9192}']('Player Not Have Base')
        end
    end)
    _Tp:Button('Tp to Player', function()
        _G['\u{4f20}\u{9001}'](_G['\u{73a9}\u{5bb6}'][_G['\u{83dc}\u{5355}']['\u{4f20}\u{9001}\u{7684}\u{73a9}\u{5bb6}'] ].Character.HumanoidRootPart.CFrame)
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
            _G['\u{4f20}\u{9001}'](CFrame.new(270, 4, 60))
        elseif p103 == 'Spawn' then
            _G['\u{4f20}\u{9001}'](CFrame.new(174, 10.5, 66))
        elseif p103 == 'Land Store' then
            _G['\u{4f20}\u{9001}'](CFrame.new(270, 3, -98))
        elseif p103 == 'Bridge' then
            _G['\u{4f20}\u{9001}'](CFrame.new(112, 37, -892))
        elseif p103 == 'Dock' then
            _G['\u{4f20}\u{9001}'](CFrame.new(1136, 0, -206))
        elseif p103 == 'Palm' then
            _G['\u{4f20}\u{9001}'](CFrame.new(2614, -4, -34))
        elseif p103 == 'Cave' then
            _G['\u{4f20}\u{9001}'](CFrame.new(3590, -177, 415))
        elseif p103 == 'Volcano' then
            _G['\u{4f20}\u{9001}'](CFrame.new(-1588, 623, 1069))
        elseif p103 == 'Swamp' then
            _G['\u{4f20}\u{9001}'](CFrame.new(-1216, 131, -822))
        elseif p103 == 'Fancy Furnishings' then
            _G['\u{4f20}\u{9001}'](CFrame.new(486, 3, -1722))
        elseif p103 == 'Boxed Cars' then
            _G['\u{4f20}\u{9001}'](CFrame.new(509, 3, -1458))
        elseif p103 == 'Ice Mountain' then
            _G['\u{4f20}\u{9001}'](CFrame.new(1487, 415, 3259))
        elseif p103 == 'Links Logic' then
            _G['\u{4f20}\u{9001}'](CFrame.new(4615, 7, -794))
        elseif p103 == 'Bobs Shack' then
            _G['\u{4f20}\u{9001}'](CFrame.new(292, 8, -2544))
        elseif p103 == 'Fine Arts Store' then
            _G['\u{4f20}\u{9001}'](CFrame.new(5217, -166, 721))
        elseif p103 == 'Shrine Of Sight' then
            _G['\u{4f20}\u{9001}'](CFrame.new(-1608, 195, 928))
        elseif p103 == 'Strange Man' then
            _G['\u{4f20}\u{9001}'](CFrame.new(1071, 16, 1141))
        elseif p103 == 'Volcano Win' then
            _G['\u{4f20}\u{9001}'](CFrame.new(-1667, 349, 1474))
        elseif p103 == 'Ski Lodge' then
            _G['\u{4f20}\u{9001}'](CFrame.new(1244, 59, 2290))
        elseif p103 == 'Fur Wood' then
            _G['\u{4f20}\u{9001}'](CFrame.new(-1080, -5, -942))
        elseif p103 == 'The Den' then
            _G['\u{4f20}\u{9001}'](CFrame.new(330.259735, 45.7998505, 1943.30823, 0.972010553, -8.07546598e-8, 0.234937176, 7.63610259e-8, 1, 2.77986647e-8, -0.234937176, -9.080551419999999e-9, 0.972010553))
        end
    end)

    local _funny = _Player:Section('funny')

    _funny:Toggle('Fire', false, function(p104)
        if p104 then
            Instance.new('Fire', _G['\u{81ea}\u{5df1}\u{89d2}\u{8272}'].Head)
        else
            _G['\u{81ea}\u{5df1}\u{89d2}\u{8272}'].Head:FindFirstChild('Fire'):Destroy()
        end
    end)
    _funny:Toggle('Sparkles', false, function(p105)
        if p105 then
            Instance.new('Sparkles', _G['\u{81ea}\u{5df1}\u{89d2}\u{8272}'].Head)
        else
            _G['\u{81ea}\u{5df1}\u{89d2}\u{8272}'].Head:FindFirstChild('Sparkles'):Destroy()
        end
    end)

    _G['\u{81ea}\u{52a8}\u{62ff}\u{9ca8}\u{9c7c}\u{65a7}\u{5934}'] = nil
    _G['\u{81ea}\u{52a8}\u{62ff}\u{9ca8}\u{9c7c}\u{65a7}\u{5934}'] = function(p106)
        if p106 then
            _G['\u{81ea}\u{52a8}\u{62ff}\u{9ca8}\u{9c7c}\u{65a7}\u{5934}'] = game.Workspace.PlayerModels.ChildAdded:Connect(function(p107)
                local _Main = p107:WaitForChild('Main', 60)
                local _CFrame2 = _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}'].CFrame

                if _Main:FindFirstChild('Mesh') and _Main.Mesh.TextureId == 'rbxassetid://273892918' then
                    repeat
                        wait()
                    until p107:FindFirstChild('ToolName')

                    if p107.Owner.Value == nil then
                        _G['\u{63d0}\u{9192}']('Calming Rukiryaxe')
                        _G['\u{4f20}\u{9001}'](p107.Main.CFrame)

                        repeat
                            task.wait()
                            _G['\u{62c9}\u{4e1c}\u{897f}']:FireServer(p107)
                            game.ReplicatedStorage.Interaction.ClientInteracted:FireServer(p107, 'Pick up tool')
                        until tostring(p107.Parent) ~= 'PlayerModels'
                    end

                    _G['\u{4f20}\u{9001}'](_CFrame2)
                end
            end)
        else
            pcall(function()
                _G['\u{81ea}\u{52a8}\u{62ff}\u{9ca8}\u{9c7c}\u{65a7}\u{5934}']:Disconnect()

                _G['\u{81ea}\u{52a8}\u{62ff}\u{9ca8}\u{9c7c}\u{65a7}\u{5934}'] = nil
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
        _G['\u{83dc}\u{5355}']['\u{7ec8}\u{65e5}\u{767d}\u{5929}'] = p109
    end)
    _World:Toggle('Always Night', false, function(p110)
        _G['\u{83dc}\u{5355}']['\u{7ec8}\u{65e5}\u{9ed1}\u{591c}'] = p110
    end)
    _World:Toggle('Remove Fog', false, function(p111)
        _G['\u{83dc}\u{5355}']['\u{6d88}\u{9664}\u{96fe}'] = p111
    end)

    _G['\u{706f}\u{5149}'].GlobalShadows = false

    _World:Toggle('Always Shadows', true, function(p112)
        _G['\u{706f}\u{5149}'].GlobalShadows = p112
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
        _G['\u{81ea}\u{52a8}\u{62ff}\u{9ca8}\u{9c7c}\u{65a7}\u{5934}'](p116)

        _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{62ff}\u{9ca8}\u{9c7c}\u{65a7}\u{5934}'] = p116
    end)
    _World:Toggle('Water Gold Mode ', false, function(p117)
        _G['\u{83dc}\u{5355}']['\u{6c34}\u{4e2d}\u{65e0}\u{654c}'] = p117
    end)
    _World:Toggle('Leaked item  ', false, function(p118)
        _ScreenGui3.Enabled = p118
    end)
    _World:Button('Bring Swamp Bridge', function()
        local _CFrame3 = _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}'].CFrame
        local _Slab = game:GetService('Workspace').Region_Mountainside.SlabRegen:FindFirstChild('Slab')

        if _Slab and not _Slab.PrimaryPart then
            _Slab.PrimaryPart = _Slab.PushMe
        end

        wait()

        for _ = 1, 6 do
            _G['\u{62c9}\u{4e1c}\u{897f}']:FireServer(_Slab.PrimaryPart)
            _Slab:PivotTo(_CFrame3)
            _G['\u{62c9}\u{4e1c}\u{897f}']:FireServer(_Slab.Slider)
            task.wait()
        end
    end)

    _G['\u{5904}\u{7406}\u{6811}'] = function(p119)
        local v199 = _G
        local v200 = _G
        local v201, v202 = _G['\u{68c0}\u{67e5}\u{65a7}\u{5934}'](p119.TreeClass.Value)

        v200['\u{4f24}\u{5bb3}'] = v202
        v199['\u{65a7}\u{5934}'] = v201

        if _G['\u{4f24}\u{5bb3}'] then
            _G['\u{952f}\u{6728}\u{673a}'] = _G['\u{83dc}\u{5355}']['\u{9009}\u{62e9}\u{7684}\u{952f}\u{6728}\u{673a}'].Particles.CFrame + Vector3.new(0.7, 0, 0)
            _G['\u{4fdd}\u{7559}'] = nil

            local _CFrame4 = _G['\u{81ea}\u{5df1}'].Character.HumanoidRootPart.CFrame
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

                                                if _G['\u{4fdd}\u{7559}'] or not v210 then
                                                    v210 = _G['\u{4fdd}\u{7559}']
                                                end

                                                v211['\u{4fdd}\u{7559}'] = v210
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

                                    if _G['\u{4fdd}\u{7559}'] or not v206 then
                                        v213 = _G['\u{4fdd}\u{7559}']
                                    else
                                        v213 = v206
                                    end

                                    v212['\u{4fdd}\u{7559}'] = v213

                                    if v206.Size.Z < _G['\u{4fdd}\u{7559}'].Size.Z then
                                        wait()

                                        _G['\u{4fdd}\u{7559}'] = v206
                                    end
                                end
                            end
                        end
                    end
                end
            end

            _G['\u{70e7}\u{6bc1}'] = nil

            local v214 = next
            local v215, v216 = _G['\u{4fdd}\u{7559}'].Parent:GetChildren()

            for _, v217 in v214, v215, v216 do
                if v217.Name == 'WoodSection' then
                    if v217:WaitForChild('ID').Value == _G['\u{4fdd}\u{7559}'].ParentID.Value then
                        wait()

                        _G['\u{70e7}\u{6bc1}'] = v217
                    end
                end
            end

            if _G['\u{70e7}\u{6bc1}'] and _G['\u{4fdd}\u{7559}'] then
                local _BoxHandleAdornment = Instance.new('BoxHandleAdornment', _G['\u{4fdd}\u{7559}'])

                _BoxHandleAdornment.Name = 'Selection'
                _BoxHandleAdornment.Adornee = _BoxHandleAdornment.Parent
                _BoxHandleAdornment.AlwaysOnTop = true
                _BoxHandleAdornment.ZIndex = 0
                _BoxHandleAdornment.Size = _BoxHandleAdornment.Parent.Size
                _BoxHandleAdornment.Transparency = 0
                _BoxHandleAdornment.Color = BrickColor.new('Lime green')
                _G['\u{83dc}\u{5355}']['\u{98de}\u{884c}'] = true

                spawn(function()
                    _G['\u{98de}\u{884c}'](true)
                end)

                _G['\u{65e7}\u{7684}\u{98de}\u{884c}\u{901f}\u{5ea6}'] = _G['\u{83dc}\u{5355}']['\u{98de}\u{884c}\u{901f}\u{5ea6}']
                _G['\u{83dc}\u{5355}']['\u{98de}\u{884c}\u{901f}\u{5ea6}'] = 0

                _G['\u{4f20}\u{9001}'](p119.WoodSection.CFrame)

                repeat
                    spawn(function()
                        _G['\u{62c9}\u{4e1c}\u{897f}']:FireServer(p119)
                        p119:PivotTo(CFrame.new(-1665.86548, 355.800415, 1478.47742))
                        pcall(function()
                            spawn(function()
                                _G['\u{5ca9}\u{6d46}'].Size = Vector3.new(0, 0, 0)
                                _G['\u{5ca9}\u{6d46}'].Size = Vector3.new(0, 0, 0)
                            end)

                            _G['\u{5ca9}\u{6d46}'].CFrame = _G['\u{70e7}\u{6bc1}'].CFrame
                            _G['\u{5ca9}\u{6d46}'].Size = Vector3.new(0, 0, 0)
                            _G['\u{5ca9}\u{6d46}'].Size = Vector3.new(0, 0, 0)
                            _G['\u{5ca9}\u{6d46}'].Size = Vector3.new(0, 0, 0)
                        end)
                    end)
                    game['Run Service'].Heartbeat:wait()
                until _G['\u{70e7}\u{6bc1}']:FindFirstChild('LavaFire')

                _G['\u{5ca9}\u{6d46}'].CFrame = CFrame.new(-1675.2002, 255.002533, 1284.19983, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)

                _G['\u{70e7}\u{6bc1}']:FindFirstChild('LavaFire'):Destroy()

                local u56 = false

                _G['\u{70e7}\u{6bc1}'].AncestryChanged:Connect(function()
                    u56 = true
                end)
                _G['\u{62c9}\u{4e1c}\u{897f}']:FireServer(p119)

                for _ = 1, 30 do
                    _G['\u{62c9}\u{4e1c}\u{897f}']:FireServer(p119)

                    p119.WoodSection.Velocity = Vector3.new(0, 0, 0)
                    p119.WoodSection.RotVelocity = Vector3.new(0, 0, 0)

                    p119:PivotTo(CFrame.new(-904, 150, -3396))
                    _G['\u{62c9}\u{4e1c}\u{897f}']:FireServer(p119)
                    task.wait()
                end

                _G['\u{4f20}\u{9001}'](_G['\u{70e7}\u{6bc1}'].CFrame)

                repeat
                    _G['\u{62c9}\u{4e1c}\u{897f}']:FireServer(p119)
                    _G['\u{70e7}\u{6bc1}']:PivotTo(CFrame.new(315, 5, 85.4999924))
                    _G['\u{62c9}\u{4e1c}\u{897f}']:FireServer(p119)
                    game['Run Service'].Heartbeat:wait()
                until u56

                _G['\u{5b8c}\u{6210}'] = false

                local v218 = game:GetService('Workspace').LogModels.ChildAdded:Connect(function(p120)
                    if p120:WaitForChild('Owner', 1).Value == _G['\u{81ea}\u{5df1}'] then
                        _G['\u{5b8c}\u{6210}'] = true
                    end
                end)

                _G['\u{83dc}\u{5355}']['\u{98de}\u{884c}'] = false

                spawn(function()
                    _G['\u{98de}\u{884c}'](false)
                end)

                _G['\u{83dc}\u{5355}']['\u{98de}\u{884c}\u{901f}\u{5ea6}'] = _G['\u{65e7}\u{7684}\u{98de}\u{884c}\u{901f}\u{5ea6}']

                _G['\u{4f20}\u{9001}'](CFrame.new(p119.WoodSection.CFrame.p) + Vector3.new(3, 0, 0))
                spawn(function()
                    repeat
                        _G['\u{62c9}\u{4e1c}\u{897f}']:FireServer(p119)

                        _G['\u{4fdd}\u{7559}'].Velocity = Vector3.new()
                        _G['\u{4fdd}\u{7559}'].RotVelocity = Vector3.new()

                        _G['\u{4fdd}\u{7559}']:PivotTo(_G['\u{952f}\u{6728}\u{673a}'])
                        game['Run Service'].Heartbeat:wait()
                    until _G['\u{5b8c}\u{6210}'] == true
                end)

                repeat
                    _G['\u{4f20}\u{9001}'](CFrame.new(p119.WoodSection.CFrame.p) + Vector3.new(5, 0, 0))
                    _G['\u{780d}'](p119.CutEvent, _G['\u{65a7}\u{5934}'], 1, 0.3, _G['\u{4f24}\u{5bb3}'])
                    game['Run Service'].Heartbeat:wait()
                until _G['\u{5b8c}\u{6210}'] == true or p119.Parent == nil

                v218:Disconnect()
                _G['\u{4f20}\u{9001}'](_CFrame4)

                return
            else
                return _G['\u{63d0}\u{9192}']('cant mod this wood')
            end
        else
            return _G['\u{63d0}\u{9192}']('you need one axe')
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
        _G['\u{83dc}\u{5355}']['\u{9009}\u{62e9}\u{7684}\u{6811}'] = p121
    end)
    _BringTree:DropDown('Select TreeGetMethod', {
        'Largest',
        'Smallest',
    }, false, false, function(p122)
        if p122 == 'Largest' then
            _G['\u{83dc}\u{5355}']['\u{6811}\u{7684}\u{5927}\u{5c0f}'] = 'big'
        else
            _G['\u{83dc}\u{5355}']['\u{6811}\u{7684}\u{5927}\u{5c0f}'] = 'Smallest'
        end
    end)
    _BringTree:TextBox('Tree Amount', '1', function(p123)
        _G['\u{83dc}\u{5355}']['\u{5e26}\u{6765}\u{6811}\u{7684}\u{6570}\u{91cf}'] = tonumber(p123)
    end)
    _BringTree:Button('Bring', function()
        _G['\u{83dc}\u{5355}']['\u{6811}\u{653e}\u{7f6e}\u{7684}\u{5730}\u{70b9}'] = _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}'].CFrame
        _G['\u{83dc}\u{5355}']['\u{505c}\u{6b62}\u{780d}\u{6811}'] = false

        for _ = 1, _G['\u{83dc}\u{5355}']['\u{5e26}\u{6765}\u{6811}\u{7684}\u{6570}\u{91cf}']do
            _G['\u{5e26}\u{6765}\u{6811}'](_G['\u{83dc}\u{5355}']['\u{9009}\u{62e9}\u{7684}\u{6811}'])
            task.wait()
        end

        if _G['\u{83dc}\u{5355}']['\u{9009}\u{62e9}\u{7684}\u{6811}'] ~= 'LoneCave' then
            _G['\u{4f20}\u{9001}'](_G['\u{83dc}\u{5355}']['\u{6811}\u{653e}\u{7f6e}\u{7684}\u{5730}\u{70b9}'])
        end
    end)
    _BringTree:Button('Abort', function()
        _G['\u{83dc}\u{5355}']['\u{505c}\u{6b62}\u{780d}\u{6811}'] = true
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
                                if v226.Owner.Value == nil or tostring(v226.Owner.Value) == _G['\u{81ea}\u{5df1}'] then
                                    if v226:FindFirstChild('WoodSection') then
                                        _G['\u{4f20}\u{9001}'](v226.WoodSection.CFrame)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end)

    _G['\u{9009}\u{62e9}\u{952f}\u{6728}\u{673a}'] = function()
        local u57 = nil

        _G['\u{63d0}\u{9192}']('Click one  Sawmill')

        local v227 = _G['\u{9f20}\u{6807}'].Button1Up:Connect(function()
            wait()

            local _Parent = _G['\u{9f20}\u{6807}'].Target.Parent

            if _Parent:FindFirstChild('Settings') and _Parent.Settings:FindFirstChild('DimZ') then
                u57 = _Parent

                _G['\u{63d0}\u{9192}']('Sawmill Selected')
            elseif _Parent.Parent:FindFirstChild('Settings') and _Parent.Parent.Settings:FindFirstChild('DimZ') then
                u57 = _Parent.Parent

                _G['\u{63d0}\u{9192}']('Sawmill Selected')
            end
        end)

        repeat
            task.wait(0.1)
        until u57 ~= nil

        v227:Disconnect()

        return u57
    end

    local _Mod = _Wood:Section('Mod')

    _G['\u{5904}\u{7406}\u{6811}\u{952f}\u{6728}\u{673a}'] = _Mod:Label('Please Selecet one Sawmill')

    _Mod:Button('select Sawmill', function()
        _G['\u{83dc}\u{5355}']['\u{9009}\u{62e9}\u{7684}\u{952f}\u{6728}\u{673a}'] = _G['\u{9009}\u{62e9}\u{952f}\u{6728}\u{673a}']()
        _G['\u{5904}\u{7406}\u{6811}\u{952f}\u{6728}\u{673a}'].Text = 'Selected'
    end)
    _Mod:Button('Mod Wood', function()
        if _G['\u{83dc}\u{5355}']['\u{9009}\u{62e9}\u{7684}\u{952f}\u{6728}\u{673a}'] ~= nil then
            local u58 = nil

            if _G['\u{83dc}\u{5355}']['\u{6b63}\u{5728}\u{5904}\u{7406}\u{6811}'] ~= true then
                _G['\u{83dc}\u{5355}']['\u{6b63}\u{5728}\u{5904}\u{7406}\u{6811}'] = true

                _G['\u{63d0}\u{9192}']('Click one Wood ')

                local v228 = _G['\u{9f20}\u{6807}'].Button1Up:Connect(function()
                    wait()

                    local _Parent2 = _G['\u{9f20}\u{6807}'].Target.Parent

                    if _Parent2:FindFirstChild('Owner') and (_Parent2.Owner.Value == _G['\u{81ea}\u{5df1}'] and _Parent2:FindFirstChild('WoodSection')) and not (_Parent2:FindFirstAncestor('TreeRegion') or _Parent2:FindFirstChild('RootCut')) then
                        wait()

                        u58 = _Parent2

                        _G['\u{63d0}\u{9192}']('Wood Selected')
                    end
                end)

                repeat
                    task.wait(0.1)
                until u58 ~= nil

                v228:Disconnect()
                _G['\u{5904}\u{7406}\u{6811}'](u58)

                _G['\u{83dc}\u{5355}']['\u{6b63}\u{5728}\u{5904}\u{7406}\u{6811}'] = false

                return
            else
                return _G['\u{63d0}\u{9192}']('you are using this feature')
            end
        else
            return _G['\u{63d0}\u{9192}']('select Sawmail At First')
        end
    end)
    _Mod:Button('Mod Sawmill', function()
        if not _G['\u{81ea}\u{5df1}'].PlayerBlueprints.Blueprints:FindFirstChild('Floor2') then
            local v229 = game.Workspace.PlayerModels.ChildAdded:connect(function(p124)
                spawn(function()
                    if p124.Type.Value == 'Blueprint' then
                        game:GetService('ReplicatedStorage').Interaction.ClientInteracted:FireServer(p124, 'Open box')
                    end
                end)
            end)

            _G['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}v2']('Floor2', 1)
            wait(1)
            v229:Disconnect()
        end

        local v230 = nil
        local v231 = _G['\u{83dc}\u{5355}']['\u{9009}\u{62e9}\u{7684}\u{952f}\u{6728}\u{673a}'].Conveyor.Model:GetChildren()
        local _Y = _G['\u{83dc}\u{5355}']['\u{9009}\u{62e9}\u{7684}\u{952f}\u{6728}\u{673a}'].Main.Orientation.Y

        for v232 = _G['\u{83dc}\u{5355}']['\u{9009}\u{62e9}\u{7684}\u{952f}\u{6728}\u{673a}'].ItemName.Value:match('Sawmill4L') and #v231 - 1 or #v231, #v231 do
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

            _FireServer(_ClientPlacedBlueprint, v234, _new(_p + _new2(v235, v236, v237)) * CFrame.Angles(math.rad((_Y == 180 or _Y == 0) and 90 or 45), math.rad((_Y == 180 or _Y == 0) and 0 or 90), math.rad((_Y == 180 or _Y == 0) and 90 or 45)), _G['\u{81ea}\u{5df1}'])
            task.wait(1.5)
        end
    end)
    _Mod:Button('Max Sawmill Settings', function()
        if _G['\u{83dc}\u{5355}']['\u{9009}\u{62e9}\u{7684}\u{952f}\u{6728}\u{673a}'] ~= nil then
            for _ = 1, 20 do
                game:GetService('ReplicatedStorage').Interaction.RemoteProxy:FireServer(_G['\u{83dc}\u{5355}']['\u{9009}\u{62e9}\u{7684}\u{952f}\u{6728}\u{673a}'].ButtonRemote_XUp)
                task.wait(1)
                game:GetService('ReplicatedStorage').Interaction.RemoteProxy:FireServer(_G['\u{83dc}\u{5355}']['\u{9009}\u{62e9}\u{7684}\u{952f}\u{6728}\u{673a}'].ButtonRemote_YUp)
                task.wait(1)
            end

            return
        else
            return _G['\u{63d0}\u{9192}']('select Sawmail At First')
        end
    end)
    _Mod:Button('Lowest Sawmill Settings', function()
        if _G['\u{83dc}\u{5355}']['\u{9009}\u{62e9}\u{7684}\u{952f}\u{6728}\u{673a}'] ~= nil then
            for _ = 1, 20 do
                game:GetService('ReplicatedStorage').Interaction.RemoteProxy:FireServer(_G['\u{83dc}\u{5355}']['\u{9009}\u{62e9}\u{7684}\u{952f}\u{6728}\u{673a}'].ButtonRemote_XDown)
                task.wait(1)
                game:GetService('ReplicatedStorage').Interaction.RemoteProxy:FireServer(_G['\u{83dc}\u{5355}']['\u{9009}\u{62e9}\u{7684}\u{952f}\u{6728}\u{673a}'].ButtonRemote_YDown)
                task.wait(1)
            end

            return
        else
            return _G['\u{63d0}\u{9192}']('select Sawmail At First')
        end
    end)

    _G['\u{62ff}\u{86cb}'] = function()
        local _CFrame5 = _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}'].CFrame
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
                                if v246.Owner.Value == nil or v246.Owner.Value == _G['\u{81ea}\u{5df1}'] then
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

            if p125:WaitForChild('Owner', 60).Value == _G['\u{81ea}\u{5df1}'] and tostring(p125.TreeClass.Value) == 'Oak' then
                u59 = true

                _G['\u{4f20}\u{9001}'](p125.WoodSection.CFrame)
                u49(p125, workspace.Egger.Pedestal.Zone.CFrame)
                _G['\u{4f20}\u{9001}'](workspace.Egger.Pedestal.Zone.CFrame + Vector3.new(5, 0, 0))
            end
        end)
        local _Oak, v253 = _G['\u{68c0}\u{67e5}\u{65a7}\u{5934}']('Oak')

        repeat
            game['Run Service'].Heartbeat:wait()
            _G['\u{4f20}\u{9001}'](v241.CFrame + Vector3.new(3, 0, 0))
            _G['\u{780d}'](v241.Parent.CutEvent, _Oak, v241.ID.Value, v241.Size.Y - 4 / (v241.Size.X * v241.Size.X) + 0.01, v253)
        until u59

        v252:Disconnect()

        local u60 = false
        local v254 = workspace.PlayerModels.ChildAdded:Connect(function(p126)
            p126:WaitForChild('Owner', 60)
            p126:WaitForChild('Owner', 60)

            p126.PrimaryPart = p126:WaitForChild('Main', 60)

            if p126:WaitForChild('Owner', 60).Value == _G['\u{81ea}\u{5df1}'] and tostring(p126.ItemName.Value) == 'HuntEgg1' then
                u60 = true

                wait(1)
                _G['\u{4f20}\u{9001}'](p126.Main.CFrame)
                u49(p126, _CFrame5)
                _G['\u{4f20}\u{9001}'](_CFrame5)
            end
        end)

        repeat
            wait()
        until u60

        v254:Disconnect()
    end
    _G['\u{81ea}\u{52a8}\u{8d5a}\u{94b1}'] = function(p127)
        if p127 then
            _G['\u{5df2}\u{7ecf}\u{5904}\u{7406}\u{597d}'] = false
            _G['\u{6811}\u{7684}\u{52a0}\u{5165}'] = game.Workspace.LogModels.ChildAdded:Connect(function(p128)
                local _Owner = p128:WaitForChild('Owner', 60)

                p128.PrimaryPart = p128:FindFirstChild('WoodSection')
                _G['\u{5356}\u{6728}\u{677f}'] = nil

                if _Owner.Value == _G['\u{81ea}\u{5df1}'] and _Owner.Value == _G['\u{6811}\u{7684}\u{79cd}\u{7c7b}'] then
                    _G['\u{5df2}\u{7ecf}\u{5904}\u{7406}\u{597d}'] = false

                    if _G['\u{83dc}\u{5355}']['\u{5904}\u{7406}\u{780d}\u{597d}\u{7684}\u{6728}\u{5934}'] then
                        _G['\u{5904}\u{7406}\u{6811}'](p128)

                        _G['\u{5356}\u{6728}\u{677f}'] = game.Workspace.PlayerModels.ChildAdded:connect(function(p129)
                            if p129:FindFirstChild('Owner') and (p129.Owner.Value == _G['\u{81ea}\u{5df1}'] and not p129:FindFirstChild('TreeClass')) and p129:FindFirstChild('WoodSection') then
                                repeat
                                    wait()
                                until p129:FindFirstChild('TreeClass')

                                _G['\u{4f20}\u{9001}'](p129.WoodSection.CFrame)

                                for _ = 1, 2 do
                                    for _ = 1, 10 do
                                        _G['\u{62c9}\u{4e1c}\u{897f}']:FireServer(p129)
                                        task.wait()
                                    end

                                    p129:PivotTo(CFrame.new(315, 0, 84))
                                    game.ReplicatedStorage.TestPing:InvokeServer()
                                    game.ReplicatedStorage.TestPing:InvokeServer()
                                    task.wait()
                                end
                            end

                            _G['\u{4f20}\u{9001}'](CFrame.new(315, 0, 84))

                            _G['\u{5df2}\u{7ecf}\u{5904}\u{7406}\u{597d}'] = true

                            wait(0.2)

                            _G['\u{5df2}\u{7ecf}\u{5904}\u{7406}\u{597d}'] = false

                            pcall(function()
                                _G['\u{5356}\u{6728}\u{677f}']:Disconnect()

                                _G['\u{5356}\u{6728}\u{677f}'] = nil
                            end)
                        end)
                    else
                        _G['\u{5356}\u{6728}\u{5934}']()

                        _G['\u{5df2}\u{7ecf}\u{5904}\u{7406}\u{597d}'] = true
                    end
                end
            end)

            while task.wait(0.1) do
                if p127 then
                    _G['\u{5df2}\u{7ecf}\u{5904}\u{7406}\u{597d}'] = false

                    _G['\u{5e26}\u{6765}\u{6811}'](_G['\u{83dc}\u{5355}']['\u{9009}\u{62e9}\u{7684}\u{6811}'])
                    task.wait()

                    _G['\u{5df2}\u{7ecf}\u{5904}\u{7406}\u{597d}'] = false
                    _G['\u{5df2}\u{7ecf}\u{5904}\u{7406}\u{597d}'] = false

                    task.wait(0.2)

                    if _G['\u{5df2}\u{7ecf}\u{5904}\u{7406}\u{597d}'] ~= true then
                        break
                    end
                end
            end
        else
            _G['\u{6811}\u{7684}\u{52a0}\u{5165}']:Disconnect()

            _G['\u{6811}\u{7684}\u{52a0}\u{5165}'] = nil
        end
    end
    _G['\u{780d}\u{597d}\u{4e86}'] = false
    _G['\u{81ea}\u{52a8}\u{780d}'] = function(p130)
        if p130 then
            _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{780d}\u{7684}\u{94fe}\u{63a5}'] = game:GetService('Workspace').LogModels.ChildAdded:Connect(function(p131)
                if p131:WaitForChild('Owner').Value == _G['\u{81ea}\u{5df1}'] then
                    _G['\u{780d}\u{597d}\u{4e86}'] = true
                end
            end)
            _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{780d}'] = _G['\u{9f20}\u{6807}'].Button1Up:Connect(function()
                if _G['\u{9f20}\u{6807}'].Target.Name ~= 'WoodSection' or tostring(_G['\u{9f20}\u{6807}'].Target.Parent.Owner.Value) ~= 'nil' and not _G['\u{81ea}\u{5df1}'].Name then
                else
                    _G['\u{9009}\u{62e9}\u{7684}\u{6728}\u{5934}'] = _G['\u{9f20}\u{6807}'].Target
                    _G['\u{780d}\u{597d}\u{4e86}'] = false
                    _G['\u{780d}\u{7684}\u{5730}\u{65b9}'] = _G['\u{9009}\u{62e9}\u{7684}\u{6728}\u{5934}'].CFrame:pointToObjectSpace(_G['\u{9f20}\u{6807}'].Hit.p).Y + _G['\u{9009}\u{62e9}\u{7684}\u{6728}\u{5934}'].Size.Y / 2

                    local v255 = _G
                    local v256 = _G
                    local v257, v258 = _G['\u{68c0}\u{67e5}\u{65a7}\u{5934}'](_G['\u{9009}\u{62e9}\u{7684}\u{6728}\u{5934}'].Parent.TreeClass.Value)

                    v256['\u{4f24}\u{5bb3}'] = v258
                    v255['\u{65a7}\u{5934}'] = v257

                    if _G['\u{4f24}\u{5bb3}'] then
                        while _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{780d}\u{5f00}\u{542f}'] do
                            _G['\u{780d}'](_G['\u{9009}\u{62e9}\u{7684}\u{6728}\u{5934}'].Parent.CutEvent, _G['\u{65a7}\u{5934}'], _G['\u{9009}\u{62e9}\u{7684}\u{6728}\u{5934}'].ID.Value, _G['\u{780d}\u{7684}\u{5730}\u{65b9}'], _G['\u{4f24}\u{5bb3}'])
                            task.wait()

                            if _G['\u{780d}\u{597d}\u{4e86}'] == true then
                                break
                            end
                        end

                        _G['\u{780d}\u{597d}\u{4e86}'] = false

                        if _G['\u{780d}\u{597d}\u{4e86}'] then
                            _G['\u{63d0}\u{9192}']('Finished Cutting')
                        end
                    else
                        return _G['\u{63d0}\u{9192}']('you need one axe')
                    end
                end

                return
            end)

            return
        else
            _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{780d}']:Disconnect()
            _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{780d}\u{7684}\u{94fe}\u{63a5}']:Disconnect()

            return
        end
    end

    _Mod:Button('Get egg', function()
        _G['\u{62ff}\u{86cb}']()
    end)
    _Mod:Toggle('Auto Farm', false, function(p132)
        _G['\u{81ea}\u{52a8}\u{8d5a}\u{94b1}'](p132)
    end)
    _Mod:Toggle('Mod Cut Wood', false, function(p133)
        if p133 and _G['\u{83dc}\u{5355}']['\u{9009}\u{62e9}\u{7684}\u{952f}\u{6728}\u{673a}'] == nil then
            return _G['\u{63d0}\u{9192}']('select Sawmail At First')
        else
            _G['\u{83dc}\u{5355}']['\u{5904}\u{7406}\u{780d}\u{597d}\u{7684}\u{6728}\u{5934}'] = p133

            return
        end
    end)

    local _Misc = _Wood:Section('Misc')

    _Misc:Toggle('One Unit Cutter', false, function(p134)
        if p134 then
            _G['\u{88ab}\u{780d}\u{6728}\u{677f}'] = nil
            _G['\u{6728}\u{677f}\u{52a0}\u{5165}'] = game:GetService('Workspace').PlayerModels.ChildAdded:Connect(function(p135)
                if p135:WaitForChild('TreeClass') and p135:WaitForChild('WoodSection') then
                    _G['\u{88ab}\u{780d}\u{6728}\u{677f}'] = p135

                    task.wait()
                end
            end)
            _G['\u{780d}\u{6811}'] = _G['\u{9f20}\u{6807}'].Button1Up:Connect(function()
                local _Target = _G['\u{9f20}\u{6807}'].Target

                if _Target.Name == 'WoodSection' then
                    _G['\u{88ab}\u{780d}\u{6728}\u{677f}'] = _Target.Parent

                    _G['\u{4f20}\u{9001}'](_Target.CFrame + Vector3.new(0, 3, -3))

                    local v259 = _G
                    local v260 = _G
                    local v261, v262 = _G['\u{68c0}\u{67e5}\u{65a7}\u{5934}'](_G['\u{88ab}\u{780d}\u{6728}\u{677f}'].TreeClass.Value)

                    v260['\u{4f24}\u{5bb3}'] = v262
                    v259['\u{65a7}\u{5934}'] = v261

                    while p134 ~= false do
                        _G['\u{780d}'](_G['\u{88ab}\u{780d}\u{6728}\u{677f}'].CutEvent, _G['\u{65a7}\u{5934}'], 1, 1, _G['\u{4f24}\u{5bb3}'])

                        if _G['\u{88ab}\u{780d}\u{6728}\u{677f}']:FindFirstChild('Cut') then
                            _G['\u{4f20}\u{9001}'](_G['\u{88ab}\u{780d}\u{6728}\u{677f}']:FindFirstChild('Cut').CFrame + Vector3.new(0, 3, -3))
                        end

                        task.wait()

                        if _G['\u{88ab}\u{780d}\u{6728}\u{677f}'].WoodSection.Size.X <= 1.88 and _G['\u{88ab}\u{780d}\u{6728}\u{677f}'].WoodSection.Size.Y <= 1.88 and _G['\u{88ab}\u{780d}\u{6728}\u{677f}'].WoodSection.Size.Z <= 1.88 then
                            break
                        end
                    end
                end
            end)

            return
        else
            _G['\u{6728}\u{677f}\u{52a0}\u{5165}']:Disconnect()
            _G['\u{780d}\u{6811}']:Disconnect()

            return
        end
    end)
    _Misc:Button('Cut Tree Joints', function()
        local u61 = nil

        _G['\u{63d0}\u{9192}']('Click one Wood')

        local v263 = _G['\u{9f20}\u{6807}'].Button1Up:Connect(function()
            wait()

            local _Parent3 = _G['\u{9f20}\u{6807}'].Target.Parent

            if _Parent3:FindFirstChild('Owner') and (_Parent3.Owner.Value == _G['\u{81ea}\u{5df1}'] and _Parent3:FindFirstChild('WoodSection')) and not (_Parent3:FindFirstAncestor('TreeRegion') or _Parent3:FindFirstChild('RootCut')) then
                wait()

                u61 = _Parent3

                _G['\u{63d0}\u{9192}']('Clicked')
            end
        end)

        repeat
            task.wait(0.1)
        until u61 ~= nil

        v263:Disconnect()

        _G['\u{9700}\u{8981}\u{88ab}\u{780d}\u{7684}\u{6811}'] = {}

        local v264 = next
        local v265 = u61
        local v266, v267 = u61.GetChildren(v265)

        for _, v268 in v264, v266, v267 do
            if v268:FindFirstChild('Tree Weld') then
                table.insert(_G['\u{9700}\u{8981}\u{88ab}\u{780d}\u{7684}\u{6811}'], v268)
            end
        end

        local v269 = _G
        local v270 = _G
        local v271, v272 = _G['\u{68c0}\u{67e5}\u{65a7}\u{5934}'](u61.TreeClass.Value)

        v270['\u{4f24}\u{5bb3}'] = v272
        v269['\u{65a7}\u{5934}'] = v271

        if _G['\u{4f24}\u{5bb3}'] then
            local u62 = false
            local u63 = game:GetService('Workspace').LogModels.ChildAdded:Connect(function(p136)
                p136:WaitForChild('Owner')

                if p136.Owner.Value == _G['\u{81ea}\u{5df1}'] then
                    u62 = true
                end
            end)

            for _, v273 in next, _G['\u{9700}\u{8981}\u{88ab}\u{780d}\u{7684}\u{6811}']do
                _G['\u{4f20}\u{9001}'](CFrame.new(v273.Parent.WoodSection.CFrame.p) - Vector3.new(3, 0, 0))

                repeat
                    local v274 = _G
                    local v275 = _G
                    local v276, v277 = _G['\u{68c0}\u{67e5}\u{65a7}\u{5934}'](v273.Parent.TreeClass.Value)

                    v275['\u{4f24}\u{5bb3}'] = v277
                    v274['\u{65a7}\u{5934}'] = v276

                    _G['\u{780d}'](v273.Parent.CutEvent, _G['\u{65a7}\u{5934}'], v273.ID.Value, v273.Size.Y - 0.1, _G['\u{4f24}\u{5bb3}'])
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
        _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{780d}\u{5f00}\u{542f}'] = p137

        _G['\u{81ea}\u{52a8}\u{780d}'](p137)
    end)
    _Misc:Toggle('Hard Dragger', false, function(p138)
        _G['\u{83dc}\u{5355}']['\u{5927}\u{529b}'] = p138
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
                return _G['\u{63d0}\u{9192}']('Not Found Phantom Tree ')
            end
        else
            game.Workspace.Camera.CameraSubject = _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}']
        end

        return
    end)

    _G['\u{70b9}\u{51fb}\u{5356}\u{6728}\u{677f}'] = nil
    _G['\u{9f20}\u{6807}\u{79fb}\u{52a8}'] = nil

    _Misc:Toggle('Click to Sell Plank', false, function(p140)
        if p140 then
            _G['\u{70b9}\u{51fb}\u{5356}\u{6728}\u{5934}\u{9009}\u{62e9}\u{6846}'] = Instance.new('SelectionBox', game.Workspace.PlayerModels)
            _G['\u{9f20}\u{6807}\u{79fb}\u{52a8}'] = _G['\u{9f20}\u{6807}'].Move:Connect(function()
                _G['\u{70b9}\u{51fb}'] = _G['\u{9f20}\u{6807}'].Target

                if _G['\u{70b9}\u{51fb}'].Parent:FindFirstChild('Owner') and _G['\u{70b9}\u{51fb}'].Parent.Owner.Value == _G['\u{81ea}\u{5df1}'] and (_G['\u{70b9}\u{51fb}'].Parent:FindFirstChild('TreeClass') and _G['\u{70b9}\u{51fb}']:FindFirstAncestor('PlayerModels')) then
                    _G['\u{70b9}\u{51fb}\u{5356}\u{6728}\u{5934}\u{9009}\u{62e9}\u{6846}'].LineThickness = 0.1
                    _G['\u{70b9}\u{51fb}\u{5356}\u{6728}\u{5934}\u{9009}\u{62e9}\u{6846}'].Adornee = _G['\u{9f20}\u{6807}'].Target
                    _G['\u{70b9}\u{51fb}\u{5356}\u{6728}\u{5934}\u{9009}\u{62e9}\u{6846}'].Color3 = Color3.new(1, 0, 0)
                else
                    _G['\u{70b9}\u{51fb}\u{5356}\u{6728}\u{5934}\u{9009}\u{62e9}\u{6846}'].Adornee = game.Workspace.PlayerModels
                end
            end)
            _G['\u{70b9}\u{51fb}\u{5356}\u{6728}\u{677f}'] = _G['\u{9f20}\u{6807}'].Button1Up:Connect(function()
                _G['\u{70b9}\u{51fb}2'] = _G['\u{9f20}\u{6807}'].Target

                if _G['\u{70b9}\u{51fb}2'].Parent:FindFirstChild('Owner') and _G['\u{70b9}\u{51fb}2'].Parent.Owner.Value == _G['\u{81ea}\u{5df1}'] and (_G['\u{70b9}\u{51fb}2'].Parent:FindFirstChild('TreeClass') and _G['\u{70b9}\u{51fb}2'].Parent:FindFirstAncestor('PlayerModels')) and _G['\u{70b9}\u{51fb}2'].Parent:FindFirstChild('WoodSection') then
                    local _CFrame6 = _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}'].CFrame

                    _G['\u{4f20}\u{9001}'](_G['\u{70b9}\u{51fb}2'].Parent.WoodSection.CFrame)
                    spawn(function()
                        for _ = 1, 30 do
                            if _G['\u{70b9}\u{51fb}2'].Parent:FindFirstChild('Owner') then
                                if _G['\u{70b9}\u{51fb}2'].Parent.Owner.Value == _G['\u{81ea}\u{5df1}'] then
                                    if _G['\u{70b9}\u{51fb}2'].Parent:FindFirstChild('TreeClass') then
                                        if _G['\u{70b9}\u{51fb}2'].Parent:FindFirstAncestor('PlayerModels') then
                                            if _G['\u{70b9}\u{51fb}2'].Parent:FindFirstChild('WoodSection') then
                                                pcall(function()
                                                    _G['\u{62c9}\u{4e1c}\u{897f}']:FireServer(_G['\u{70b9}\u{51fb}2'].Parent)
                                                    _G['\u{70b9}\u{51fb}2'].Parent:PivotTo(CFrame.new(315, 0, 85.4999924))
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
                    _G['\u{4f20}\u{9001}'](_CFrame6)
                    task.wait(0.5)

                    _G['\u{70b9}\u{51fb}2'].Anchored = true
                end
            end)
        else
            pcall(function()
                _G['\u{70b9}\u{51fb}\u{5356}\u{6728}\u{5934}\u{9009}\u{62e9}\u{6846}']:Destroy()
            end)
            _G['\u{70b9}\u{51fb}\u{5356}\u{6728}\u{677f}']:Disconnect()
            _G['\u{9f20}\u{6807}\u{79fb}\u{52a8}']:Disconnect()

            _G['\u{70b9}\u{51fb}\u{5356}\u{6728}\u{677f}'] = nil
            _G['\u{9f20}\u{6807}\u{79fb}\u{52a8}'] = nil
        end
    end)
    _Misc:Button('Bring All Tree', function()
        local _CFrame7 = _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}'].CFrame
        local v283 = next
        local v284, v285 = game:GetService('Workspace').LogModels:GetChildren()

        for _, v286 in v283, v284, v285 do
            if v286:FindFirstChild('Owner') then
                if v286.Owner.Value == _G['\u{81ea}\u{5df1}'] then
                    _G['\u{4f20}\u{9001}'](v286.WoodSection.CFrame)

                    for _ = 1, 20 do
                        _G['\u{62c9}\u{4e1c}\u{897f}']:FireServer(v286)
                        v286:PivotTo(_CFrame7)
                        game:GetService('RunService').Stepped:wait()
                    end
                end

                task.wait()
            end
        end

        task.wait()
        _G['\u{4f20}\u{9001}'](_CFrame7)
        _G['\u{63d0}\u{9192}']('Done')
    end)
    _Misc:Button('Sell All Tree', function()
        _G['\u{5356}\u{6728}\u{5934}']()
        _G['\u{63d0}\u{9192}']('Done')
    end)
    _Misc:Button('Bring All Plank', function()
        local _CFrame8 = _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}'].CFrame
        local v287 = next
        local v288, v289 = game.Workspace.PlayerModels:GetChildren()

        for _, v290 in v287, v288, v289 do
            if v290.Name == 'Plank' then
                if v290:findFirstChild('Owner') then
                    if v290.Owner.Value == _G['\u{81ea}\u{5df1}'] then
                        local v291 = next
                        local v292, v293 = v290:GetChildren()

                        for _, v294 in v291, v292, v293 do
                            if v294.Name == 'WoodSection' then
                                _G['\u{4f20}\u{9001}'](v294.CFrame)

                                for _ = 1, 30 do
                                    _G['\u{62c9}\u{4e1c}\u{897f}']:FireServer(v290)
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

        _G['\u{4f20}\u{9001}'](_CFrame8)
        _G['\u{63d0}\u{9192}']('Done')
    end)
    _Misc:Button('Sell All Plank', function()
        local _CFrame9 = _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}'].CFrame
        local v295 = next
        local v296, v297 = game.Workspace.PlayerModels:GetChildren()

        for _, u64 in v295, v296, v297 do
            if u64.Name == 'Plank' and u64:findFirstChild('Owner') then
                if u64.Owner.Value == _G['\u{81ea}\u{5df1}'] then
                    local v298 = next
                    local v299, v300 = u64:GetChildren()

                    for _, v301 in v298, v299, v300 do
                        if v301.Name == 'WoodSection' then
                            _G['\u{4f20}\u{9001}'](v301.CFrame)
                            spawn(function()
                                for _ = 1, 100 do
                                    _G['\u{62c9}\u{4e1c}\u{897f}']:FireServer(u64)
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

        _G['\u{4f20}\u{9001}'](_CFrame9)
        _G['\u{63d0}\u{9192}']('Done')
    end)

    _G['\u{83b7}\u{5f97}\u{571f}\u{5730}'] = function()
        local v302 = next
        local v303, v304 = _G['\u{571f}\u{5730}']:GetChildren()
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
    _G['\u{6b63}\u{5728}\u{9009}\u{62e9}\u{571f}\u{5730}'] = _G['\u{81ea}\u{5df1}'].PlayerGui.PropertyPurchasingGUI.PropertyPurchasingClient
    _G['\u{9009}\u{62e9}\u{7684}\u{73af}\u{5883}'] = getsenv(_G['\u{6b63}\u{5728}\u{9009}\u{62e9}\u{571f}\u{5730}'])
    _G['\u{65e7}\u{7684}\u{70b9}\u{51fb}'] = _G['\u{9009}\u{62e9}\u{7684}\u{73af}\u{5883}'].enterPurchaseMode
    getsenv(_G['\u{6b63}\u{5728}\u{9009}\u{62e9}\u{571f}\u{5730}']).enterPurchaseMode = function(...)
        if _G['\u{83dc}\u{5355}']['\u{5feb}\u{901f}\u{52a0}\u{8f7d}'] then
            setupvalue(_G['\u{9009}\u{62e9}\u{7684}\u{73af}\u{5883}'].rotate, 3, 0)
            setupvalue(_G['\u{65e7}\u{7684}\u{70b9}\u{51fb}'], 10, _G['\u{83b7}\u{5f97}\u{571f}\u{5730}']())

            return
        else
            return _G['\u{65e7}\u{7684}\u{70b9}\u{51fb}'](...)
        end
    end

    local _Slot = v54:CreateTab('Slot', '6031090999')
    local _Slot2 = _Slot:Section('Slot')

    _Slot2:Slider('select slot', 1, 1, 6, false, function(p141)
        _G['\u{83dc}\u{5355}']['\u{5b58}\u{6863}'] = p141
    end)
    _Slot2:Toggle('Fast Load', false, function(p142)
        _G['\u{83dc}\u{5355}']['\u{5feb}\u{901f}\u{52a0}\u{8f7d}'] = p142
    end)
    _Slot2:Button('Load Base', function()
        _G['\u{52a0}\u{8f7d}'](_G['\u{83dc}\u{5355}']['\u{5b58}\u{6863}'])
    end)
    _Slot2:Button('Save Base', function()
        _G['\u{4fdd}\u{5b58}\u{57fa}\u{5730}'](_G['\u{83dc}\u{5355}']['\u{5b58}\u{6863}'])
    end)
    _Slot2:Button('Sell Sold Sign', function()
        _G['\u{5356}\u{6807}\u{5fd7}']()
    end)
    _Slot2:Toggle('Auto Farm Sold Sign', false, function(p143)
        _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{5356}\u{6807}\u{5fd7}\u{724c}'] = p143
    end)

    local _SoldSign = _Slot:Section('Sold Sign')

    _SoldSign:DropDown('Select the player', {}, true, false, function(p144)
        _G['\u{83dc}\u{5355}']['\u{590d}\u{5236}\u{6807}\u{5fd7}\u{7684}\u{73a9}\u{5bb6}'] = p144
    end)
    _SoldSign:Toggle('Sold Sign Dupe', false, function(p145)
        _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{590d}\u{5236}\u{6807}\u{5fd7}'] = p145
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

    game:GetService('ReplicatedStorage'):WaitForChild('LoadSaveRequests'):WaitForChild('GetMetaData'):InvokeServer(_G['\u{81ea}\u{5df1}'])

    _G['\u{590d}\u{5236}\u{7269}\u{54c1}'] = function(p146)
        _G['\u{662f}\u{5426}\u{53ef}\u{4ee5}\u{52a0}\u{8f7d}']()
        task.spawn(function()
            game:GetService('ReplicatedStorage').LoadSaveRequests.RequestLoad:InvokeServer(_G['\u{83dc}\u{5355}']['\u{5b58}\u{6863}'], _G['\u{81ea}\u{5df1}'])
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

        if _G['\u{83dc}\u{5355}']['\u{590d}\u{5236}\u{6728}\u{5934}'] then
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
            local v334 = game:GetService('ReplicatedStorage'):WaitForChild('LoadSaveRequests'):WaitForChild('GetMetaData'):InvokeServer(_G['\u{81ea}\u{5df1}'])
            local v335 = {}

            for v336 = 1, #v334 do
                if v334[v336].SaveMeta[#v334[v336].SaveMeta] then
                    local _NumKeys = v334[v336].SaveMeta[#v334[v336].SaveMeta].NumKeys

                    v335[#v335 + 1] = _NumKeys
                end
            end

            u67 = u67 - math.floor(v333) * v335[_G['\u{83dc}\u{5355}']['\u{5b58}\u{6863}'] ]

            if v335[_G['\u{83dc}\u{5355}']['\u{5b58}\u{6863}'] ] >= 2 then
            else
                return _G['\u{63d0}\u{9192}']('Data size is to low !!!')
            end
        end

        Workspace.PlayerModels.ChildAdded:Connect(function(p147)
            if p147:WaitForChild('Owner', 1) and p147.Owner.Value == _G['\u{81ea}\u{5df1}'] and (p147.Name ~= 'Wire' or not p147:FindFirstChild('ItemName')) then
                u67 = u67 - 1
            end
        end)

        repeat
            task.wait()
        until u67 <= 0

        spawn(function()
            _G['\u{81ea}\u{5df1}']:remove()
        end)
        game:Shutdown()

        return
    end

    local _DupeSlot = _Slot:Section('Dupe Slot')

    _DupeSlot:Toggle('Dupe Wood', false, function(p148)
        _G['\u{83dc}\u{5355}']['\u{590d}\u{5236}\u{6728}\u{5934}'] = p148
    end)
    _DupeSlot:Button('Center Dupe', function()
        _G['\u{590d}\u{5236}\u{7269}\u{54c1}'](false)
    end)
    _DupeSlot:Button('Max Land Dupe', function()
        _G['\u{590d}\u{5236}\u{7269}\u{54c1}'](true)
    end)
    _DupeSlot:Button('Remove Ownership', function()
        _G['\u{52a0}\u{8f7d}'](math.huge)
        _G['\u{63d0}\u{9192}']('done')
    end)

    local _DupePower = _Slot:Section('Dupe Power')

    _DupePower:Slider('Power slot', 1, 1, 6, false, function(p149)
        _G['\u{83dc}\u{5355}']['\u{6709}\u{8d85}\u{7ea7}\u{5efa}\u{9020}\u{7684}\u{5b58}\u{6863}'] = p149
    end)
    _DupePower:Button('Dupe Power To Build With ease', function()
        if _G['\u{81ea}\u{5df1}'].SuperBlueprint.Value then
            if _G['\u{81ea}\u{5df1}'].CurrentSaveSlot.Value ~= _G['\u{83dc}\u{5355}']['\u{6709}\u{8d85}\u{7ea7}\u{5efa}\u{9020}\u{7684}\u{5b58}\u{6863}'] then
                _G['\u{52a0}\u{8f7d}'](_G['\u{83dc}\u{5355}']['\u{6709}\u{8d85}\u{7ea7}\u{5efa}\u{9020}\u{7684}\u{5b58}\u{6863}'])
            end

            repeat
                task.wait()
            until _G['\u{81ea}\u{5df1}'].CurrentlySavingOrLoading.Value ~= true

            _G['\u{52a0}\u{8f7d}'](math.huge)

            repeat
                wait()
            until _G['\u{81ea}\u{5df1}'].OwnsProperty.Value == false and not _G['\u{81ea}\u{5df1}'].CurrentlySavingOrLoading.Value

            local v337 = _G['\u{83b7}\u{5f97}\u{571f}\u{5730}']()

            _G['\u{4f20}\u{9001}'](v337.OriginSquare.CFrame + Vector3.new(0, 3, 0))
            game.ReplicatedStorage.PropertyPurchasing.ClientPurchasedProperty:FireServer(v337, v337.OriginSquare.CFrame.p + Vector3.new(0, 3, 0))
            _G['\u{63d0}\u{9192}']('now save your slot')

            return
        else
            return _G['\u{63d0}\u{9192}']('You need to own the power to be able to dupe it')
        end
    end)

    local _Land = _Slot:Section('Land')

    _Land:Button('Free Land', function()
        local v338 = _G['\u{83b7}\u{5f97}\u{571f}\u{5730}']()

        _G['\u{4f20}\u{9001}'](v338.OriginSquare.CFrame + Vector3.new(0, 3, 0))
        game.ReplicatedStorage.PropertyPurchasing.ClientPurchasedProperty:FireServer(v338, v338.OriginSquare.CFrame.p + Vector3.new(0, 3, 0))
    end)
    _Land:Button('Free Land(buy it but free)', function()
        setidentity(2)
        getsenv(_G['\u{81ea}\u{5df1}'].PlayerGui.PropertyPurchasingGUI.PropertyPurchasingClient).enterPurchaseMode(0)
    end)
    _Land:Button('Max Land', function()
        local v339 = next
        local v340, v341 = _G['\u{571f}\u{5730}']:GetChildren()
        local v342 = nil

        for _, v343 in v339, v340, v341 do
            if v343:FindFirstChild('Owner') then
                if v343.Owner.Value == _G['\u{81ea}\u{5df1}'] then
                    v342 = v343.OriginSquare
                end
            end
        end

        if not v342 then
            local v344 = _G['\u{83b7}\u{5f97}\u{571f}\u{5730}']()

            _G['\u{4f20}\u{9001}'](v344.OriginSquare.CFrame + Vector3.new(0, 3, 0))
            game.ReplicatedStorage.PropertyPurchasing.ClientPurchasedProperty:FireServer(v344, v344.OriginSquare.CFrame.p + Vector3.new(0, 3, 0))
        end

        wait(0.5)
        _G['\u{6269}\u{5927}\u{571f}\u{5730}'](CFrame.new(v342.Position.X + 40, v342.Position.Y, v342.Position.Z))
        _G['\u{6269}\u{5927}\u{571f}\u{5730}'](CFrame.new(v342.Position.X - 40, v342.Position.Y, v342.Position.Z))
        _G['\u{6269}\u{5927}\u{571f}\u{5730}'](CFrame.new(v342.Position.X, v342.Position.Y, v342.Position.Z + 40))
        _G['\u{6269}\u{5927}\u{571f}\u{5730}'](CFrame.new(v342.Position.X, v342.Position.Y, v342.Position.Z - 40))
        _G['\u{6269}\u{5927}\u{571f}\u{5730}'](CFrame.new(v342.Position.X + 40, v342.Position.Y, v342.Position.Z + 40))
        _G['\u{6269}\u{5927}\u{571f}\u{5730}'](CFrame.new(v342.Position.X + 40, v342.Position.Y, v342.Position.Z - 40))
        _G['\u{6269}\u{5927}\u{571f}\u{5730}'](CFrame.new(v342.Position.X - 40, v342.Position.Y, v342.Position.Z + 40))
        _G['\u{6269}\u{5927}\u{571f}\u{5730}'](CFrame.new(v342.Position.X - 40, v342.Position.Y, v342.Position.Z - 40))
        _G['\u{6269}\u{5927}\u{571f}\u{5730}'](CFrame.new(v342.Position.X + 80, v342.Position.Y, v342.Position.Z))
        _G['\u{6269}\u{5927}\u{571f}\u{5730}'](CFrame.new(v342.Position.X - 80, v342.Position.Y, v342.Position.Z))
        _G['\u{6269}\u{5927}\u{571f}\u{5730}'](CFrame.new(v342.Position.X, v342.Position.Y, v342.Position.Z + 80))
        _G['\u{6269}\u{5927}\u{571f}\u{5730}'](CFrame.new(v342.Position.X, v342.Position.Y, v342.Position.Z - 80))
        _G['\u{6269}\u{5927}\u{571f}\u{5730}'](CFrame.new(v342.Position.X + 80, v342.Position.Y, v342.Position.Z + 80))
        _G['\u{6269}\u{5927}\u{571f}\u{5730}'](CFrame.new(v342.Position.X + 80, v342.Position.Y, v342.Position.Z - 80))
        _G['\u{6269}\u{5927}\u{571f}\u{5730}'](CFrame.new(v342.Position.X - 80, v342.Position.Y, v342.Position.Z + 80))
        _G['\u{6269}\u{5927}\u{571f}\u{5730}'](CFrame.new(v342.Position.X - 80, v342.Position.Y, v342.Position.Z - 80))
        _G['\u{6269}\u{5927}\u{571f}\u{5730}'](CFrame.new(v342.Position.X + 40, v342.Position.Y, v342.Position.Z + 80))
        _G['\u{6269}\u{5927}\u{571f}\u{5730}'](CFrame.new(v342.Position.X - 40, v342.Position.Y, v342.Position.Z + 80))
        _G['\u{6269}\u{5927}\u{571f}\u{5730}'](CFrame.new(v342.Position.X + 80, v342.Position.Y, v342.Position.Z + 40))
        _G['\u{6269}\u{5927}\u{571f}\u{5730}'](CFrame.new(v342.Position.X + 80, v342.Position.Y, v342.Position.Z - 40))
        _G['\u{6269}\u{5927}\u{571f}\u{5730}'](CFrame.new(v342.Position.X - 80, v342.Position.Y, v342.Position.Z + 40))
        _G['\u{6269}\u{5927}\u{571f}\u{5730}'](CFrame.new(v342.Position.X - 80, v342.Position.Y, v342.Position.Z - 40))
        _G['\u{6269}\u{5927}\u{571f}\u{5730}'](CFrame.new(v342.Position.X + 40, v342.Position.Y, v342.Position.Z - 80))
        _G['\u{6269}\u{5927}\u{571f}\u{5730}'](CFrame.new(v342.Position.X - 40, v342.Position.Y, v342.Position.Z - 80))
    end)

    _G['\u{571f}\u{5730}\u{827a}\u{672f}'] = false

    _Land:Toggle('Land Art', false, function(p150)
        _G['\u{571f}\u{5730}\u{827a}\u{672f}'] = p150

        local v345 = next
        local v346, v347 = _G['\u{571f}\u{5730}']:GetChildren()
        local v348 = {}
        local v349 = nil
        local u68 = nil

        for _, v350 in v345, v346, v347 do
            if v350:FindFirstChild('Owner') then
                if v350.Owner.Value == _G['\u{81ea}\u{5df1}'] then
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
            local v354 = _G['\u{9f20}\u{6807}'].Move:Connect(function()
                if _G['\u{9f20}\u{6807}'].Target.Name == 'Dark' then
                    _SelectionBox.LineThickness = 0.1
                    _SelectionBox.Adornee = _G['\u{9f20}\u{6807}'].Target
                end
            end)
            local v355 = _G['\u{9f20}\u{6807}'].Button1Down:Connect(function()
                if _G['\u{9f20}\u{6807}'].Target.Name == 'Dark' then
                    game.ReplicatedStorage.PropertyPurchasing.ClientExpandedProperty:FireServer(u68, _G['\u{9f20}\u{6807}'].Target.CFrame)
                    _G['\u{9f20}\u{6807}'].Target:Destroy()
                end
            end)
            local v356 = _SelectionBox

            repeat
                task.wait()
            until u68.Owner.Value ~= _G['\u{81ea}\u{5df1}'] or _G['\u{571f}\u{5730}\u{827a}\u{672f}'] == false

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
            return _G['\u{63d0}\u{9192}']('u need  a land ')
        end
    end)

    _G['\u{70b9}\u{51fb}\u{83b7}\u{5f97}\u{571f}\u{5730}'] = false
    _G['\u{70b9}\u{51fb}\u{571f}\u{5730}'] = nil

    _Land:Toggle('Click to Get Land', false, function(p151)
        _G['\u{70b9}\u{51fb}\u{83b7}\u{5f97}\u{571f}\u{5730}'] = p151

        if _G['\u{70b9}\u{51fb}\u{83b7}\u{5f97}\u{571f}\u{5730}'] then
            _G['\u{70b9}\u{51fb}\u{571f}\u{5730}'] = _G['\u{9f20}\u{6807}'].Button1Down:Connect(function()
                if _G['\u{9f20}\u{6807}'].Target.Parent:FindFirstChild('Owner') and _G['\u{9f20}\u{6807}'].Target.Parent.Parent == _G['\u{571f}\u{5730}'] then
                    if _G['\u{9f20}\u{6807}'].Target.Parent:FindFirstChild('Owner').Value ~= nil then
                        _G['\u{63d0}\u{9192}']('This Land already Have Owner')
                    else
                        _G['\u{4f20}\u{9001}'](_G['\u{9f20}\u{6807}'].Target.Parent.OriginSquare.CFrame + Vector3.new(0, 3, 0))
                        game.ReplicatedStorage.PropertyPurchasing.ClientPurchasedProperty:FireServer(_G['\u{9f20}\u{6807}'].Target.Parent, _G['\u{9f20}\u{6807}'].Target.Parent.OriginSquare.CFrame.p + Vector3.new(0, 3, 0))
                        _G['\u{63d0}\u{9192}']('Done')
                    end
                end
            end)
        else
            _G['\u{70b9}\u{51fb}\u{571f}\u{5730}']:Disconnect()

            _G['\u{70b9}\u{51fb}\u{571f}\u{5730}'] = nil
        end
    end)

    _G['\u{590d}\u{5236}\u{65a7}\u{5934}'] = function()
        _G['\u{662f}\u{5426}\u{53ef}\u{4ee5}\u{52a0}\u{8f7d}']()
        wait()

        if _G['\u{83dc}\u{5355}']['\u{98de}\u{884c}'] then
            _G['\u{98de}\u{884c}'](false)

            _G['\u{83dc}\u{5355}']['\u{98de}\u{884c}'] = false
        end

        _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}']:UnequipTools()
        _G['\u{4f20}\u{9001}'](CFrame.new(0, -380, 0))

        repeat
            wait()
        until not _G['\u{81ea}\u{5df1}\u{89d2}\u{8272}']:FindFirstChild('Head')

        _G['\u{52a0}\u{8f7d}'](_G['\u{81ea}\u{5df1}'].CurrentSaveSlot.Value)

        game:GetService('Workspace').CurrentCamera.CameraSubject = _G['\u{81ea}\u{5df1}\u{89d2}\u{8272}']

        task.wait()
    end
    _G['\u{83b7}\u{5f97}\u{6240}\u{6709}\u{65a7}\u{5934}'] = function()
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
        _G['\u{83dc}\u{5355}']['\u{8d85}\u{7ea7}\u{7535}\u{7ebf}'] = p152
    end)

    local _Axe = _Slot:Section('Axe')

    _Axe:DropDown('Select the Axe', _G['\u{83b7}\u{5f97}\u{6240}\u{6709}\u{65a7}\u{5934}'](), false, false, function(p153)
        _G['\u{83dc}\u{5355}']['\u{65a7}\u{5934}\u{7c7b}\u{578b}'] = p153
    end)
    _Axe:Toggle('Auto Pick Up Axe', false, function(p154)
        _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{6361}\u{65a7}\u{5934}'] = p154
    end)

    local _AxeDupe = _Slot:Section('Axe Dupe')

    _AxeDupe:TextBox('Amount', '1', function(p155)
        _G['\u{83dc}\u{5355}']['\u{590d}\u{5236}\u{65a7}\u{5934}\u{6570}\u{91cf}'] = tonumber(p155)
    end)
    _AxeDupe:Button('Dupe Axe', function()
        for _ = 1, _G['\u{83dc}\u{5355}']['\u{590d}\u{5236}\u{65a7}\u{5934}\u{6570}\u{91cf}']do
            _G['\u{590d}\u{5236}\u{65a7}\u{5934}']()
        end
    end)
    _AxeDupe:Toggle('Auto Dupe Axe', false, function(p156)
        _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{590d}\u{5236}\u{65a7}\u{5934}'] = p156

        repeat
            _G['\u{590d}\u{5236}\u{65a7}\u{5934}']()
        until _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{590d}\u{5236}\u{65a7}\u{5934}'] == false
    end)

    local _Wipe = _Slot:Section('Wipe')

    _Wipe:DropDown('Select the player', {}, true, false, function(p157)
        _G['\u{83dc}\u{5355}']['\u{64e6}\u{53bb}\u{7684}\u{73a9}\u{5bb6}'] = p157
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
        _G['\u{83dc}\u{5355}']['\u{64e6}\u{53bb}\u{7684}\u{4e1c}\u{897f}'] = p158

        if p158 == 'Plank' then
            _G['\u{83dc}\u{5355}']['\u{64e6}\u{53bb}\u{7684}\u{4e1c}\u{897f}'] = 'TreeClass'
        end
    end)
    _Wipe:Button('Wipe', function()
        _G['\u{64e6}\u{9664}\u{9009}\u{62e9}\u{7684}\u{7269}\u{54c1}']()
    end)

    _G['\u{70b9}\u{51fb}\u{5220}\u{9664}\u{7269}\u{54c1}'] = nil

    _Wipe:Toggle('Click to Delete', false, function(p159)
        if p159 then
            _G['\u{70b9}\u{51fb}\u{5220}\u{9664}\u{7269}\u{54c1}'] = _G['\u{9f20}\u{6807}'].Button1Down:Connect(function()
                if _G['\u{9f20}\u{6807}'].Target.Parent:FindFirstChild('Owner') and _G['\u{9f20}\u{6807}'].Target.Parent.Parent == game.Workspace.PlayerModels and tostring(_G['\u{9f20}\u{6807}'].Target.Parent:FindFirstChild('Owner').Value) == _G['\u{83dc}\u{5355}']['\u{64e6}\u{53bb}\u{7684}\u{73a9}\u{5bb6}'] then
                    game.ReplicatedStorage.Interaction.DestroyStructure:FireServer(_G['\u{9f20}\u{6807}'].Target.Parent)

                    repeat
                        task.wait()
                    until _G['\u{9f20}\u{6807}'].Target.Parent == nil
                end
            end)
        else
            _G['\u{70b9}\u{51fb}\u{5220}\u{9664}\u{7269}\u{54c1}']:Disconnect()

            _G['\u{70b9}\u{51fb}\u{5220}\u{9664}\u{7269}\u{54c1}'] = nil
        end
    end)

    _G['\u{83b7}\u{5f97}\u{5546}\u{573a}id'] = {
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
    _G['\u{627e}\u{5230}\u{7269}\u{54c1}'] = function(p160)
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
                                    v369 = _G['\u{83b7}\u{5f97}\u{5546}\u{573a}id'].FurnitureStore
                                    v370 = game.Workspace.Stores.FurnitureStore.Counter.CFrame + Vector3.new(0, 0.6, 0)
                                elseif v379.BoxItemName.Value == 'Sawmill' or v379.BoxItemName.Value == 'Sawmill2' then
                                    v369 = _G['\u{83b7}\u{5f97}\u{5546}\u{573a}id'].WoodRus
                                    v370 = game.Workspace.Stores.WoodRUs.Counter.CFrame + Vector3.new(0, 0.6, 0)
                                elseif v379.BoxItemName.Value == 'Trailer2' or v379.BoxItemName.Value == 'UtilityTruck2' then
                                    v369 = _G['\u{83b7}\u{5f97}\u{5546}\u{573a}id'].CarStore
                                    v370 = game.Workspace.Stores.CarStore.Counter.CFrame + Vector3.new(0, 0.6, 0)
                                elseif v379.BoxItemName.Value == 'CanOfWorms' or v379.BoxItemName.Value == 'Dynamite' then
                                    v369 = _G['\u{83b7}\u{5f97}\u{5546}\u{573a}id'].ShackShop
                                    v370 = game.Workspace.Stores.ShackShop.Counter.CFrame + Vector3.new(0, 0.6, 0)
                                elseif v379.BoxItemName.Value == 'Painting1' or v379.BoxItemName.Value == 'Painting2' then
                                    v369 = _G['\u{83b7}\u{5f97}\u{5546}\u{573a}id'].FineArt
                                    v370 = game.Workspace.Stores.FineArt.Counter.CFrame + Vector3.new(0, 0.6, 0)
                                elseif v379.BoxItemName.Value == 'GateXOR' or v379.BoxItemName.Value == 'NeonWireOrange' then
                                    v369 = _G['\u{83b7}\u{5f97}\u{5546}\u{573a}id'].LogicStore
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
    _G['\u{4f20}\u{9001}\u{7269}\u{54c1}'] = nil
    _G['\u{4e70}'] = function(p161)
        local v380 = _G
        local v381 = _G
        local v382 = _G
        local v383, v384, v385 = _G['\u{627e}\u{5230}\u{7269}\u{54c1}'](p161)

        v382['\u{6536}\u{94f6}\u{53f0}'] = v385
        v381['\u{5546}\u{4eba}id'] = v384
        v380['\u{7269}\u{54c1}'] = v383

        if _G['\u{7269}\u{54c1}'] == nil then
            _G['\u{63d0}\u{9192}']('Wait for the item to refresh')

            while _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}\u{505c}\u{6b62}'] ~= true do
                task.wait()

                local v386 = _G
                local v387 = _G
                local v388 = _G
                local v389, v390, v391 = _G['\u{627e}\u{5230}\u{7269}\u{54c1}'](p161)

                v388['\u{6536}\u{94f6}\u{53f0}'] = v391
                v387['\u{5546}\u{4eba}id'] = v390
                v386['\u{7269}\u{54c1}'] = v389

                if _G['\u{7269}\u{54c1}'] ~= nil then
                    break
                end
            end
        end

        _G['\u{4f20}\u{9001}'](_G['\u{7269}\u{54c1}'].Main.CFrame - Vector3.new(1, -3, 1))
        u49(_G['\u{7269}\u{54c1}'], _G['\u{6536}\u{94f6}\u{53f0}'])
        spawn(function()
            _G['\u{4f20}\u{9001}'](_G['\u{6536}\u{94f6}\u{53f0}'] + Vector3.new(5, 0, 5))
        end)
        wait()

        repeat
            game.ReplicatedStorage.NPCDialog.PlayerChatted:InvokeServer(_G['\u{5546}\u{4eba}id'], 'ConfirmPurchase')
            wait()
        until _G['\u{7269}\u{54c1}'].Owner.Value == _G['\u{81ea}\u{5df1}'] and _G['\u{7269}\u{54c1}'].Parent ~= 'ShopItem' and not _G['\u{7269}\u{54c1}']:FindFirstChild('BoxItemName')
    end
    _G['\u{4f20}\u{9001}\u{7269}\u{54c1}'] = nil
    _G['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}v2'] = function(p162, p163, p164, _)
        _G['\u{81ea}\u{52a8}\u{6570}\u{91cf}'] = p163

        if p164 then
            _G['\u{81ea}\u{52a8}\u{6570}\u{91cf}'] = 9000000000
        end
        if p164 == false and _G['\u{5546}\u{54c1}\u{4ef7}\u{683c}'](p162, p163) > _G['\u{81ea}\u{5df1}'].leaderstats.Money.Value then
            return _G['\u{63d0}\u{9192}']('you not have enough money')
        else
            local u69 = false

            _G['\u{4f20}\u{9001}\u{7269}\u{54c1}'] = game.Workspace.PlayerModels.ChildAdded:Connect(function(p165)
                p165:WaitForChild('Owner', 60)

                if p165.Owner.Value == _G['\u{81ea}\u{5df1}'] then
                    pcall(function()
                        for _ = 1, 15 do
                            game:GetService('ReplicatedStorage').Interaction.ClientIsDragging:FireServer(p165)
                            p165:PivotTo(_G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}\u{7684}\u{5730}\u{70b9}'])
                            game:GetService('RunService').Stepped:wait()
                        end

                        u69 = true
                    end)
                end
            end)
            _G['\u{6570}\u{91cf}'] = 0

            for _ = 1, _G['\u{81ea}\u{52a8}\u{6570}\u{91cf}']do
                u69 = false

                if _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}\u{505c}\u{6b62}'] ~= true then
                    _G['\u{4e70}'](p162)

                    _G['\u{6570}\u{91cf}'] = _G['\u{6570}\u{91cf}'] + 1
                    _G['\u{81ea}\u{5df1}'].PlayerGui.MoneyDisplayGui.Text.Text = 'Autobuying:' .. tostring(_G['\u{6570}\u{91cf}']) .. '/' .. tostring(p163)

                    repeat
                        task.wait()
                    until u69

                    task.wait()
                end
            end

            wait()

            _G['\u{81ea}\u{5df1}'].PlayerGui.MoneyDisplayGui.Text.Text = tostring(_G['\u{81ea}\u{5df1}'].leaderstats.Money.Value)

            spawn(function()
                pcall(function()
                    _G['\u{4f20}\u{9001}\u{7269}\u{54c1}']:Disconnect()

                    _G['\u{4f20}\u{9001}\u{7269}\u{54c1}'] = nil
                end)
            end)

            return
        end
    end
    _G['\u{83b7}\u{5f97}\u{5546}\u{54c1}\u{540d}\u{5b57}'] = function()
        _G['\u{5168}\u{90e8}\u{5546}\u{54c1}'] = {}

        local v392 = next
        local v393, v394 = game.Workspace.Stores:GetChildren()

        for _, v395 in v392, v393, v394 do
            if v395.Name == 'ShopItems' then
                if v395:FindFirstChild('Box') then
                    local v396 = next
                    local v397, v398 = v395:GetChildren()

                    for _, v399 in v396, v397, v398 do
                        if not table.find(_G['\u{5168}\u{90e8}\u{5546}\u{54c1}'], v399.BoxItemName.Value) then
                            table.insert(_G['\u{5168}\u{90e8}\u{5546}\u{54c1}'], v399.BoxItemName.Value)
                        end
                    end
                end
            end
        end

        return _G['\u{5168}\u{90e8}\u{5546}\u{54c1}']
    end
    _G['\u{5546}\u{54c1}\u{4ef7}\u{683c}'] = function(p166, p167)
        _G['\u{4ef7}\u{683c}'] = 0

        local v400 = next
        local v401, v402 = game.ReplicatedStorage.ClientItemInfo:GetChildren()

        for _, v403 in v400, v401, v402 do
            if v403.Name == p166 then
                if v403:FindFirstChild('Price') then
                    _G['\u{4ef7}\u{683c}'] = v403.Price.Value * p167
                end
            end
        end

        return _G['\u{4ef7}\u{683c}']
    end
    _G['\u{5347}\u{7ea7}\u{7269}\u{54c1}\u{540d}\u{5b57}'] = function()
        _G['\u{6240}\u{6709}\u{7269}\u{54c1}'] = _G['\u{83b7}\u{5f97}\u{5546}\u{54c1}\u{540d}\u{5b57}']()
        _G['\u{5546}\u{54c1}\u{7684}\u{4ef7}\u{683c}'] = {
            'Rukiryaxe--' .. _G['\u{5546}\u{54c1}\u{4ef7}\u{683c}']('BagOfSand', 1) + _G['\u{5546}\u{54c1}\u{4ef7}\u{683c}']('CanOfWorms', 1) + _G['\u{5546}\u{54c1}\u{4ef7}\u{683c}']('LightBulb', 1),
        }

        for _, v404 in next, _G['\u{6240}\u{6709}\u{7269}\u{54c1}']do
            table.insert(_G['\u{5546}\u{54c1}\u{7684}\u{4ef7}\u{683c}'], v404 .. '--' .. _G['\u{5546}\u{54c1}\u{4ef7}\u{683c}'](v404, 1))
        end

        return _G['\u{5546}\u{54c1}\u{7684}\u{4ef7}\u{683c}']
    end
    _G['\u{83b7}\u{5f97}\u{6240}\u{6709}\u{5546}\u{5e97}\u{540d}\u{5b57}'] = function()
        _G['\u{5546}\u{5e97}\u{540d}\u{5b57}'] = {
            'All',
        }

        local v405 = next
        local v406, v407 = game.Workspace.Stores:GetChildren()

        for _, v408 in v405, v406, v407 do
            if v408:FindFirstChild('Counter') then
                table.insert(_G['\u{5546}\u{5e97}\u{540d}\u{5b57}'], v408.Name)
            end
        end

        return _G['\u{5546}\u{5e97}\u{540d}\u{5b57}']
    end
    _G['\u{83b7}\u{5f97}\u{5546}\u{5e97}\u{7269}\u{54c1}'] = function(p168)
        if p168 == 'All' then
            return _G['\u{5347}\u{7ea7}\u{7269}\u{54c1}\u{540d}\u{5b57}']()
        end

        _G['\u{540d}\u{5b57}'] = {}

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
                                    if not table.find(_G['\u{540d}\u{5b57}'], v420.BoxItemName.Value) then
                                        table.insert(_G['\u{540d}\u{5b57}'], v420.BoxItemName.Value)
                                    end
                                end
                            end
                        elseif v416.BoxItemName.Value == 'Sawmill' or v416.BoxItemName.Value == 'Sawmill2' then
                            if p168 == 'WoodRUs' then
                                local v421 = next
                                local v422, v423 = v412:GetChildren()

                                for _, v424 in v421, v422, v423 do
                                    if not table.find(_G['\u{540d}\u{5b57}'], v424.BoxItemName.Value) then
                                        table.insert(_G['\u{540d}\u{5b57}'], v424.BoxItemName.Value)
                                    end
                                end
                            end
                        elseif v416.BoxItemName.Value == 'Trailer2' or v416.BoxItemName.Value == 'UtilityTruck2' then
                            if p168 == 'CarStore' then
                                local v425 = next
                                local v426, v427 = v412:GetChildren()

                                for _, v428 in v425, v426, v427 do
                                    if not table.find(_G['\u{540d}\u{5b57}'], v428.BoxItemName.Value) then
                                        table.insert(_G['\u{540d}\u{5b57}'], v428.BoxItemName.Value)
                                    end
                                end
                            end
                        elseif v416.BoxItemName.Value == 'CanOfWorms' or v416.BoxItemName.Value == 'Dynamite' then
                            if p168 == 'ShackShop' then
                                local v429 = next
                                local v430, v431 = v412:GetChildren()

                                for _, v432 in v429, v430, v431 do
                                    if not table.find(_G['\u{540d}\u{5b57}'], v432.BoxItemName.Value) then
                                        table.insert(_G['\u{540d}\u{5b57}'], v432.BoxItemName.Value)
                                    end
                                end
                            end
                        elseif v416.BoxItemName.Value == 'Painting1' or v416.BoxItemName.Value == 'Painting2' then
                            if p168 == 'FineArt' then
                                local v433 = next
                                local v434, v435 = v412:GetChildren()

                                for _, v436 in v433, v434, v435 do
                                    if not table.find(_G['\u{540d}\u{5b57}'], v436.BoxItemName.Value) then
                                        table.insert(_G['\u{540d}\u{5b57}'], v436.BoxItemName.Value)
                                    end
                                end
                            end
                        elseif v416.BoxItemName.Value == 'GateXOR' or v416.BoxItemName.Value == 'NeonWireOrange' then
                            if p168 == 'LogicStore' then
                                local v437 = next
                                local v438, v439 = v412:GetChildren()

                                for _, v440 in v437, v438, v439 do
                                    if not table.find(_G['\u{540d}\u{5b57}'], v440.BoxItemName.Value) then
                                        table.insert(_G['\u{540d}\u{5b57}'], v440.BoxItemName.Value)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end

        return _G['\u{540d}\u{5b57}']
    end
    _G['\u{5347}\u{7ea7}\u{9009}\u{62e9}\u{7684}\u{7269}\u{54c1}\u{540d}\u{5b57}'] = function(p169)
        _G['\u{7269}\u{54c1}'] = {}

        if p169 == 'All' then
            return _G['\u{83b7}\u{5f97}\u{5546}\u{5e97}\u{7269}\u{54c1}'](p169)
        end

        local v441 = _G['\u{83b7}\u{5f97}\u{5546}\u{5e97}\u{7269}\u{54c1}'](p169)

        for _, v442 in next, v441 do
            table.insert(_G['\u{7269}\u{54c1}'], v442 .. '--' .. _G['\u{5546}\u{54c1}\u{4ef7}\u{683c}'](v442, 1))
        end

        return _G['\u{7269}\u{54c1}']
    end

    local _AutoBuy = v54:CreateTab('Auto Buy ', '6031289461')
    local _AutoBuy2 = _AutoBuy:Section('Auto Buy')

    _AutoBuy2:DropDown('Select Store', _G['\u{83b7}\u{5f97}\u{6240}\u{6709}\u{5546}\u{5e97}\u{540d}\u{5b57}'](), false, false, function(p170)
        _G['\u{83dc}\u{5355}']['\u{5546}\u{5e97}\u{540d}\u{5b57}'] = p170

        _G['\u{7269}\u{54c1}\u{9009}\u{62e9}']:SetOptions(_G['\u{5347}\u{7ea7}\u{9009}\u{62e9}\u{7684}\u{7269}\u{54c1}\u{540d}\u{5b57}'](_G['\u{83dc}\u{5355}']['\u{5546}\u{5e97}\u{540d}\u{5b57}']))
    end)

    _G['\u{7269}\u{54c1}\u{9009}\u{62e9}'] = _AutoBuy2:DropDown('Select Item', _G['\u{5347}\u{7ea7}\u{9009}\u{62e9}\u{7684}\u{7269}\u{54c1}\u{540d}\u{5b57}'](_G['\u{83dc}\u{5355}']['\u{5546}\u{5e97}\u{540d}\u{5b57}']), false, false, function(p171)
        _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}\u{7684}\u{7269}\u{54c1}'] = p171
    end)

    _AutoBuy2:TextBox('Amount', '1', function(p172)
        _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}\u{7684}\u{6570}\u{91cf}'] = tonumber(p172)
    end)
    _AutoBuy2:Button('Buy', function()
        _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}\u{505c}\u{6b62}'] = false
        _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}\u{7684}\u{5730}\u{70b9}'] = _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}'].CFrame

        if string.split(_G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}\u{7684}\u{7269}\u{54c1}'], '--')[1] ~= 'Rukiryaxe' then
            _G['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}v2'](string.split(_G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}\u{7684}\u{7269}\u{54c1}'], '--')[1], _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}\u{7684}\u{6570}\u{91cf}'])
            _G['\u{4f20}\u{9001}'](_G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}\u{7684}\u{5730}\u{70b9}'])
        else
            local _ = _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}'].CFrame

            if _G['\u{5546}\u{54c1}\u{4ef7}\u{683c}']('BagOfSand', 1) + _G['\u{5546}\u{54c1}\u{4ef7}\u{683c}']('CanOfWorms', 1) + _G['\u{5546}\u{54c1}\u{4ef7}\u{683c}']('LightBulb', 1) <= _G['\u{81ea}\u{5df1}'].leaderstats.Money.Value then
                _G['\u{81ea}\u{52a8}\u{6253}\u{5f00}\u{76d2}\u{5b50}'] = game.Workspace.PlayerModels.ChildAdded:Connect(function(p173)
                    p173:WaitForChild('Owner', 60)
                    wait(1)

                    if tostring(p173.Owner.Value) == tostring(_G['\u{81ea}\u{5df1}']) and p173:FindFirstChild('PurchasedBoxItemName') and (tostring(p173.PurchasedBoxItemName.Value) == 'BagOfSand' or tostring(p173.PurchasedBoxItemName.Value) == 'CanOfWorms' or tostring(p173.PurchasedBoxItemName.Value) == 'LightBulb') then
                        game:GetService('ReplicatedStorage').Interaction.ClientInteracted:FireServer(p173, 'Open box')
                    end
                end)
                _G['\u{62ff}\u{65a7}\u{5934}'] = nil
                _G['\u{62ff}\u{65a7}\u{5934}'] = game.Workspace.PlayerModels.ChildAdded:Connect(function(p174)
                    local _Main2 = p174:WaitForChild('Main', 60)
                    local _CFrame10 = _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}'].CFrame

                    if _Main2:FindFirstChild('Mesh') and _Main2.Mesh.TextureId == 'rbxassetid://273892918' then
                        repeat
                            wait()
                        until p174:FindFirstChild('ToolName')

                        if p174.Owner.Value == nil then
                            _G['\u{63d0}\u{9192}']('Calming Rukiryaxe')
                            _G['\u{4f20}\u{9001}'](p174.Main.CFrame)

                            repeat
                                task.wait()
                                _G['\u{62c9}\u{4e1c}\u{897f}']:FireServer(p174)
                                game.ReplicatedStorage.Interaction.ClientInteracted:FireServer(p174, 'Pick up tool')
                            until tostring(p174.Parent) ~= 'PlayerModels'
                        end

                        _G['\u{4f20}\u{9001}'](_CFrame10)
                        pcall(function()
                            _G['\u{81ea}\u{52a8}\u{6253}\u{5f00}\u{76d2}\u{5b50}']:Disconnect()

                            _G['\u{81ea}\u{52a8}\u{6253}\u{5f00}\u{76d2}\u{5b50}'] = nil

                            _G['\u{62ff}\u{65a7}\u{5934}']:Disconnect()

                            _G['\u{62ff}\u{65a7}\u{5934}'] = nil
                        end)
                    end
                end)
                _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}\u{7684}\u{5730}\u{70b9}'] = CFrame.new(319, 43, 1914)

                _G['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}v2']('BagOfSand', 1)
                wait(1)

                _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}\u{7684}\u{5730}\u{70b9}'] = CFrame.new(317, 43, 1918)

                _G['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}v2']('CanOfWorms', 1)
                wait(1)

                _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}\u{7684}\u{5730}\u{70b9}'] = CFrame.new(322, 43, 1916)

                _G['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}v2']('LightBulb', 1)
            else
                return _G['\u{63d0}\u{9192}']('you not have enough money')
            end
        end

        return
    end)
    _AutoBuy2:Button('Abort', function()
        _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}\u{505c}\u{6b62}'] = true
    end)
    _AutoBuy2:Toggle('Loop Auto Buy', false, function(p175)
        if p175 then
            _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}\u{505c}\u{6b62}'] = false
            _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}\u{7684}\u{5730}\u{70b9}'] = _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}'].CFrame

            _G['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}v2'](string.split(_G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}\u{7684}\u{7269}\u{54c1}'], '--')[1], 0, true)
            _G['\u{4f20}\u{9001}'](_G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}\u{7684}\u{5730}\u{70b9}'])
        else
            _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}\u{505c}\u{6b62}'] = true
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

            _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}\u{505c}\u{6b62}'] = false

            local v444 = next
            local v445, v446 = game.ReplicatedStorage.ClientItemInfo:GetChildren()

            for _, v447 in v444, v445, v446 do
                if v447:FindFirstChild('WoodCost') then
                    if not _G['\u{81ea}\u{5df1}'].PlayerBlueprints.Blueprints:FindFirstChild(v447.Name) then
                        _G['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}v2'](v447.Name, 1)
                    end
                end
            end

            wait(1)
            v443:Disconnect()
        else
            _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}\u{505c}\u{6b62}'] = true
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
    _G['\u{5728}\u{6846}\u{5185}'] = function(p178, p179)
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
    _G['\u{6574}\u{7406}\u{9f20}\u{6807}\u{79fb}\u{52a8}'] = nil
    _G['\u{6574}\u{7406}\u{9f20}\u{6807}\u{70b9}\u{51fb}'] = nil

    local u70 = false

    _G['\u{76d2}\u{5b50}\u{4f20}\u{9001}'] = function(p180, p181, p182, p183)
        _G['\u{83dc}\u{5355}']['\u{505c}\u{6b62}\u{6574}\u{7406}'] = false

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
                            if tostring(v456.Owner.Value) == _G['\u{83dc}\u{5355}']['\u{4f20}\u{9001}\u{7684}\u{73a9}\u{5bb6}'] then
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

        if _G['\u{9f20}\u{6807}'].Target.Name ~= 'Ground' and _G['\u{9f20}\u{6807}'].Target.Name ~= 'preview' then
            _Part2.CFrame = CFrame.new(_G['\u{9f20}\u{6807}'].Hit.X + p181 / 2 * u71[1].PrimaryPart.Size.X, _G['\u{9f20}\u{6807}'].Hit.Y + _Part2.Size.Y / 2, _G['\u{9f20}\u{6807}'].Hit.Z + p182 / 2 * u71[1].PrimaryPart.Size.Z)
        end

        _G['\u{6574}\u{7406}\u{9f20}\u{6807}\u{79fb}\u{52a8}'] = _G['\u{9f20}\u{6807}'].Move:Connect(function()
            if _G['\u{9f20}\u{6807}'].Target.Name ~= 'Ground' then
                _Part2.CFrame = CFrame.new(_G['\u{9f20}\u{6807}'].Hit.X + p181 / 2 * u71[1].PrimaryPart.Size.X, _G['\u{9f20}\u{6807}'].Hit.Y + _Part2.Size.Y / 2, _G['\u{9f20}\u{6807}'].Hit.Z + p182 / 2 * u71[1].PrimaryPart.Size.Z)
            end
        end)
        _G['\u{6574}\u{7406}\u{9f20}\u{6807}\u{70b9}\u{51fb}'] = _G['\u{9f20}\u{6807}'].Button1Down:Connect(function()
            pcall(function()
                _G['\u{6574}\u{7406}\u{9f20}\u{6807}\u{79fb}\u{52a8}']:Disconnect()

                _G['\u{6574}\u{7406}\u{9f20}\u{6807}\u{79fb}\u{52a8}'] = nil
            end)
            pcall(function()
                _G['\u{6574}\u{7406}\u{9f20}\u{6807}\u{70b9}\u{51fb}']:Disconnect()

                _G['\u{6574}\u{7406}\u{9f20}\u{6807}\u{70b9}\u{51fb}'] = nil
            end)

            _G['\u{83dc}\u{5355}']['\u{4f20}\u{9001}\u{505c}\u{6b62}'] = false

            local v467 = next
            local v468, v469 = game.Workspace:FindFirstChild('preview'):GetChildren()
            local u72 = 0
            local __continue_break_3 = false

            for _, u73 in v467, v468, v469 do
                if _G['\u{83dc}\u{5355}']['\u{505c}\u{6b62}\u{6574}\u{7406}'] == true then
                    break
                else
                    u72 = u72 + 1

                    if u73:FindFirstChildOfClass('Part') and not u71[u72]:FindFirstChild('ItemName') then
                        pcall(function()
                            u71[u72]:FindFirstChild('SelectionBox'):Destroy()
                        end)

                        _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].PlatformStand = true

                        local _BodyPosition = Instance.new('BodyPosition', u71[u72].PrimaryPart)

                        _BodyPosition.MaxForce = Vector3.new(100, 100, 100)
                        _BodyPosition.Position = u73.PrimaryPart.Position
                        _BodyPosition.P = 100000
                        _BodyPosition.Name = 'freeze2'

                        _G['\u{4f20}\u{9001}'](CFrame.new(u71[u72].PrimaryPart.Position.X, _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}'].Size.Y, u71[u72].PrimaryPart.Position.Z) + Vector3.new(2, 1, 2))
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
            _G['\u{83dc}\u{5355}']['\u{505c}\u{6b62}\u{6574}\u{7406}'] = false
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
                                if tostring(v474.Owner.Value) == _G['\u{83dc}\u{5355}']['\u{4f20}\u{9001}\u{7684}\u{73a9}\u{5bb6}'] then
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

            _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].PlatformStand = false
        end)
    end

    local _Items = v54:CreateTab('Items', '6035030083')
    local _Position = _Items:Section('Position')

    _Position:DropDown('Select the player', {}, true, false, function(p184)
        _G['\u{83dc}\u{5355}']['\u{4f20}\u{9001}\u{7684}\u{73a9}\u{5bb6}'] = p184
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
        _Part3.CFrame = _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}'].CFrame
        _Part3.Material = Enum.Material.Marble
        _Part3.Name = 'darkx'
    end)
    _Position:Button('Delete Position', function()
        pcall(function()
            game.Workspace.darkx:Destroy()
        end)
    end)

    local _selectItem = _Items:Section('select Item')

    _G['\u{70b9}\u{51fb}\u{9009}\u{62e9}\u{7269}\u{54c1}'] = nil

    _selectItem:Toggle('Click To Select', false, function(p185)
        if p185 then
            _G['\u{70b9}\u{51fb}\u{9009}\u{62e9}\u{7269}\u{54c1}'] = _G['\u{9f20}\u{6807}'].Button1Up:Connect(function()
                local _Target2 = _G['\u{9f20}\u{6807}'].Target

                if _Target2.Parent:FindFirstChild('Owner') and tostring(_Target2.Parent.Owner.Value) == _G['\u{83dc}\u{5355}']['\u{4f20}\u{9001}\u{7684}\u{73a9}\u{5bb6}'] and _Target2.Parent:FindFirstAncestor('PlayerModels') then
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
            _G['\u{70b9}\u{51fb}\u{9009}\u{62e9}\u{7269}\u{54c1}']:Disconnect()

            _G['\u{70b9}\u{51fb}\u{9009}\u{62e9}\u{7269}\u{54c1}'] = nil
        end
    end)
    _selectItem:Toggle('Group Select', false, function(p186)
        if p186 then
            _G['\u{70b9}\u{51fb}\u{9009}\u{62e9}\u{540c}\u{7c7b}\u{578b}\u{7269}\u{54c1}'] = _G['\u{9f20}\u{6807}'].Button1Up:Connect(function()
                local _Target3 = _G['\u{9f20}\u{6807}'].Target

                if _Target3.Parent:FindFirstChild('Owner') and tostring(_Target3.Parent.Owner.Value) == _G['\u{83dc}\u{5355}']['\u{4f20}\u{9001}\u{7684}\u{73a9}\u{5bb6}'] and _Target3.Parent:FindFirstAncestor('PlayerModels') then
                    local v475 = next
                    local v476, v477 = game:GetService('Workspace').PlayerModels:GetChildren()

                    for _, v478 in v475, v476, v477 do
                        if v478:FindFirstChild('Owner') then
                            if tostring(v478.Owner.Value) == _G['\u{83dc}\u{5355}']['\u{4f20}\u{9001}\u{7684}\u{73a9}\u{5bb6}'] then
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
            _G['\u{70b9}\u{51fb}\u{9009}\u{62e9}\u{540c}\u{7c7b}\u{578b}\u{7269}\u{54c1}']:Disconnect()

            _G['\u{70b9}\u{51fb}\u{9009}\u{62e9}\u{540c}\u{7c7b}\u{578b}\u{7269}\u{54c1}'] = nil
        end
    end)
    _selectItem:Toggle('Lasso Tool', false, function(p187)
        if p187 then
            _G['\u{83dc}\u{5355}']['\u{7269}\u{54c1}\u{6846}'] = game:GetService('UserInputService').InputBegan:Connect(function(p188)
                if p188.UserInputType == Enum.UserInputType.MouseButton1 then
                    _Frame20.Visible = true
                    _Frame20.Position = UDim2.new(0, _G['\u{9f20}\u{6807}'].X, 0, _G['\u{9f20}\u{6807}'].Y)

                    while game:GetService('UserInputService'):IsMouseButtonPressed(Enum.UserInputType.MouseButton1) or game:GetService('UserInputService'):IsMouseButtonPressed(Enum.UserInputType.MouseButton1) and game:GetService('UserInputService'):IsMouseButtonPressed(Enum.UserInputType.MouseButton2) do
                        game:GetService('RunService').RenderStepped:wait()
                        task.wait()

                        _Frame20.Size = UDim2.new(0, _G['\u{9f20}\u{6807}'].X, 0, _G['\u{9f20}\u{6807}'].Y) - _Frame20.Position

                        for _, v479 in pairs(workspace.PlayerModels:GetChildren())do
                            if v479:FindFirstChild('Owner') and tostring(v479.Owner.Value) == _G['\u{83dc}\u{5355}']['\u{4f20}\u{9001}\u{7684}\u{73a9}\u{5bb6}'] and v479:FindFirstChild('WoodSection') then
                                local v480, v481 = game.Workspace.CurrentCamera:WorldToScreenPoint(v479.WoodSection.CFrame.p)

                                if v481 and _G['\u{5728}\u{6846}\u{5185}'](v480, _Frame20) and not v479:FindFirstChild('SelectionBox') then
                                    local _SelectionBox6 = Instance.new('SelectionBox', v479)

                                    _SelectionBox6.LineThickness = 0.05
                                    _SelectionBox6.Adornee = v479
                                end
                            end
                            if v479:FindFirstChild('Owner') and tostring(v479.Owner.Value) == _G['\u{83dc}\u{5355}']['\u{4f20}\u{9001}\u{7684}\u{73a9}\u{5bb6}'] and v479:FindFirstChild('DraggableItem') or v479:FindFirstChild('PurchasedBoxItemName') then
                                local v482, v483 = game.Workspace.CurrentCamera:WorldToScreenPoint(v479.Main.CFrame.p)

                                if v483 then
                                    if _G['\u{5728}\u{6846}\u{5185}'](v482, _Frame20) then
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

            _G['\u{83dc}\u{5355}']['\u{7269}\u{54c1}\u{6846}']:Disconnect()

            _G['\u{83dc}\u{5355}']['\u{7269}\u{54c1}\u{6846}'] = nil
        end
    end)
    _selectItem:Button('Deselect All Item', function()
        local v484 = next
        local v485, v486 = game:GetService('Workspace').PlayerModels:GetChildren()

        for _, v487 in v484, v485, v486 do
            if v487:FindFirstChild('Owner') then
                if tostring(v487.Owner.Value) == _G['\u{83dc}\u{5355}']['\u{4f20}\u{9001}\u{7684}\u{73a9}\u{5bb6}'] then
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
                if tostring(v491.Owner.Value) == _G['\u{83dc}\u{5355}']['\u{4f20}\u{9001}\u{7684}\u{73a9}\u{5bb6}'] then
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
            _G['\u{4f20}\u{9001}\u{7684}\u{4e1c}\u{897f}'] = {}

            local v492 = next
            local v493, v494 = game:GetService('Workspace').PlayerModels:GetChildren()

            for _, v495 in v492, v493, v494 do
                if v495:FindFirstChild('Owner') then
                    if tostring(v495.Owner.Value) == _G['\u{83dc}\u{5355}']['\u{4f20}\u{9001}\u{7684}\u{73a9}\u{5bb6}'] then
                        if v495:FindFirstChild('SelectionBox') then
                            if not v495.PrimaryPart then
                                v495.PrimaryPart = v495:FindFirstChildOfClass('Part')
                            end

                            table.insert(_G['\u{4f20}\u{9001}\u{7684}\u{4e1c}\u{897f}'], v495)
                        end
                    end
                end
            end

            _G['\u{83dc}\u{5355}']['\u{4f20}\u{9001}\u{505c}\u{6b62}'] = false

            local _CFrame11 = _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}'].CFrame
            local __continue_break_4 = false

            for _, u74 in next, _G['\u{4f20}\u{9001}\u{7684}\u{4e1c}\u{897f}']do
                if _G['\u{83dc}\u{5355}']['\u{4f20}\u{9001}\u{505c}\u{6b62}'] ~= true then
                    u74:FindFirstChild('SelectionBox'):Destroy()

                    u74.PrimaryPart.Anchored = false

                    if u74:FindFirstChildOfClass('Part') and u74:FindFirstChild('WoodSection') or u74:FindFirstChild('PurchasedBoxItemName') then
                        u74.PrimaryPart.Anchored = false

                        _G['\u{4f20}\u{9001}'](CFrame.new(u74.PrimaryPart.Position.X, _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}'].Position.Y, u74.PrimaryPart.Position.Z) + Vector3.new(1, 0, 0))

                        u74.PrimaryPart.Velocity = Vector3.new(0, 0, 0)
                        u74.PrimaryPart.RotVelocity = Vector3.new(0, 0, 0)

                        if u74:FindFirstChild('WoodSection') then
                            if _G['\u{6728}\u{5934}\u{7ad6}\u{7740}\u{4f20}\u{9001}'] then
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

            _G['\u{4f20}\u{9001}'](_CFrame11)

            _G['\u{83dc}\u{5355}']['\u{98de}\u{884c}'] = false

            spawn(function()
                _G['\u{98de}\u{884c}'](false)
            end)
            _G['\u{7a7f}\u{5899}'](false)

            _G['\u{83dc}\u{5355}']['\u{98de}\u{884c}\u{901f}\u{5ea6}'] = _G['\u{65e7}\u{7684}\u{98de}\u{884c}\u{901f}\u{5ea6}']

            return
        else
            return _G['\u{63d0}\u{9192}']('Please Set Position')
        end
    end)
    _Item:Toggle('Standing Wood', false, function(p189)
        _G['\u{83dc}\u{5355}']['\u{6728}\u{5934}\u{7ad6}\u{7740}\u{4f20}\u{9001}'] = p189
    end)
    _Item:Button('Abort', function()
        _G['\u{83dc}\u{5355}']['\u{4f20}\u{9001}\u{505c}\u{6b62}'] = true
    end)

    local _BoxSort = _Items:Section('Box Sort')

    _BoxSort:TextBox('X', '5', function(p190)
        _G['\u{83dc}\u{5355}']['\u{6574}\u{7406}\u{7269}\u{54c1}X'] = tonumber(p190)
    end)
    _BoxSort:TextBox('Z', '5', function(p191)
        _G['\u{83dc}\u{5355}']['\u{6574}\u{7406}\u{7269}\u{54c1}Z'] = tonumber(p191)
    end)
    _BoxSort:Button('Start', function()
        local v497 = {}
        local v498 = {}
        local v499 = {}

        if _G['\u{83dc}\u{5355}']['\u{6b63}\u{5728}\u{6574}\u{7406}\u{7269}\u{54c1}'] ~= true then
            _G['\u{83dc}\u{5355}']['\u{6b63}\u{5728}\u{6574}\u{7406}\u{7269}\u{54c1}'] = true

            local v500 = next
            local v501, v502 = game:GetService('Workspace').PlayerModels:GetChildren()

            for _, v503 in v500, v501, v502 do
                if v503:FindFirstChild('Owner') then
                    if tostring(v503.Owner.Value) == _G['\u{83dc}\u{5355}']['\u{4f20}\u{9001}\u{7684}\u{73a9}\u{5bb6}'] then
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
                _G['\u{76d2}\u{5b50}\u{4f20}\u{9001}'](v504, _G['\u{83dc}\u{5355}']['\u{6574}\u{7406}\u{7269}\u{54c1}X'], _G['\u{83dc}\u{5355}']['\u{6574}\u{7406}\u{7269}\u{54c1}Z'], 'PurchasedBoxItemName')
                task.wait()
            end
            for _, v505 in next, v498 do
                _G['\u{76d2}\u{5b50}\u{4f20}\u{9001}'](v505, _G['\u{83dc}\u{5355}']['\u{6574}\u{7406}\u{7269}\u{54c1}X'], _G['\u{83dc}\u{5355}']['\u{6574}\u{7406}\u{7269}\u{54c1}Z'], 'ItemName')
                task.wait()
            end
            for _, v506 in next, v499 do
                _G['\u{76d2}\u{5b50}\u{4f20}\u{9001}'](v506, _G['\u{83dc}\u{5355}']['\u{6574}\u{7406}\u{7269}\u{54c1}X'], _G['\u{83dc}\u{5355}']['\u{6574}\u{7406}\u{7269}\u{54c1}Z'], 'TreeClass')
                task.wait()
            end

            _G['\u{83dc}\u{5355}']['\u{6b63}\u{5728}\u{6574}\u{7406}\u{7269}\u{54c1}'] = false

            return
        else
            return _G['\u{63d0}\u{9192}']('you are using this feature')
        end
    end)
    _BoxSort:Button('Abort', function()
        _G['\u{83dc}\u{5355}']['\u{505c}\u{6b62}\u{6574}\u{7406}'] = true
        u70 = true
        _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].PlatformStand = false

        game:GetService('Workspace'):FindFirstChild('preview'):Destroy()
        pcall(function()
            _G['\u{6574}\u{7406}\u{9f20}\u{6807}\u{79fb}\u{52a8}']:Disconnect()

            _G['\u{6574}\u{7406}\u{9f20}\u{6807}\u{79fb}\u{52a8}'] = nil
        end)

        _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].PlatformStand = false

        pcall(function()
            _G['\u{83dc}\u{5355}']['\u{6b63}\u{5728}\u{6574}\u{7406}\u{7269}\u{54c1}'] = false
            game:GetService('Workspace').CurrentCamera.CameraSubject = _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}']
        end)
        _G['\u{4f20}\u{9001}'](oldpos)

        _G['\u{83dc}\u{5355}']['\u{98de}\u{884c}'] = false

        spawn(function()
            _G['\u{98de}\u{884c}'](false)
        end)
        _G['\u{7a7f}\u{5899}'](false)

        _G['\u{83dc}\u{5355}']['\u{98de}\u{884c}\u{901f}\u{5ea6}'] = _G['\u{65e7}\u{7684}\u{98de}\u{884c}\u{901f}\u{5ea6}']
    end)

    _G['\u{4fee}\u{6539}\u{6c7d}\u{8f66}\u{7684}\u{5c5e}\u{6027}'] = function(p192, p193)
        local v507 = next
        local v508, v509 = game:GetService('Workspace').PlayerModels:GetChildren()

        for _, v510 in v507, v508, v509 do
            if v510:FindFirstChild('Owner') then
                if v510.Owner.Value == _G['\u{81ea}\u{5df1}'] then
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
        _G['\u{4fee}\u{6539}\u{6c7d}\u{8f66}\u{7684}\u{5c5e}\u{6027}'](p194, 'MaxSpeed')
    end)
    _Vehicle2:Slider('Steer Angle', 0.7, 0.7, 5, true, function(p195)
        _G['\u{4fee}\u{6539}\u{6c7d}\u{8f66}\u{7684}\u{5c5e}\u{6027}'](p195, 'SteerAngle')
    end)
    _Vehicle2:Button('Flip Vehicle', function()
        if _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].SeatPart or _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].SeatPart == 'DriveSeat' then
            _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].SeatPart.Parent:PivotTo(_G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].SeatPart.Parent.PrimaryPart.CFrame * CFrame.Angles(math.rad(-180), 0, 0) + Vector3.new(0, 5, 0))

            return
        else
            _G['\u{63d0}\u{9192}']('You need to sit in the vehicles driver seat')

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
        _G['\u{83dc}\u{5355}']['\u{6c7d}\u{8f66}\u{7684}\u{989c}\u{8272}'] = p196
    end)
    _VehicleSpawner:Button('Start Vehicle Spawner', function()
        if _G['\u{83dc}\u{5355}']['\u{6b63}\u{5728}\u{751f}\u{6210}\u{8f66}'] ~= true then
            if _G['\u{83dc}\u{5355}']['\u{6c7d}\u{8f66}\u{7684}\u{989c}\u{8272}'] ~= nil then
                _G['\u{63d0}\u{9192}']('Click a spawn pad')

                _G['\u{83dc}\u{5355}']['\u{505c}\u{6b62}\u{751f}\u{6210}\u{8f66}'] = false
                _G['\u{751f}\u{6210}\u{6210}\u{529f}'] = false
                _G['\u{6c7d}\u{8f66}\u{751f}\u{6210}\u{68c0}\u{6d4b}'] = game:GetService('Workspace').PlayerModels.ChildAdded:connect(function(p197)
                    if p197:WaitForChild('Owner') and (p197.Owner.Value == _G['\u{81ea}\u{5df1}'] and p197:WaitForChild('PaintParts')) and p197.PaintParts:WaitForChild('Part').BrickColor.Name == _G['\u{83dc}\u{5355}']['\u{6c7d}\u{8f66}\u{7684}\u{989c}\u{8272}'] then
                        _G['\u{751f}\u{6210}\u{6210}\u{529f}'] = true
                    end
                end)
                _G['\u{83dc}\u{5355}']['\u{6b63}\u{5728}\u{751f}\u{6210}\u{8f66}'] = true
                _G['\u{9009}\u{62e9}\u{7684}\u{6c7d}\u{8f66}'] = nil

                local v511 = _G['\u{9f20}\u{6807}'].Button1Up:Connect(function()
                    if _G['\u{9f20}\u{6807}'].Target.Parent.Owner.Value == _G['\u{81ea}\u{5df1}'] and _G['\u{9f20}\u{6807}'].Target.Parent.Type.Value == 'Vehicle Spot' then
                        _G['\u{9009}\u{62e9}\u{7684}\u{6c7d}\u{8f66}'] = _G['\u{9f20}\u{6807}'].Target
                    end
                end)

                repeat
                    wait()
                until _G['\u{9009}\u{62e9}\u{7684}\u{6c7d}\u{8f66}'] ~= nil

                while true do
                    if _G['\u{83dc}\u{5355}']['\u{505c}\u{6b62}\u{751f}\u{6210}\u{8f66}'] then
                        _G['\u{63d0}\u{9192}']('Aborted')

                        break
                    end

                    game:GetService('ReplicatedStorage').Interaction.RemoteProxy:FireServer(_G['\u{9009}\u{62e9}\u{7684}\u{6c7d}\u{8f66}'].Parent.ButtonRemote_SpawnButton)
                    task.wait(1)

                    if _G['\u{751f}\u{6210}\u{6210}\u{529f}'] == true then
                        break
                    end
                end

                v511:Disconnect()
                _G['\u{6c7d}\u{8f66}\u{751f}\u{6210}\u{68c0}\u{6d4b}']:Disconnect()

                if not _G['\u{83dc}\u{5355}']['\u{505c}\u{6b62}\u{751f}\u{6210}\u{8f66}'] then
                    _G['\u{63d0}\u{9192}']('Finished spawning vehicle')
                end

                _G['\u{83dc}\u{5355}']['\u{6b63}\u{5728}\u{751f}\u{6210}\u{8f66}'] = false

                return
            else
                return _G['\u{63d0}\u{9192}']('No car color selected')
            end
        else
            return _G['\u{63d0}\u{9192}']('you are using this feature')
        end
    end)
    _VehicleSpawner:Button('Abort', function()
        _G['\u{83dc}\u{5355}']['\u{505c}\u{6b62}\u{751f}\u{6210}\u{8f66}'] = true
    end)

    _G['\u{83b7}\u{5f97}\u{6728}\u{5934}'] = function()
        local v512 = next
        local v513, v514 = game:GetService('Workspace').PlayerModels:GetChildren()

        for _, v515 in v512, v513, v514 do
            if v515:FindFirstChild('Owner') then
                if v515:FindFirstChild('WoodSection') then
                    if tostring(v515.Owner.Value) ~= _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{586b}\u{5145}\u{7684}\u{73a9}\u{5bb6}'] then
                    elseif tostring(v515.TreeClass.Value) ~= _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{586b}\u{5145}\u{7684}\u{6811}'] then
                    else
                        return v515
                    end
                end
            end
        end
    end
    _G['\u{586b}\u{5145}\u{6240}\u{6709}\u{84dd}\u{56fe}'] = function()
        local _CFrame12 = _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}'].CFrame
        local v516 = next
        local v517, v518 = game:GetService('Workspace').PlayerModels:GetChildren()

        for _, v519 in v516, v517, v518 do
            if v519:FindFirstChild('Owner') then
                if v519:FindFirstChild('Main') then
                    if v519:FindFirstChild('Type') then
                        if v519.Type.Value == 'Blueprint' then
                            if v519.Owner.Value == _G['\u{81ea}\u{5df1}'] then
                                local v520 = _G['\u{83b7}\u{5f97}\u{6728}\u{5934}']()

                                _G['\u{4f20}\u{9001}'](v520.WoodSection.CFrame)

                                for _ = 1, 2 do
                                    for _ = 1, 5 do
                                        _G['\u{62c9}\u{4e1c}\u{897f}']:FireServer(v520)
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

        _G['\u{4f20}\u{9001}'](_CFrame12)
    end
    _G['\u{6cb9}\u{6f06}'] = function(p198)
        if _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{586b}\u{5145}\u{7684}\u{6811}'] ~= nil then
            local _CFrame13 = _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}'].CFrame

            _G['\u{84dd}\u{56fe}\u{540d}\u{5b57}'] = p198.ItemName.Value

            if p198:FindFirstChild('MainCFrame') then
                _G['\u{65e7}\u{7684}\u{5730}\u{65b9}'] = p198.MainCFrame.Value
            else
                _G['\u{65e7}\u{7684}\u{5730}\u{65b9}'] = p198.PrimaryPart.CFrame
            end

            _G['\u{6728}\u{5934}\u{5927}\u{5c0f}'] = nil

            local v521 = next
            local v522, v523 = game:GetService('ReplicatedStorage').ClientItemInfo:GetChildren()

            for _, v524 in v521, v522, v523 do
                if v524.Name == _G['\u{84dd}\u{56fe}\u{540d}\u{5b57}'] then
                    local v525 = next
                    local v526, v527 = v524:GetChildren()

                    for _, v528 in v525, v526, v527 do
                        if v528.Name == 'WoodCost' then
                            _G['\u{6728}\u{5934}\u{5927}\u{5c0f}'] = v528.Value
                        end
                    end
                end
            end

            if _G['\u{81ea}\u{5df1}'].SuperBlueprint.Value then
                _G['\u{6728}\u{5934}\u{5927}\u{5c0f}'] = 1
            end

            local v529 = _G
            local v530 = _G
            local v531, v532 = _G['\u{68c0}\u{67e5}\u{65a7}\u{5934}'](tonumber(_G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{586b}\u{5145}\u{7684}\u{6811}']))

            v530['\u{4f24}\u{5bb3}'] = v532
            v529['\u{65a7}\u{5934}'] = v531

            if _G['\u{4f24}\u{5bb3}'] then
                _G['\u{6728}\u{5934}\u{7684}\u{5927}\u{5c0f}'] = nil
                _G['\u{9009}\u{62e9}\u{7684}\u{6728}\u{5934}'] = nil

                local v533 = next
                local v534, v535 = game.Workspace:GetChildren()

                for _, v536 in v533, v534, v535 do
                    if v536.Name == 'TreeRegion' then
                        local v537 = next
                        local v538, v539 = v536:GetChildren()

                        for _, v540 in v537, v538, v539 do
                            if v540:FindFirstChild('WoodSection') then
                                if v540:FindFirstChild('TreeClass') then
                                    if v540:FindFirstChild('TreeClass').Value == _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{586b}\u{5145}\u{7684}\u{6811}'] then
                                        local v541 = next
                                        local v542, v543 = v540:GetChildren()

                                        for _, v544 in v541, v542, v543 do
                                            if v544.Name == 'WoodSection' then
                                                if v544.Size.X * v544.Size.Y * v544.Size.Z > _G['\u{6728}\u{5934}\u{5927}\u{5c0f}'] then
                                                    if #v544.ChildIDs:GetChildren() == 0 then
                                                        if v544.Size.X < 9000000000 then
                                                            _G['\u{6728}\u{5934}\u{7684}\u{5927}\u{5c0f}'] = v544.Size.X
                                                            _G['\u{9009}\u{62e9}\u{7684}\u{6728}\u{5934}'] = v544
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

                if _G['\u{9009}\u{62e9}\u{7684}\u{6728}\u{5934}'] and _G['\u{6728}\u{5934}\u{7684}\u{5927}\u{5c0f}'] then
                    _G['\u{52a0}\u{5165}\u{7684}\u{6728}\u{5934}'] = nil
                    _G['\u{52a0}\u{5165}\u{7684}\u{6811}'] = game.Workspace.LogModels.ChildAdded:connect(function(p199)
                        p199:WaitForChild('Owner')

                        if p199.Owner.Value == _G['\u{81ea}\u{5df1}'] and (p199.TreeClass.Value == _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{586b}\u{5145}\u{7684}\u{6811}'] and p199:FindFirstChild('WoodSection')) then
                            _G['\u{52a0}\u{5165}\u{7684}\u{6728}\u{5934}'] = p199
                        end
                    end)
                    _G['\u{780d}\u{7684}\u{5730}\u{65b9}'] = _G['\u{6728}\u{5934}\u{5927}\u{5c0f}'] / (_G['\u{9009}\u{62e9}\u{7684}\u{6728}\u{5934}'].Size.X * _G['\u{9009}\u{62e9}\u{7684}\u{6728}\u{5934}'].Size.X) + 0.01

                    repeat
                        game['Run Service'].Heartbeat:wait()
                        _G['\u{4f20}\u{9001}'](_G['\u{9009}\u{62e9}\u{7684}\u{6728}\u{5934}'].CFrame + Vector3.new(4, 2, 2))
                        _G['\u{780d}'](_G['\u{9009}\u{62e9}\u{7684}\u{6728}\u{5934}'].Parent.CutEvent, _G['\u{65a7}\u{5934}'], _G['\u{9009}\u{62e9}\u{7684}\u{6728}\u{5934}'].ID.Value, _G['\u{9009}\u{62e9}\u{7684}\u{6728}\u{5934}'].Size.Y - _G['\u{780d}\u{7684}\u{5730}\u{65b9}'], _G['\u{4f24}\u{5bb3}'])
                    until _G['\u{52a0}\u{5165}\u{7684}\u{6728}\u{5934}'] ~= nil

                    pcall(function()
                        _G['\u{52a0}\u{5165}\u{7684}\u{6811}']:Disconnect()

                        _G['\u{52a0}\u{5165}\u{7684}\u{6811}'] = nil
                    end)

                    _G['\u{586b}\u{5145}\u{5b8c}\u{6210}'] = false
                    _G['\u{68c0}\u{6d4b}\u{662f}\u{5426}\u{6210}\u{529f}'] = game.Workspace.PlayerModels.ChildAdded:Connect(function(p200)
                        p200:WaitForChild('Owner')

                        if p200.Owner.Value == _G['\u{81ea}\u{5df1}'] and (p200:FindFirstChild('Type') and p200.Type.Value == 'Structure') and p200:FindFirstChild('BlueprintWoodClass') then
                            game.ReplicatedStorage.PlaceStructure.ClientPlacedStructure:FireServer(p200.ItemName.Value, _G['\u{65e7}\u{7684}\u{5730}\u{65b9}'], _G['\u{81ea}\u{5df1}'], _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{586b}\u{5145}\u{7684}\u{6811}'], p200, true, nil)

                            _G['\u{586b}\u{5145}\u{5b8c}\u{6210}'] = true
                        end
                    end)
                    _G['\u{6728}\u{677f}\u{52a0}\u{5165}'] = game:GetService('Workspace').PlayerModels.ChildAdded:connect(function(p201)
                        p201:WaitForChild('Owner')

                        if p201:FindFirstChild('Owner') and (p201.Owner.Value == _G['\u{81ea}\u{5df1}'] and p201:FindFirstChild('WoodSection')) then
                            repeat
                                task.wait()
                            until p201:FindFirstChild('TreeClass')

                            p201.WoodSection.Anchored = true

                            local v545 = {
                                _G['\u{84dd}\u{56fe}\u{540d}\u{5b57}'],
                                p201.WoodSection.CFrame,
                                _G['\u{81ea}\u{5df1}'],
                                p198,
                                true,
                            }

                            game:GetService('ReplicatedStorage'):WaitForChild('PlaceStructure'):WaitForChild('ClientPlacedBlueprint'):FireServer(unpack(v545))
                        end
                    end)

                    repeat
                        _G['\u{62c9}\u{4e1c}\u{897f}']:FireServer(_G['\u{52a0}\u{5165}\u{7684}\u{6728}\u{5934}'])
                        _G['\u{52a0}\u{5165}\u{7684}\u{6728}\u{5934}']:PivotTo(_G['\u{83dc}\u{5355}']['\u{6cb9}\u{6f06}\u{7684}\u{952f}\u{6728}\u{673a}'].Particles.CFrame)
                        _G['\u{62c9}\u{4e1c}\u{897f}']:FireServer(_G['\u{52a0}\u{5165}\u{7684}\u{6728}\u{5934}'])
                        task.wait(2)
                    until _G['\u{52a0}\u{5165}\u{7684}\u{6728}\u{5934}'].Parent == nil
                    repeat
                        task.wait()
                    until _G['\u{586b}\u{5145}\u{5b8c}\u{6210}'] == true

                    pcall(function()
                        _G['\u{6728}\u{677f}\u{52a0}\u{5165}']:Disconnect()

                        _G['\u{6728}\u{677f}\u{52a0}\u{5165}'] = nil

                        _G['\u{68c0}\u{6d4b}\u{662f}\u{5426}\u{6210}\u{529f}']:Disconnect()

                        _G['\u{68c0}\u{6d4b}\u{662f}\u{5426}\u{6210}\u{529f}'] = nil
                    end)
                    _G['\u{63d0}\u{9192}']('done')
                    _G['\u{4f20}\u{9001}'](_CFrame13)

                    return
                else
                    return _G['\u{63d0}\u{9192}']('Not Find  right tree')
                end
            else
                return _G['\u{63d0}\u{9192}']('you need one axe')
            end
        else
            return _G['\u{63d0}\u{9192}']('select Wood At First')
        end
    end

    local _AutoBuild = v54:CreateTab('AutoBuild', '6034281908')
    local _AutoFiller = _AutoBuild:Section('Auto Filler')

    _AutoFiller:DropDown('Select the player', {}, true, false, function(p202)
        _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{586b}\u{5145}\u{7684}\u{73a9}\u{5bb6}'] = p202
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
        _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{586b}\u{5145}\u{7684}\u{6811}'] = p203
    end)

    _G['\u{81ea}\u{52a8}\u{586b}\u{5145}'] = false

    _AutoFiller:Toggle('Auto Build Loops', false, function(p204)
        _G['\u{81ea}\u{52a8}\u{586b}\u{5145}'] = p204

        while task.wait() do
            if _G['\u{81ea}\u{52a8}\u{586b}\u{5145}'] == true then
                _G['\u{586b}\u{5145}\u{6240}\u{6709}\u{84dd}\u{56fe}']()
            end
        end
    end)
    _AutoFiller:Button('Fill All blueprint', function()
        _G['\u{586b}\u{5145}\u{6240}\u{6709}\u{84dd}\u{56fe}']()
    end)
    _AutoFiller:Toggle('Click to Fill', false, function(p205)
        if p205 then
            _G['\u{70b9}\u{51fb}\u{84dd}\u{56fe}'] = _G['\u{9f20}\u{6807}'].Button1Up:Connect(function()
                local _Target4 = _G['\u{9f20}\u{6807}'].Target

                if tostring(_Target4.Parent.Owner.Value) == _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{586b}\u{5145}\u{7684}\u{73a9}\u{5bb6}'] and (_Target4.Parent:FindFirstChild('Type') and _Target4.Parent.Type.Value == 'Blueprint' and _Target4.Parent:FindFirstChild('Main')) then
                    local v546 = _G['\u{83b7}\u{5f97}\u{6728}\u{5934}']()
                    local _CFrame14 = _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}'].CFrame

                    _G['\u{4f20}\u{9001}'](v546.WoodSection.CFrame)
                    _G['\u{62c9}\u{4e1c}\u{897f}']:FireServer(v546)

                    for _ = 1, 2 do
                        for _ = 1, 5 do
                            _G['\u{62c9}\u{4e1c}\u{897f}']:FireServer(v546)
                            task.wait()
                        end

                        v546:PivotTo(_Target4.Parent.Main.CFrame)
                        task.wait(0.1)
                    end

                    _G['\u{4f20}\u{9001}'](_CFrame14)
                end
            end)
        else
            _G['\u{70b9}\u{51fb}\u{84dd}\u{56fe}']:Disconnect()

            _G['\u{70b9}\u{51fb}\u{84dd}\u{56fe}'] = nil
        end
    end)

    local _Paint = _AutoBuild:Section('Paint')

    _G['\u{952f}\u{6728}\u{673a}'] = _Paint:Label('Please Selecet one Sawmill')

    _Paint:Button('Click To Select Sawmill', function()
        local u75 = nil

        _G['\u{63d0}\u{9192}']('Click one  Sawmill')

        local v547 = _G['\u{9f20}\u{6807}'].Button1Up:Connect(function()
            wait()

            local _Parent4 = _G['\u{9f20}\u{6807}'].Target.Parent

            if _Parent4:FindFirstChild('Settings') and _Parent4.Settings:FindFirstChild('DimZ') then
                u75 = _Parent4

                _G['\u{63d0}\u{9192}']('Sawmill Selected')
            elseif _Parent4.Parent:FindFirstChild('Settings') and _Parent4.Parent.Settings:FindFirstChild('DimZ') then
                u75 = _Parent4.Parent

                _G['\u{63d0}\u{9192}']('Sawmill Selected')
            end
        end)

        repeat
            task.wait(0.1)
        until u75 ~= nil

        _G['\u{83dc}\u{5355}']['\u{6cb9}\u{6f06}\u{7684}\u{952f}\u{6728}\u{673a}'] = u75
        _G['\u{952f}\u{6728}\u{673a}'].Text = 'Selected'

        v547:Disconnect()
    end)
    _Paint:Toggle('Paint Tool', false, function(p206)
        if _G['\u{83dc}\u{5355}']['\u{6cb9}\u{6f06}\u{7684}\u{952f}\u{6728}\u{673a}'] ~= nil then
            if p206 then
                _G['\u{70b9}\u{51fb}\u{84dd}\u{56fe}'] = _G['\u{9f20}\u{6807}'].Button1Up:Connect(function()
                    if _G['\u{9f20}\u{6807}'].Target.Parent.Owner.Value == _G['\u{81ea}\u{5df1}'] and (_G['\u{9f20}\u{6807}'].Target.Parent:FindFirstChild('Type') and _G['\u{9f20}\u{6807}'].Target.Parent.Type.Value == 'Blueprint') then
                        _G['\u{6cb9}\u{6f06}'](_G['\u{9f20}\u{6807}'].Target.Parent)
                    end
                end)
            else
                _G['\u{70b9}\u{51fb}\u{84dd}\u{56fe}']:Disconnect()

                _G['\u{70b9}\u{51fb}\u{84dd}\u{56fe}'] = nil
            end

            return
        else
            return _G['\u{63d0}\u{9192}']['select Sawmail At First']
        end
    end)

    _G['\u{83b7}\u{5f97}\u{81ea}\u{5df1}\u{7684}\u{84dd}\u{56fe}'] = function()
        local v548 = next
        local v549, v550 = _G['\u{81ea}\u{5df1}'].PlayerBlueprints.Blueprints:GetChildren()
        local v551 = {}

        for _, v552 in v548, v549, v550 do
            table.insert(v551, v552.Name)
        end

        return v551
    end
    _G['\u{8bfb}\u{53d6}\u{6587}\u{4ef6}'] = function(p207)
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
    _G['\u{586b}\u{5145}\u{84dd}\u{56fe}'] = function(p208)
        local _CFrame15 = _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}'].CFrame

        _G['\u{4f20}\u{9001}'](_G['\u{83b7}\u{5f97}\u{6728}\u{5934}']().WoodSection.CFrame)
        _G['\u{62c9}\u{4e1c}\u{897f}']:FireServer(_G['\u{83b7}\u{5f97}\u{6728}\u{5934}']())

        for _ = 1, 2 do
            for _ = 1, 5 do
                _G['\u{62c9}\u{4e1c}\u{897f}']:FireServer(_G['\u{83b7}\u{5f97}\u{6728}\u{5934}']())
                task.wait()
            end

            _G['\u{83b7}\u{5f97}\u{6728}\u{5934}']():PivotTo(p208.Main.CFrame)
            task.wait(0.1)
        end

        _G['\u{4f20}\u{9001}'](_CFrame15)
    end

    local _BuildingTool = _AutoBuild:Section('Building Tool')

    _BuildingTool:DropDown('Select the player', {}, true, false, function(p209)
        _G['\u{83dc}\u{5355}']['\u{4fdd}\u{5b58}\u{57fa}\u{5730}\u{7684}\u{73a9}\u{5bb6}'] = p209
    end)

    _G['\u{6728}\u{5934}\u{79cd}\u{7c7b}'] = nil
    _G['\u{6728}\u{5934}\u{79cd}\u{7c7b}'] = _BuildingTool:DropDown('All Plank(Click to get Count)', {}, false, false, function(p210)
        _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{5efa}\u{9020}\u{7684}\u{6728}\u{5934}'] = p210

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

        _G['\u{63d0}\u{9192}'](v561 .. ' Plank')
    end)

    _BuildingTool:TextBox('Save Base', 'File Name', function(p211)
        local v563 = next
        local v564, v565 = _G['\u{571f}\u{5730}']:GetChildren()
        local v566 = ''
        local v567 = nil

        for _, v568 in v563, v564, v565 do
            if tostring(v568.Owner.Value) == _G['\u{83dc}\u{5355}']['\u{4fdd}\u{5b58}\u{57fa}\u{5730}\u{7684}\u{73a9}\u{5bb6}'] then
                v567 = v568.OriginSquare.CFrame.p
            end
        end

        local v569 = next
        local v570, v571 = workspace.PlayerModels:GetChildren()

        for _, v572 in v569, v570, v571 do
            if v572:FindFirstChild('Owner') then
                if tostring(v572.Owner.Value) == _G['\u{83dc}\u{5355}']['\u{4fdd}\u{5b58}\u{57fa}\u{5730}\u{7684}\u{73a9}\u{5bb6}'] then
                    if v572:FindFirstChild('BlueprintWoodClass') then
                        if v572:FindFirstChild('MainCFrame') then
                            v566 = v566 .. 'CFrame' .. tostring(v572.MainCFrame.Value - v567) .. 'Blueprint' .. tostring(v572.ItemName.Value) .. 'Wood' .. tostring(v572.BlueprintWoodClass.Value) .. '/'
                        end
                    end
                end
            end
        end

        writefile(p211, v566)
        _G['\u{63d0}\u{9192}']('success')
    end)

    _G['\u{68c0}\u{67e5}\u{84dd}\u{56fe}'] = function()
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
            return _G['\u{63d0}\u{9192}']('not find file')
        else
            if game.Workspace:FindFirstChild('Preview') then
                game.Workspace:FindFirstChild('Preview'):Destroy()
            end

            local _Folder2 = Instance.new('Folder', game.Workspace)

            _Folder2.Name = 'Preview'

            local v578 = next
            local v579, v580 = _G['\u{571f}\u{5730}']:GetChildren()
            local v581 = nil

            for _, v582 in v578, v579, v580 do
                if v582.Owner.Value == _G['\u{81ea}\u{5df1}'] then
                    v581 = v582.OriginSquare.CFrame.p
                end
            end

            local v583 = next
            local v584, v585 = _G['\u{8bfb}\u{53d6}\u{6587}\u{4ef6}'](u76)
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
            _G['\u{6728}\u{5934}\u{79cd}\u{7c7b}']:SetOptions(v586)
            _G['\u{63d0}\u{9192}']('load success')

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

        if _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{5efa}\u{9020}\u{7684}\u{6728}\u{5934}'] ~= nil then
            if game.Workspace:FindFirstChild('Preview') then
                local v603 = next
                local v604, v605 = game.Workspace:FindFirstChild('Preview'):GetChildren()
                local v606 = 0

                for _, v607 in v603, v604, v605 do
                    if v607:FindFirstChild('woodclass') then
                        if tostring(v607.woodclass.Value) == _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{5efa}\u{9020}\u{7684}\u{6728}\u{5934}'] then
                            if v606 <= 50 then
                                local _SelectionBox8 = Instance.new('SelectionBox', v607)

                                _SelectionBox8.LineThickness = 0.1
                                _SelectionBox8.Adornee = v607
                                v606 = v606 + 1
                            end
                        end
                    end
                end

                _G['\u{63d0}\u{9192}']('Click Build if u already build done and fill it then click this button again')

                return
            else
                return _G['\u{63d0}\u{9192}']('load ur file at first')
            end
        else
            return _G['\u{63d0}\u{9192}']('select Wood At First')
        end
    end)

    _G['\u{57fa}\u{5730}\u{52a0}\u{5165}\u{84dd}\u{56fe}'] = nil

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
                if _G['\u{81ea}\u{5df1}'].PlayerBlueprints.Blueprints:FindFirstChild(v613) then
                    return _G['\u{63d0}\u{9192}']('u need ' .. v613 .. ' BluePrint')
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
                return _G['\u{63d0}\u{9192}']('select blueprint at first')
            else
                local u77 = false

                _G['\u{57fa}\u{5730}\u{52a0}\u{5165}\u{84dd}\u{56fe}'] = game.Workspace.PlayerModels.ChildAdded:Connect(function(p213)
                    if p213:FindFirstChild('Owner') and (p213.Owner.Value == _G['\u{81ea}\u{5df1}'] and p213:FindFirstChild('BuildDependentWood')) then
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
                                    game:GetService('ReplicatedStorage'):WaitForChild('PlaceStructure'):WaitForChild('ClientPlacedBlueprint'):FireServer(v622.Name, v622.Main.CFrame, _G['\u{81ea}\u{5df1}'])
                                until u77 == true

                                v622:Destroy()

                                if _G['\u{68c0}\u{67e5}\u{84dd}\u{56fe}'] == false then
                                    repeat
                                        wait()
                                    until _G['\u{68c0}\u{67e5}\u{84dd}\u{56fe}'] == true
                                end

                                task.wait()
                            end
                        end
                    end
                end

                pcall(function()
                    _G['\u{57fa}\u{5730}\u{52a0}\u{5165}\u{84dd}\u{56fe}']:Disconnect()

                    _G['\u{57fa}\u{5730}\u{52a0}\u{5165}\u{84dd}\u{56fe}'] = nil
                end)

                return
            end
        else
            return _G['\u{63d0}\u{9192}']('load ur file at first')
        end
    end)

    local _BluePrintPlace = _AutoBuild:Section('BluePrint Place')
    local _SelectBluePrintType = _BluePrintPlace:DropDown('Select BluePrint Type', _G['\u{83b7}\u{5f97}\u{81ea}\u{5df1}\u{7684}\u{84dd}\u{56fe}'](), false, false, function(p214)
        _G['\u{83dc}\u{5355}']['\u{84dd}\u{56fe}\u{540d}\u{5b57}'] = p214
    end)

    _G['\u{81ea}\u{5df1}'].PlayerBlueprints.Blueprints.ChildAdded:Connect(function(_)
        _SelectBluePrintType:SetOptions(_G['\u{83b7}\u{5f97}\u{81ea}\u{5df1}\u{7684}\u{84dd}\u{56fe}']())
    end)
    _BluePrintPlace:Label('R T   to Use Rotate to Place B Abort')
    _BluePrintPlace:Button('Go!', function()
        local u78 = _G['\u{83dc}\u{5355}']['\u{84dd}\u{56fe}\u{540d}\u{5b57}']
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
                    game:GetService('ReplicatedStorage'):WaitForChild('PlaceStructure'):WaitForChild('ClientPlacedBlueprint'):FireServer(u78, u79.Main.CFrame, _G['\u{81ea}\u{5df1}'])
                end
            end),
        }
        local _ = v629
        local v630 = {
            Function = game:GetService('RunService').RenderStepped:Connect(function()
                if u79.Parent then
                    u79:PivotTo(CFrame.new(_G['\u{9f20}\u{6807}'].Hit.Position.X, _G['\u{9f20}\u{6807}'].Hit.Position.Y, _G['\u{9f20}\u{6807}'].Hit.Position.Z) * CFrame.Angles(u81, math.rad(u83), math.rad(u85)))

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

    _G['\u{7535}\u{7ebf}\u{5730}\u{70b9}'] = function(p220)
        _G['\u{7535}\u{7ebf}'] = p220
        _G['\u{8ddd}\u{79bb}'] = 0
        _G['\u{8fd4}\u{56de}\u{7535}\u{7ebf}'] = {}
        _G['\u{5168}\u{90e8}\u{7535}\u{7ebf}'] = {}

        local v631 = nil

        for _, v632 in next, _G['\u{7535}\u{7ebf}']do
            if v631 == nil then
                table.insert(_G['\u{5168}\u{90e8}\u{7535}\u{7ebf}'], v632)

                v631 = v632
            elseif _G['\u{8ddd}\u{79bb}'] + (v632 - v631).magnitude <= game:GetService('ReplicatedStorage').ClientItemInfo:FindFirstChild(u91).OtherInfo.MaxLength.Value then
                _G['\u{8ddd}\u{79bb}'] = _G['\u{8ddd}\u{79bb}'] + (v632 - v631).magnitude

                table.insert(_G['\u{5168}\u{90e8}\u{7535}\u{7ebf}'], v632)

                v631 = v632
            else
                table.insert(_G['\u{8fd4}\u{56de}\u{7535}\u{7ebf}'], _G['\u{5168}\u{90e8}\u{7535}\u{7ebf}'])

                _G['\u{5168}\u{90e8}\u{7535}\u{7ebf}'] = {}
                _G['\u{8ddd}\u{79bb}'] = 0

                table.insert(_G['\u{5168}\u{90e8}\u{7535}\u{7ebf}'], v631)

                _G['\u{8ddd}\u{79bb}'] = (v632 - v631).magnitude

                table.insert(_G['\u{5168}\u{90e8}\u{7535}\u{7ebf}'], v632)

                v631 = v632
            end
        end

        if #_G['\u{5168}\u{90e8}\u{7535}\u{7ebf}'] > 0 then
            table.insert(_G['\u{8fd4}\u{56de}\u{7535}\u{7ebf}'], _G['\u{5168}\u{90e8}\u{7535}\u{7ebf}'])
        end

        return _G['\u{8fd4}\u{56de}\u{7535}\u{7ebf}']
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
            u92 = _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}'].Position

            local _Model = Instance.new('Model')

            _Model.Name = 'Dark X Wire art'

            local v633 = next
            local v634, v635 = _G['\u{7535}\u{7ebf}\u{5730}\u{70b9}'](u90)

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
            return _G['\u{63d0}\u{9192}']('u need wire art')
        end
    end)
    _wireart:Button('destroy preview', function()
        pcall(function()
            game.Workspace['Dark X Wire art']:Destroy()
        end)

        u92 = nil
    end)

    _G['\u{68c0}\u{67e5}\u{7535}\u{7ebf}'] = function(p229, p230)
        local v646 = next
        local v647, v648 = workspace.PlayerModels:GetChildren()
        local v649 = {}

        for _, v650 in v646, v647, v648 do
            if v650:FindFirstChild('Owner') then
                if v650.Owner.Value == _G['\u{81ea}\u{5df1}'] then
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

        if _G['\u{68c0}\u{67e5}\u{7535}\u{7ebf}'](u91, #_G['\u{7535}\u{7ebf}\u{5730}\u{70b9}'](u90)) ~= true then
            print('buy')

            _G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}\u{7684}\u{5730}\u{70b9}'] = _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}'].CFrame

            _G['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}v2'](u91, #_G['\u{7535}\u{7ebf}\u{5730}\u{70b9}'](u90) - _G['\u{68c0}\u{67e5}\u{7535}\u{7ebf}'](u91, #_G['\u{7535}\u{7ebf}\u{5730}\u{70b9}'](u90)))
            task.wait()
        end

        _G['\u{4f20}\u{9001}'](_G['\u{83dc}\u{5355}']['\u{81ea}\u{52a8}\u{8d2d}\u{4e70}\u{7684}\u{5730}\u{70b9}'])

        local v651 = next
        local v652, v653 = _G['\u{7535}\u{7ebf}\u{5730}\u{70b9}'](u90)

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
                    if v661.Owner.Value == _G['\u{81ea}\u{5df1}'] then
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
                _G['\u{81ea}\u{5df1}'],
                v660,
                true,
            }

            game:GetService('ReplicatedStorage'):WaitForChild('PlaceStructure'):WaitForChild('ClientPlacedWire'):FireServer(unpack(v662))
            task.wait(2)
        end

        u92 = nil
    end)

    _G['\u{83b7}\u{5f97}\u{8f66}\u{5b50}'] = function()
        local v663 = next
        local v664, v665 = game.Workspace.PlayerModels:GetChildren()
        local v666 = 0
        local v667 = {}
        local v668 = 0
        local v669 = {}

        for _, v670 in v663, v664, v665 do
            if v670:FindFirstChild('Owner') then
                if v670.Owner.Value == _G['\u{81ea}\u{5df1}'] then
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
                    if v674.Owner.Value == _G['\u{81ea}\u{5df1}'] then
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
    _G['\u{641e}\u{73a9}\u{5bb6}'] = function()
        if _G['\u{83dc}\u{5355}']['\u{6740}\u{6b7b}\u{7684}\u{5de5}\u{5177}'] ~= 'Axe' or _G['\u{83b7}\u{5f97}\u{5de5}\u{5177}'] ~= nil then
            if _G['\u{83dc}\u{5355}']['\u{6740}\u{6b7b}\u{7684}\u{5de5}\u{5177}'] ~= 'Vehicle' or _G['\u{83b7}\u{5f97}\u{8f66}\u{5b50}']() ~= nil then
                if _G['\u{73a9}\u{5bb6}']:FindFirstChild(tostring(_G['\u{83dc}\u{5355}']['\u{6740}\u{6b7b}\u{7684}\u{73a9}\u{5bb6}'])) then
                    if tostring(_G['\u{83dc}\u{5355}']['\u{6740}\u{6b7b}\u{7684}\u{73a9}\u{5bb6}']) ~= tostring(_G['\u{81ea}\u{5df1}']) then
                        if _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].SeatPart ~= nil or _G['\u{83dc}\u{5355}']['\u{6740}\u{6b7b}\u{7684}\u{5de5}\u{5177}'] ~= 'Vehicle' then
                            if _G['\u{73a9}\u{5bb6}'][_G['\u{83dc}\u{5355}']['\u{6740}\u{6b7b}\u{7684}\u{73a9}\u{5bb6}'] ].Character.Humanoid.SeatPart == nil then
                                if tostring(_G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].SeatPart) == 'DriveSeat' or _G['\u{83dc}\u{5355}']['\u{6740}\u{6b7b}\u{7684}\u{5de5}\u{5177}'] ~= 'Vehicle' then
                                    local _CFrame17 = _G['\u{81ea}\u{5df1}\u{7684}\u{65b9}\u{5757}'].CFrame

                                    if _G['\u{83dc}\u{5355}']['\u{6740}\u{6b7b}\u{7684}\u{5de5}\u{5177}'] == 'Vehicle' then
                                        car = _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}'].SeatPart.Parent

                                        game:GetService('ReplicatedStorage').Interaction.UpdateUserSettings:FireServer('UserPermission', _G['\u{73a9}\u{5bb6}'][_G['\u{83dc}\u{5355}']['\u{6740}\u{6b7b}\u{7684}\u{73a9}\u{5bb6}'] ].UserId, 'Sit', true)

                                        repeat
                                            _G['\u{4f20}\u{9001}'](_G['\u{73a9}\u{5bb6}'][_G['\u{83dc}\u{5355}']['\u{6740}\u{6b7b}\u{7684}\u{73a9}\u{5bb6}'] ].Character.PrimaryPart.CFrame * CFrame.Angles(math.rad(-180), 0, 0) + Vector3.new(0, 2, 0))
                                            task.wait(1)
                                        until _G['\u{73a9}\u{5bb6}'][_G['\u{83dc}\u{5355}']['\u{6740}\u{6b7b}\u{7684}\u{73a9}\u{5bb6}'] ].Character.Humanoid.SeatPart == car.Seat

                                        if _G['\u{83dc}\u{5355}']['\u{6740}\u{6b7b}\u{7684}\u{65b9}\u{6cd5}'] ~= 'Hard Kill' then
                                            if _G['\u{83dc}\u{5355}']['\u{6740}\u{6b7b}\u{7684}\u{65b9}\u{6cd5}'] ~= 'Kill' then
                                                local _ = _G['\u{83dc}\u{5355}']['\u{6740}\u{6b7b}\u{7684}\u{65b9}\u{6cd5}'] ~= 'Bring'
                                            else
                                                _G['\u{4f20}\u{9001}'](CFrame.new(0, -50, 0))
                                                wait(1)
                                                game.ReplicatedStorage.Interaction.DestroyStructure:FireServer(car)
                                                wait(0.3)
                                            end
                                        else
                                            _G['\u{4f20}\u{9001}'](CFrame.new(-1675, 500, 1282))
                                            wait(1)
                                            game.ReplicatedStorage.Interaction.DestroyStructure:FireServer(car)
                                            wait(0.3)
                                        end
                                    end

                                    _G['\u{4f20}\u{9001}'](_CFrame17)

                                    return
                                else
                                    return _G['\u{63d0}\u{9192}']("You Need To Be In The Driver's Seat")
                                end
                            else
                                return _G['\u{63d0}\u{9192}']('Selected Player Is Seated!')
                            end
                        else
                            return _G['\u{63d0}\u{9192}']('pls sit in a car')
                        end
                    else
                        return _G['\u{63d0}\u{9192}']('You Cannot Perform This Action On Yourself!')
                    end
                else
                    return _G['\u{63d0}\u{9192}']('Selected Player Has Left The Game!')
                end
            else
                return _G['\u{63d0}\u{9192}']('You Need A Vehicle To Use This Feature.')
            end
        else
            return _G['\u{63d0}\u{9192}']('You Need An Axe To Use This Feature.')
        end
    end
    _G['\u{65a7}\u{5934}\u{98de}\u{884c}'] = function(p231)
        if p231 then
            _G['\u{83dc}\u{5355}']['\u{65a7}\u{5934}\u{6389}\u{843d}'] = game.Workspace.PlayerModels.ChildAdded:Connect(function(p232)
                if p232:WaitForChild('Owner') and (p232.Owner.Value == _G['\u{81ea}\u{5df1}'] and p232:WaitForChild('Main')) and p232:WaitForChild('ToolName') then
                    local _BodyAngularVelocity = Instance.new('BodyAngularVelocity', p232.Main)
                    local _BodyPosition2 = Instance.new('BodyPosition', p232.Main)

                    _BodyPosition2.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    _BodyPosition2.Position = _G['\u{9f20}\u{6807}'].Hit.p
                    _BodyPosition2.P = 1000000
                    _BodyAngularVelocity.P = 9000000000
                    _BodyAngularVelocity.MaxTorque = Vector3.new(0, 9999999, 0)
                    _BodyAngularVelocity.AngularVelocity = Vector3.new(0, 9999999, 0)
                    _BodyAngularVelocity.P = 9999999

                    local v675 = 0

                    while p232:FindFirstChild('Main') do
                        game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(p232)

                        p232.Main.CFrame = CFrame.new(_G['\u{9f20}\u{6807}'].Hit.p) * CFrame.Angles(math.rad(20 * v675), 0, 0)
                        v675 = v675 + 1

                        task.wait(0.5)

                        if (_G['\u{81ea}\u{5df1}\u{89d2}\u{8272}'].Head.CFrame.p - p232:WaitForChild('Main').CFrame.p).Magnitude >= 15 or 40 <= v675 then
                            break
                        end
                    end

                    game:GetService('ReplicatedStorage').Interaction.ClientInteracted:FireServer(p232, 'Pick up tool')
                    _G['\u{81ea}\u{5df1}\u{89d2}\u{8272}']:WaitForChild('Tool')
                    _G['\u{81ea}\u{5df1}\u{8eab}\u{4f53}']:UnequipTools()
                end
            end)
            _G['\u{83dc}\u{5355}']['\u{65a7}\u{5934}\u{98de}\u{884c}'] = _G['\u{9f20}\u{6807}'].Button1Up:Connect(function()
                game:GetService('ReplicatedStorage').Interaction.ClientInteracted:FireServer(_G['\u{81ea}\u{5df1}'].Backpack:FindFirstChild('Tool') or _G['\u{81ea}\u{5df1}\u{89d2}\u{8272}']:FindFirstChild('Tool'), 'Drop tool', _G['\u{81ea}\u{5df1}'].Character['Right Arm'].CFrame - Vector3.new(5, 0, 0))
            end)

            return
        else
            _G['\u{83dc}\u{5355}']['\u{65a7}\u{5934}\u{6389}\u{843d}']:Disconnect()
            _G['\u{83dc}\u{5355}']['\u{65a7}\u{5934}\u{98de}\u{884c}']:Disconnect()

            return
        end
    end

    local _Player3 = v54:CreateTab('Troll', '8769279408'):Section('Player')

    _Player3:DropDown('Select the player', {}, true, false, function(p233)
        _G['\u{83dc}\u{5355}']['\u{6740}\u{6b7b}\u{7684}\u{73a9}\u{5bb6}'] = p233
    end)
    _Player3:DropDown('Method', {
        'Kill',
        'Hard Kill',
        'Bring',
    }, false, false, function(p234)
        _G['\u{83dc}\u{5355}']['\u{6740}\u{6b7b}\u{7684}\u{65b9}\u{6cd5}'] = p234
    end)
    _Player3:DropDown('select tool', {
        'Vehicle',
    }, false, false, function(p235)
        _G['\u{83dc}\u{5355}']['\u{6740}\u{6b7b}\u{7684}\u{5de5}\u{5177}'] = p235
    end)
    _Player3:Button('Kill!', function()
        _G['\u{641e}\u{73a9}\u{5bb6}']()
    end)
    _Player3:Toggle('Delete all Shop items', false, function(p236)
        _G['\u{83dc}\u{5355}']['\u{5220}\u{9664}\u{5546}\u{5e97}\u{7269}\u{54c1}'] = p236
    end)
    _Player3:Toggle('Tomahawk Axe Fling', false, function(p237)
        _G['\u{65a7}\u{5934}\u{98de}\u{884c}'](p237)
    end)

    local _Credits = v54:CreateTab('Settings', '6031280882'):Section('Credits')

    _Credits:Label('UI Made by silent ben8x')
    _Credits:Label('Devs : silent ben8x and Thchjh')

    local v676 = next
    local v677, v678 = game.CoreGui.Aurora.Main.Side.TabHolder:GetChildren()

    for _, v679 in v676, v677, v678 do
        if v679:FindFirstChild('Title') then
            if v679.Title.Text == 'Player' then
                SwitchTab(v679, game.CoreGui.Aurora.Main.Holder_Player)
            end
        end
    end

    game.CoreGui.Aurora.Main.Holder_Key:Destroy()

    local v680 = next
    local v681, v682 = game.CoreGui.Aurora.Main.Side.TabHolder:GetChildren()

    for _, v683 in v680, v681, v682 do
        if v683:FindFirstChild('Title') then
            if v683.Title.Text == 'Key' then
                v683:Destroy()
            end
        end
    end

    _Credits:KeyBind('Toggle UI', 'RightShift', function(_)
        u47:ToggleUI()
    end)
    _G['\u{63d0}\u{9192}']('Dark X load success')
    wait(2)
    _G['\u{63d0}\u{9192}']('our discord: https://discord.gg/6aP9akd5rX')

    local u93 = nil

    u93 = hookmetamethod(game, '__namecall', function(p238, ...)
        if getnamecallmethod() ~= 'FireServer' or (not _G['\u{83dc}\u{5355}']['\u{6c34}\u{4e2d}\u{65e0}\u{654c}'] or p238.Name ~= 'DamageHumanoid') then
            return u93(p238, ...)
        else
            return
        end
    end)

    local u94 = nil

    u94 = hookmetamethod(game, '__namecall', function(...)
        local v684 = {...}
        local v685 = getnamecallmethod()

        if v685 == 'FindPartOnRayWithIgnoreList' and (v684[3][2] and _G['\u{83dc}\u{5355}']['\u{8d85}\u{7ea7}\u{7535}\u{7ebf}']) then
            rawset(v684, 2, Ray.new(Vector3.new(0, 0, 0), Vector3.new(0, 0, 0)))
        end

        setnamecallmethod(v685)

        return u94(unpack(v684))
    end)

    return
else
    return _G['\u{81ea}\u{5df1}']:Kick('you are using old dark x')
end
