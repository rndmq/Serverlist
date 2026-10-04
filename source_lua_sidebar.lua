local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local ContentProvider = game:GetService("ContentProvider")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Settings = {}
local UIReferences = {
    Toggles = {},
    Dropdowns = {}
}

local function LoadSettings()
    local saveFile = "Rdnm.json"
    pcall(function()
        if getgenv and getgenv().SaveFile then
            saveFile = getgenv().SaveFile
        end
    end)
    if not saveFile:match("%.json$") then
        saveFile = saveFile .. ".json"
    end
    if isfile(saveFile) then
        local success, result = pcall(function()
            return HttpService:JSONDecode(readfile(saveFile))
        end)
        if success and type(result) == "table" then
            Settings = result
            if tostring(game.PlaceId) ~= "13127800756" and (next(Settings) == nil or not Settings[tostring(game.PlaceId)]) then
                Settings[tostring(game.PlaceId)] = {}
            end
        else
            Settings = {}
            if tostring(game.PlaceId) ~= "13127800756" then
                Settings[tostring(game.PlaceId)] = {}
            end
        end
    else
        Settings = {}
        if tostring(game.PlaceId) ~= "13127800756" then
            Settings[tostring(game.PlaceId)] = {}
        end
        pcall(function()
            writefile(saveFile, HttpService:JSONEncode(Settings))
        end)
    end
    for gameId, gameSettings in pairs(Settings) do
        if UIReferences.Toggles[gameId] then
            for name, value in pairs(gameSettings) do
                if UIReferences.Toggles[name] then
                    local toggle = UIReferences.Toggles[name]
                    toggle.Toggled = value
                    toggle.TickCover.Position = value and UDim2.new(0.5, 0, 0.5, 0) or UDim2.new(0.5, -7, 0.5, -7)
                    toggle.TickCover.Size = value and UDim2.new(0, 0, 0, 0) or UDim2.new(0, 14, 0, 14)
                    toggle.CheckboxOutline.ImageColor3 = value and (Library and Library.Theme and Library.Theme.MainColor or Color3.fromRGB(255, 75, 75)) or Color3.fromRGB(65, 65, 65)
                    toggle.CheckboxTicked.ImageColor3 = value and (Library and Library.Theme and Library.Theme.MainColor or Color3.fromRGB(255, 75, 75)) or Color3.fromRGB(65, 65, 65)
                    if value and toggle.Callback then
                        toggle.Callback(true)
                    end
                end
            end
        end
        if UIReferences.Dropdowns[gameId] then
            for name, value in pairs(gameSettings) do
                if UIReferences.Dropdowns[name] then
                    local dropdown = UIReferences.Dropdowns[name]
                    dropdown.SelectedOption = value
                    dropdown.TitleToggle.Text = name .. " - " .. value
                    if dropdown.Callback then
                        dropdown.Callback(value)
                    end
                end
            end
        end
    end
end
LoadSettings()

local function SaveSettings()
    local saveFile = "Rdnm.json"
    pcall(function()
        if getgenv and getgenv().SaveFile then
            saveFile = getgenv().SaveFile
        end
    end)
    if not saveFile:match("%.json$") then
        saveFile = saveFile .. ".json"
    end
    if not Settings then
        Settings = {}
        if tostring(game.PlaceId) ~= "13127800756" then
            Settings[tostring(game.PlaceId)] = {}
        end
    end
    if tostring(game.PlaceId) ~= "13127800756" then
        pcall(function()
            local settingsToSave = {}
            for gameId, gameSettings in pairs(Settings) do
                if gameId ~= "13127800756" then
                    settingsToSave[gameId] = gameSettings
                end
            end
            writefile(saveFile, HttpService:JSONEncode(settingsToSave))
        end)
    end
end
ContentProvider:PreloadAsync({"rbxassetid://3570695787", "rbxassetid://2708891598", "rbxassetid://4155801252", "rbxassetid://4695575676", "rbxassetid://4155801252"})
Library = {
    LibraryColorTable = {},
    TabCount = 0,
    FirstTab = nil,
    CurrentlyBinding = false,
    RainbowColorValue = 0,
    HueSelectionPosition = 0,
    Theme = {
        MainColor = Color3.fromRGB(100, 100, 110),
        BackgroundColor = Color3.fromRGB(35, 35, 35),
        UIToggleKey = Enum.KeyCode.RightControl,
        TextFont = Enum.Font.SourceSansBold,
        EasingStyle = Enum.EasingStyle.Quart,
        Color = Color3.fromRGB(100, 100, 110),      
        TextColor = Color3.fromRGB(255, 255, 255) 
    }
}
local selectedColor = Color3.fromRGB(100, 100, 110)

pcall(function()
    if getgenv and not getgenv().Color then
    Library.Theme.Color = Color3.fromRGB(100, 100, 110)
    elseif getgenv().Color == "rgb" then
        coroutine.wrap(function()
            while true do
                if getgenv().StopRGB then break end
                for i = 0, 1, 0.001 do
                    selectedColor = Color3.fromHSV(i, 1, 1)
                    Library.Theme.Color = selectedColor
                    for _, v in pairs(Library.LibraryColorTable) do
                        if v:IsA("Frame") or v:IsA("ImageButton") or (v:IsA("ImageLabel") and (v.Name == "Border" or v.Name == "BackgroundTab" or v == SectionBorder)) or v == SectionLayout then
                            v.ImageColor3 = Library.Theme.Color
                        end
                    end
                    task.wait(0.0001)
                end
            end
        end)()
    else
        local colorMap = {
            blue = Color3.fromRGB(0, 0, 255),
            red = Color3.fromRGB(255, 0, 0),
            green = Color3.fromRGB(0, 255, 0),
            yellow = Color3.fromRGB(255, 255, 0),
            purple = Color3.fromRGB(128, 0, 128),
            pink = Color3.fromRGB(255, 105, 180),
            default = Color3.fromRGB(100, 100, 110),
            gray = Color3.fromRGB(100, 100, 110),
            grey = Color3.fromRGB(100, 100, 110),
            cyan = Color3.fromRGB(0, 255, 255),
            brown = Color3.fromRGB(139, 69, 19),
            orange = Color3.fromRGB(255, 165, 0),
            black = Color3.fromRGB(0, 0, 0),
            white = Color3.fromRGB(255, 255, 255)
        }
        local colorKey = string.lower(getgenv().Color)
        selectedColor = colorMap[colorKey] or colorMap.default
        Library.Theme.Color = selectedColor
    end
end)
local function UpdateTextColors()
    for _, v in pairs(Library.LibraryColorTable) do
        if typeof(v) == "Instance" then
            if v:IsA("TextLabel") or v:IsA("TextButton") then
                v.TextColor3 = Library.Theme.TextColor
            elseif v:IsA("ImageLabel") and (v.Name == "CheckboxTicked" or v.Name == "CheckboxOutline") then
                v.ImageColor3 = Library.Theme.TextColor
            elseif v:IsA("TextLabel") and (v.Name == "Title" or v.Name == "TitleTab" or v.Name == "SectionTitle") then
                v.TextColor3 = Library.Theme.TextColor
            end
        end
    end
end
local selectedTextColor = Color3.fromRGB(255, 255, 255)
pcall(function()
    if getgenv().TextColor == "rgb" then
        coroutine.wrap(function()
            while true do
                if getgenv().StopRGB then break end
                for i = 0, 1, 0.002 do
                    Library.Theme.TextColor = Color3.fromHSV(i, 1, 1)
                    for _, v in pairs(Library.LibraryColorTable) do
                        if v:IsA("TextLabel") or v:IsA("TextButton") then
                            v.TextColor3 = Library.Theme.TextColor
                        elseif v:IsA("ImageLabel") and v.Name == "CheckboxTicked" then
                            v.ImageColor3 = Library.Theme.TextColor
                        elseif v:IsA("ImageLabel") and v.Name == "CheckboxOutline" then
                            v.ImageColor3 = Library.Theme.TextColor
                        elseif v:IsA("TextLabel") and (v.Name == "Title" or v.Name == "TitleTab" or v.Name == "SectionTitle") then
                            v.TextColor3 = Library.Theme.TextColor
                        end
                    end
                    task.wait(0.01)
                end
            end
        end)()
    else
        local colorMap = {
            blue = Color3.fromRGB(0, 0, 255),
            red = Color3.fromRGB(255, 0, 0),
            green = Color3.fromRGB(0, 255, 0),
            yellow = Color3.fromRGB(255, 255, 0),
            purple = Color3.fromRGB(128, 0, 128),
            pink = Color3.fromRGB(255, 105, 180),
            default = Color3.fromRGB(255, 255, 255),
            cyan = Color3.fromRGB(0, 255, 255),
            brown = Color3.fromRGB(139, 69, 19),
            orange = Color3.fromRGB(255, 165, 0),
            black = Color3.fromRGB(0, 0, 0),
            white = Color3.fromRGB(255, 255, 255)
        }
        local colorKey = string.lower(tostring(getgenv().TextColor))
        Library.Theme.TextColor = colorMap[colorKey] or Color3.fromRGB(255, 255, 255)
        UpdateTextColors()
    end
end)
pcall(function()
    if getgenv().Font or getgenv().font then
        local fontMap = {
            bold = Enum.Font.SourceSansBold,
            regular = Enum.Font.SourceSans,
            italic = Enum.Font.SourceSansItalic,
            light = Enum.Font.SourceSansLight,
            semibold = Enum.Font.SourceSansSemibold,
            arial = Enum.Font.Arial,
            arialbold = Enum.Font.ArialBold,
            legacy = Enum.Font.Legacy,
            cartosil = Enum.Font.Cartosil,
            specialelite = Enum.Font.SpecialElite
        }
        local fontKey = string.lower(tostring(getgenv().Font or getgenv().font))
        Library.Theme.TextFont = fontMap[fontKey] or Enum.Font.SourceSansBold
    end
end)

Library.Theme.MainColor = selectedColor
local function DarkenObjectColor(object, amount)
    local h, s, v = Color3.toHSV(object)
    v = math.clamp(v - (amount / 255), 0, 1)
    s = math.clamp(s - (amount / 510), 0, 1)
    return Color3.fromHSV(h, s, v)
end

local function SetUIAccent(color)
    for i, v in pairs(Library.LibraryColorTable) do
        if HasProperty(v, "ImageColor3") then
            if v ~= "CheckboxOutline" and v.ImageColor3 ~= Color3.fromRGB(65, 65, 65) then
                v.ImageColor3 = color
            end
        end

        if HasProperty(v, "TextColor3") then
            if v.TextColor3 ~= Color3.fromRGB(255, 255, 255) then
                v.TextColor3 = color
            end
        end
    end
end

local function RippleEffect(object)
    spawn(function()
        local Ripple = Instance.new("ImageLabel")

        Ripple.Name = "Ripple"
        Ripple.Parent = object
        Ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Ripple.BackgroundTransparency = 1.000
        Ripple.ZIndex = 8
        Ripple.Image = "rbxassetid://2708891598"
        Ripple.ImageTransparency = 0.800
        Ripple.ScaleType = Enum.ScaleType.Fit

        Ripple.Position = UDim2.new((Mouse.X - object.AbsolutePosition.X) / object.AbsoluteSize.X, 0, (Mouse.Y - object.AbsolutePosition.Y) / object.AbsoluteSize.Y, 0)
        TweenService:Create(Ripple, TweenInfo.new(1, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Position = UDim2.new(-5.5, 0, -5.5, 0), Size = UDim2.new(12, 0, 12, 0)}):Play()

        wait(0.5)
        TweenService:Create(Ripple, TweenInfo.new(1, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()

        wait(1)
        Ripple:Destroy()
    end)
end

local function MakeDraggable(topbarobject, object)
    local Dragging = nil
    local DragInput = nil
    local DragStart = nil
    local StartPosition = nil
    
    local function Update(input)
        local Delta = input.Position - DragStart
        object.Position = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y)
    end
    
    topbarobject.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            Dragging = true
            DragStart = input.Position
            StartPosition = object.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    Dragging = false
                end
            end)
        end
    end)
    
    topbarobject.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            DragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == DragInput and Dragging then
            Update(input)
        end
    end)
end

local Layout = { W = 520, H = 300, Side = 124, Top = 30 }

local UILibrary = Instance.new("ScreenGui")
local Main = Instance.new("ImageLabel")
local Border = Instance.new("ImageLabel")
local Topbar = Instance.new("Frame")
local UITabs = Instance.new("Frame")
local Tabs = Instance.new("Frame")
local TabButtons = Instance.new("ImageLabel")
local TabButtonLayout = Instance.new("UIListLayout")

UILibrary.Name = "Rndm."
UILibrary.Parent = CoreGui
UILibrary.DisplayOrder = 1
UILibrary.ZIndexBehavior = Enum.ZIndexBehavior.Global

Main.Name = "Main"
Main.Parent = UILibrary
Main.BackgroundColor3 = Library.Theme.BackgroundColor
Main.BackgroundTransparency = 1.000
Main.Position = UDim2.new(0.5, -Layout.W / 2, 0.5, -Layout.H / 2)
Main.Size = UDim2.new(0, Layout.W, 0, 0)
Main.ZIndex = 2
Main.Image = "rbxassetid://3570695787"
Main.ImageColor3 = Library.Theme.BackgroundColor
Main.ScaleType = Enum.ScaleType.Slice
Main.SliceCenter = Rect.new(100, 100, 100, 100)
Main.SliceScale = 0.050
Main.ImageTransparency = 0.25   -- jendela semi transparan (0 = solid, 1 = hilang)
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Main
Border.Name = "Border"
Border.Parent = Main
Border.BackgroundColor3 = Library.Theme.MainColor
Border.BackgroundTransparency = 1.000
Border.Position = UDim2.new(0, -1, 0, -1)
Border.Size = UDim2.new(1, 2, 1, 2)
Border.Image = ""
Border.ImageColor3 = Library.Theme.MainColor
Border.ImageTransparency = 1
do
    local bc = Instance.new("UICorner")
    bc.CornerRadius = UDim.new(0, 11)
    bc.Parent = Border
    local bs = Instance.new("UIStroke")
    bs.Color = Color3.fromRGB(80, 80, 90)
    bs.Transparency = 0.55
    bs.Thickness = 1
    bs.Parent = Border
end

Topbar.Name = "Topbar"
Topbar.Parent = Main
Topbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Topbar.BackgroundTransparency = 1.000
Topbar.Size = UDim2.new(1, 0, 0, Layout.Top)
Topbar.ZIndex = 2

UITabs.Name = "UITabs"
UITabs.Parent = Main
UITabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UITabs.BackgroundTransparency = 1.000
UITabs.ClipsDescendants = true
UITabs.Size = UDim2.new(1, 0, 1, 0)

Tabs.Name = "Tabs"
Tabs.Parent = UITabs
Tabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Tabs.BackgroundTransparency = 1.000
Tabs.Position = UDim2.new(0, Layout.Side + 8, 0, Layout.Top + 4)
Tabs.Size = UDim2.new(1, -(Layout.Side + 16), 1, -(Layout.Top + 4 + 24))
Tabs.ClipsDescendants = true
Tabs.ZIndex = 2

TabButtons.Name = "TabButtons"
TabButtons.Parent = UITabs
TabButtons.BackgroundColor3 = Library.Theme.MainColor
TabButtons.BackgroundTransparency = 1.000
TabButtons.Position = UDim2.new(0, 8, 0, Layout.Top + 4)
TabButtons.Size = UDim2.new(0, Layout.Side - 4, 1, -(Layout.Top + 4 + 8))
TabButtons.ZIndex = 2
TabButtons.Image = "rbxassetid://3570695787"
TabButtons.ImageColor3 = Color3.fromRGB(20, 20, 24)
TabButtons.ImageTransparency = 0.3
TabButtons.ScaleType = Enum.ScaleType.Slice
TabButtons.SliceCenter = Rect.new(100, 100, 100, 100)
TabButtons.SliceScale = 0.050
TabButtons.ClipsDescendants = true

TabButtonLayout.Name = "TabButtonLayout"
TabButtonLayout.Parent = TabButtons
TabButtonLayout.FillDirection = Enum.FillDirection.Vertical
TabButtonLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
TabButtonLayout.Padding = UDim.new(0, 4)
TabButtonLayout.SortOrder = Enum.SortOrder.LayoutOrder
local TabScrollingFrame = Instance.new("ScrollingFrame")
TabScrollingFrame.Name = "TabScrollingFrame"
TabScrollingFrame.Parent = TabButtons
TabScrollingFrame.Position = UDim2.new(0, 0, 0, 0)
TabScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
TabScrollingFrame.BackgroundTransparency = 1
TabScrollingFrame.ScrollBarThickness = 3
TabScrollingFrame.ElasticBehavior = Enum.ElasticBehavior.Always
TabScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
TabScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
TabScrollingFrame.ScrollBarImageTransparency = 0.5
TabScrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y
TabScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
TabScrollingFrame.ClipsDescendants = true
local TabListPadding = Instance.new("UIPadding")
TabListPadding.PaddingTop = UDim.new(0, 8)
TabListPadding.PaddingLeft = UDim.new(0, 2)
TabListPadding.Parent = TabScrollingFrame
TabButtonLayout.Parent = TabScrollingFrame

TweenService:Create(Main, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(0, Layout.W, 0, Layout.H)}):Play()
TweenService:Create(Border, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()

table.insert(Library.LibraryColorTable, Border)
MakeDraggable(Topbar, Main)

local Minimized = false


-- gradasi tipis supaya terasa seperti kaca
do
    local g = Instance.new("UIGradient")
    g.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(200, 200, 212))
    g.Rotation = 90
    g.Parent = Main
end


local TweenService = game:GetService("TweenService")

local MinimizeBtn = Instance.new("ImageButton")
MinimizeBtn.Name = "MinimizeBtn"
MinimizeBtn.Parent = Topbar
MinimizeBtn.BackgroundTransparency = 1
MinimizeBtn.Position = UDim2.new(1, -24, 0, 7)
MinimizeBtn.Size = UDim2.new(0, 15, 0, 15)
MinimizeBtn.ZIndex = 10
MinimizeBtn.Image = "rbxassetid://3570695787"
MinimizeBtn.ImageColor3 = Library.Theme.MainColor
MinimizeBtn.ScaleType = Enum.ScaleType.Slice
MinimizeBtn.SliceCenter = Rect.new(100, 100, 100, 100)
MinimizeBtn.SliceScale = 0.050

local MinIcon = Instance.new("TextLabel")
MinIcon.Name = "MinIcon"
MinIcon.Parent = MinimizeBtn
MinIcon.BackgroundTransparency = 1
MinIcon.Size = UDim2.new(1, 0, 1, 0)
MinIcon.ZIndex = 11
MinIcon.Font = Library.Theme.TextFont
MinIcon.Text = "-"
MinIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
MinIcon.TextSize = 16

local FloatingIcon = Instance.new("ImageButton")
FloatingIcon.Name = "FloatingIcon"
FloatingIcon.Parent = UILibrary
FloatingIcon.BackgroundTransparency = 1
FloatingIcon.Position = UDim2.new(0, 100, 0, 100)
FloatingIcon.Size = UDim2.new(0, 40, 0, 40)
FloatingIcon.Visible = false
FloatingIcon.ZIndex = 50
FloatingIcon.Image = "rbxassetid://3570695787"
FloatingIcon.ImageColor3 = Library.Theme.MainColor
FloatingIcon.ScaleType = Enum.ScaleType.Slice
FloatingIcon.SliceCenter = Rect.new(100, 100, 100, 100)
FloatingIcon.SliceScale = 0.050

local FloatingText = Instance.new("TextLabel")
FloatingText.Name = "FloatingText"
FloatingText.Parent = FloatingIcon
FloatingText.BackgroundTransparency = 1
FloatingText.Size = UDim2.new(1, 0, 1, 0)
FloatingText.ZIndex = 51
FloatingText.Font = Library.Theme.TextFont
FloatingText.Text = "W"
FloatingText.TextColor3 = Color3.fromRGB(255, 255, 255)
FloatingText.TextSize = 20
local function AutoContrast()
    local color = string.lower(tostring(getgenv().Color))
    if color == "white" then
        FloatingText.TextColor3 = Color3.fromRGB(0, 0, 0)
    elseif color == "black" then
        FloatingText.TextColor3 = Color3.fromRGB(255, 255, 255) 
    else
        FloatingText.TextColor3 = Color3.fromRGB(255, 255, 255)
    end
end

AutoContrast()
if not Library.LibraryColorTable then
    Library.LibraryColorTable = {}
end

table.insert(Library.LibraryColorTable, MinimizeBtn)
table.insert(Library.LibraryColorTable, FloatingIcon)

Minimized = false
local isDragging = false
local ICON_DROP = 64                            -- seberapa jauh ikon diturunkan dari pojok kiri atas window (piksel)
local iconPosition = UDim2.new(0, 14, 0, 120)   -- cadangan; dihitung ulang dari posisi window saat minimize
local iconMoved = false
local windowPosition = nil                        -- posisi window sebelum di-minimize
local originalMainSize

-- ===== Animasi minimize / maximize =====
-- Window mengecil ke posisi ikon sambil memudar (semua isi ikut memudar),
-- dan sebaliknya saat dibuka lagi.
local mainImageTransparency = Main.ImageTransparency
local animBusy = false

-- Satu frame penutup yang memudar menggantikan fade per-elemen (jauh lebih ringan, nggak bikin FPS turun)
local AnimCover = Instance.new("Frame")
AnimCover.Name = "AnimCover"
AnimCover.Parent = Main
AnimCover.BackgroundColor3 = Library.Theme.BackgroundColor
AnimCover.BackgroundTransparency = 1
AnimCover.BorderSizePixel = 0
AnimCover.Size = UDim2.new(1, 0, 1, 0)
AnimCover.ZIndex = 500
AnimCover.Active = false
AnimCover.Visible = false
Instance.new("UICorner", AnimCover).CornerRadius = UDim.new(0, 10)

-- Mengecil/membesar pakai UIScale (tanpa mengubah Size) supaya layout isi window nggak dihitung ulang tiap frame
local MainScale = Instance.new("UIScale")
MainScale.Name = "AnimScale"
MainScale.Scale = 1
MainScale.Parent = Main
local MIN_SCALE = 0.1

local function MaximizeUI()
    if animBusy then return end
    animBusy = true
    Minimized = false

    local t = 0.45
    Main.Visible = true
    Main.Position = iconPosition
    MainScale.Scale = MIN_SCALE
    Main.ImageTransparency = 1
    AnimCover.Visible = true
    AnimCover.BackgroundTransparency = 0

    TweenService:Create(Main, TweenInfo.new(t, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        Position = windowPosition or Main.Position,
        ImageTransparency = mainImageTransparency
    }):Play()
    TweenService:Create(MainScale, TweenInfo.new(t, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        Scale = 1
    }):Play()
    TweenService:Create(AnimCover, TweenInfo.new(t * 0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundTransparency = 1
    }):Play()

    TweenService:Create(FloatingIcon, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 0, 0, 0)
    }):Play()

    task.delay(0.2, function()
        FloatingIcon.Visible = false
        FloatingIcon.Size = UDim2.new(0, 40, 0, 40)
    end)
    task.delay(t, function()
        AnimCover.Visible = false
        animBusy = false
    end)
end

local function MinimizeUI()
    if animBusy or Minimized then return end
    animBusy = true
    Minimized = true

    windowPosition = Main.Position
    if not originalMainSize then
        originalMainSize = Main.Size
    end
    if not iconMoved then
        -- X sama seperti posisi window, tapi diturunkan supaya nggak ketutup menu / voice chat Roblox
        local inset = game:GetService("GuiService"):GetGuiInset()
        iconPosition = UDim2.new(0, math.max(Main.AbsolutePosition.X, 8), 0, Main.AbsolutePosition.Y - inset.Y + ICON_DROP)
    end
    mainImageTransparency = Main.ImageTransparency

    local t = 0.4
    TweenService:Create(Main, TweenInfo.new(t, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
        Position = iconPosition,
        ImageTransparency = 1
    }):Play()
    TweenService:Create(MainScale, TweenInfo.new(t, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
        Scale = MIN_SCALE
    }):Play()
    AnimCover.Visible = true
    AnimCover.BackgroundTransparency = 1
    TweenService:Create(AnimCover, TweenInfo.new(t * 0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundTransparency = 0
    }):Play()

    -- ikon muncul tepat saat window hampir sampai di posisinya
    task.delay(t * 0.6, function()
        FloatingIcon.Position = iconPosition
        FloatingIcon.Size = UDim2.new(0, 0, 0, 0)
        FloatingIcon.Visible = true
        TweenService:Create(FloatingIcon, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 40, 0, 40)
        }):Play()
    end)
    task.delay(t, function()
        Main.Visible = false
        animBusy = false
    end)
end

MinimizeBtn.MouseButton1Click:Connect(function()
    if not Minimized then
        MinimizeUI()
    end
end)

local function MakeDraggableWithTracking(gui)
    local UserInputService = game:GetService("UserInputService")
    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        local newPosition = UDim2.new(
            startPos.X.Scale, 
            startPos.X.Offset + delta.X,
            startPos.Y.Scale, 
            startPos.Y.Offset + delta.Y
        )
        gui.Position = newPosition
        iconPosition = newPosition
        iconMoved = true
    end

    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position
            isDragging = true

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                    isDragging = false
                    
                    if (input.Position - dragStart).Magnitude < 5 then
                        MaximizeUI()
                    end
                end
            end)
        end
    end)

    gui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

MakeDraggableWithTracking(FloatingIcon)

local function CloseAllTabs()
    for i, v in pairs(Tabs:GetChildren()) do
        if v:IsA("Frame") then
            v.Visible = false
        end
    end
end

local TabNormalSize = UDim2.new(1, -16, 0, 28)   -- ukuran tab biasa
local TabBigSize    = UDim2.new(1, -2, 0, 38)    -- ukuran tab yang sedang dibuka (membesar)

local function SetTabVisual(btn, selected, extra)
    local info = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)   -- transisi halus
    local soft = TweenInfo.new(0.25, Library.Theme.EasingStyle, Enum.EasingDirection.Out)
    TweenService:Create(btn, info, {
        Size = selected and TabBigSize or TabNormalSize,
        ImageTransparency = selected and 0.25 or 1,
        ImageColor3 = Color3.fromRGB(58, 58, 66)
    }):Play()
    local title = btn:FindFirstChild("Title")
    if title then
        TweenService:Create(title, info, { TextSize = selected and 18 or 15 }):Play()
        TweenService:Create(title, soft, { TextTransparency = selected and 0 or 0.45 }):Play()
    end
    local tabIcon = btn:FindFirstChild("Icon")
    if tabIcon then
        TweenService:Create(tabIcon, soft, { ImageTransparency = selected and 0 or 0.45 }):Play()
    end
    local accent = btn:FindFirstChild("Accent")
    if accent then
        TweenService:Create(accent, info, {
            BackgroundTransparency = selected and 0 or 1,
            Size = selected and UDim2.new(0, 3, 0, 22) or UDim2.new(0, 3, 0, 12),
            Position = selected and UDim2.new(0, 5, 0.5, -11) or UDim2.new(0, 5, 0.5, -6)
        }):Play()
    end
end

local function ResetAllTabButtons()
    for i, v in pairs(TabScrollingFrame:GetChildren()) do
        if v:IsA("ImageButton") then
            SetTabVisual(v, false)
        end
    end
end

local function KeepFirstTabOpen()
    for i, v in pairs(Tabs:GetChildren()) do
        if v:IsA("Frame") then
            if v.Name == (Library.FirstTab .. "Tab") then
                v.Visible = true
            else
                v.Visible = false
            end
        end

        for i, v in pairs(TabScrollingFrame:GetChildren()) do
            if v:IsA("ImageButton") then
                if v.Name:find(Library.FirstTab .. "TabButton") then
                    SetTabVisual(v, true)
                else
                    SetTabVisual(v, false)
                end
            end
        end
    end
end

local function ToggleUI()
    Library.UIOpen = not Library.UIOpen
            
    if Library.UIOpen then
        TweenService:Create(Main, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(0, Layout.W, 0, 0)}):Play()
        TweenService:Create(Border, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
    elseif not Library.UIOpen then
        TweenService:Create(Main, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(0, Layout.W, 0, Layout.H)}):Play()
        TweenService:Create(Border, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
    end
end

coroutine.wrap(function()
    while wait() do
        Library.RainbowColorValue = Library.RainbowColorValue + 1/255
        Library.HueSelectionPosition = Library.HueSelectionPosition + 1

        if Library.RainbowColorValue >= 1 then
            Library.RainbowColorValue = 0
        end

        if Library.HueSelectionPosition == 105 then
            Library.HueSelectionPosition = 0
        end
    end
end)()
-- ===== Icon library (Lucide, gaya Fluent) =====
-- Pemakaian: Library:CreateTab("Main", "user")  -> otomatis cari icon "user"
-- Bisa juga "lucide-user", "rbxassetid://123", atau angka ID langsung.
local IconData = [[
accessibility=10709751939,activity=10709752035,air-vent=10709752131,airplay=10709752254,
alarm-check=10709752405,alarm-clock=10709752630,alarm-clock-off=10709752508,alarm-minus=10709752732,
alarm-plus=10709752825,album=10709752906,alert-circle=10709752996,alert-octagon=10709753064,
alert-triangle=10709753149,align-center=10709753570,align-center-horizontal=10709753272,
align-center-vertical=10709753421,align-end-horizontal=10709753692,align-end-vertical=10709753808,
align-horizontal-distribute-center=10747779791,align-horizontal-distribute-end=10747784534,
align-horizontal-distribute-start=10709754118,align-horizontal-justify-center=10709754204,
align-horizontal-justify-end=10709754317,align-horizontal-justify-start=10709754436,
align-horizontal-space-around=10709754590,align-horizontal-space-between=10709754749,align-justify=10709759610,
align-left=10709759764,align-right=10709759895,align-start-horizontal=10709760051,
align-start-vertical=10709760244,align-vertical-distribute-center=10709760351,
align-vertical-distribute-end=10709760434,align-vertical-distribute-start=10709760612,
align-vertical-justify-center=10709760814,align-vertical-justify-end=10709761003,
align-vertical-justify-start=10709761176,align-vertical-space-around=10709761324,
align-vertical-space-between=10709761434,anchor=10709761530,angry=10709761629,annoyed=10709761722,
aperture=10709761813,apple=10709761889,archive=10709762233,archive-restore=10709762058,armchair=10709762327,
arrow-big-down=10747796644,arrow-big-left=10709762574,arrow-big-right=10709762727,arrow-big-up=10709762879,
arrow-down=10709767827,arrow-down-circle=10709763034,arrow-down-left=10709767656,arrow-down-right=10709767750,
arrow-left=10709768114,arrow-left-circle=10709767936,arrow-left-right=10709768019,arrow-right=10709768347,
arrow-right-circle=10709768226,arrow-up=10709768939,arrow-up-circle=10709768432,arrow-up-down=10709768538,
arrow-up-left=10709768661,arrow-up-right=10709768787,asterisk=10709769095,at-sign=10709769286,
award=10709769406,axe=10709769508,axis-3d=10709769598,baby=10709769732,backpack=10709769841,
baggage-claim=10709769935,banana=10709770005,banknote=10709770178,bar-chart=10709773755,
bar-chart-2=10709770317,bar-chart-3=10709770431,bar-chart-4=10709770560,bar-chart-horizontal=10709773669,
barcode=10747360675,baseline=10709773863,bath=10709773963,battery=10709774640,battery-charging=10709774068,
battery-full=10709774206,battery-low=10709774370,battery-medium=10709774513,beaker=10709774756,bed=10709775036,
bed-double=10709774864,bed-single=10709774968,beer=10709775167,bell=10709775704,bell-minus=10709775241,
bell-off=10709775320,bell-plus=10709775448,bell-ring=10709775560,bike=10709775894,binary=10709776050,
bitcoin=10709776126,bluetooth=10709776655,bluetooth-connected=10709776240,bluetooth-off=10709776344,
bluetooth-searching=10709776501,bold=10747813908,bomb=10709781460,bone=10709781605,book=10709781824,
book-open=10709781717,bookmark=10709782154,bookmark-minus=10709781919,bookmark-plus=10709782044,
bot=10709782230,box=10709782497,box-select=10709782342,boxes=10709782582,briefcase=10709782662,
brush=10709782758,bug=10709782845,building=10709783051,building-2=10709782939,bus=10709783137,cake=10709783217,
calculator=10709783311,calendar=10709789505,calendar-check=10709783474,calendar-check-2=10709783392,
calendar-clock=10709783577,calendar-days=10709783673,calendar-heart=10709783835,calendar-minus=10709783959,
calendar-off=10709788784,calendar-plus=10709788937,calendar-range=10709789053,calendar-search=10709789200,
calendar-x=10709789407,calendar-x-2=10709789329,camera=10709789686,camera-off=10747822677,car=10709789810,
carrot=10709789960,cast=10709790097,charge=10709790202,check=10709790644,check-circle=10709790387,
check-circle-2=10709790298,check-square=10709790537,chef-hat=10709790757,cherry=10709790875,
chevron-down=10709790948,chevron-first=10709791015,chevron-last=10709791130,chevron-left=10709791281,
chevron-right=10709791437,chevron-up=10709791523,chevrons-down=10709796864,chevrons-down-up=10709791632,
chevrons-left=10709797151,chevrons-left-right=10709797006,chevrons-right=10709797382,
chevrons-right-left=10709797274,chevrons-up=10709797622,chevrons-up-down=10709797508,chrome=10709797725,
circle=10709798174,circle-dot=10709797837,circle-ellipsis=10709797985,circle-slashed=10709798100,
citrus=10709798276,clapperboard=10709798350,clipboard=10709799288,clipboard-check=10709798443,
clipboard-copy=10709798574,clipboard-edit=10709798682,clipboard-list=10709798792,
clipboard-signature=10709798890,clipboard-type=10709798999,clipboard-x=10709799124,clock=10709805144,
clock-1=10709799535,clock-10=10709799718,clock-11=10709799818,clock-12=10709799962,clock-2=10709803876,
clock-3=10709803989,clock-4=10709804164,clock-5=10709804291,clock-6=10709804435,clock-7=10709804599,
clock-8=10709804784,clock-9=10709804996,cloud=10709806740,cloud-cog=10709805262,cloud-drizzle=10709805371,
cloud-fog=10709805477,cloud-hail=10709805596,cloud-lightning=10709805727,cloud-moon=10709805942,
cloud-moon-rain=10709805838,cloud-off=10709806060,cloud-rain=10709806277,cloud-rain-wind=10709806166,
cloud-snow=10709806374,cloud-sun=10709806631,cloud-sun-rain=10709806475,cloudy=10709806859,clover=10709806995,
code=10709810463,code-2=10709807111,codepen=10709810534,codesandbox=10709810676,coffee=10709810814,
cog=10709810948,coins=10709811110,columns=10709811261,command=10709811365,compass=10709811445,
component=10709811595,concierge-bell=10709811706,connection=10747361219,contact=10709811834,
contrast=10709811939,cookie=10709812067,copy=10709812159,copyleft=10709812251,copyright=10709812311,
corner-down-left=10709812396,corner-down-right=10709812485,corner-left-down=10709812632,
corner-left-up=10709812784,corner-right-down=10709812939,corner-right-up=10709813094,
corner-up-left=10709813185,corner-up-right=10709813281,cpu=10709813383,croissant=10709818125,crop=10709818245,
cross=10709818399,crosshair=10709818534,crown=10709818626,cup-soda=10709818763,curly-braces=10709818847,
currency=10709818931,database=10709818996,delete=10709819059,diamond=10709819149,dice-1=10709819266,
dice-2=10709819361,dice-3=10709819508,dice-4=10709819670,dice-5=10709819801,dice-6=10709819896,
dices=10723343321,diff=10723343416,disc=10723343537,divide=10723343805,divide-circle=10723343636,
divide-square=10723343737,dollar-sign=10723343958,download=10723344270,download-cloud=10723344088,
droplet=10723344432,droplets=10734883356,drumstick=10723344737,edit=10734883598,edit-2=10723344885,
edit-3=10723345088,egg=10723345518,egg-fried=10723345347,electricity=10723345749,electricity-off=10723345643,
equal=10723345990,equal-not=10723345866,eraser=10723346158,euro=10723346372,expand=10723346553,
external-link=10723346684,eye=10723346959,eye-off=10723346871,factory=10723347051,fan=10723354359,
fast-forward=10723354521,feather=10723354671,figma=10723354801,file=10723374641,file-archive=10723354921,
file-audio=10723355148,file-audio-2=10723355026,file-axis-3d=10723355272,file-badge=10723355622,
file-badge-2=10723355451,file-bar-chart=10723355887,file-bar-chart-2=10723355746,file-box=10723355989,
file-check=10723356210,file-check-2=10723356100,file-clock=10723356329,file-code=10723356507,
file-cog=10723356830,file-cog-2=10723356676,file-diff=10723357039,file-digit=10723357151,file-down=10723357322,
file-edit=10723357495,file-heart=10723357637,file-image=10723357790,file-input=10723357933,
file-json=10723364435,file-json-2=10723364361,file-key=10723364605,file-key-2=10723364515,
file-line-chart=10723364725,file-lock=10723364957,file-lock-2=10723364861,file-minus=10723365254,
file-minus-2=10723365086,file-output=10723365457,file-pie-chart=10723365598,file-plus=10723365877,
file-plus-2=10723365766,file-question=10723365987,file-scan=10723366167,file-search=10723366550,
file-search-2=10723366340,file-signature=10723366741,file-spreadsheet=10723366962,file-symlink=10723367098,
file-terminal=10723367244,file-text=10723367380,file-type=10723367606,file-type-2=10723367509,
file-up=10723367734,file-video=10723373884,file-video-2=10723367834,file-volume=10723374172,
file-volume-2=10723374030,file-warning=10723374276,file-x=10723374544,file-x-2=10723374378,files=10723374759,
film=10723374981,filter=10723375128,fingerprint=10723375250,flag=10723375890,flag-off=10723375443,
flag-triangle-left=10723375608,flag-triangle-right=10723375727,flame=10723376114,flashlight=10723376471,
flashlight-off=10723376365,flask-conical=10734883986,flask-round=10723376614,flip-horizontal=10723376884,
flip-horizontal-2=10723376745,flip-vertical=10723377138,flip-vertical-2=10723377026,flower=10747830374,
flower-2=10723377305,focus=10723377537,folder=10723387563,folder-archive=10723384478,folder-check=10723384605,
folder-clock=10723384731,folder-closed=10723384893,folder-cog=10723385213,folder-cog-2=10723385036,
folder-down=10723385338,folder-edit=10723385445,folder-heart=10723385545,folder-input=10723385721,
folder-key=10723385848,folder-lock=10723386005,folder-minus=10723386127,folder-open=10723386277,
folder-output=10723386386,folder-plus=10723386531,folder-search=10723386787,folder-search-2=10723386674,
folder-symlink=10723386930,folder-tree=10723387085,folder-up=10723387265,folder-x=10723387448,
folders=10723387721,form-input=10723387841,forward=10723388016,frame=10723394389,framer=10723394565,
frown=10723394681,fuel=10723394846,function-square=10723395041,gamepad=10723395457,gamepad-2=10723395215,
gauge=10723395708,gavel=10723395896,gem=10723396000,ghost=10723396107,gift=10723396402,gift-card=10723396225,
git-branch=10723396676,git-branch-plus=10723396542,git-commit=10723396812,git-compare=10723396954,
git-fork=10723397049,git-merge=10723397165,git-pull-request=10723397431,git-pull-request-closed=10723397268,
git-pull-request-draft=10734884302,glass=10723397788,glass-2=10723397529,glass-water=10723397678,
glasses=10723397895,globe=10723404337,globe-2=10723398002,grab=10723404472,graduation-cap=10723404691,
grape=10723404822,grid=10723404936,grip-horizontal=10723405089,grip-vertical=10723405236,hammer=10723405360,
hand=10723405649,hand-metal=10723405508,hard-drive=10723405749,hard-hat=10723405859,hash=10723405975,
haze=10723406078,headphones=10723406165,heart=10723406885,heart-crack=10723406299,heart-handshake=10723406480,
heart-off=10723406662,heart-pulse=10723406795,help-circle=10723406988,hexagon=10723407092,
highlighter=10723407192,history=10723407335,home=10723407389,hourglass=10723407498,ice-cream=10723414308,
image=10723415040,image-minus=10723414487,image-off=10723414677,image-plus=10723414827,import=10723415205,
inbox=10723415335,indent=10723415494,indian-rupee=10723415642,infinity=10723415766,info=10723415903,
inspect=10723416057,italic=10723416195,japanese-yen=10723416363,joystick=10723416527,key=10723416652,
keyboard=10723416765,lamp=10723417513,lamp-ceiling=10723416922,lamp-desk=10723417016,lamp-floor=10723417131,
lamp-wall-down=10723417240,lamp-wall-up=10723417356,landmark=10723417608,languages=10723417703,
laptop=10723423881,laptop-2=10723417797,lasso=10723424235,lasso-select=10723424058,laugh=10723424372,
layers=10723424505,layout=10723425376,layout-dashboard=10723424646,layout-grid=10723424838,
layout-list=10723424963,layout-template=10723425187,leaf=10723425539,library=10723425615,life-buoy=10723425685,
lightbulb=10723425852,lightbulb-off=10723425762,line-chart=10723426393,link=10723426722,link-2=10723426595,
link-2-off=10723426513,list=10723433811,list-checks=10734884548,list-end=10723426886,list-minus=10723426986,
list-music=10723427081,list-ordered=10723427199,list-plus=10723427334,list-start=10723427494,
list-video=10723427619,list-x=10723433655,loader=10723434070,loader-2=10723433935,locate=10723434557,
locate-fixed=10723434236,locate-off=10723434379,lock=10723434711,log-in=10723434830,log-out=10723434906,
luggage=10723434993,magnet=10723435069,mail=10734885430,mail-check=10723435182,mail-minus=10723435261,
mail-open=10723435342,mail-plus=10723435443,mail-question=10723435515,mail-search=10734884739,
mail-warning=10734885015,mail-x=10734885247,mails=10734885614,map=10734886202,map-pin=10734886004,
map-pin-off=10734885803,maximize=10734886735,maximize-2=10734886496,medal=10734887072,megaphone=10734887454,
megaphone-off=10734887311,meh=10734887603,menu=10734887784,message-circle=10734888000,
message-square=10734888228,mic=10734888864,mic-2=10734888430,mic-off=10734888646,microscope=10734889106,
microwave=10734895076,milestone=10734895310,minimize=10734895698,minimize-2=10734895530,minus=10734896206,
minus-circle=10734895856,minus-square=10734896029,monitor=10734896881,monitor-off=10734896360,
monitor-speaker=10734896512,moon=10734897102,more-horizontal=10734897250,more-vertical=10734897387,
mountain=10734897956,mountain-snow=10734897665,mouse=10734898592,mouse-pointer=10734898476,
mouse-pointer-2=10734898194,mouse-pointer-click=10734898355,move=10734900011,move-3d=10734898756,
move-diagonal=10734899164,move-diagonal-2=10734898934,move-horizontal=10734899414,move-vertical=10734899821,
music=10734905958,music-2=10734900215,music-3=10734905665,music-4=10734905823,navigation=10734906744,
navigation-2=10734906332,navigation-2-off=10734906144,navigation-off=10734906580,network=10734906975,
newspaper=10734907168,octagon=10734907361,option=10734907649,outdent=10734907933,package=10734909540,
package-2=10734908151,package-check=10734908384,package-minus=10734908626,package-open=10734908793,
package-plus=10734909016,package-search=10734909196,package-x=10734909375,paint-bucket=10734909847,
paintbrush=10734910187,paintbrush-2=10734910030,palette=10734910430,palmtree=10734910680,paperclip=10734910927,
party-popper=10734918735,pause=10734919336,pause-circle=10735024209,pause-octagon=10734919143,
pen-tool=10734919503,pencil=10734919691,percent=10734919919,person-standing=10734920149,phone=10734921524,
phone-call=10734920305,phone-forwarded=10734920508,phone-incoming=10734920694,phone-missed=10734920845,
phone-off=10734921077,phone-outgoing=10734921288,pie-chart=10734921727,piggy-bank=10734921935,pin=10734922324,
pin-off=10734922180,pipette=10734922497,pizza=10734922774,plane=10734922971,play=10734923549,
play-circle=10734923214,plus=10734924532,plus-circle=10734923868,plus-square=10734924219,podcast=10734929553,
pointer=10734929723,pound-sterling=10734929981,power=10734930466,power-off=10734930257,printer=10734930632,
puzzle=10734930886,quote=10734931234,radio=10734931596,radio-receiver=10734931402,
rectangle-horizontal=10734931777,rectangle-vertical=10734932081,recycle=10734932295,redo=10734932822,
redo-2=10734932586,refresh-ccw=10734933056,refresh-cw=10734933222,refrigerator=10734933465,regex=10734933655,
repeat=10734933966,repeat-1=10734933826,reply=10734934252,reply-all=10734934132,rewind=10734934347,
rocket=10734934585,rocking-chair=10734939942,rotate-3d=10734940107,rotate-ccw=10734940376,
rotate-cw=10734940654,rss=10734940825,ruler=10734941018,russian-ruble=10734941199,sailboat=10734941354,
save=10734941499,scale=10734941912,scale-3d=10734941739,scaling=10734942072,scan=10734942565,
scan-face=10734942198,scan-line=10734942351,scissors=10734942778,screen-share=10734943193,
screen-share-off=10734942967,scroll=10734943448,search=10734943674,send=10734943902,
separator-horizontal=10734944115,separator-vertical=10734944326,server=10734949856,server-cog=10734944444,
server-crash=10734944554,server-off=10734944668,settings=10734950309,settings-2=10734950020,share=10734950813,
share-2=10734950553,sheet=10734951038,shield=10734951847,shield-alert=10734951173,shield-check=10734951367,
shield-close=10734951535,shield-off=10734951684,shirt=10734952036,shopping-bag=10734952273,
shopping-cart=10734952479,shovel=10734952773,shower-head=10734952942,shrink=10734953073,shrub=10734953241,
shuffle=10734953451,sidebar=10734954301,sidebar-close=10734953715,sidebar-open=10734954000,sigma=10734954538,
signal=10734961133,signal-high=10734954807,signal-low=10734955080,signal-medium=10734955336,
signal-zero=10734960878,siren=10734961284,skip-back=10734961526,skip-forward=10734961809,skull=10734962068,
slack=10734962339,slash=10734962600,slice=10734963024,sliders=10734963400,sliders-horizontal=10734963191,
smartphone=10734963940,smartphone-charging=10734963671,smile=10734964441,smile-plus=10734964188,
snowflake=10734964600,sofa=10734964852,sort-asc=10734965115,sort-desc=10734965287,speaker=10734965419,
sprout=10734965572,square=10734965702,star=10734966248,star-half=10734965897,star-off=10734966097,
stethoscope=10734966384,sticker=10734972234,sticky-note=10734972463,stop-circle=10734972621,
stretch-horizontal=10734972862,stretch-vertical=10734973130,strikethrough=10734973290,subscript=10734973457,
sun=10734974297,sun-dim=10734973645,sun-medium=10734973778,sun-moon=10734973999,sun-snow=10734974130,
sunrise=10734974522,sunset=10734974689,superscript=10734974850,swiss-franc=10734975024,
switch-camera=10734975214,sword=10734975486,swords=10734975692,syringe=10734975932,table=10734976230,
table-2=10734976097,tablet=10734976394,tag=10734976528,tags=10734976739,target=10734977012,tent=10734981750,
terminal=10734982144,terminal-square=10734981995,text-cursor=10734982395,text-cursor-input=10734982297,
thermometer=10734983134,thermometer-snowflake=10734982571,thermometer-sun=10734982771,thumbs-down=10734983359,
thumbs-up=10734983629,ticket=10734983868,timer=10734984606,timer-off=10734984138,timer-reset=10734984355,
toggle-left=10734984834,toggle-right=10734985040,tornado=10734985247,toy-brick=10747361919,train=10747362105,
trash=10747362393,trash-2=10747362241,tree-deciduous=10747362534,tree-pine=10747362748,trees=10747363016,
trending-down=10747363205,trending-up=10747363465,triangle=10747363621,trophy=10747363809,truck=10747364031,
tv=10747364593,tv-2=10747364302,type=10747364761,umbrella=10747364971,underline=10747365191,undo=10747365484,
undo-2=10747365359,unlink=10747365771,unlink-2=10747397871,unlock=10747366027,upload=10747366434,
upload-cloud=10747366266,usb=10747366606,user=10747373176,user-check=10747371901,user-cog=10747372167,
user-minus=10747372346,user-plus=10747372702,user-x=10747372992,users=10747373426,utensils=10747373821,
utensils-crossed=10747373629,venetian-mask=10747374003,verified=10747374131,vibrate=10747374489,
vibrate-off=10747374269,video=10747374938,video-off=10747374721,view=10747375132,voicemail=10747375281,
volume=10747376008,volume-1=10747375450,volume-2=10747375679,volume-x=10747375880,wallet=10747376205,
wand=10747376565,wand-2=10747376349,watch=10747376722,waves=10747376931,webcam=10747381992,wifi=10747382504,
wifi-off=10747382268,wind=10747382750,wrap-text=10747383065,wrench=10747383470,x=10747384394,
x-circle=10747383819,x-octagon=10747384037,x-square=10747384217,zoom-in=10747384552,zoom-out=10747384679
]]
local IconAssets = {}
for name, id in IconData:gmatch("([%w%-]+)=(%d+)") do
    IconAssets[name] = "rbxassetid://" .. id
end
local IconNames = {}
for name in pairs(IconAssets) do table.insert(IconNames, name) end
table.sort(IconNames)

-- nama umum yang nggak ada di Lucide -> icon terdekat
local IconAliases = {
    player = "user", players = "users", profile = "user", account = "user",
    main = "home", home = "home", general = "home", settings = "settings", setting = "settings",
    config = "settings", configs = "settings", options = "sliders", misc = "layout-grid",
    esp = "eye", visual = "eye", visuals = "eye", vision = "eye",
    aim = "crosshair", aimbot = "crosshair", combat = "swords", fight = "swords", pvp = "swords",
    farm = "sprout", farming = "sprout", auto = "refresh-cw", automation = "refresh-cw",
    teleport = "navigation", tp = "navigation", movement = "move", world = "globe",
    info = "info", about = "info", credits = "heart", discord = "message-circle",
    script = "code", scripts = "code", exploit = "bug", dev = "terminal", debug = "bug",
    shop = "shopping-cart", store = "shopping-bag", money = "dollar-sign", stats = "bar-chart",
    ui = "layout", theme = "palette", themes = "palette", color = "palette", colors = "palette",
    keybind = "keyboard", keybinds = "keyboard", bind = "keyboard", security = "shield",
    weapon = "sword", weapons = "sword", gun = "crosshair", item = "package", items = "package",
    inventory = "backpack", pet = "heart", pets = "heart", boss = "skull", dungeon = "skull",
    quest = "scroll", quests = "scroll", map = "map", server = "server", hop = "server",
}

local function ResolveIcon(icon)
    if icon == nil or icon == false or icon == "" then return nil end
    local s = tostring(icon)
    if s:match("^%d+$") then return "rbxassetid://" .. s end
    if s:match("^rbxassetid://") or s:match("^rbxasset://") or s:match("^https?://") then return s end

    local key = s:lower():gsub("^lucide[%-_ ]", ""):gsub("[%s_]+", "-")
    if IconAssets[key] then return IconAssets[key] end                       -- cocok persis
    if IconAliases[key] and IconAssets[IconAliases[key]] then               -- alias umum
        return IconAssets[IconAliases[key]]
    end
    for _, n in ipairs(IconNames) do                                          -- diawali kata itu
        if n:sub(1, #key) == key then return IconAssets[n] end
    end
    for _, n in ipairs(IconNames) do                                          -- mengandung kata itu
        if n:find(key, 1, true) then return IconAssets[n] end
    end
    warn("[Rndm] Icon '" .. s .. "' nggak ketemu")
    return nil
end
Library.ResolveIcon = ResolveIcon
-- ===== end Icon library =====

-- Library:CreateTab("Nama", "user")  -> icon dicari otomatis dari nama (atau rbxassetid / angka ID)
function Library:CreateTab(name, icon)
    local NameTab = Instance.new("Frame")
    local NameTabButton = Instance.new("ImageButton")
    local Title = Instance.new("TextLabel")
    local SectionLayout = Instance.new("UIListLayout")
    local SectionPadding = Instance.new("UIPadding")

    local gameId = tostring(game.PlaceId)
    local TabElements = { GameId = gameId }
    Library.TabCount = Library.TabCount + 1

    if Library.TabCount == 1 then
        Library.FirstTab = name
    end

    NameTab.Name = (name .. "Tab")
    NameTab.Parent = Tabs
    NameTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NameTab.BackgroundTransparency = 1.000
    NameTab.Size = UDim2.new(1, 0, 1, 0)
    NameTab.ZIndex = 2
    NameTab.ClipsDescendants = true
    NameTab.Position = UDim2.new(0, 0, 0, 14)

    NameTabButton.Name = (name .. "TabButton")
    NameTabButton.Parent = TabScrollingFrame
    NameTabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NameTabButton.BackgroundTransparency = 1.000
    NameTabButton.Size = TabNormalSize
    NameTabButton.ZIndex = 2
    NameTabButton.Image = "rbxassetid://3570695787"
    NameTabButton.ImageColor3 = Color3.fromRGB(58, 58, 66)
    NameTabButton.ImageTransparency = 1
    NameTabButton.ScaleType = Enum.ScaleType.Slice
    NameTabButton.SliceCenter = Rect.new(100, 100, 100, 100)
    NameTabButton.SliceScale = 0.050

    Title.Name = "Title"
    Title.Parent = NameTabButton
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    local iconId = ResolveIcon(icon)
    local hasIcon = iconId ~= nil
    Title.Position = UDim2.new(0, hasIcon and 38 or 16, 0, 0)
    Title.Size = UDim2.new(1, hasIcon and -42 or -20, 1, 0)
    Title.TextTransparency = 0.45
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.TextTruncate = Enum.TextTruncate.AtEnd
    Title.ZIndex = 2
    Title.Font = Library.Theme.TextFont
    Title.Text = name
    Title.TextColor3 = Library.Theme.TextColor
    table.insert(Library.LibraryColorTable, Title) 
    Title.TextSize = 15.000

    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 6)
    TabCorner.Parent = NameTabButton

    if hasIcon then
        local TabIcon = Instance.new("ImageLabel")
        TabIcon.Name = "Icon"
        TabIcon.Parent = NameTabButton
        TabIcon.BackgroundTransparency = 1
        TabIcon.AnchorPoint = Vector2.new(0, 0.5)
        TabIcon.Position = UDim2.new(0, 14, 0.5, 0)
        TabIcon.Size = UDim2.new(0, 18, 0, 18)
        TabIcon.ZIndex = 3
        TabIcon.Image = iconId
        TabIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
        TabIcon.ImageTransparency = 0.45
        TabIcon.ScaleType = Enum.ScaleType.Fit
    end

    local Accent = Instance.new("Frame")
    Accent.Name = "Accent"
    Accent.Parent = NameTabButton
    Accent.BackgroundColor3 = Library.Theme.MainColor
    Accent.BackgroundTransparency = 1
    Accent.BorderSizePixel = 0
    Accent.Position = UDim2.new(0, 5, 0.5, -8)
    Accent.Size = UDim2.new(0, 3, 0, 16)
    Accent.ZIndex = 3
    local AccentCorner = Instance.new("UICorner")
    AccentCorner.CornerRadius = UDim.new(1, 0)
    AccentCorner.Parent = Accent

    local SectionScrollingFrame = Instance.new("ScrollingFrame")
    SectionScrollingFrame.Name = "SectionScrollingFrame"
    SectionScrollingFrame.Parent = NameTab
    SectionScrollingFrame.BackgroundTransparency = 1
    SectionScrollingFrame.BorderSizePixel = 0
    SectionScrollingFrame.Active = true
    SectionScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(110, 110, 110)
    SectionScrollingFrame.Position = UDim2.new(0, 0, 0, 0)
    SectionScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
    SectionScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    SectionScrollingFrame.ScrollBarThickness = 4
    SectionScrollingFrame.ElasticBehavior = Enum.ElasticBehavior.Always
    SectionScrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y
    SectionScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    SectionScrollingFrame.ClipsDescendants = true
    SectionLayout.Name = "SectionLayout"
    SectionLayout.Parent = SectionScrollingFrame
    SectionLayout.FillDirection = Enum.FillDirection.Vertical
    SectionLayout.SortOrder = Enum.SortOrder.LayoutOrder
    SectionLayout.Padding = UDim.new(0, 12)

    SectionPadding.Name = "SectionPadding"
    SectionPadding.Parent = SectionScrollingFrame
    SectionPadding.PaddingTop = UDim.new(0, 4)
    SectionPadding.PaddingLeft = UDim.new(0, 4)
    SectionPadding.PaddingRight = UDim.new(0, 8)
    SectionPadding.PaddingBottom = UDim.new(0, 4)

    local PageTitle = Instance.new("TextLabel")
    PageTitle.Name = "PageTitle"
    PageTitle.Parent = SectionScrollingFrame
    PageTitle.BackgroundTransparency = 1
    PageTitle.LayoutOrder = 0
    PageTitle.Size = UDim2.new(1, 0, 0, 30)
    PageTitle.ZIndex = 4
    PageTitle.Font = Library.Theme.TextFont
    PageTitle.Text = name
    PageTitle.TextColor3 = Library.Theme.TextColor
    PageTitle.TextSize = 26
    PageTitle.TextXAlignment = Enum.TextXAlignment.Left
    table.insert(Library.LibraryColorTable, PageTitle)

    local sectionOrder = 0

    NameTab.Visible = false


    local originalSize = NameTabButton.Size
    local smallSize = TabBigSize

NameTabButton.MouseButton1Down:Connect(function()
    if CloseAllTabs and type(CloseAllTabs) == "function" then 
        CloseAllTabs() 
    else
        for _, v in pairs(Tabs:GetChildren()) do
            if v:IsA("Frame") then 
                v.Visible = false 
                v.Position = UDim2.new(0, 0, 0, 0)
            end
        end
    end
    
    if ResetAllTabButtons and type(ResetAllTabButtons) == "function" then 
        ResetAllTabButtons() 
    else
        for _, v in pairs(TabButtons:GetChildren()) do
            if v:IsA("ImageButton") then
                SetTabVisual(v, false)
            end
        end
    end
    
    NameTab.Position = UDim2.new(0, 0, 0, 14)
    NameTab.Visible = true
    
    for _, child in pairs(NameTab:GetChildren()) do
        if child:IsA("ImageLabel") and child.Name:match("Section$") then
            child.ImageTransparency = 1
            child.ImageColor3 = Library.Theme.MainColor
            
            TweenService:Create(child, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {
                ImageTransparency = 0,
                ImageColor3 = Library.Theme.BackgroundColor
            }):Play()
        end
    end
    
    SetTabVisual(NameTabButton, true, { Size = smallSize })
    TweenService:Create(NameTab, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {
        Position = UDim2.new(0, 0, 0, 0)
    }):Play()
end)

    ResetAllTabButtons = function()
    for _, v in pairs(TabScrollingFrame:GetChildren()) do
        if v:IsA("ImageButton") then
            SetTabVisual(v, false, { Size = originalSize })
        end
    end
end

local function ShowFirstTab()
    if NameTab.Name == (Library.FirstTab .. "Tab") then
        NameTab.Visible = true
        SetTabVisual(NameTabButton, true, { Size = smallSize })
        
        TweenService:Create(NameTab, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {
            Position = UDim2.new(0, 0, 0, 0)
        }):Play()
    end
end

    task.wait(0.1)
ShowFirstTab()
task.wait(0.1)  
if NameTab.Name == (Library.FirstTab .. "Tab") then
    for _, child in pairs(NameTab:GetChildren()) do
        if child:IsA("ImageLabel") and child.Name:match("Section$") then
            child.ImageTransparency = 1
            child.ImageColor3 = Library.Theme.MainColor
            child.Position = UDim2.new(0, 0, -0.5, 0)
            child.Size = UDim2.new(1, 0, 0, 0)
            if child.Name == "SectionBorder" then
                child.Position = UDim2.new(0, 0, 0, 0)
            end
            TweenService:Create(child, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {
                Position = UDim2.new(0, 0, 0, 0),
                Size = UDim2.new(1, 0, 0, 181),
                ImageTransparency = 0,
                ImageColor3 = Library.Theme.BackgroundColor
            }):Play()
        end
    end
end

  

function TabElements:CreateSection(name)
    local NameSection = Instance.new("Frame")
    local SectionTitle = Instance.new("TextLabel")
    local SectionContent = Instance.new("Frame")
    local SectionContentLayout = Instance.new("UIListLayout")

    local SectionElements = { GameId = self.GameId }

    sectionOrder = sectionOrder + 1

    -- Section = judul di atas + daftar elemen memanjang ke bawah (gaya Fluent)
    NameSection.Name = (name .. "Section")
    NameSection.Parent = SectionScrollingFrame
    NameSection.BackgroundTransparency = 1
    NameSection.LayoutOrder = sectionOrder
    NameSection.Size = UDim2.new(1, 0, 0, 34)
    NameSection.ZIndex = 4

    SectionTitle.Name = "SectionTitle"
    SectionTitle.Parent = NameSection
    SectionTitle.BackgroundTransparency = 1
    SectionTitle.Position = UDim2.new(0, 11, 0, 0)
    SectionTitle.Size = UDim2.new(1, -11, 0, 22)
    SectionTitle.ZIndex = 4
    SectionTitle.Font = Library.Theme.TextFont
    SectionTitle.Text = name
    SectionTitle.TextColor3 = Library.Theme.TextColor
    SectionTitle.TextSize = 20
    SectionTitle.TextXAlignment = Enum.TextXAlignment.Left
    table.insert(Library.LibraryColorTable, SectionTitle)

    SectionContent.Name = "SectionContent"
    SectionContent.Parent = NameSection
    SectionContent.BackgroundTransparency = 1
    SectionContent.BorderSizePixel = 0
    SectionContent.Position = UDim2.new(0, 0, 0, 30)

    local HeaderBar = Instance.new("Frame")
    HeaderBar.Name = "HeaderBar"
    HeaderBar.Parent = NameSection
    HeaderBar.BackgroundColor3 = Library.Theme.MainColor
    HeaderBar.BorderSizePixel = 0
    HeaderBar.Position = UDim2.new(0, 1, 0, 4)
    HeaderBar.Size = UDim2.new(0, 4, 0, 15)
    HeaderBar.ZIndex = 4
    Instance.new("UICorner", HeaderBar).CornerRadius = UDim.new(1, 0)

    local HeaderLine = Instance.new("Frame")
    HeaderLine.Name = "HeaderLine"
    HeaderLine.Parent = NameSection
    HeaderLine.BackgroundColor3 = Color3.fromRGB(120, 120, 130)
    HeaderLine.BackgroundTransparency = 0.7
    HeaderLine.BorderSizePixel = 0
    HeaderLine.Position = UDim2.new(0, 0, 0, 25)
    HeaderLine.Size = UDim2.new(1, 0, 0, 1)
    HeaderLine.ZIndex = 4
    SectionContent.Size = UDim2.new(1, 0, 0, 0)
    SectionContent.ZIndex = 4

    SectionContentLayout.Name = "SectionContentLayout"
    SectionContentLayout.Parent = SectionContent
    SectionContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    SectionContentLayout.Padding = UDim.new(0, 3)

    -- Tinggi section otomatis mengikuti isinya (dropdown dibuka -> section ikut turun)
    local function ResizeSection()
        local h = SectionContentLayout.AbsoluteContentSize.Y
        SectionContent.Size = UDim2.new(1, 0, 0, h)
        NameSection.Size = UDim2.new(1, 0, 0, h + 34)
    end
    SectionContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(ResizeSection)

    -- Setiap elemen otomatis jadi "kartu" bulat seperti Fluent
    SectionContent.ChildAdded:Connect(function(child)
        task.defer(function()
            if child:IsA("Frame") and not child.Name:match("_ImageHolder$") and not child.Name:match("Button$") then
                child.BackgroundColor3 = Color3.fromRGB(46, 46, 52)
                child.BackgroundTransparency = 0.45
                local corner = Instance.new("UICorner")
                corner.CornerRadius = UDim.new(0, 6)
                corner.Parent = child
            end
        end)
    end)

function SectionElements:CreateLabel(name, text, callback, options)
    local NameLabel = Instance.new("TextLabel")
    local LabelButton = nil

    local opts = options or {}
    local holdColor = opts.holdColor or false

    NameLabel.Name = (name .. "Label")
    NameLabel.Parent = SectionContent
    NameLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NameLabel.BackgroundTransparency = 1.000
    NameLabel.TextSize = 16
    NameLabel.TextWrapped = true
    NameLabel.TextXAlignment = Enum.TextXAlignment.Left
    NameLabel.Text = text or ""
    NameLabel.Size = UDim2.new(1, 0, 0, math.max(24, NameLabel.TextBounds.Y))
    NameLabel.ZIndex = 5
    NameLabel.Font = Enum.Font.SourceSansSemibold
    NameLabel.TextColor3 = Color3.fromRGB(190, 190, 198)
    table.insert(Library.LibraryColorTable, NameLabel)
    NameLabel.TextSize = 16.000

    local isColorHeld = false

    if callback and type(callback) == "function" then
        LabelButton = Instance.new("TextButton")
        LabelButton.Name = "LabelButton"
        LabelButton.Parent = NameLabel
        LabelButton.BackgroundTransparency = 1.000
        LabelButton.Size = UDim2.new(1, 0, 1, 0)
        LabelButton.Position = UDim2.new(0, 0, 0, 0)
        LabelButton.ZIndex = 6
        LabelButton.Font = Library.Theme.TextFont
        LabelButton.Text = ""
        LabelButton.TextColor3 = Color3.fromRGB(0, 0, 0)
        LabelButton.TextSize = 16.000

        LabelButton.MouseButton1Click:Connect(function()
            callback()
            if holdColor then
                for _, child in pairs(SectionContent:GetChildren()) do
                    if child:IsA("TextLabel") and child ~= NameLabel then
                        TweenService:Create(
                            child,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad),
                            {TextColor3 = Color3.fromRGB(190, 190, 198)}
                        ):Play()
                    end
                end
                TweenService:Create(
                    NameLabel,
                    TweenInfo.new(0.2, Enum.EasingStyle.Quad),
                    {TextColor3 = Library.Theme.MainColor}
                ):Play()
                isColorHeld = true
            end
        end)

        if holdColor then
            LabelButton.MouseEnter:Connect(function()
                if not isColorHeld then
                    TweenService:Create(
                        NameLabel,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad),
                        {TextColor3 = Library.Theme.MainColor}
                    ):Play()
                end
            end)
        else
            LabelButton.MouseEnter:Connect(function()
                TweenService:Create(
                    NameLabel,
                    TweenInfo.new(0.2, Enum.EasingStyle.Quad),
                    {TextColor3 = Library.Theme.MainColor}
                ):Play()
            end)

            LabelButton.MouseLeave:Connect(function()
                TweenService:Create(
                    NameLabel,
                    TweenInfo.new(0.2, Enum.EasingStyle.Quad),
                    {TextColor3 = Color3.fromRGB(190, 190, 198)}
                ):Play()
            end)
        end
    end

    local function ChangeText(newtext)
        NameLabel.Text = newtext
    end

    local function RefreshLabel(newtext)
        TweenService:Create(
            NameLabel,
            TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {TextTransparency = 1}
        ):Play()

        wait(0.3)
        NameLabel.Text = newtext
        TweenService:Create(
            NameLabel,
            TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {TextTransparency = 0}
        ):Play()
    end

    NameLabel:GetPropertyChangedSignal("TextBounds"):Connect(function()
        if NameLabel.Text ~= "" then
            TweenService:Create(
                NameLabel,
                TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out),
                {Size = UDim2.new(1, 0, 0, math.max(24, NameLabel.TextBounds.Y))}
            ):Play()
        else
            TweenService:Create(
                NameLabel,
                TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out),
                {Size = UDim2.new(1, 0, 0, 0)}
            ):Play()
        end
    end)

    -- (tinggi diatur otomatis oleh ResizeSection)

    return {
        ChangeText = ChangeText,
        Refresh = RefreshLabel
    }
end

        function SectionElements:CreateButton(name, callback)
            local NameButton = Instance.new("Frame")
            local Button = Instance.new("TextButton")
            local ButtonRounded = Instance.new("ImageLabel")

            NameButton.Name = (name .. "Button")
            NameButton.Parent = SectionContent
            NameButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            NameButton.BackgroundTransparency = 1.000
            NameButton.Size = UDim2.new(1, 0, 0, 32)
            NameButton.ZIndex = 5

            Button.Name = "Button"
            Button.Parent = NameButton
            Button.BackgroundColor3 = Library.Theme.MainColor
table.insert(Library.LibraryColorTable, Button)
            Button.BackgroundTransparency = 1.000
            Button.BorderSizePixel = 0
            Button.Position = UDim2.new(0, 0, 0, 0)
            Button.Size = UDim2.new(1, 0, 1, 0)
            Button.ZIndex = 6
            Button.Font = Library.Theme.TextFont
            Button.Text = name
            Button.TextColor3 = Library.Theme.TextColor
            Button.TextSize = 14.000
            Button.ClipsDescendants = true

            ButtonRounded.Name = "ButtonRounded"
            ButtonRounded.Parent = Button
            ButtonRounded.Active = true
            ButtonRounded.AnchorPoint = Vector2.new(0.5, 0.5)
            ButtonRounded.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ButtonRounded.BackgroundTransparency = 1.000
            ButtonRounded.Position = UDim2.new(0.5, 0, 0.5, 0)
            ButtonRounded.Selectable = true
            ButtonRounded.Size = UDim2.new(1, 0, 1, 0)
            ButtonRounded.ZIndex = 5
            ButtonRounded.Image = "rbxassetid://3570695787"
            ButtonRounded.ImageColor3 = Library.Theme.MainColor
            ButtonRounded.ImageTransparency = 0.2
            ButtonRounded.ScaleType = Enum.ScaleType.Slice
            ButtonRounded.SliceCenter = Rect.new(100, 100, 100, 100)
            ButtonRounded.SliceScale = 0.050

            Button.MouseButton1Down:Connect(function()
                TweenService:Create(ButtonRounded, TweenInfo.new(0.25, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {ImageColor3 = DarkenObjectColor(Library.Theme.MainColor, 20)}):Play()

                RippleEffect(Button)
            end)

            -- callback dijalankan saat klik selesai (lepas di atas tombol), bukan saat baru disentuh,
            -- supaya nggak kepicu waktu scroll / geser jari
            Button.MouseButton1Click:Connect(function()
                if type(callback) == "function" then
                    local ok, err = pcall(callback, Button)
                    if not ok then warn(err) end
                end
            end)

            Button.MouseButton1Up:Connect(function()
                TweenService:Create(ButtonRounded, TweenInfo.new(0.25, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {ImageColor3 = Library.Theme.MainColor}):Play()
            end)

            Button.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement then
                    TweenService:Create(ButtonRounded, TweenInfo.new(0.25, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {ImageColor3 = Library.Theme.MainColor}):Play()
                end
            end)

            table.insert(Library.LibraryColorTable, ButtonRounded)
        end
function SectionElements:CreateToggle(name, ...)
    local args = {...}
    local presetToggle, callback, tooltipText = nil, nil, nil

    for i, v in ipairs(args) do
        if type(v) == "boolean" then
            presetToggle = v
        elseif type(v) == "function" and not callback then
            callback = v
        elseif type(v) == "string" and not tooltipText then
            tooltipText = v
        end
    end
    callback = callback or function() end

    local NameToggle = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local Toggle = Instance.new("TextButton")
    local CheckboxOutline = Instance.new("ImageLabel")
    local CheckboxTicked = Instance.new("ImageLabel")
    local TickCover = Instance.new("Frame")
    local Tooltip

    local gameId = self.GameId or tostring(game.PlaceId)
    if not Settings[gameId] then Settings[gameId] = {} end
    local Toggled = (presetToggle ~= nil and presetToggle) or false
    if Settings[gameId][name] ~= nil then
        Toggled = Settings[gameId][name]
    end

    if not UIReferences then UIReferences = { Toggles = {} } end
    UIReferences.Toggles[name] = {
        Toggled = Toggled,
        TickCover = TickCover,
        CheckboxOutline = CheckboxOutline,
        CheckboxTicked = CheckboxTicked,
        Callback = callback,
        EnabledDuringLoad = true
    }

    NameToggle.Name = (name .. "Toggle")
    NameToggle.Parent = SectionContent or error("SectionContent tidak ditemukan")
    NameToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NameToggle.BackgroundTransparency = 1.000
    NameToggle.Size = UDim2.new(1, 0, 0, 35)
    NameToggle.ZIndex = 5

    Title.Name = "Title"
    Title.Parent = NameToggle
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.Position = UDim2.new(0, 13, 0, 0)
    Title.Size = UDim2.new(1, -50, 0, 35)
    Title.ZIndex = 5
    Title.Font = Library and Library.Theme and Library.Theme.TextFont or Enum.Font.SourceSansBold
    Title.Text = name
    Title.TextColor3 = Toggled and (Library and Library.Theme and Library.Theme.TextColor or Color3.fromRGB(255, 255, 255)) or Color3.fromRGB(185, 185, 185)
    if Library and Library.LibraryColorTable then table.insert(Library.LibraryColorTable, Title) end
    if _G.UpdateTextColors then UpdateTextColors() end
    Title.TextSize = 15.000
    Title.TextXAlignment = Enum.TextXAlignment.Left

    Toggle.Name = "Toggle"
    Toggle.Parent = NameToggle
    Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Toggle.BackgroundTransparency = 1.000
    Toggle.Position = UDim2.new(1, -34, 0, 7)
    Toggle.Size = UDim2.new(0, 20, 0, 20)
    Toggle.ZIndex = 5
    Toggle.AutoButtonColor = false
    Toggle.Font = Library and Library.Theme and Library.Theme.TextFont or Enum.Font.SourceSansBold
    Toggle.Text = ""
    Toggle.TextColor3 = Library and Library.Theme and Library.Theme.TextColor or Color3.fromRGB(255, 255, 255)
    Toggle.TextSize = 14.000

    CheckboxOutline.Name = "CheckboxOutline"
    CheckboxOutline.Parent = Toggle
    CheckboxOutline.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CheckboxOutline.BackgroundTransparency = 1.000
    CheckboxOutline.Position = UDim2.new(0.5, -12, 0.5, -12)
    CheckboxOutline.Size = UDim2.new(0, 24, 0, 24)
    CheckboxOutline.ZIndex = 5
    CheckboxOutline.Image = "rbxassetid://5416796047"
    CheckboxOutline.ImageColor3 = Toggled and (Library and Library.Theme and Library.Theme.MainColor or Color3.fromRGB(255, 75, 75)) or Color3.fromRGB(65, 65, 65)

    CheckboxTicked.Name = "CheckboxTicked"
    CheckboxTicked.Parent = Toggle
    CheckboxTicked.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CheckboxTicked.BackgroundTransparency = 1.000
    CheckboxTicked.Position = UDim2.new(0.5, -12, 0.5, -12)
    CheckboxTicked.Size = UDim2.new(0, 24, 0, 24)
    CheckboxTicked.ZIndex = 6
    CheckboxTicked.Image = "rbxassetid://5416796675"
    CheckboxTicked.ImageColor3 = Toggled and (Library and Library.Theme and Library.Theme.MainColor or Color3.fromRGB(255, 75, 75)) or Color3.fromRGB(65, 65, 65)
    if Library and Library.LibraryColorTable then table.insert(Library.LibraryColorTable, CheckboxTicked) end

    TickCover.Name = "TickCover"
    TickCover.Parent = Toggle
    TickCover.BackgroundColor3 = Library and Library.Theme and Library.Theme.BackgroundColor or Color3.fromRGB(35, 35, 35)
    TickCover.BorderSizePixel = 0
    TickCover.Position = Toggled and UDim2.new(0.5, 0, 0.5, 0) or UDim2.new(0.5, -7, 0.5, -7)
    TickCover.Size = Toggled and UDim2.new(0, 0, 0, 0) or UDim2.new(0, 14, 0, 14)
    TickCover.ZIndex = 7

    if tooltipText then
        Tooltip = Instance.new("TextLabel")
        Tooltip.Name = "Tooltip"
        Tooltip.Parent = NameToggle
        Tooltip.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Tooltip.Position = UDim2.new(0, 10, 0, -10)
        Tooltip.ZIndex = 10
        Tooltip.Font = Library and Library.Theme and Library.Theme.TextFont or Enum.Font.SourceSansBold
        Tooltip.Text = tooltipText
        Tooltip.TextColor3 = Color3.fromRGB(0, 0, 0)
        Tooltip.TextSize = 14.000
        Tooltip.Visible = false
        Tooltip.ClipsDescendants = true

        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 5)
        UICorner.Parent = Tooltip

        local lineCount = 0
        for _ in tooltipText:gmatch("\n") do
            lineCount = lineCount + 1
        end
        Tooltip.Position = UDim2.new(0, 10, 0, -10 - (lineCount * 20))
        Tooltip.Size = UDim2.new(0, math.min(Tooltip.TextBounds.X + 10, 187), 0, Tooltip.TextBounds.Y + 5)

        Title.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
                Tooltip.Visible = true
            elseif input.UserInputType == Enum.UserInputType.MouseMovement then
                Tooltip.Visible = true
            end
        end)

        Title.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
                Tooltip.Visible = false
            elseif input.UserInputType == Enum.UserInputType.MouseMovement then
                Tooltip.Visible = false
            end
        end)
    end

    local function safeCallback(state)
        if type(callback) == "function" and UIReferences.Toggles[name].EnabledDuringLoad then
            local success, err = pcall(callback, state)
            if not success then
                warn(err)
            end
        end
    end

    Toggle.MouseButton1Click:Connect(function()
        Toggled = not Toggled
        UIReferences.Toggles[name].EnabledDuringLoad = true
        TweenService:Create(Title, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Toggled and (Library and Library.Theme and Library.Theme.TextColor or Color3.fromRGB(255, 255, 255)) or Color3.fromRGB(185, 185, 185)}):Play()
        TweenService:Create(TickCover, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = Toggled and UDim2.new(0.5, 0, 0.5, 0) or UDim2.new(0.5, -7, 0.5, -7), Size = Toggled and UDim2.new(0, 0, 0, 0) or UDim2.new(0, 14, 0, 14)}):Play()
        TweenService:Create(CheckboxOutline, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageColor3 = Toggled and (Library and Library.Theme and Library.Theme.MainColor or Color3.fromRGB(255, 75, 75)) or Color3.fromRGB(65, 65, 65)}):Play()
        TweenService:Create(CheckboxTicked, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageColor3 = Toggled and (Library and Library.Theme and Library.Theme.MainColor or Color3.fromRGB(255, 75, 75)) or Color3.fromRGB(65, 65, 65)}):Play()
        Settings[gameId][name] = Toggled
        SaveSettings()
        safeCallback(Toggled)
        task.wait()
    end)

    if Library and Library.LibraryColorTable then
        table.insert(Library.LibraryColorTable, CheckboxOutline)
        table.insert(Library.LibraryColorTable, CheckboxTicked)
    end

    if Toggled then
        task.wait(0.1)
    end

    if SectionContent and SectionContentLayout then
        -- (tinggi diatur otomatis oleh ResizeSection)
    end

    task.delay(1, function()
        if UIReferences and UIReferences.Toggles[name] and UIReferences.Toggles[name].Toggled then
            UIReferences.Toggles[name].EnabledDuringLoad = true
            safeCallback(UIReferences.Toggles[name].Toggled)
        end
    end)

    return {
        SetState = function(state)
            Toggled = state
            UIReferences.Toggles[name].EnabledDuringLoad = true
            TweenService:Create(Title, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Toggled and (Library and Library.Theme and Library.Theme.TextColor or Color3.fromRGB(255, 255, 255)) or Color3.fromRGB(185, 185, 185)}):Play()
            TweenService:Create(TickCover, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = Toggled and UDim2.new(0.5, 0, 0.5, 0) or UDim2.new(0.5, -7, 0.5, -7), Size = Toggled and UDim2.new(0, 0, 0, 0) or UDim2.new(0, 14, 0, 14)}):Play()
            TweenService:Create(CheckboxOutline, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageColor3 = Toggled and (Library and Library.Theme and Library.Theme.MainColor or Color3.fromRGB(255, 75, 75)) or Color3.fromRGB(65, 65, 65)}):Play()
            TweenService:Create(CheckboxTicked, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageColor3 = Toggled and (Library and Library.Theme and Library.Theme.MainColor or Color3.fromRGB(255, 75, 75)) or Color3.fromRGB(65, 65, 65)}):Play()
            Settings[gameId][name] = state
            SaveSettings()
            safeCallback(state)
            task.wait()
        end
    }
end
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

function SectionElements:CreateSlider(name, minimumvalue, maximumvalue, presetvalue, precisevalue, callback)
    local NameSlider = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local SliderBackground = Instance.new("ImageLabel")
    local SliderIndicator = Instance.new("ImageLabel")
    local CircleSelector = Instance.new("ImageLabel")
    local SliderValue = Instance.new("ImageLabel")
    local Value = Instance.new("TextBox")

    local SliderDragging = false
    local StartingValue = presetvalue

    NameSlider.Name = (name .. "Slider")
    NameSlider.Parent = SectionContent
    NameSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NameSlider.BackgroundTransparency = 1.000
    NameSlider.Position = UDim2.new(0, 0, 0.497237563, 0)
    NameSlider.Size = UDim2.new(1, 0, 0, 50)
    NameSlider.ZIndex = 5

    Title.Name = "Title"
    Title.Parent = NameSlider
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.Position = UDim2.new(0, 12, 0, 0)
    Title.Size = UDim2.new(1, -90, 0, 35)
    Title.ZIndex = 5
    Title.Font = Library.Theme.TextFont
    Title.Text = name
    Title.TextColor3 = Library.Theme.TextColor
table.insert(Library.LibraryColorTable, Title)
    Title.TextSize = 15.000
    Title.TextXAlignment = Enum.TextXAlignment.Left

    SliderBackground.Name = "SliderBackground"
    SliderBackground.Parent = NameSlider
    SliderBackground.BackgroundColor3 = Color3.fromRGB(62, 62, 70)
    SliderBackground.BackgroundTransparency = 0
    SliderBackground.BorderSizePixel = 0
    SliderBackground.Position = UDim2.new(0, 12, 0, 38)
    SliderBackground.Size = UDim2.new(1, -24, 0, 6)
    SliderBackground.ZIndex = 5
    SliderBackground.Image = ""
    Instance.new("UICorner", SliderBackground).CornerRadius = UDim.new(1, 0)
    SliderBackground.ImageColor3 = Color3.fromRGB(55, 55, 55)
    SliderBackground.ScaleType = Enum.ScaleType.Slice
    SliderBackground.SliceCenter = Rect.new(100, 100, 100, 100)
    SliderBackground.SliceScale = 0.150

    SliderIndicator.Name = "SliderIndicator"
    SliderIndicator.Parent = SliderBackground
    SliderIndicator.BackgroundColor3 = Library.Theme.MainColor
    SliderIndicator.BackgroundTransparency = 0
    SliderIndicator.BorderSizePixel = 0
    Instance.new("UICorner", SliderIndicator).CornerRadius = UDim.new(1, 0)
    SliderIndicator.Size = UDim2.new(((StartingValue or minimumvalue) - minimumvalue) / (maximumvalue - minimumvalue), 0, 1, 0)
    SliderIndicator.ZIndex = 5
    SliderIndicator.Image = ""
    SliderIndicator.ImageColor3 = Library.Theme.MainColor
    SliderIndicator.ScaleType = Enum.ScaleType.Slice
    SliderIndicator.SliceCenter = Rect.new(100, 100, 100, 100)
    SliderIndicator.SliceScale = 0.150

    CircleSelector.Name = "CircleSelector"
    CircleSelector.Parent = SliderIndicator
    CircleSelector.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CircleSelector.BackgroundTransparency = 0
    CircleSelector.BorderSizePixel = 0
    CircleSelector.AnchorPoint = Vector2.new(0.5, 0.5)
    CircleSelector.Position = UDim2.new(1, 0, 0.5, 0)
    CircleSelector.Size = UDim2.new(0, 14, 0, 14)
    CircleSelector.ZIndex = 6
    CircleSelector.Image = ""
    Instance.new("UICorner", CircleSelector).CornerRadius = UDim.new(1, 0)
    local CircleStroke = Instance.new("UIStroke")
    CircleStroke.Thickness = 2
    CircleStroke.Color = Library.Theme.MainColor
    CircleStroke.Parent = CircleSelector

    SliderValue.Name = "SliderValue"
    SliderValue.Parent = NameSlider
    SliderValue.BackgroundColor3 = Color3.fromRGB(42, 42, 47)
    SliderValue.BackgroundTransparency = 0
    SliderValue.BorderSizePixel = 0
    SliderValue.Position = UDim2.new(1, -58, 0, 8)
    SliderValue.Size = UDim2.new(0, 46, 0, 22)
    SliderValue.ZIndex = 5
    SliderValue.Image = ""
    Instance.new("UICorner", SliderValue).CornerRadius = UDim.new(0, 8)
    SliderValue.ImageColor3 = Color3.fromRGB(65, 65, 65)
    SliderValue.ScaleType = Enum.ScaleType.Slice
    SliderValue.SliceCenter = Rect.new(100, 100, 100, 100)
    SliderValue.SliceScale = 0.030

    Value.Name = "Value"
    Value.Parent = SliderValue
    Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Value.BackgroundTransparency = 1.000
    Value.Size = UDim2.new(1, 0, 1, 0)
    Value.ZIndex = 5
    Value.Font = Library.Theme.TextFont
    Value.Text = tostring(StartingValue or precisevalue and tonumber(string.format("%.2f", StartingValue)))
    Value.TextColor3 = Color3.fromRGB(255, 255, 255)
    Value.TextSize = 14.000

    
    local function enlargeCircle()
        TweenService:Create(CircleSelector, TweenInfo.new(0.1), {Size = UDim2.new(0, 20, 0, 20)}):Play()
    end

    
    local function shrinkCircle()
        TweenService:Create(CircleSelector, TweenInfo.new(0.1), {Size = UDim2.new(0, 14, 0, 14)}):Play()
    end


    local function Sliding(input)
        local SliderPosition
        if input.UserInputType == Enum.UserInputType.Touch then
            SliderPosition = UDim2.new(math.clamp((input.Position.X - SliderBackground.AbsolutePosition.X) / SliderBackground.AbsoluteSize.X, 0, 1), 0, 1, 0)
        elseif input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.MouseButton1 then
            SliderPosition = UDim2.new(math.clamp((input.Position.X - SliderBackground.AbsolutePosition.X) / SliderBackground.AbsoluteSize.X, 0, 1), 0, 1, 0)
        end

        TweenService:Create(SliderIndicator, TweenInfo.new(0.02, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = SliderPosition}):Play()

        local NonSliderPreciseValue = math.floor(((SliderPosition.X.Scale * maximumvalue) / maximumvalue) * (maximumvalue - minimumvalue) + minimumvalue)
        local SliderPreciseValue = ((SliderPosition.X.Scale * maximumvalue) / maximumvalue) * (maximumvalue - minimumvalue) + minimumvalue

        local SlidingValue = (precisevalue and SliderPreciseValue or NonSliderPreciseValue)
        SlidingValue = tonumber(string.format("%.2f", SlidingValue))

        Value.Text = tostring(SlidingValue)
        callback(SlidingValue)
    end

    CircleSelector.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            SliderDragging = true
            SectionScrollingFrame.ScrollingEnabled = false
            enlargeCircle()  
            Sliding(input)   
        end
    end)

    
    CircleSelector.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            SliderDragging = false
            SectionScrollingFrame.ScrollingEnabled = true
            shrinkCircle()   
        end
    end)

    
    local HitArea = Instance.new("Frame")
    HitArea.Name = "HitArea"
    HitArea.Parent = SliderBackground
    HitArea.BackgroundTransparency = 1
    HitArea.AnchorPoint = Vector2.new(0, 0.5)
    HitArea.Position = UDim2.new(0, 0, 0.5, 0)
    HitArea.Size = UDim2.new(1, 0, 0, 28)
    HitArea.ZIndex = 6
    HitArea.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            SliderDragging = true
            SectionScrollingFrame.ScrollingEnabled = false
            enlargeCircle()
            Sliding(input)
        end
    end)
    HitArea.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            SliderDragging = false
            SectionScrollingFrame.ScrollingEnabled = true
            shrinkCircle()
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if SliderDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            
            Sliding(input)
        end
    end)

    
    Value.FocusLost:Connect(function()
        if not tonumber(Value.Text) then
            Value.Text = tostring(StartingValue or precisevalue and tonumber(string.format("%.2f", StartingValue)))
        elseif Value.Text == "" or tonumber(Value.Text) <= minimumvalue then
            Value.Text = minimumvalue
        elseif Value.Text == "" or tonumber(Value.Text) >= maximumvalue then
            Value.Text = maximumvalue
        end

        TweenService:Create(SliderIndicator, TweenInfo.new(0.02, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(((tonumber(Value.Text) or minimumvalue) - minimumvalue) / (maximumvalue - minimumvalue), 0, 1, 0)}):Play()
        callback(tonumber(Value.Text))
    end)

    callback(StartingValue)
end

function SectionElements:CreateTextBox(name, characterLimit, placeholderText, callback)
            local NameTextBox = Instance.new("Frame")
            local Title = Instance.new("TextLabel")
            local InputBox = Instance.new("TextBox")

            local gameId = self.GameId
            if not Settings[gameId] then Settings[gameId] = {} end
            local SavedText = Settings[gameId][name] or placeholderText or ""

            NameTextBox.Name = name .. "TextBox"
            NameTextBox.Parent = SectionContent
            NameTextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            NameTextBox.BackgroundTransparency = 1.000
            NameTextBox.Size = UDim2.new(1, 0, 0, 50)
            NameTextBox.ZIndex = 5

            Title.Name = "Title"
            Title.Parent = NameTextBox
            Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title.BackgroundTransparency = 1.000
            Title.Position = UDim2.new(0, 10, 0, 0)
            Title.Size = UDim2.new(1, -24, 0, 20)
            Title.ZIndex = 5
            Title.Font = Library.Theme.TextFont
            Title.Text = name
            Title.TextColor3 = Library.Theme.TextColor
            Title.TextSize = 15.000
            Title.TextXAlignment = Enum.TextXAlignment.Left

            InputBox.Name = "InputBox"
            InputBox.Parent = NameTextBox
            InputBox.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
            InputBox.BackgroundTransparency = 0.100
            InputBox.Position = UDim2.new(0, 10, 0, 20)
            InputBox.Size = UDim2.new(1, -20, 0, 22)
            InputBox.ZIndex = 5
            InputBox.Font = Library.Theme.TextFont
            InputBox.PlaceholderText = placeholderText or "message..."
            InputBox.Text = SavedText
            InputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            InputBox.TextSize = 14.000
            InputBox.TextXAlignment = Enum.TextXAlignment.Left

            InputBox:GetPropertyChangedSignal("Text"):Connect(function()
                if #InputBox.Text > characterLimit then
                    InputBox.Text = InputBox.Text:sub(1, characterLimit)
                end
                if not Settings[gameId] then Settings[gameId] = {} end
                Settings[gameId][name] = InputBox.Text ~= "" and InputBox.Text or placeholderText
                SaveSettings()
                if callback then
                    callback(InputBox.Text ~= "" and InputBox.Text or placeholderText)
                end
            end)

            return NameTextBox, InputBox
        end
function SectionElements:CreateImage(name, imageId, size)
    local ImageHolder = Instance.new("Frame")
    ImageHolder.Name = name .. "_ImageHolder"
    ImageHolder.BackgroundTransparency = 1
    ImageHolder.Size = UDim2.new(1, 0, 0, (size and size.Y and size.Y[2]) or 100)
    ImageHolder.Parent = SectionContent
ImageHolder.ZIndex = 999
    local ImageLabel = Instance.new("ImageLabel")
    ImageLabel.Name = name .. "_Image"
    ImageLabel.AnchorPoint = Vector2.new(0.5, 0)
    ImageLabel.Position = UDim2.new(0.5, 0, 0, 0)
    ImageLabel.Size = UDim2.new(
        size and size.X and size.X[1] or 0,
        size and size.X and size.X[2] or 100,
        size and size.Y and size.Y[1] or 0,
        size and size.Y and size.Y[2] or 100
    )
    ImageLabel.Image = imageId or ""
    ImageLabel.BackgroundTransparency = 1
    ImageLabel.ScaleType = Enum.ScaleType.Fit
    ImageLabel.Parent = ImageHolder
    ImageLabel.ZIndex = 999




    local Element = {
        Type = "Image",
        Holder = ImageHolder,
        Image = ImageLabel,
        Refresh = function(self, newImage)
            self.Image.Image = newImage
        end
    }

    return Element
end
        function SectionElements:CreateColorPicker(name, presetcolor, callback)
            local NameColorPicker = Instance.new("Frame")
            local Title = Instance.new("TextLabel")
            local ColorPickerToggle = Instance.new("ImageButton")
            local ColorPicker = Instance.new("ImageLabel")
            local Color = Instance.new("ImageLabel")
            local ColorRound = Instance.new("ImageLabel")
            local ColorSelection = Instance.new("ImageLabel")
            local RValue = Instance.new("ImageLabel")
            local ValueR = Instance.new("TextLabel")
            local GValue = Instance.new("ImageLabel")
            local ValueG = Instance.new("TextLabel")
            local BValue = Instance.new("ImageLabel")
            local ValueB = Instance.new("TextLabel")
            local RainbowToggle = Instance.new("Frame")
            local RainbowToggleTitle = Instance.new("TextLabel")
            local Toggle = Instance.new("TextButton")
            local CheckboxOutline = Instance.new("ImageLabel")
            local CheckboxTicked = Instance.new("ImageLabel")
            local TickCover = Instance.new("Frame")
            local Hue = Instance.new("ImageLabel")
            local UIGradient = Instance.new("UIGradient")
            local HueSelection = Instance.new("ImageLabel")
            
            local ColorPickerToggled = false
            local OldToggleColor = Color3.fromRGB(0, 0, 0)
            local OldColor = Color3.fromRGB(0, 0, 0)
            local OldColorSelectionPosition = nil
            local OldHueSelectionPosition = nil
            local ColorH, ColorS, ColorV = 1, 1, 1
            local RainbowColorPicker = false
            local ColorPickerInput = nil
            local ColorInput = nil
            local HueInput = nil

            NameColorPicker.Name = (name .. "ColorPicker")
            NameColorPicker.Parent = SectionContent
            NameColorPicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            NameColorPicker.BackgroundTransparency = 1.000
            NameColorPicker.Position = UDim2.new(0, 0, 0.138121545, 0)
            NameColorPicker.Size = UDim2.new(1, 0, 0, 32)
            NameColorPicker.ClipsDescendants = true

            Title.Name = "Title"
            Title.Parent = NameColorPicker
            Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title.BackgroundTransparency = 1.000
            Title.Position = UDim2.new(0, 13, 0, 0)
            Title.Size = UDim2.new(1, -66, 0, 30)
            Title.ZIndex = 5
            Title.Font = Library.Theme.TextFont
            Title.Text = name
            Title.TextColor3 = Library.Theme.TextColor
            Title.TextSize = 15.000
            Title.TextXAlignment = Enum.TextXAlignment.Left
            
            ColorPickerToggle.Name = "ColorPickerToggle"
            ColorPickerToggle.Parent = NameColorPicker
            ColorPickerToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorPickerToggle.BackgroundTransparency = 1.000
            ColorPickerToggle.Position = UDim2.new(1, -56, 0, 5)
            ColorPickerToggle.Size = UDim2.new(0, 42, 0, 20)
            ColorPickerToggle.ZIndex = 5
            ColorPickerToggle.Image = "rbxassetid://3570695787"
            ColorPickerToggle.ImageColor3 = presetcolor
            ColorPickerToggle.ScaleType = Enum.ScaleType.Slice
            ColorPickerToggle.SliceCenter = Rect.new(100, 100, 100, 100)
            ColorPickerToggle.SliceScale = 0.030
            
            ColorPicker.Name = "ColorPicker"
            ColorPicker.Parent = NameColorPicker
            ColorPicker.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            ColorPicker.BackgroundTransparency = 1.000
            ColorPicker.ClipsDescendants = true
            ColorPicker.Position = UDim2.new(0, 12, 0, 30)
            ColorPicker.Size = UDim2.new(0, 169, 0, 175)
            ColorPicker.ZIndex = 10
            ColorPicker.Image = "rbxassetid://3570695787"
            ColorPicker.ImageColor3 = Color3.fromRGB(45, 45, 45)
            ColorPicker.ScaleType = Enum.ScaleType.Slice
            ColorPicker.SliceCenter = Rect.new(100, 100, 100, 100)
            ColorPicker.SliceScale = 0.070
            ColorPicker.ImageTransparency = 1

            Color.Name = "Color"
            Color.Parent = ColorPicker
            Color.BackgroundColor3 = presetcolor
            Color.BorderSizePixel = 0
            Color.Position = UDim2.new(0, 9, 0, 10)
            Color.Size = UDim2.new(0, 124, 0, 105)
            Color.ZIndex = 10
            Color.Image = "rbxassetid://4155801252"
            
            ColorRound.Name = "ColorRound"
            ColorRound.Parent = Color
            ColorRound.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorRound.BackgroundTransparency = 1.000
            ColorRound.ClipsDescendants = true
            ColorRound.Size = UDim2.new(1, 0, 1, 0)
            ColorRound.ZIndex = 10
            ColorRound.Image = "rbxassetid://4695575676"
            ColorRound.ImageColor3 = Color3.fromRGB(45, 45, 45)
            ColorRound.ScaleType = Enum.ScaleType.Slice
            ColorRound.SliceCenter = Rect.new(128, 128, 128, 128)
            ColorRound.SliceScale = 0.050
    
            ColorSelection.Name = "ColorSelection"
            ColorSelection.Parent = Color
            ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
            ColorSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorSelection.BackgroundTransparency = 1.000
            ColorSelection.Position = UDim2.new(presetcolor and select(3, Color3.toHSV(presetcolor)))
            ColorSelection.Size = UDim2.new(0, 18, 0, 18)
            ColorSelection.ZIndex = 25
            ColorSelection.Image = "rbxassetid://4953646208"
            ColorSelection.ScaleType = Enum.ScaleType.Fit
            
            RValue.Name = "RValue"
            RValue.Parent = ColorPicker
            RValue.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
            RValue.BackgroundTransparency = 1.000
            RValue.Position = UDim2.new(0, 10, 0, 123)
            RValue.Size = UDim2.new(0, 42, 0, 19)
            RValue.ZIndex = 10
            RValue.Image = "rbxassetid://3570695787"
            RValue.ImageColor3 = Color3.fromRGB(65, 65, 65)
            RValue.ScaleType = Enum.ScaleType.Slice
            RValue.SliceCenter = Rect.new(100, 100, 100, 100)
            RValue.SliceScale = 0.030
            
            ValueR.Name = "ValueR"
            ValueR.Parent = RValue
            ValueR.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ValueR.BackgroundTransparency = 1.000
            ValueR.Size = UDim2.new(1, 0, 1, 0)
            ValueR.ZIndex = 11
            ValueR.Font = Library.Theme.TextFont
            ValueR.Text = "R: 255"
            ValueR.TextColor3 = Color3.fromRGB(255, 255, 255)
            ValueR.TextSize = 14.000
            
            GValue.Name = "GValue"
            GValue.Parent = ColorPicker
            GValue.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
            GValue.BackgroundTransparency = 1.000
            GValue.Position = UDim2.new(0, 64, 0, 123)
            GValue.Size = UDim2.new(0, 42, 0, 19)
            GValue.ZIndex = 10
            GValue.Image = "rbxassetid://3570695787"
            GValue.ImageColor3 = Color3.fromRGB(65, 65, 65)
            GValue.ScaleType = Enum.ScaleType.Slice
            GValue.SliceCenter = Rect.new(100, 100, 100, 100)
            GValue.SliceScale = 0.030
            
            ValueG.Name = "ValueG"
            ValueG.Parent = GValue
            ValueG.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ValueG.BackgroundTransparency = 1.000
            ValueG.Size = UDim2.new(1, 0, 1, 0)
            ValueG.ZIndex = 11
            ValueG.Font = Library.Theme.TextFont
            ValueG.Text = "G: 255"
            ValueG.TextColor3 = Color3.fromRGB(255, 255, 255)
            ValueG.TextSize = 14.000
            
            BValue.Name = "BValue"
            BValue.Parent = ColorPicker
            BValue.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
            BValue.BackgroundTransparency = 1.000
            BValue.Position = UDim2.new(0, 119, 0, 123)
            BValue.Size = UDim2.new(0, 42, 0, 19)
            BValue.ZIndex = 10
            BValue.Image = "rbxassetid://3570695787"
            BValue.ImageColor3 = Color3.fromRGB(65, 65, 65)
            BValue.ScaleType = Enum.ScaleType.Slice
            BValue.SliceCenter = Rect.new(100, 100, 100, 100)
            BValue.SliceScale = 0.030
            
            ValueB.Name = "ValueB"
            ValueB.Parent = BValue
            ValueB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ValueB.BackgroundTransparency = 1.000
            ValueB.Size = UDim2.new(1, 0, 1, 0)
            ValueB.ZIndex = 11
            ValueB.Font = Library.Theme.TextFont
            ValueB.Text = "B: 255"
            ValueB.TextColor3 = Color3.fromRGB(255, 255, 255)
            ValueB.TextSize = 14.000
            
            RainbowToggle.Name = "RainbowToggle"
            RainbowToggle.Parent = ColorPicker
            RainbowToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            RainbowToggle.BackgroundTransparency = 1.000
            RainbowToggle.Position = UDim2.new(0, 10, 0, 143)
            RainbowToggle.Size = UDim2.new(0, 160, 0, 35)
            RainbowToggle.ZIndex = 10
            
            RainbowToggleTitle.Name = "RainbowToggleTitle"
            RainbowToggleTitle.Parent = RainbowToggle
            RainbowToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            RainbowToggleTitle.BackgroundTransparency = 1.000
            RainbowToggleTitle.Size = UDim2.new(0, 124, 0, 30)
            RainbowToggleTitle.ZIndex = 10
            RainbowToggleTitle.Font = Library.Theme.TextFont
            RainbowToggleTitle.Text = "Rainbow"
            RainbowToggleTitle.TextColor3 = Color3.fromRGB(185, 185, 185)
            RainbowToggleTitle.TextSize = 15
            RainbowToggleTitle.TextXAlignment = Enum.TextXAlignment.Left
            
            Toggle.Name = "Toggle"
            Toggle.Parent = RainbowToggle
            Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Toggle.BackgroundTransparency = 1.000
            Toggle.Position = UDim2.new(0, 131, 0, 5)
            Toggle.Size = UDim2.new(0, 20, 0, 20)
            Toggle.ZIndex = 10
            Toggle.AutoButtonColor = false
            Toggle.Font = Library.Theme.TextFont
            Toggle.Text = ""
            Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
            Toggle.TextSize = 14.000
            
            CheckboxOutline.Name = "CheckboxOutline"
            CheckboxOutline.Parent = Toggle
            CheckboxOutline.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            CheckboxOutline.BackgroundTransparency = 1.000
            CheckboxOutline.Position = UDim2.new(0.5, -12, 0.5, -12)
            CheckboxOutline.Size = UDim2.new(0, 24, 0, 24)
            CheckboxOutline.ZIndex = 10
            CheckboxOutline.Image = "http://www.roblox.com/asset/?id=5416796047"
            CheckboxOutline.ImageColor3 = Color3.fromRGB(65, 65, 65)
            
            CheckboxTicked.Name = "CheckboxTicked"
            CheckboxTicked.Parent = Toggle
            CheckboxTicked.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            CheckboxTicked.BackgroundTransparency = 1.000
            CheckboxTicked.Position = UDim2.new(0.5, -12, 0.5, -12)
            CheckboxTicked.Size = UDim2.new(0, 24, 0, 24)
            CheckboxTicked.ZIndex = 10
            CheckboxTicked.Image = "http://www.roblox.com/asset/?id=5416796675"
            CheckboxTicked.ImageColor3 = Color3.fromRGB(65, 65, 65)

            TickCover.Name = "TickCover"
            TickCover.Parent = Toggle
            TickCover.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            TickCover.BorderSizePixel = 0
            TickCover.Position = UDim2.new(0.5, -7, 0.5, -7)
            TickCover.Size = UDim2.new(0, 14, 0, 14)
            TickCover.ZIndex = 10
            
            Hue.Name = "Hue"
            Hue.Parent = ColorPicker
            Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Hue.BackgroundTransparency = 1.000
            Hue.Position = UDim2.new(0, 136, 0, 10)
            Hue.Size = UDim2.new(0, 25, 0, 105)
            Hue.ZIndex = 10
            Hue.Image = "rbxassetid://3570695787"
            Hue.ScaleType = Enum.ScaleType.Slice
            Hue.SliceCenter = Rect.new(100, 100, 100, 100)
            Hue.SliceScale = 0.050

            UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)), ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)), ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)), ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)), ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))}
            UIGradient.Rotation = 270
            UIGradient.Parent = Hue
            
            HueSelection.Name = "HueSelection"
            HueSelection.Parent = Hue
            HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)
            HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            HueSelection.BackgroundTransparency = 1.000
            HueSelection.Position = UDim2.new(0.48, 0, 1 - select(1, Color3.toHSV(presetcolor)))
            HueSelection.Size = UDim2.new(0, 18, 0, 18)
            HueSelection.ZIndex = 10
            HueSelection.Image = "rbxassetid://4953646208"
            HueSelection.ScaleType = Enum.ScaleType.Fit

            local function SetRGBValues()
                ValueR.Text = ("R: " .. math.floor(ColorPickerToggle.ImageColor3.r * 255))
                ValueG.Text = ("G: " .. math.floor(ColorPickerToggle.ImageColor3.g * 255))
                ValueB.Text = ("B: " .. math.floor(ColorPickerToggle.ImageColor3.b * 255))
            end
    
            local function UpdateColorPicker(nope)
                ColorPickerToggle.ImageColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
                Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)
    
                SetRGBValues()
                callback(ColorPickerToggle.ImageColor3)
            end
    
            ColorH = 1 - (math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) / Hue.AbsoluteSize.Y)
            ColorS = (math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) / Color.AbsoluteSize.X)
            ColorV = 1 - (math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) / Color.AbsoluteSize.Y)
    
            ColorPickerToggle.ImageColor3 = presetcolor
            Color.BackgroundColor3 = presetcolor
            SetRGBValues()
            callback(Color.BackgroundColor3)
    
            Color.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if RainbowColorPicker then return end
    
                    if ColorInput then
                        ColorInput:Disconnect()
                    end
                    
                    ColorInput = RunService.RenderStepped:Connect(function()
                        local ColorX = (math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) / Color.AbsoluteSize.X)
                        local ColorY = (math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) / Color.AbsoluteSize.Y)
    
                        ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
                        ColorS = ColorX
                        ColorV = 1 - ColorY
    
                        UpdateColorPicker(true)
                    end)
                end
            end)
    
            Color.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if ColorInput then
                        ColorInput:Disconnect()
                    end
                end
            end)
    
            Hue.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if RainbowColorPicker then return end
    
                    if HueInput then
                        HueInput:Disconnect()
                    end
                    
                    HueInput = RunService.RenderStepped:Connect(function()
                        local HueY = (math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) / Hue.AbsoluteSize.Y)
    
                        HueSelection.Position = UDim2.new(0.48, 0, HueY, 0)
                        ColorH = 1 - HueY
    
                        UpdateColorPicker(true)
                    end)
                end
            end)
    
            Hue.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if HueInput then
                        HueInput:Disconnect()
                    end
                end
            end)
    
            Toggle.MouseButton1Down:Connect(function()
                RainbowColorPicker = not RainbowColorPicker
            
                if ColorInput then
                    ColorInput:Disconnect()
                end
    
                if HueInput then
                    HueInput:Disconnect()
                end
    
                if RainbowColorPicker then              
                    TweenService:Create(RainbowToggleTitle, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                    TweenService:Create(TickCover, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 0, 0.5, 0), Size = UDim2.new(0, 0, 0, 0)}):Play()
                    TweenService:Create(CheckboxOutline, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageColor3 = Library.Theme.MainColor}):Play()
                    TweenService:Create(CheckboxTicked, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageColor3 = Library.Theme.MainColor}):Play()
    
                    OldToggleColor = ColorPickerToggle.ImageColor3
                    OldColor = Color.BackgroundColor3
                    OldColorSelectionPosition = ColorSelection.Position
                    OldHueSelectionPosition = HueSelection.Position
    
                    while RainbowColorPicker do
                        ColorPickerToggle.ImageColor3 = Color3.fromHSV(Library.RainbowColorValue, 1, 1)
                        Color.BackgroundColor3 = Color3.fromHSV(Library.RainbowColorValue, 1, 1)
            
                        ColorSelection.Position = UDim2.new(1, 0, 0, 0)
                        HueSelection.Position = UDim2.new(0.48, 0, 0, Library.HueSelectionPosition)
            
                        SetRGBValues()
                        callback(Color.BackgroundColor3)
                        wait()
                    end
                elseif not RainbowColorPicker then
                    ColorPickerToggle.ImageColor3 = OldToggleColor
                    Color.BackgroundColor3 = OldColor
    
                    ColorSelection.Position = OldColorSelectionPosition
                    HueSelection.Position = OldHueSelectionPosition
    
                    SetRGBValues()
                    callback(ColorPickerToggle.ImageColor3)

                    TweenService:Create(RainbowToggleTitle, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(185, 185, 185)}):Play()
                    TweenService:Create(TickCover, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -7, 0.5, -7), Size = UDim2.new(0, 14, 0, 14)}):Play()
                    TweenService:Create(CheckboxOutline, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(65, 65, 65)}):Play()
                    TweenService:Create(CheckboxTicked, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(65, 65, 65)}):Play()
                end
            end)

            ColorPickerToggle.MouseButton1Down:Connect(function()
                ColorPickerToggled = not ColorPickerToggled

                if ColorPickerToggled then
                    TweenService:Create(NameColorPicker, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 0, 210)}):Play()
                    TweenService:Create(ColorPicker, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
                elseif not ColorPickerToggled then
                    TweenService:Create(NameColorPicker, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 0, 32)}):Play()
                    TweenService:Create(ColorPicker, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
                end
            end)

            table.insert(Library.LibraryColorTable, CheckboxOutline)
            table.insert(Library.LibraryColorTable, CheckboxTicked)
        end
function SectionElements:CreateDropdown(name, options, presetoption, callback)
    local NameDropdown = Instance.new("Frame")
    local TitleToggle = Instance.new("TextButton")
    local Dropdown = Instance.new("ImageLabel")
    local DropdownContentLayout = Instance.new("UIListLayout")

    local gameId = self.GameId
    local DropdownToggled = false
    table.insert(options, 1, "None")
    if not Settings[gameId] then Settings[gameId] = {} end
    local SelectedOption = tostring(Settings[gameId][name] or options[presetoption] or options[1] or "None")

    
    NameDropdown.Name = (name .. "Dropdown")
    NameDropdown.Parent = SectionContent
    NameDropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NameDropdown.BackgroundTransparency = 1.000
    NameDropdown.Position = UDim2.new(0, 0, 0.773480654, 0)
    NameDropdown.Size = UDim2.new(1, 0, 0, 35)
    NameDropdown.ZIndex = 10

    TitleToggle.Name = "TitleToggle"
    TitleToggle.Parent = NameDropdown
    TitleToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TitleToggle.BackgroundTransparency = 1.000
    TitleToggle.BorderSizePixel = 0
    TitleToggle.Position = UDim2.new(0, 13, 0, 0)
    TitleToggle.Size = UDim2.new(1, -30, 0, 30)
    TitleToggle.ZIndex = 11
    TitleToggle.Font = Library.Theme.TextFont
    TitleToggle.Text = (name .. " - " .. SelectedOption)
    TitleToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleToggle.TextSize = 15.000
    TitleToggle.TextXAlignment = Enum.TextXAlignment.Left

    Dropdown.Name = "Dropdown"
    Dropdown.Parent = NameDropdown
    Dropdown.BackgroundColor3 = Library.Theme.BackgroundColor
    Dropdown.BackgroundTransparency = 1.000
    Dropdown.Position = UDim2.new(0, 15, 0, 30)
    Dropdown.Size = UDim2.new(1, -30, 0, 0)
    Dropdown.ZIndex = 12
    Dropdown.Image = "rbxassetid://3570695787"
    Dropdown.ImageColor3 = Color3.fromRGB(30, 30, 33)
    Dropdown.ScaleType = Enum.ScaleType.Slice
    Dropdown.SliceCenter = Rect.new(100, 100, 100, 100)
    Dropdown.SliceScale = 0.050
    Dropdown.ClipsDescendants = true

    DropdownContentLayout.Name = "DropdownContentLayout"
    DropdownContentLayout.Parent = Dropdown
    DropdownContentLayout.SortOrder = Enum.SortOrder.LayoutOrder

    local searchTextBox = Instance.new("TextBox")
    searchTextBox.Name = "SearchTextBox"
    searchTextBox.Parent = Dropdown
    searchTextBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    searchTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    searchTextBox.PlaceholderText = "Search..."
    searchTextBox.Size = UDim2.new(1, 0, 0, 20)
    searchTextBox.Position = UDim2.new(0, 0, 0, 0)
    searchTextBox.Visible = false
    searchTextBox.TextSize = 14
    searchTextBox.Font = Library.Theme.TextFont
    searchTextBox.ZIndex = 13

    local function ResetAllDropdownItems()
        for i, v in pairs(Dropdown:GetChildren()) do
            if v:IsA("TextButton") then
                TweenService:Create(v, TweenInfo.new(0.25, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
            end
        end
    end

    local function ClearAllDropdownItems()
        for i, v in pairs(Dropdown:GetChildren()) do
            if v:IsA("TextButton") then
                v:Destroy()
            end
        end
        DropdownToggled = true
        searchTextBox.Visible = false
        TweenService:Create(TitleToggle, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
        TweenService:Create(NameDropdown, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 0, 35)}):Play()
        TweenService:Create(Dropdown, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(1, -30, 0, 0)}):Play()
    end

    local function updateOptions(filterText)
        for i, v in pairs(Dropdown:GetChildren()) do
            if v:IsA("TextButton") then
                v:Destroy()
            end
        end

        for i, v in pairs(options) do
            if string.find(string.lower(v), string.lower(filterText)) then
                local NameButton = Instance.new("TextButton")
                NameButton.Name = (v .. "DropdownButton")
                NameButton.Parent = Dropdown
                NameButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                NameButton.BackgroundTransparency = 1.000
                NameButton.BorderSizePixel = 0
                NameButton.Size = UDim2.new(1, 0, 0, 25)
                NameButton.ZIndex = 14
                NameButton.AutoButtonColor = false
                NameButton.Font = Library.Theme.TextFont
                NameButton.Text = v
                NameButton.TextColor3 = (v == SelectedOption) and Library.Theme.MainColor or Color3.fromRGB(255, 255, 255)
                NameButton.TextSize = 15.000
                
                NameButton.TextXAlignment = Enum.TextXAlignment.Center

                
                local textBounds = NameButton.TextBounds.X + 20 
                local ClickArea = Instance.new("TextButton")
                ClickArea.Name = "ClickArea"
                ClickArea.Parent = NameButton
                ClickArea.BackgroundTransparency = 1.000
                ClickArea.Size = UDim2.new(0, textBounds, 0, 25)
                ClickArea.Position = UDim2.new(0.5, -textBounds / 2, 0, 0) 
                ClickArea.ZIndex = 15
                ClickArea.Text = ""
                ClickArea.AutoButtonColor = false

                table.insert(Library.LibraryColorTable, NameButton)

                
                ClickArea.MouseButton1Down:Connect(function()
                    SelectedOption = v
                    ResetAllDropdownItems()
                    TitleToggle.Text = (name .. " - " .. SelectedOption)
                    TweenService:Create(NameButton, TweenInfo.new(0.35, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {TextColor3 = Library.Theme.MainColor}):Play()
                    if not Settings[gameId] then Settings[gameId] = {} end
                    Settings[gameId][name] = SelectedOption
                    SaveSettings()
                    if type(callback) == "function" then
                        callback(SelectedOption)
                    end
                    ClearAllDropdownItems()
                end)

                ClickArea.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseMovement then
                        TweenService:Create(NameButton, TweenInfo.new(0.35, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {BackgroundTransparency = 0.95}):Play()
                    end
                end)

                ClickArea.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseMovement then
                        TweenService:Create(NameButton, TweenInfo.new(0.35, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
                    end
                end)
            end
        end
    end

    TitleToggle.MouseButton1Down:Connect(function()
        DropdownToggled = not DropdownToggled
        if DropdownToggled then
            searchTextBox.Visible = false
            updateOptions("")
            TweenService:Create(TitleToggle, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
            TweenService:Create(NameDropdown, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 0, 35)}):Play()
            TweenService:Create(Dropdown, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(1, -30, 0, 0)}):Play()
        else
            searchTextBox.Visible = true
            searchTextBox.Text = ""
            updateOptions("")
            TweenService:Create(TitleToggle, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(185, 185, 185)}):Play()
            TweenService:Create(NameDropdown, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 0, 35 + DropdownContentLayout.AbsoluteContentSize.Y + 20)}):Play()
            TweenService:Create(Dropdown, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(1, -30, 0, DropdownContentLayout.AbsoluteContentSize.Y + 20)}):Play()
        end
    end)

    searchTextBox.Changed:Connect(function(property)
        if property == "Text" and not DropdownToggled then
            updateOptions(searchTextBox.Text)
        end
    end)

    local function Refresh(newoptions, newpresetoption, newcallback)
        options = newoptions or options
        local presetValue = options[newpresetoption] or Settings[gameId][name] or options[1]
        SelectedOption = presetValue
        
        if SelectedOption and SelectedOption ~= "None" and type(newcallback) == "function" then
            callback(SelectedOption)
        end
        
        TitleToggle.Text = (name .. " - " .. SelectedOption)
        Settings[gameId][name] = SelectedOption
        SaveSettings()
        
        ClearAllDropdownItems()
        updateOptions("")
    end

    updateOptions("")
    if type(callback) == "function" and SelectedOption ~= "None" then
        callback(SelectedOption)
    end

    if SectionContent and SectionContentLayout then
        -- (tinggi diatur otomatis oleh ResizeSection)
    end

    return {
        Refresh = Refresh
    }
end
function SectionElements:CreateMultiDropdown(name, options, minSelect, maxSelect, presetOptions, callback)
    local NameDropdown = Instance.new("Frame")
    local TitleToggle = Instance.new("TextButton")
    local Dropdown = Instance.new("ImageLabel")
    local DropdownContentLayout = Instance.new("UIListLayout")
    
    local DropdownToggled = false
    local gameId = self.GameId
    local SelectedOptions = presetOptions or {}
    local minSelect = tonumber(minSelect) or 1
    local maxSelect = tonumber(maxSelect) or (#options or 0)

    
    if not Settings[gameId] then
        Settings[gameId] = {}
    end

    
    if Settings[gameId][name] and type(Settings[gameId][name]) == "table" then
        SelectedOptions = Settings[gameId][name]
        
        for i = #SelectedOptions, 1, -1 do
            if not table.find(options, SelectedOptions[i]) then
                table.remove(SelectedOptions, i)
            end
        end
        
        while #SelectedOptions > maxSelect do
            table.remove(SelectedOptions, #SelectedOptions)
        end
        if #SelectedOptions < minSelect then
            for i = 1, minSelect - #SelectedOptions do
                if options[i] and not table.find(SelectedOptions, options[i]) then
                    table.insert(SelectedOptions, options[i])
                end
            end
        end
    else
        
        Settings[gameId][name] = SelectedOptions
        SaveSettings() 
    end

    NameDropdown.Name = (name .. "MultiDropdown")
    NameDropdown.Parent = SectionContent
    NameDropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NameDropdown.BackgroundTransparency = 1.000
    NameDropdown.Size = UDim2.new(1, 0, 0, 35)
    NameDropdown.ZIndex = 5

    TitleToggle.Name = "TitleToggle"
    TitleToggle.Parent = NameDropdown
    TitleToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TitleToggle.BackgroundTransparency = 1.000
    TitleToggle.BorderSizePixel = 0
    TitleToggle.Position = UDim2.new(0, 13, 0, 0)
    TitleToggle.Size = UDim2.new(1, -30, 0, 30)
    TitleToggle.ZIndex = 7
    TitleToggle.Font = Library.Theme.TextFont
    TitleToggle.Text = name .. " - " .. #SelectedOptions .. "/" .. maxSelect
    TitleToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleToggle.TextSize = 15.000
    TitleToggle.TextXAlignment = Enum.TextXAlignment.Left

    Dropdown.Name = "Dropdown"
    Dropdown.Parent = NameDropdown
    Dropdown.BackgroundColor3 = Library.Theme.BackgroundColor
    Dropdown.BackgroundTransparency = 1.000
    Dropdown.Position = UDim2.new(0, 15, 0, 30)
    Dropdown.Size = UDim2.new(1, -30, 0, 0)
    Dropdown.ZIndex = 15
    Dropdown.Image = "rbxassetid://3570695787"
    Dropdown.ImageColor3 = Color3.fromRGB(30, 30, 33)
    Dropdown.ScaleType = Enum.ScaleType.Slice
    Dropdown.SliceCenter = Rect.new(100, 100, 100, 100)
    Dropdown.SliceScale = 0.050
    Dropdown.ClipsDescendants = true

    DropdownContentLayout.Name = "DropdownContentLayout"
    DropdownContentLayout.Parent = Dropdown
    DropdownContentLayout.SortOrder = Enum.SortOrder.LayoutOrder

    local function UpdateTitle()
        TitleToggle.Text = name .. " - " .. #SelectedOptions .. "/" .. maxSelect
        if callback then
            callback(SelectedOptions)
        end
    end

    local function ResetAllDropdownItems()
        for _, v in pairs(Dropdown:GetChildren()) do
            if v:IsA("TextButton") then
                if table.find(SelectedOptions, v.Text) then
                    TweenService:Create(v, TweenInfo.new(0.25, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {TextColor3 = Library.Theme.MainColor}):Play()
                else
                    TweenService:Create(v, TweenInfo.new(0.25, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                end
            end
        end
    end

    local function ClearAllDropdownItems()
        for _, v in pairs(Dropdown:GetChildren()) do
            if v:IsA("TextButton") then
                v:Destroy()
            end
        end
    end

    local function PopulateDropdown()
        ClearAllDropdownItems()
        
        for _, v in pairs(options or {}) do
            local NameButton = Instance.new("TextButton")
            
            NameButton.Name = (v .. "DropdownButton")
            NameButton.Parent = Dropdown
            NameButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            NameButton.BackgroundTransparency = 1.000
            NameButton.BorderSizePixel = 0
            NameButton.Size = UDim2.new(1, 0, 0, 25)
            NameButton.ZIndex = 15
            NameButton.AutoButtonColor = false
            NameButton.Font = Library.Theme.TextFont
            NameButton.Text = v
            NameButton.TextColor3 = table.find(SelectedOptions, v) and Library.Theme.MainColor or Color3.fromRGB(255, 255, 255)
            NameButton.TextSize = 15.000

            NameButton.MouseButton1Click:Connect(function()
                local index = table.find(SelectedOptions, v)
                if index then
                    if #SelectedOptions > minSelect then
                        table.remove(SelectedOptions, index)
                        TweenService:Create(NameButton, TweenInfo.new(0.35, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                        Settings[gameId][name] = SelectedOptions
                        SaveSettings() 
                        UpdateTitle()
                    end
                else
                    if #SelectedOptions < maxSelect then
                        table.insert(SelectedOptions, v)
                        TweenService:Create(NameButton, TweenInfo.new(0.35, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {TextColor3 = Library.Theme.MainColor}):Play()
                        Settings[gameId][name] = SelectedOptions
                        SaveSettings() 
                        UpdateTitle()
                    end
                end
            end)

            NameButton.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement then
                    TweenService:Create(NameButton, TweenInfo.new(0.35, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {BackgroundTransparency = 0.95}):Play()
                end
            end)

            NameButton.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement then
                    TweenService:Create(NameButton, TweenInfo.new(0.35, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
                end
            end)
        end
    end

    TitleToggle.MouseButton1Down:Connect(function()
        DropdownToggled = not DropdownToggled
        
        if DropdownToggled then
            PopulateDropdown()
            TweenService:Create(TitleToggle, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(185, 185, 185)}):Play()
            TweenService:Create(NameDropdown, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 0, 35 + DropdownContentLayout.AbsoluteContentSize.Y)}):Play()
            TweenService:Create(Dropdown, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(1, -30, 0, DropdownContentLayout.AbsoluteContentSize.Y)}):Play()
        else
            TweenService:Create(TitleToggle, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
            TweenService:Create(NameDropdown, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 0, 35)}):Play()
            TweenService:Create(Dropdown, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(1, -30, 0, 0)}):Play()
        end
    end)

    local function Refresh(newOptions, newMinSelect, newMaxSelect, newPresetOptions)
        options = newOptions or options
        minSelect = tonumber(newMinSelect) or minSelect
        maxSelect = tonumber(newMaxSelect) or maxSelect
        SelectedOptions = newPresetOptions or SelectedOptions
        
        for i = #SelectedOptions, 1, -1 do
            if not table.find(options, SelectedOptions[i]) then
                table.remove(SelectedOptions, i)
            end
        end
        
        while #SelectedOptions > maxSelect do
            table.remove(SelectedOptions, #SelectedOptions)
        end
        
        if #SelectedOptions < minSelect then
            for i = 1, minSelect - #SelectedOptions do
                if options[i] and not table.find(SelectedOptions, options[i]) then
                    table.insert(SelectedOptions, options[i])
                end
            end
        end
        Settings[gameId][name] = SelectedOptions
        SaveSettings() 
        UpdateTitle()

        if DropdownToggled then
            PopulateDropdown()
            TweenService:Create(NameDropdown, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 0, 35 + DropdownContentLayout.AbsoluteContentSize.Y)}):Play()
            TweenService:Create(Dropdown, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(1, -30, 0, DropdownContentLayout.AbsoluteContentSize.Y)}):Play()
        end
    end

    UpdateTitle()
    return {
        Refresh = Refresh,
        GetSelected = function() return SelectedOptions end
    }
end

        function SectionElements:CreateKeybind(name, presetbind, keyboardonly, holdmode, callback)
            local NameKeybind = Instance.new("Frame")
            local Title = Instance.new("TextLabel")
            local KeybindButtonBorder = Instance.new("ImageLabel")
            local KeybindButton = Instance.new("TextButton")

            local OldBind = presetbind.Name
            local LoadFromPreset = false
            local JustBinded = false

            local NotAllowedKeys = {
                Return = true,
                Space = true,
                Tab = true,
                Unknown = true,
                MouseButton1 = true
            }

            local AllowedMouseTypes = {
                MouseButton2 = true,
                MouseButton3 = true
            }

            local ShortenedNames = {
                LeftShift = "LShift",
                RightShift = "RShift",
                LeftControl = "LCtrl",
                RightControl = "RCtrl",
                LeftAlt = "LAlt",
                RightAlt = "RAlt",
                CapsLock = "Caps",
                One = "1",
                Two = "2",
                Three = "3",
                Four = "4",
                Five = "5",
                Six = "6",
                Seven = "7",
                Eight = "8",
                Nine = "9",
                Zero = "0",
                KeypadOne = "Num-1",
                KeypadTwo = "Num-2",
                KeypadThree = "Num-3",
                KeypadFour = "Num-4",
                KeypadFive = "Num-5",
                KeypadSix = "Num-6",
                KeypadSeven = "Num-7",
                KeypadEight = "Num-8",
                KeypadNine = "Num-9",
                KeypadZero = "Num-0",
                Minus = "-",
                Equals = "=",
                Tilde = "~",
                LeftBracket = "[",
                RightBracket = "]",
                RightParenthesis = ")",
                LeftParenthesis = "(",
                Semicolon = ";",
                Quote = "'",
                BackSlash = "\\",
                Comma = ",",
                Period = ".",
                Slash = "/",
                Asterisk = "*",
                Plus = "+",
                Period = ".",
                Backquote = "`",
                MouseButton1 = "M1",
                MouseButton2 = "M2",
                MouseButton3 = "M3"
            }

            NameKeybind.Name = (name .. "Keybind")
            NameKeybind.Parent = SectionContent
            NameKeybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            NameKeybind.BackgroundTransparency = 1.000
            NameKeybind.Position = UDim2.new(0, 0, 0.138121545, 0)
            NameKeybind.Size = UDim2.new(1, 0, 0, 35)

            Title.Name = "Title"
            Title.Parent = NameKeybind
            Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title.BackgroundTransparency = 1.000
            Title.Position = UDim2.new(0, 13, 0, 0)
            Title.Size = UDim2.new(1, -66, 0, 30)
            Title.ZIndex = 5
            Title.Font = Library.Theme.TextFont
            Title.Text = name
            Title.TextColor3 = Library.Theme.TextColor
            Title.TextSize = 15.000
            Title.TextXAlignment = Enum.TextXAlignment.Left

            KeybindButtonBorder.Name = "KeybindButtonBorder"
            KeybindButtonBorder.Parent = NameKeybind
            KeybindButtonBorder.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
            KeybindButtonBorder.BackgroundTransparency = 1.000
            KeybindButtonBorder.Position = UDim2.new(1, -56, 0, 5)
            KeybindButtonBorder.Size = UDim2.new(0, 42, 0, 20)
            KeybindButtonBorder.ZIndex = 5
            KeybindButtonBorder.Image = "rbxassetid://3570695787"
            KeybindButtonBorder.ImageColor3 = Color3.fromRGB(65, 65, 65)
            KeybindButtonBorder.ScaleType = Enum.ScaleType.Slice
            KeybindButtonBorder.SliceCenter = Rect.new(100, 100, 100, 100)
            KeybindButtonBorder.SliceScale = 0.030

            KeybindButton.Name = "KeybindButton"
            KeybindButton.Parent = KeybindButtonBorder
            KeybindButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            KeybindButton.BackgroundTransparency = 1.000
            KeybindButton.Size = UDim2.new(1, 0, 1, 0)
            KeybindButton.ZIndex = 5
            KeybindButton.Font = Library.Theme.TextFont
            KeybindButton.Text = (ShortenedNames[presetbind.Name] or ShortenedNames[presetbind] or presetbind.Name or "None")
            KeybindButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            KeybindButton.TextSize = 15.000
            KeybindButton.TextWrapped = true
            
            if LoadFromPreset then
                KeybindButton.Text = presetbind
            end

            if presetbind == Enum.KeyCode.Unknown or presetbind == "Unknown" then
                KeybindButton.Text = "None"
            end

            KeybindButton.MouseButton1Click:Connect(function()
                if Library.CurrentlyBinding then return end

                KeybindButton.Text = "..."

                local Input, Bruh = UserInputService.InputBegan:wait()
                Library.CurrentlyBinding = true

                if Input.KeyCode.Name == "Backspace" or Input.KeyCode.Name == "Delete" then
                    KeybindButton.Text = "None"
                    OldBind = Enum.KeyCode.Unknown.Name
                    Library.CurrentlyBinding = false
                    JustBinded = false
                    return
                end
                
                if (Input.UserInputType ~= Enum.UserInputType.Keyboard and (AllowedMouseTypes[Input.UserInputType.Name]) and (not keyboardonly)) or (Input.KeyCode and (not NotAllowedKeys[Input.KeyCode.Name])) then
                    local BindName = ((Input.UserInputType ~= Enum.UserInputType.Keyboard and Input.UserInputType.Name) or Input.KeyCode.Name)
                    KeybindButton.Text = ShortenedNames[BindName] or BindName
                    OldBind = BindName
                    Library.CurrentlyBinding = false
                    JustBinded = true
                else
                    KeybindButton.Text = ShortenedNames[OldBind] or OldBind
                    Library.CurrentlyBinding = false
                end
            end)
            
            if not holdmode then
                UserInputService.InputBegan:Connect(function(input, gameprocessedevent) 
                    if not gameprocessedevent then
                        if UserInputService:GetFocusedTextBox() then return end
                        if OldBind == Enum.KeyCode.Unknown.Name then return end
                        if JustBinded then JustBinded = false return end

                        local BindName = ((input.UserInputType ~= Enum.UserInputType.Keyboard and input.UserInputType.Name) or input.KeyCode.Name)

                        if BindName == OldBind then 
                            callback()
                        end
                    end
                end)
            else
                UserInputService.InputBegan:Connect(function(input, gameprocessedevent) 
                    if not gameprocessedevent then
                        if UserInputService:GetFocusedTextBox() then return end
                        if OldBind == Enum.KeyCode.Unknown.Name then return end
                        if JustBinded then JustBinded = false return end

                        local BindName = ((input.UserInputType ~= Enum.UserInputType.Keyboard and input.UserInputType.Name) or input.KeyCode.Name)

                        if BindName == OldBind then 
                            callback(true)
                        end
                    end
                end)

                UserInputService.InputEnded:Connect(function(input, gameprocessedevent) 
                    if not gameprocessedevent then
                        if UserInputService:GetFocusedTextBox() then return end
                        if OldBind == Enum.KeyCode.Unknown.Name then return end
                        if JustBinded then JustBinded = false return end

                        HoldModeToggled = false
                        local BindName = ((input.UserInputType ~= Enum.UserInputType.Keyboard and input.UserInputType.Name) or input.KeyCode.Name)

                        if BindName == OldBind then 
                            callback(false)
                        end
                    end
                end)
            end
        end

        -- (tinggi diatur otomatis oleh ResizeSection)

        return SectionElements
    end

    return TabElements
end

-- Library:SetLogo("rbxassetid://123")        -> gambar saja
-- Library:SetLogo("123456")                  -> gambar saja (angka = asset id)
-- Library:SetLogo("DX")                      -> huruf saja
-- Library:SetLogo("rbxassetid://123", "DX")  -> gambar + huruf
-- Library:SetLogo({ Image = "...", Text = "DX" })
function Library:SetLogo(a, b)
    local image, text
    if type(a) == "table" then
        image, text = a.Image or a.image, a.Text or a.text
    elseif type(a) == "number" then
        image, text = "rbxassetid://" .. a, b
    elseif type(a) == "string" then
        if a:match("^rbxassetid://") or a:match("^rbxasset://") or a:match("^https?://") or a:match("^%d+$") then
            image, text = a, b
        else
            text = a
        end
    end
    if type(image) == "number" then image = "rbxassetid://" .. image end
    if type(image) == "string" and image:match("^%d+$") then image = "rbxassetid://" .. image end

    local old = Topbar:FindFirstChild("Logo")
    if old then old:Destroy() end
    local oldFloat = FloatingIcon:FindFirstChild("LogoImage")
    if oldFloat then oldFloat:Destroy() end
    FloatingText.Visible = true
    if not image and not text then return end

    local Logo = Instance.new("Frame")
    Logo.Name = "Logo"
    Logo.Parent = Topbar
    Logo.BackgroundTransparency = 1
    Logo.Position = UDim2.new(0, 8, 0, 4)
    Logo.Size = UDim2.new(0, 0, 0, 22)
    Logo.AutomaticSize = Enum.AutomaticSize.X
    Logo.ZIndex = 6

    local LogoLayout = Instance.new("UIListLayout")
    LogoLayout.FillDirection = Enum.FillDirection.Horizontal
    LogoLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    LogoLayout.SortOrder = Enum.SortOrder.LayoutOrder
    LogoLayout.Padding = UDim.new(0, 6)
    LogoLayout.Parent = Logo

    if image then
        local Img = Instance.new("ImageLabel")
        Img.Name = "LogoImage"
        Img.Parent = Logo
        Img.LayoutOrder = 1
        Img.BackgroundTransparency = 1
        Img.Size = UDim2.new(0, 22, 0, 22)
        Img.Image = image
        Img.ScaleType = Enum.ScaleType.Crop
        Img.ZIndex = 6
        local c = Instance.new("UICorner")
        c.CornerRadius = UDim.new(0, 6)
        c.Parent = Img

        -- ikon melayang saat window di-minimize ikut pakai gambar yang sama
        local Fi = Instance.new("ImageLabel")
        Fi.Name = "LogoImage"
        Fi.Parent = FloatingIcon
        Fi.BackgroundTransparency = 1
        Fi.AnchorPoint = Vector2.new(0.5, 0.5)
        Fi.Position = UDim2.new(0.5, 0, 0.5, 0)
        Fi.Size = UDim2.new(1, -6, 1, -6)
        Fi.Image = image
        Fi.ScaleType = Enum.ScaleType.Crop
        Fi.ZIndex = 52
        local fc = Instance.new("UICorner")
        fc.CornerRadius = UDim.new(0, 8)
        fc.Parent = Fi
        FloatingText.Visible = false
    end

    if text then
        local Txt = Instance.new("TextLabel")
        Txt.Name = "LogoText"
        Txt.Parent = Logo
        Txt.LayoutOrder = 2
        Txt.BackgroundTransparency = 1
        Txt.AutomaticSize = Enum.AutomaticSize.X
        Txt.Size = UDim2.new(0, 0, 0, 22)
        Txt.Font = Library.Theme.TextFont
        Txt.Text = text
        Txt.TextSize = 17
        Txt.TextColor3 = Library.Theme.MainColor
        Txt.ZIndex = 6
        if not image then FloatingText.Text = string.sub(text, 1, 2) end
    end
end

function Library:CreateWindow(text, logo)
    if logo ~= nil then Library:SetLogo(logo) end
    local WindowTitle = Instance.new("TextLabel")
    WindowTitle.Name = "WindowTitle"
    WindowTitle.Parent = Topbar
    WindowTitle.BackgroundTransparency = 1
    WindowTitle.AnchorPoint = Vector2.new(0.5, 0)
    WindowTitle.Position = UDim2.new(0.5, 0, 0, 0)
    WindowTitle.Size = UDim2.new(1, -70, 1, 0)
    WindowTitle.ZIndex = 3
    WindowTitle.Font = Library.Theme.TextFont
    WindowTitle.Text = text or "Window Title"
    WindowTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    WindowTitle.TextSize = 14
    WindowTitle.TextXAlignment = Enum.TextXAlignment.Center

    table.insert(Library.LibraryColorTable, WindowTitle)

    local function ColorTransition()
        while true do
            for i = 0, 1, 0.01 do
                local r = 255
                local g = 255 - (i * (255 - 75))
                local b = 255 - (i * (255 - 75))
                WindowTitle.TextColor3 = Color3.fromRGB(r, g, b)
                task.wait(0.02)
            end
            for i = 0, 1, 0.01 do
                local r = 255 - (i * 255)
                local g = 75 - (i * 75)
                local b = 75 + (i * (255 - 75))
                WindowTitle.TextColor3 = Color3.fromRGB(r, g, b)
                task.wait(0.02)
            end
            for i = 0, 1, 0.01 do
                local r = 0 + (i * 255)
                local g = 0 + (i * 255)
                local b = 255 - (i * (255 - 255))
                WindowTitle.TextColor3 = Color3.fromRGB(r, g, b)
                task.wait(0.02)
            end
        end
    end

    coroutine.wrap(ColorTransition)()

    return WindowTitle
end
function Library:CreateText(texts, duration, colorHex)
    local textContainer = Instance.new("Frame")
    local textLabel = Instance.new("TextLabel")
    local currentIndex = 1

    if not texts or #texts < 1 or #texts > 5 then
        warn("Texts must be an array with 1 to 5 entries")
        return
    end
    duration = duration or 2
    local color = colorHex and Color3.fromHex(colorHex) or Library.Theme.TextColor

    textContainer.Name = "TextContainer"
    textContainer.Parent = game:GetService("CoreGui")["Rndm."].Main
    textContainer.BackgroundTransparency = 1
    textContainer.Position = UDim2.new(0, Layout.Side + 12, 1, -22)
    textContainer.Size = UDim2.new(1, -(Layout.Side + 24), 0, 20)
    textContainer.ZIndex = 100

    textLabel.Name = "TextLabel"
    textLabel.Parent = textContainer
    textLabel.BackgroundTransparency = 1
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.ZIndex = 101
    textLabel.Font = Library.Theme.TextFont
    textLabel.Text = texts[1]
    textLabel.TextColor3 = color
    textLabel.TextTransparency = 0
    textLabel.TextSize = 14 
    textLabel.TextWrapped = true
    textLabel.TextXAlignment = Enum.TextXAlignment.Left

    local function transitionText()
        while true do
            local nextIndex = currentIndex % #texts + 1
            TweenService:Create(textLabel, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {
                TextTransparency = 1
            }):Play()
            wait(0.5)
            textLabel.Text = texts[nextIndex]
            TweenService:Create(textLabel, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {
                TextTransparency = 0.5
            }):Play()
            currentIndex = nextIndex
            wait(duration)
        end
    end

    spawn(transitionText)

    return textContainer
end


-- =====================================================================
-- NOTIFICATION SYSTEM (module-level, bisa dipanggil kapan saja)
-- =====================================================================
Library.ActiveNotifications = {}

function Library:CreateNotification(title, message, duration, buttons, buttonCallbacks)
    local NotificationFrame = Instance.new("Frame")
    local NotificationBackground = Instance.new("Frame")
    local TopAccent = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local TopCorner = Instance.new("UICorner")
    local TitleLabel = Instance.new("TextLabel")
    local MessageLabel = Instance.new("TextLabel")
    local CloseButton = Instance.new("TextButton")
    local TimerBar = Instance.new("Frame")
    local TimerBarFill = Instance.new("Frame")
    local TimerCorner = Instance.new("UICorner")

    local hasButtons = buttons and #buttons > 0
    local notifHeight = hasButtons and 110 or 80

    NotificationFrame.Name = "Notification"
    NotificationFrame.Parent = UILibrary
    NotificationFrame.BackgroundTransparency = 1
    NotificationFrame.Position = UDim2.new(1, 0, 1, -110)
    NotificationFrame.Size = UDim2.new(0, 300, 0, notifHeight)
    NotificationFrame.ZIndex = 100

    -- Background gelap, bukan MainColor
    NotificationBackground.Name = "Background"
    NotificationBackground.Parent = NotificationFrame
    NotificationBackground.BackgroundColor3 = Color3.fromRGB(28, 28, 32)
    NotificationBackground.Size = UDim2.new(1, 0, 1, 0)
    NotificationBackground.ZIndex = 100
    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = NotificationBackground

    -- Top accent strip pakai MainColor
    TopAccent.Name = "TopAccent"
    TopAccent.Parent = NotificationBackground
    TopAccent.BackgroundColor3 = Library.Theme.MainColor
    TopAccent.BorderSizePixel = 0
    TopAccent.Position = UDim2.new(0, 0, 0, 0)
    TopAccent.Size = UDim2.new(1, 0, 0, 3)
    TopAccent.ZIndex = 101
    TopCorner.CornerRadius = UDim.new(0, 10)
    TopCorner.Parent = TopAccent

    TitleLabel.Name = "Title"
    TitleLabel.Parent = NotificationBackground
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(0, 12, 0, 8)
    TitleLabel.Size = UDim2.new(0, 250, 0, 22)
    TitleLabel.ZIndex = 101
    TitleLabel.Font = Library.Theme.TextFont
    TitleLabel.Text = title or "Notification"
    TitleLabel.TextColor3 = Library.Theme.MainColor
    TitleLabel.TextSize = 16
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    MessageLabel.Name = "Message"
    MessageLabel.Parent = NotificationBackground
    MessageLabel.BackgroundTransparency = 1
    MessageLabel.Position = UDim2.new(0, 12, 0, 32)
    MessageLabel.Size = UDim2.new(0, 256, 0, hasButtons and 38 or 30)
    MessageLabel.ZIndex = 101
    MessageLabel.Font = Library.Theme.TextFont
    MessageLabel.Text = message or ""
    MessageLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    MessageLabel.TextSize = 14
    MessageLabel.TextWrapped = true
    MessageLabel.TextXAlignment = Enum.TextXAlignment.Left

    CloseButton.Name = "CloseButton"
    CloseButton.Parent = NotificationBackground
    CloseButton.BackgroundTransparency = 1
    CloseButton.Position = UDim2.new(1, -26, 0, 6)
    CloseButton.Size = UDim2.new(0, 20, 0, 20)
    CloseButton.ZIndex = 102
    CloseButton.Font = Library.Theme.TextFont
    CloseButton.Text = "✕"
    CloseButton.TextColor3 = Color3.fromRGB(160, 160, 160)
    CloseButton.TextSize = 14

    CloseButton.MouseEnter:Connect(function()
        TweenService:Create(CloseButton, TweenInfo.new(0.15), {TextColor3 = Color3.fromRGB(255,255,255)}):Play()
    end)
    CloseButton.MouseLeave:Connect(function()
        TweenService:Create(CloseButton, TweenInfo.new(0.15), {TextColor3 = Color3.fromRGB(160,160,160)}):Play()
    end)

    -- Timer bar bawah
    TimerBar.Name = "TimerBar"
    TimerBar.Parent = NotificationBackground
    TimerBar.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
    TimerBar.BorderSizePixel = 0
    TimerBar.Position = UDim2.new(0, 12, 1, -12)
    TimerBar.Size = UDim2.new(1, -24, 0, 4)
    TimerBar.ZIndex = 101
    TimerCorner.CornerRadius = UDim.new(1, 0)
    TimerCorner.Parent = TimerBar

    TimerBarFill.Name = "TimerBarFill"
    TimerBarFill.Parent = TimerBar
    TimerBarFill.BackgroundColor3 = Library.Theme.MainColor
    TimerBarFill.BorderSizePixel = 0
    TimerBarFill.Size = UDim2.new(1, 0, 1, 0)
    TimerBarFill.ZIndex = 102
    local FillCorner = Instance.new("UICorner")
    FillCorner.CornerRadius = UDim.new(1, 0)
    FillCorner.Parent = TimerBarFill

    local isClosing = false

    local function closeNotification()
        if isClosing then return end
        isClosing = true
        local idx = table.find(Library.ActiveNotifications, NotificationFrame)
        if idx then table.remove(Library.ActiveNotifications, idx) end
        pcall(function()
            TweenService:Create(NotificationFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                Position = UDim2.new(1, 20, NotificationFrame.Position.Y.Scale, NotificationFrame.Position.Y.Offset)
            }):Play()
        end)
        for i, notif in ipairs(Library.ActiveNotifications) do
            if notif.Parent then
                local targetY = -110 - (i - 1) * (notif.Size.Y.Offset + 10)
                TweenService:Create(notif, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    Position = UDim2.new(1, -310, 1, targetY)
                }):Play()
            end
        end
        task.delay(0.45, function()
            if NotificationFrame and NotificationFrame.Parent then NotificationFrame:Destroy() end
        end)
    end

    if hasButtons then
        local buttonCount = math.clamp(#buttons, 1, 5)
        local btnW = (276 - (buttonCount - 1) * 6) / buttonCount
        for i = 1, buttonCount do
            local ActionButton = Instance.new("TextButton")
            ActionButton.Parent = NotificationBackground
            ActionButton.BackgroundColor3 = Library.Theme.MainColor
            ActionButton.Position = UDim2.new(0, 12 + (i-1)*(btnW+6), 0, notifHeight - 34)
            ActionButton.Size = UDim2.new(0, btnW, 0, 22)
            ActionButton.ZIndex = 102
            ActionButton.Font = Library.Theme.TextFont
            ActionButton.Text = buttons[i] or "Button "..i
            ActionButton.TextColor3 = Color3.fromRGB(255,255,255)
            ActionButton.TextSize = 13
            ActionButton.AutoButtonColor = false
            local ar = Instance.new("UICorner"); ar.CornerRadius = UDim.new(0,5); ar.Parent = ActionButton
            ActionButton.MouseButton1Down:Connect(function()
                TweenService:Create(ActionButton, TweenInfo.new(0.08), {BackgroundColor3 = DarkenObjectColor(Library.Theme.MainColor, 35)}):Play()
            end)
            ActionButton.MouseButton1Up:Connect(function()
                TweenService:Create(ActionButton, TweenInfo.new(0.15, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {BackgroundColor3 = Library.Theme.MainColor}):Play()
            end)
            ActionButton.MouseButton1Click:Connect(function()
                if buttonCallbacks and buttonCallbacks[i] then task.spawn(buttonCallbacks[i]) end
                closeNotification()
            end)
        end
    end

    table.insert(Library.ActiveNotifications, 1, NotificationFrame)
    for i, notif in ipairs(Library.ActiveNotifications) do
        if notif.Parent then
            local targetY = -110 - (i-1) * (notif.Size.Y.Offset + 10)
            TweenService:Create(notif, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                Position = UDim2.new(1, -310, 1, targetY)
            }):Play()
        end
    end

    local dur = duration or 5
    TweenService:Create(TimerBarFill, TweenInfo.new(dur, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 0, 1, 0)}):Play()
    task.delay(dur, function()
        if not isClosing then closeNotification() end
    end)

    CloseButton.MouseButton1Click:Connect(closeNotification)

    -- Slide-in dari kanan
    NotificationFrame.Position = UDim2.new(1, 20, 1, -110)
    TweenService:Create(NotificationFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Position = UDim2.new(1, -310, 1, -110)
    }):Play()

    return NotificationFrame
end

-- =====================================================================
-- KEY SYSTEM UI
-- =====================================================================
function Library:CreateKeySystem(config)
    config = config or {}
    local ksTabs = config.tabs or {}
    local tabCount = math.clamp(#ksTabs, 1, 2)

    -- DARK hardcoded background — tidak pakai Library.Theme.BackgroundColor
    -- karena bisa ter-override oleh LibraryColorTable saat runtime
    local KS_BG      = Color3.fromRGB(22, 22, 26)
    local KS_SURFACE = Color3.fromRGB(30, 30, 36)
    local KS_BORDER  = Color3.fromRGB(48, 48, 58)

    local KSOverlay = Instance.new("Frame")
    KSOverlay.Name = "KeySystemOverlay"
    KSOverlay.Parent = Main
    KSOverlay.BackgroundColor3 = KS_BG
    KSOverlay.BackgroundTransparency = 0
    KSOverlay.Position = UDim2.new(0, 0, 0, 0)
    KSOverlay.Size = UDim2.new(1, 0, 1, 0)
    KSOverlay.ZIndex = 200
    KSOverlay.ClipsDescendants = true

    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 10)
    MainCorner.Parent = KSOverlay

    -- Thin accent line di paling atas
    local TopAccent = Instance.new("Frame")
    TopAccent.Name = "TopAccent"
    TopAccent.Parent = KSOverlay
    TopAccent.BackgroundColor3 = Library.Theme.MainColor
    TopAccent.BorderSizePixel = 0
    TopAccent.Position = UDim2.new(0, 0, 0, 0)
    TopAccent.Size = UDim2.new(1, 0, 0, 3)
    TopAccent.ZIndex = 202
    table.insert(Library.LibraryColorTable, TopAccent)
    local TopAccentCorner = Instance.new("UICorner")
    TopAccentCorner.CornerRadius = UDim.new(0, 10)
    TopAccentCorner.Parent = TopAccent

    -- Header bar (dark surface)
    local HeaderBar = Instance.new("Frame")
    HeaderBar.Name = "KSHeader"
    HeaderBar.Parent = KSOverlay
    HeaderBar.BackgroundColor3 = KS_SURFACE
    HeaderBar.BorderSizePixel = 0
    HeaderBar.Position = UDim2.new(0, 0, 0, 3)
    HeaderBar.Size = UDim2.new(1, 0, 0, 42)
    HeaderBar.ZIndex = 201

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "KSTitle"
    titleLabel.Parent = HeaderBar
    titleLabel.BackgroundTransparency = 1
    titleLabel.Size = UDim2.new(1, 0, 1, 0)
    titleLabel.ZIndex = 203
    titleLabel.Font = Library.Theme.TextFont
    titleLabel.Text = config.title or "Authentication"
    titleLabel.TextColor3 = Library.Theme.TextColor
    titleLabel.TextSize = 17

    -- Separator bawah header
    local HeaderSep = Instance.new("Frame")
    HeaderSep.Parent = KSOverlay
    HeaderSep.BackgroundColor3 = KS_BORDER
    HeaderSep.BorderSizePixel = 0
    HeaderSep.Position = UDim2.new(0, 0, 0, 45)
    HeaderSep.Size = UDim2.new(1, 0, 0, 1)
    HeaderSep.ZIndex = 202

    -- Tab bar (gelap, pakai underline indicator bukan background merah)
    local TabBar = Instance.new("Frame")
    TabBar.Name = "TabBar"
    TabBar.Parent = KSOverlay
    TabBar.BackgroundColor3 = KS_SURFACE
    TabBar.BorderSizePixel = 0
    TabBar.Position = UDim2.new(0, 0, 0, 46)
    TabBar.Size = UDim2.new(1, 0, 0, 34)
    TabBar.ZIndex = 202

    local TabSep = Instance.new("Frame")
    TabSep.Parent = KSOverlay
    TabSep.BackgroundColor3 = KS_BORDER
    TabSep.BorderSizePixel = 0
    TabSep.Position = UDim2.new(0, 0, 0, 80)
    TabSep.Size = UDim2.new(1, 0, 0, 1)
    TabSep.ZIndex = 202

    -- Content area
    local ContentArea = Instance.new("Frame")
    ContentArea.Name = "ContentArea"
    ContentArea.Parent = KSOverlay
    ContentArea.BackgroundTransparency = 1
    ContentArea.Position = UDim2.new(0, 12, 0, 84)
    ContentArea.Size = UDim2.new(1, -24, 1, -148)
    ContentArea.ZIndex = 203
    ContentArea.ClipsDescendants = true

    Library._lastKSOverlay = KSOverlay
    Library._lastKSContentArea = ContentArea

    local tabObjects = {}

    local function ShowTab(index)
        for i, tab in ipairs(tabObjects) do
            local isActive = (i == index)
            tab.content.Visible = isActive
            -- Underline indicator: visible saat active
            TweenService:Create(tab.indicator, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundTransparency = isActive and 0 or 1
            }):Play()
            TweenService:Create(tab.button, TweenInfo.new(0.2), {
                TextColor3 = isActive and Library.Theme.MainColor or Color3.fromRGB(100, 100, 110)
            }):Play()
        end
    end

    for i = 1, tabCount do
        local tabData = ksTabs[i] or {name = "Tab "..i}

        local btn = Instance.new("TextButton")
        btn.Name = "KSTabBtn"..i
        btn.Parent = TabBar
        btn.BackgroundTransparency = 1
        btn.AutoButtonColor = false
        btn.Size = UDim2.new(1/tabCount, 0, 1, 0)
        btn.Position = UDim2.new((i-1)/tabCount, 0, 0, 0)
        btn.ZIndex = 204
        btn.Font = Library.Theme.TextFont
        btn.Text = tabData.name
        btn.TextColor3 = Color3.fromRGB(100, 100, 110)
        btn.TextSize = 14

        -- Underline indicator (accent color, bawah tab button)
        local indicator = Instance.new("Frame")
        indicator.Name = "TabIndicator"
        indicator.Parent = btn
        indicator.AnchorPoint = Vector2.new(0, 1)
        indicator.BackgroundColor3 = Library.Theme.MainColor
        indicator.BorderSizePixel = 0
        indicator.Position = UDim2.new(0.15, 0, 1, 0)
        indicator.Size = UDim2.new(0.7, 0, 0, 2)
        indicator.BackgroundTransparency = 1
        indicator.ZIndex = 205
        table.insert(Library.LibraryColorTable, indicator)
        local indicatorCorner = Instance.new("UICorner")
        indicatorCorner.CornerRadius = UDim.new(1, 0)
        indicatorCorner.Parent = indicator

        -- ScrollingFrame content
        local content = Instance.new("ScrollingFrame")
        content.Name = "KSContent"..i
        content.Parent = ContentArea
        content.BackgroundTransparency = 1
        content.Size = UDim2.new(1, 0, 1, 0)
        content.ScrollBarThickness = 3
        content.ElasticBehavior = Enum.ElasticBehavior.Always
        content.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 90)
        content.AutomaticCanvasSize = Enum.AutomaticSize.Y
        content.CanvasSize = UDim2.new(0, 0, 0, 0)
        content.Visible = false
        content.ZIndex = 205
        content.ClipsDescendants = true

        local layout = Instance.new("UIListLayout")
        layout.Parent = content
        layout.SortOrder = Enum.SortOrder.LayoutOrder
        layout.Padding = UDim.new(0, 8)

        local pad = Instance.new("UIPadding")
        pad.Parent = content
        pad.PaddingTop = UDim.new(0, 6)
        pad.PaddingBottom = UDim.new(0, 6)
        pad.PaddingLeft = UDim.new(0, 2)
        pad.PaddingRight = UDim.new(0, 6)

        btn.MouseButton1Click:Connect(function() ShowTab(i) end)

        local TabAPI = {
            -- AddLabel: fixed height 20px (tidak pakai AutomaticSize biar tidak collapse)
            AddLabel = function(self, text)
                local t = text or ""
                -- Jika kosong/spasi → spacer kecil
                local h = (t == "" or t == " ") and 6 or 20
                local lbl = Instance.new("TextLabel")
                lbl.Parent = content
                lbl.BackgroundTransparency = 1
                lbl.Size = UDim2.new(1, 0, 0, h)
                lbl.Font = Library.Theme.TextFont
                lbl.Text = t
                lbl.TextColor3 = Color3.fromRGB(185, 185, 195)
                lbl.TextSize = 13
                lbl.TextWrapped = true
                lbl.TextXAlignment = Enum.TextXAlignment.Left
                lbl.ZIndex = 206
                return lbl
            end,

            AddTextBox = function(self, placeholder, callback)
                local wrapper = Instance.new("Frame")
                wrapper.Parent = content
                wrapper.BackgroundTransparency = 1
                wrapper.Size = UDim2.new(1, 0, 0, 38)
                wrapper.ZIndex = 206

                local box = Instance.new("TextBox")
                box.Parent = wrapper
                box.BackgroundColor3 = Color3.fromRGB(32, 32, 40)
                box.Size = UDim2.new(1, 0, 1, 0)
                box.Font = Library.Theme.TextFont
                box.PlaceholderText = placeholder or ""
                box.PlaceholderColor3 = Color3.fromRGB(95, 95, 110)
                box.Text = ""
                box.TextColor3 = Color3.fromRGB(235, 235, 240)
                box.TextSize = 14
                box.ClearTextOnFocus = false
                box.ZIndex = 207

                local bCorner = Instance.new("UICorner")
                bCorner.CornerRadius = UDim.new(0, 6)
                bCorner.Parent = box

                local bStroke = Instance.new("UIStroke")
                bStroke.Color = KS_BORDER
                bStroke.Thickness = 1
                bStroke.Parent = box

                local bPad = Instance.new("UIPadding")
                bPad.PaddingLeft = UDim.new(0, 10)
                bPad.PaddingRight = UDim.new(0, 10)
                bPad.Parent = box

                box.Focused:Connect(function()
                    TweenService:Create(bStroke, TweenInfo.new(0.18), {Color = Library.Theme.MainColor}):Play()
                end)
                box.FocusLost:Connect(function(enter)
                    TweenService:Create(bStroke, TweenInfo.new(0.18), {Color = KS_BORDER}):Play()
                    if enter and callback then callback(box.Text) end
                end)
                if callback then
                    box:GetPropertyChangedSignal("Text"):Connect(function() callback(box.Text) end)
                end
                return box
            end,

            -- AddButton: solid BackgroundColor3 (bukan ImageLabel) supaya selalu visible
            AddButton = function(self, name, callback)
                local btn2 = Instance.new("TextButton")
                btn2.Parent = content
                btn2.BackgroundColor3 = Library.Theme.MainColor
                btn2.AutoButtonColor = false
                btn2.ClipsDescendants = true
                btn2.Size = UDim2.new(1, 0, 0, 36)
                btn2.Font = Library.Theme.TextFont
                btn2.Text = name or "Button"
                btn2.TextColor3 = Color3.fromRGB(255, 255, 255)
                btn2.TextSize = 14
                btn2.ZIndex = 206
                table.insert(Library.LibraryColorTable, btn2)

                local bCorner = Instance.new("UICorner")
                bCorner.CornerRadius = UDim.new(0, 6)
                bCorner.Parent = btn2

                -- Micro-interaction: press down = scale kecil + gelap
                btn2.MouseButton1Down:Connect(function()
                    TweenService:Create(btn2, TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Size = UDim2.new(0.96, 0, 0, 32),
                        BackgroundColor3 = DarkenObjectColor(Library.Theme.MainColor, 40)
                    }):Play()
                end)
                btn2.MouseButton1Up:Connect(function()
                    TweenService:Create(btn2, TweenInfo.new(0.22, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                        Size = UDim2.new(1, 0, 0, 36),
                        BackgroundColor3 = Library.Theme.MainColor
                    }):Play()
                end)
                btn2.MouseLeave:Connect(function()
                    TweenService:Create(btn2, TweenInfo.new(0.15), {
                        Size = UDim2.new(1, 0, 0, 36),
                        BackgroundColor3 = Library.Theme.MainColor
                    }):Play()
                end)
                btn2.MouseButton1Click:Connect(function()
                    RippleEffect(btn2)
                    if callback then pcall(callback) end
                end)
                return btn2
            end,
        }

        table.insert(tabObjects, {button = btn, content = content, api = TabAPI, indicator = indicator})

        if tabData.setup then
            tabData.setup(TabAPI)
        end
    end

    ShowTab(1)
    pcall(function() getgenv().Library = Library end)

    return {
        Overlay = KSOverlay,
        Destroy = function()
            if KSOverlay then
                TweenService:Create(KSOverlay, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
                task.delay(0.35, function()
                    if KSOverlay and KSOverlay.Parent then KSOverlay:Destroy() end
                end)
            end
        end
    }
end

-- =====================================================================
-- BOTTOM BAR
-- =====================================================================
function Library:CreateBottomBar()
    local overlay   = Library._lastKSOverlay
    local contentArea = Library._lastKSContentArea

    if not overlay or not overlay.Parent then
        warn("CreateBottomBar: No KeySystem overlay found!")
        return {SetPlaceholder=function()end, OnSubmit=function()end, AddButton=function()end}
    end

    -- Kurangi tinggi ContentArea supaya ada ruang untuk bottom bar
    if contentArea then
        contentArea.Size = UDim2.new(1, -24, 1, -158)
    end

    local KS_BG      = Color3.fromRGB(22, 22, 26)
    local KS_SURFACE = Color3.fromRGB(30, 30, 36)
    local KS_BORDER  = Color3.fromRGB(48, 48, 58)

    -- Separator garis di atas bottom bar
    local Sep = Instance.new("Frame")
    Sep.Name = "BottomBarSep"
    Sep.Parent = overlay
    Sep.BackgroundColor3 = KS_BORDER
    Sep.BorderSizePixel = 0
    Sep.Position = UDim2.new(0, 0, 1, -62)
    Sep.Size = UDim2.new(1, 0, 0, 1)
    Sep.ZIndex = 202

    local BottomBar = Instance.new("Frame")
    BottomBar.Name = "BottomBar"
    BottomBar.Parent = overlay
    BottomBar.BackgroundColor3 = KS_SURFACE
    BottomBar.BorderSizePixel = 0
    BottomBar.Position = UDim2.new(0, 0, 1, -61)
    BottomBar.Size = UDim2.new(1, 0, 0, 61)
    BottomBar.ZIndex = 203

    local InputBox = Instance.new("TextBox")
    InputBox.Name = "BottomInput"
    InputBox.Parent = BottomBar
    InputBox.BackgroundColor3 = Color3.fromRGB(32, 32, 40)
    InputBox.Position = UDim2.new(0, 92, 0, 14)
    InputBox.Size = UDim2.new(1, -196, 0, 33)
    InputBox.Font = Library.Theme.TextFont
    InputBox.PlaceholderText = ""
    InputBox.PlaceholderColor3 = Color3.fromRGB(95, 95, 110)
    InputBox.Text = ""
    InputBox.TextColor3 = Color3.fromRGB(235, 235, 240)
    InputBox.TextSize = 13
    InputBox.ClearTextOnFocus = false
    InputBox.ZIndex = 204

    local InputCorner = Instance.new("UICorner")
    InputCorner.CornerRadius = UDim.new(0, 6)
    InputCorner.Parent = InputBox

    local InputStroke = Instance.new("UIStroke")
    InputStroke.Color = KS_BORDER
    InputStroke.Thickness = 1
    InputStroke.Parent = InputBox

    InputBox.Focused:Connect(function()
        TweenService:Create(InputStroke, TweenInfo.new(0.18), {Color = Library.Theme.MainColor}):Play()
    end)
    InputBox.FocusLost:Connect(function()
        TweenService:Create(InputStroke, TweenInfo.new(0.18), {Color = KS_BORDER}):Play()
    end)

    local InputPad = Instance.new("UIPadding")
    InputPad.PaddingLeft = UDim.new(0, 10)
    InputPad.PaddingRight = UDim.new(0, 10)
    InputPad.Parent = InputBox

    local submitCallback = nil
    InputBox.FocusLost:Connect(function(enterPressed)
        if enterPressed and submitCallback then pcall(submitCallback, InputBox.Text) end
    end)

    local BarAPI = {}
    local btnCount = 0

    function BarAPI:SetPlaceholder(text)
        InputBox.PlaceholderText = text or ""
    end

    function BarAPI:OnSubmit(callback)
        submitCallback = callback
    end

    function BarAPI:AddButton(name, callback)
        if btnCount >= 2 then return end
        btnCount = btnCount + 1

        local btn = Instance.new("TextButton")
        btn.Parent = BottomBar
        btn.BackgroundColor3 = Library.Theme.MainColor
        btn.AutoButtonColor = false
        btn.ClipsDescendants = true
        btn.Size = UDim2.new(0, 84, 0, 33)
        btn.Font = Library.Theme.TextFont
        btn.Text = name or "Button"
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextSize = 13
        btn.ZIndex = 204
        table.insert(Library.LibraryColorTable, btn)

        local bCorner = Instance.new("UICorner")
        bCorner.CornerRadius = UDim.new(0, 6)
        bCorner.Parent = btn

        if btnCount == 1 then
            btn.Position = UDim2.new(0, 4, 0, 14)
        else
            btn.Position = UDim2.new(1, -88, 0, 14)
        end

        btn.MouseButton1Down:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 78, 0, 29),
                BackgroundColor3 = DarkenObjectColor(Library.Theme.MainColor, 40)
            }):Play()
        end)
        btn.MouseButton1Up:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.22, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 84, 0, 33),
                BackgroundColor3 = Library.Theme.MainColor
            }):Play()
        end)
        btn.MouseLeave:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.15), {
                Size = UDim2.new(0, 84, 0, 33),
                BackgroundColor3 = Library.Theme.MainColor
            }):Play()
        end)
        btn.MouseButton1Click:Connect(function()
            RippleEffect(btn)
            if callback then pcall(callback) end
        end)
    end

    return BarAPI
end
return Library
