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
    if Library and Library._BulkLoading then return end
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

            local endConn
            endConn = input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    endConn:Disconnect()
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
Main.BackgroundTransparency = 0.25
Main.Position = UDim2.new(0.5, -Layout.W / 2, 0.5, -Layout.H / 2)
Main.Size = UDim2.new(0, Layout.W, 0, 0)
Main.ZIndex = 2
Main.Image = ""
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
Instance.new("UICorner", UITabs).CornerRadius = UDim.new(0, 10)
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
TabButtons.BackgroundColor3 = Color3.fromRGB(20, 20, 24)
TabButtons.BackgroundTransparency = 0.3
TabButtons.Position = UDim2.new(0, 8, 0, Layout.Top + 4)
TabButtons.Size = UDim2.new(0, Layout.Side - 4, 1, -(Layout.Top + 4 + 8))
TabButtons.ZIndex = 2
TabButtons.Image = ""
TabButtons.ClipsDescendants = true
do
    local tbc = Instance.new("UICorner")
    tbc.CornerRadius = UDim.new(0, 8)
    tbc.Parent = TabButtons
end

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

do
    local g = Instance.new("UIGradient")
    g.Name = "GlassGradient"
    g.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(200, 200, 212))
    g.Rotation = 90
    g.Parent = Main
    Library.GlassGradient = g
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
FloatingIcon.Position = UDim2.new(0, 70, 0, 130)
FloatingIcon.Size = UDim2.new(0, 40, 0, 40)
FloatingIcon.Visible = true
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

do
    local Badge = Instance.new("Frame")
    Badge.Name = "NotifBadge"
    Badge.Parent = FloatingIcon
    Badge.AnchorPoint = Vector2.new(0.5, 0.5)
    Badge.Position = UDim2.new(1, -3, 0, 3)
    Badge.Size = UDim2.new(0, 18, 0, 18)
    Badge.BackgroundColor3 = Color3.fromRGB(235, 70, 70)
    Badge.BorderSizePixel = 0
    Badge.ZIndex = 53
    Badge.Visible = false
    local bc = Instance.new("UICorner")
    bc.CornerRadius = UDim.new(1, 0)
    bc.Parent = Badge
    local bs = Instance.new("UIStroke")
    bs.Color = Color3.fromRGB(20, 20, 24)
    bs.Thickness = 1.5
    bs.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    bs.Parent = Badge
    local BadgeText = Instance.new("TextLabel")
    BadgeText.Name = "Count"
    BadgeText.Parent = Badge
    BadgeText.BackgroundTransparency = 1
    BadgeText.Size = UDim2.new(1, 0, 1, 0)
    BadgeText.ZIndex = 54
    BadgeText.Font = Enum.Font.GothamBold
    BadgeText.TextSize = 11
    BadgeText.TextColor3 = Color3.fromRGB(255, 255, 255)
    BadgeText.Text = "0"
    local badgeCount = 0
    Library._ClearBadge = function()
        badgeCount = 0
        Badge.Visible = false
    end
    Library._BumpBadge = function()
        if not Minimized then return end
        badgeCount = badgeCount + 1
        BadgeText.Text = badgeCount > 9 and "9+" or tostring(badgeCount)
        Badge.Size = UDim2.new(0, badgeCount > 9 and 24 or 18, 0, 18)
        Badge.Visible = true
        Badge.Rotation = 0
        TweenService:Create(Badge, TweenInfo.new(0.12, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Rotation = 12 }):Play()
        task.delay(0.14, function()
            TweenService:Create(Badge, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Rotation = 0 }):Play()
        end)
    end
end

Minimized = false
local isDragging = false

local iconPosition = UDim2.new(0, 70, 0, 130)
local windowPosition = nil
local originalMainSize

local mainImageTransparency = Main.BackgroundTransparency
local animBusy = false

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

local MainScale = Instance.new("UIScale")
MainScale.Name = "AnimScale"
MainScale.Scale = 1
MainScale.Parent = Main
local MIN_SCALE = 0.1

local function ForceScrollable(enabled)
    for _, d in ipairs(Main:GetDescendants()) do
        if d:IsA("ScrollingFrame") then
            d.ScrollingEnabled = enabled
        elseif d.Name == "Tooltip" and d:IsA("TextLabel") then
            d.Visible = false
        end
    end
end
game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        task.defer(function()
            if not Minimized then ForceScrollable(true) end
        end)
    end
end)

local savedScrolls = {}
local function SaveScrolls()
    savedScrolls = {}
    for _, d in ipairs(Main:GetDescendants()) do
        if d:IsA("ScrollingFrame") then
            savedScrolls[d] = d.CanvasPosition
        end
    end
end
local function RestoreScrolls()
    for sf, pos in pairs(savedScrolls) do
        if sf.Parent then
            sf.CanvasPosition = pos
        end
    end
end

local function MaximizeUI()
    if animBusy then return end
    animBusy = true
    Minimized = false
    if Library._ClearBadge then Library._ClearBadge() end

    local t = 0.45
    Main.Visible = true
    ForceScrollable(true)
    Main.Position = iconPosition
    MainScale.Scale = MIN_SCALE
    Main.BackgroundTransparency = 1
    AnimCover.Visible = true
    AnimCover.BackgroundTransparency = 0
    RestoreScrolls()
    local restoreConn
    restoreConn = game:GetService("RunService").RenderStepped:Connect(RestoreScrolls)

    TweenService:Create(Main, TweenInfo.new(t, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        Position = windowPosition or Main.Position,
        BackgroundTransparency = mainImageTransparency
    }):Play()
    TweenService:Create(MainScale, TweenInfo.new(t, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        Scale = 1
    }):Play()
    TweenService:Create(AnimCover, TweenInfo.new(t * 0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundTransparency = 1
    }):Play()

    task.delay(t, function()
        if restoreConn then restoreConn:Disconnect() end
        RestoreScrolls()
        AnimCover.Visible = false
        animBusy = false
    end)
end

local function MinimizeUI()
    if animBusy or Minimized then return end
    animBusy = true
    Minimized = true

    SaveScrolls()
    windowPosition = Main.Position
    if not originalMainSize then
        originalMainSize = Main.Size
    end
    mainImageTransparency = Main.BackgroundTransparency

    local t = 0.4
    TweenService:Create(Main, TweenInfo.new(t, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
        Position = iconPosition,
        BackgroundTransparency = 1
    }):Play()
    TweenService:Create(MainScale, TweenInfo.new(t, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
        Scale = MIN_SCALE
    }):Play()
    AnimCover.Visible = true
    AnimCover.BackgroundTransparency = 1
    TweenService:Create(AnimCover, TweenInfo.new(t * 0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundTransparency = 0
    }):Play()

    task.delay(t, function()
        Main.Visible = false
        ForceScrollable(false)
        animBusy = false
    end)
end

MinimizeBtn.MouseButton1Click:Connect(function()
    if not Minimized then
        MinimizeUI()
    end
end)

Library.ToggleUI = function()
    if Minimized then MaximizeUI() else MinimizeUI() end
end

-- ===== Loading window =====
do
    local LW, Fill, Pct, Stat, nv
    local lastTick = 0
    local total, stepN = 0, 0
    Library.LoadingTimeout = 45
    Library.LoadingTips = {
        "Press the star in the top bar to pin your favorite features",
        "Use the search box to find any option quickly",
        "Drag the top bar to move the window",
        "Minimize the UI to keep it out of the way",
    }
    Library.Loading = false

    local function build(title)
        if LW and LW.Parent then return end
        local ok, grp = pcall(Instance.new, "CanvasGroup")
        LW = ok and grp or Instance.new("Frame")
        LW.Name = "LoadingWindow"
        LW.Parent = Main
        LW.Size = UDim2.new(1, 0, 1, 0)
        LW.BackgroundColor3 = Library.Theme.BackgroundColor
        LW.BackgroundTransparency = 0
        LW.BorderSizePixel = 0
        LW.ZIndex = 400
        LW.Active = true
        LW.ClipsDescendants = true
        Instance.new("UICorner", LW).CornerRadius = UDim.new(0, 10)

        local T = Instance.new("TextLabel")
        T.Name = "LoadTitle"
        T.Parent = LW
        T.BackgroundTransparency = 1
        T.AnchorPoint = Vector2.new(0.5, 0.5)
        T.Position = UDim2.new(0.5, 0, 0.42, 0)
        T.Size = UDim2.new(0.84, 0, 0, 30)
        T.ZIndex = 401
        T.Font = Library.Theme.TextFont
        T.Text = tostring(title or "Loading")
        T.TextColor3 = Library.Theme.TextColor
        T.TextSize = 24
        T.TextTruncate = Enum.TextTruncate.AtEnd

        local Track = Instance.new("Frame")
        Track.Name = "LoadTrack"
        Track.Parent = LW
        Track.AnchorPoint = Vector2.new(0.5, 0.5)
        Track.Position = UDim2.new(0.5, 0, 0.60, 0)
        Track.Size = UDim2.new(0.62, 0, 0, 8)
        Track.BackgroundColor3 = Color3.fromRGB(46, 46, 52)
        Track.BorderSizePixel = 0
        Track.ZIndex = 401
        Instance.new("UICorner", Track).CornerRadius = UDim.new(1, 0)

        Fill = Instance.new("Frame")
        Fill.Name = "LoadFill"
        Fill.Parent = Track
        Fill.Size = UDim2.new(0, 0, 1, 0)
        Fill.BackgroundColor3 = Library.Theme.MainColor
        Fill.BorderSizePixel = 0
        Fill.ZIndex = 402
        Instance.new("UICorner", Fill).CornerRadius = UDim.new(1, 0)

        Stat = Instance.new("TextLabel")
        Stat.Name = "LoadStatus"
        Stat.Parent = LW
        Stat.BackgroundTransparency = 1
        Stat.Position = UDim2.new(0.19, 0, 0.60, 10)
        Stat.Size = UDim2.new(0.46, 0, 0, 16)
        Stat.ZIndex = 401
        Stat.Font = Enum.Font.SourceSans
        Stat.TextSize = 13
        Stat.TextColor3 = Color3.fromRGB(190, 190, 198)
        Stat.TextXAlignment = Enum.TextXAlignment.Left
        Stat.TextTruncate = Enum.TextTruncate.AtEnd
        Stat.Text = "Starting..."

        Pct = Instance.new("TextLabel")
        Pct.Name = "LoadPercent"
        Pct.Parent = LW
        Pct.BackgroundTransparency = 1
        Pct.AnchorPoint = Vector2.new(1, 0)
        Pct.Position = UDim2.new(0.81, 0, 0.60, 10)
        Pct.Size = UDim2.new(0.16, 0, 0, 16)
        Pct.ZIndex = 401
        Pct.Font = Library.Theme.TextFont
        Pct.TextSize = 13
        Pct.TextColor3 = Library.Theme.TextColor
        Pct.TextXAlignment = Enum.TextXAlignment.Right
        Pct.Text = "0%"

        nv = Instance.new("NumberValue")
        nv.Value = 0
        nv.Changed:Connect(function(v)
            if Pct and Pct.Parent then Pct.Text = math.floor(v + 0.5) .. "%" end
        end)

        -- background gradient
        local bg = Instance.new("UIGradient")
        bg.Rotation = 90
        bg.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(190, 190, 205))
        bg.Parent = LW

        -- pulsing logo badge
        local Badge = Instance.new("Frame")
        Badge.Name = "LoadBadge"
        Badge.Parent = LW
        Badge.AnchorPoint = Vector2.new(0.5, 0.5)
        Badge.Position = UDim2.new(0.5, 0, 0.2, 0)
        Badge.Size = UDim2.new(0, 50, 0, 50)
        Badge.BackgroundColor3 = Library.Theme.MainColor
        Badge.BorderSizePixel = 0
        Badge.ZIndex = 401
        Instance.new("UICorner", Badge).CornerRadius = UDim.new(1, 0)
        local ring = Instance.new("UIStroke")
        ring.Color = Library.Theme.MainColor
        ring.Thickness = 3
        ring.Transparency = 0.4
        ring.Parent = Badge
        local bscale = Instance.new("UIScale")
        bscale.Parent = Badge
        local letter = Instance.new("TextLabel")
        letter.Parent = Badge
        letter.BackgroundTransparency = 1
        letter.Size = UDim2.new(1, 0, 1, 0)
        letter.ZIndex = 402
        letter.Font = Enum.Font.GothamBold
        letter.TextSize = 26
        letter.TextColor3 = Color3.fromRGB(255, 255, 255)
        letter.Text = string.upper(string.sub(tostring(title or "R"), 1, 1))
        TweenService:Create(bscale, TweenInfo.new(0.9, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), { Scale = 1.12 }):Play()
        TweenService:Create(ring, TweenInfo.new(0.9, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), { Transparency = 0.9, Thickness = 6 }):Play()

        -- subtitle with bouncing dots
        local Sub = Instance.new("TextLabel")
        Sub.Name = "LoadSub"
        Sub.Parent = LW
        Sub.BackgroundTransparency = 1
        Sub.AnchorPoint = Vector2.new(0.5, 0.5)
        Sub.Position = UDim2.new(0.5, 0, 0.42, 26)
        Sub.Size = UDim2.new(0.8, 0, 0, 16)
        Sub.ZIndex = 401
        Sub.Font = Enum.Font.SourceSans
        Sub.TextSize = 14
        Sub.TextColor3 = Color3.fromRGB(190, 190, 198)
        Sub.Text = "Preparing your script"
        task.spawn(function()
            local n = 0
            while Sub.Parent do
                Sub.Text = "Preparing your script" .. string.rep(".", n % 4)
                n = n + 1
                task.wait(0.4)
            end
        end)

        -- shimmer on the bar
        local shine = Instance.new("UIGradient")
        local mc = Library.Theme.MainColor
        shine.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, mc),
            ColorSequenceKeypoint.new(0.5, mc:Lerp(Color3.fromRGB(255, 255, 255), 0.55)),
            ColorSequenceKeypoint.new(1, mc),
        })
        shine.Offset = Vector2.new(-1, 0)
        shine.Parent = Fill
        TweenService:Create(shine, TweenInfo.new(1.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1), { Offset = Vector2.new(1, 0) }):Play()

        -- rotating tips
        local Tip = Instance.new("TextLabel")
        Tip.Name = "LoadTip"
        Tip.Parent = LW
        Tip.BackgroundTransparency = 1
        Tip.AnchorPoint = Vector2.new(0.5, 1)
        Tip.Position = UDim2.new(0.5, 0, 1, -12)
        Tip.Size = UDim2.new(0.86, 0, 0, 16)
        Tip.ZIndex = 401
        Tip.Font = Enum.Font.SourceSansItalic
        Tip.TextSize = 13
        Tip.TextColor3 = Color3.fromRGB(150, 150, 160)
        Tip.TextTransparency = 1
        Tip.TextTruncate = Enum.TextTruncate.AtEnd
        task.spawn(function()
            local i = 0
            while Tip.Parent do
                local tips = Library.LoadingTips
                if type(tips) == "table" and #tips > 0 then
                    i = i % #tips + 1
                    Tip.Text = "Tip: " .. tostring(tips[i])
                    TweenService:Create(Tip, TweenInfo.new(0.3), { TextTransparency = 0 }):Play()
                    task.wait(2.4)
                    TweenService:Create(Tip, TweenInfo.new(0.3), { TextTransparency = 1 }):Play()
                    task.wait(0.35)
                else
                    task.wait(1)
                end
            end
        end)

        pcall(MakeDraggable, LW, Main)
    end

    local function setPct(p)
        p = math.clamp(tonumber(p) or 0, 0, 100)
        Library.LoadingPercent = p
        if Fill and Fill.Parent then
            TweenService:Create(Fill, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.new(p / 100, 0, 1, 0) }):Play()
        end
        if nv then
            TweenService:Create(nv, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Value = p }):Play()
        end
    end

    function Library:StartLoading(title, status, totalSteps)
        build(title)
        total = tonumber(totalSteps) or 0
        stepN = 0
        lastTick = os.clock()
        Library.Loading = true
        if Stat and status then Stat.Text = tostring(status) end
        setPct(0)
        task.spawn(function()
            while Library.Loading and LW and LW.Parent do
                task.wait(1)
                if os.clock() - lastTick > (Library.LoadingTimeout or 45) then
                    Library:FinishLoading("Timed out")
                    break
                end
            end
        end)
    end

    function Library:SetLoading(percent, status)
        if not (LW and LW.Parent) then return end
        lastTick = os.clock()
        if status and Stat then Stat.Text = tostring(status) end
        if percent ~= nil then setPct(percent) end
    end

    function Library:LoadingStep(status, n)
        if not (LW and LW.Parent) then return end
        stepN = stepN + (tonumber(n) or 1)
        lastTick = os.clock()
        local text = tostring(status or "")
        if total > 0 then
            text = text .. "  (" .. math.min(stepN, total) .. "/" .. total .. ")"
            setPct(math.min(stepN / total * 100, 99))
        end
        if Stat then Stat.Text = text end
    end

    function Library:FinishLoading(status)
        if not (LW and LW.Parent) then Library.Loading = false return end
        Library.Loading = false
        local win = LW
        if Stat and status then Stat.Text = tostring(status) elseif Stat then Stat.Text = "Done" end
        setPct(100)
        task.delay(0.45, function()
            if not win.Parent then return end
            if win:IsA("CanvasGroup") then
                local tw = TweenService:Create(win, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { GroupTransparency = 1 })
                tw:Play()
                tw.Completed:Wait()
            end
            if win.Parent then win:Destroy() end
            if LW == win then LW = nil end
        end)
    end
end

-- ===== Confirm dialog =====
do
    local current
    function Library:Confirm(title, message, onYes, onNo, opts)
        opts = type(opts) == "table" and opts or {}
        if current and current.Parent then current:Destroy() end
        local Dim = Instance.new("TextButton")
        Dim.Name = "ConfirmDialog"
        Dim.Parent = Main
        Dim.Size = UDim2.new(1, 0, 1, 0)
        Dim.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        Dim.BackgroundTransparency = 1
        Dim.AutoButtonColor = false
        Dim.Text = ""
        Dim.ZIndex = 450
        Dim.Active = true
        Instance.new("UICorner", Dim).CornerRadius = UDim.new(0, 10)
        current = Dim

        local font = Library.Theme.TextFont
        local width = 290
        local msgH = 0
        message = tostring(message or "")
        if message ~= "" then
            local okS, sz = pcall(function()
                return game:GetService("TextService"):GetTextSize(message, 13, Enum.Font.SourceSans, Vector2.new(width - 28, 1000))
            end)
            msgH = okS and math.max(sz.Y, 16) or 32
        end
        local height = 16 + 20 + (msgH > 0 and (6 + msgH) or 0) + 16 + 32 + 14

        local Box = Instance.new("Frame")
        Box.Name = "Box"
        Box.Parent = Dim
        Box.AnchorPoint = Vector2.new(0.5, 0.5)
        Box.Position = UDim2.new(0.5, 0, 0.5, 0)
        Box.Size = UDim2.new(0, width, 0, height)
        Box.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
        Box.BorderSizePixel = 0
        Box.ZIndex = 451
        Instance.new("UICorner", Box).CornerRadius = UDim.new(0, 10)
        local bs = Instance.new("UIStroke")
        bs.Color = Color3.fromRGB(235, 85, 85)
        bs.Transparency = 0.35
        bs.Thickness = 1.5
        bs.Parent = Box
        local sc = Instance.new("UIScale")
        sc.Scale = 0.9
        sc.Parent = Box

        local T = Instance.new("TextLabel")
        T.Parent = Box
        T.BackgroundTransparency = 1
        T.Position = UDim2.new(0, 14, 0, 14)
        T.Size = UDim2.new(1, -28, 0, 20)
        T.ZIndex = 452
        T.Font = font
        T.Text = tostring(title or "Are you sure?")
        T.TextColor3 = Color3.fromRGB(245, 245, 250)
        T.TextSize = 17
        T.TextXAlignment = Enum.TextXAlignment.Left
        T.TextTruncate = Enum.TextTruncate.AtEnd

        if msgH > 0 then
            local M = Instance.new("TextLabel")
            M.Parent = Box
            M.BackgroundTransparency = 1
            M.Position = UDim2.new(0, 14, 0, 40)
            M.Size = UDim2.new(1, -28, 0, msgH)
            M.ZIndex = 452
            M.Font = Enum.Font.SourceSans
            M.Text = message
            M.TextColor3 = Color3.fromRGB(190, 190, 198)
            M.TextSize = 13
            M.TextWrapped = true
            M.TextXAlignment = Enum.TextXAlignment.Left
            M.TextYAlignment = Enum.TextYAlignment.Top
        end

        local closed = false
        local function close(result)
            if closed then return end
            closed = true
            TweenService:Create(Dim, TweenInfo.new(0.15), { BackgroundTransparency = 1 }):Play()
            TweenService:Create(sc, TweenInfo.new(0.15), { Scale = 0.9 }):Play()
            task.delay(0.16, function()
                if Dim.Parent then Dim:Destroy() end
                if current == Dim then current = nil end
            end)
            local cb = result and onYes or onNo
            if type(cb) == "function" then
                task.spawn(function()
                    local ok, err = pcall(cb)
                    if not ok then warn(err) end
                end)
            end
        end

        local function makeBtn(text, color, xScale, xOff, result)
            local B = Instance.new("TextButton")
            B.Parent = Box
            B.AnchorPoint = Vector2.new(0, 1)
            B.Position = UDim2.new(xScale, xOff, 1, -14)
            B.Size = UDim2.new(0.5, -19, 0, 32)
            B.BackgroundColor3 = color
            B.BorderSizePixel = 0
            B.AutoButtonColor = true
            B.ZIndex = 452
            B.Font = font
            B.Text = text
            B.TextColor3 = Color3.fromRGB(255, 255, 255)
            B.TextSize = 14
            Instance.new("UICorner", B).CornerRadius = UDim.new(0, 7)
            B.MouseButton1Click:Connect(function() close(result) end)
            return B
        end
        makeBtn(opts.No or "Cancel", Color3.fromRGB(58, 58, 66), 0, 14, false)
        makeBtn(opts.Yes or "Confirm", Color3.fromRGB(214, 69, 69), 0.5, 5, true)
        Dim.MouseButton1Click:Connect(function() close(false) end)
        -- clicks inside the box must not close it
        local Shield = Instance.new("TextButton")
        Shield.Parent = Box
        Shield.Size = UDim2.new(1, 0, 1, 0)
        Shield.BackgroundTransparency = 1
        Shield.Text = ""
        Shield.ZIndex = 451
        Shield.AutoButtonColor = false

        TweenService:Create(Dim, TweenInfo.new(0.18), { BackgroundTransparency = 0.45 }):Play()
        TweenService:Create(sc, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 }):Play()
        return Dim
    end
end

-- ===== Staged appearance on tab switch =====
Library.TabAnimation = true
function Library._StageIn(sf)
    if Library.TabAnimation == false or not sf then return end
    local list = {}
    for _, sec in ipairs(sf:GetChildren()) do
        if sec:IsA("Frame") and sec.Name:match("Section$") then
            local content = sec:FindFirstChild("SectionContent")
            if content and content.Visible then
                for _, el in ipairs(content:GetChildren()) do
                    if #list >= 14 then break end
                    if el:IsA("Frame") and not el:FindFirstChildOfClass("UIPadding") then
                        table.insert(list, el)
                    end
                end
            end
        end
    end
    for i, el in ipairs(list) do
        local pad = Instance.new("UIPadding")
        pad.PaddingLeft = UDim.new(0, 18)
        pad.Parent = el
        task.delay((i - 1) * 0.03, function()
            if not pad.Parent then return end
            local tw = TweenService:Create(pad, TweenInfo.new(0.28, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { PaddingLeft = UDim.new(0, 0) })
            tw.Completed:Connect(function() pad:Destroy() end)
            tw:Play()
        end)
        task.delay(1, function() if pad.Parent then pad:Destroy() end end)
    end
end

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
    end

    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            local pressStart = input.Position
            dragStart = pressStart
            startPos = gui.Position
            isDragging = true

            local endConn
            endConn = input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    endConn:Disconnect()
                    dragging = false
                    isDragging = false

                    if (input.Position - pressStart).Magnitude < 5 then
                        if Minimized then MaximizeUI() else MinimizeUI() end
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

local TabNormalSize = UDim2.new(1, -16, 0, 28)
local TabBigSize    = UDim2.new(1, -8, 0, 38)

local function SetTabVisual(btn, selected, extra)
    local info = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    local soft = TweenInfo.new(0.25, Library.Theme.EasingStyle, Enum.EasingDirection.Out)
    TweenService:Create(btn, info, {
        Size = selected and TabBigSize or TabNormalSize,
        BackgroundTransparency = selected and 0.25 or 1,
        BackgroundColor3 = Color3.fromRGB(58, 58, 66)
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

local CustomIcons = {
    pumpkin = 96785524532664, halloween = 96785524532664, ["jack-o-lantern"] = 96785524532664,
    jackolantern = 96785524532664, spooky = 96785524532664,
}
for name, id in pairs(CustomIcons) do
    IconAssets[name] = "rbxassetid://" .. id
end
do
    local seen = {}
    for _, id in pairs(CustomIcons) do
        local old = "rbxassetid://" .. id
        if not seen[old] then
            seen[old] = true
            task.spawn(function()
                local tex
                pcall(function()
                    local o = game:GetObjects(old)[1]
                    if o and (o:IsA("Decal") or o:IsA("Texture")) and o.Texture ~= "" then tex = o.Texture end
                end)
                if not tex then return end
                for n, v in pairs(IconAssets) do
                    if v == old then IconAssets[n] = tex end
                end
                for _, d in ipairs(UILibrary:GetDescendants()) do
                    if d:IsA("ImageLabel") or d:IsA("ImageButton") then
                        if d.Image == old then d.Image = tex end
                    end
                end
            end)
        end
    end
end
local IconNames = {}
for name in pairs(IconAssets) do table.insert(IconNames, name) end
table.sort(IconNames)

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
    if s:match("^%d+$") then
        local url = "rbxassetid://" .. s
        task.spawn(function()
            local tex
            pcall(function()
                local o = game:GetObjects(url)[1]
                if o and (o:IsA("Decal") or o:IsA("Texture")) and o.Texture ~= "" then tex = o.Texture end
            end)
            if tex then
                for _, d in ipairs(UILibrary:GetDescendants()) do
                    if (d:IsA("ImageLabel") or d:IsA("ImageButton")) and d.Image == url then d.Image = tex end
                end
            end
        end)
        return url
    end
    if s:match("^rbxassetid://") or s:match("^rbxasset://") or s:match("^https?://") then return s end

    local key = s:lower():gsub("^lucide[%-_ ]", ""):gsub("[%s_]+", "-")
    if IconAssets[key] then return IconAssets[key] end
    if IconAliases[key] and IconAssets[IconAliases[key]] then
        return IconAssets[IconAliases[key]]
    end
    for _, n in ipairs(IconNames) do
        if n:sub(1, #key) == key then return IconAssets[n] end
    end
    for _, n in ipairs(IconNames) do
        if n:find(key, 1, true) then return IconAssets[n] end
    end
    warn("[Rndm] Icon '" .. s .. "' nggak ketemu")
    return nil
end
Library.ResolveIcon = ResolveIcon

Library.Role = function(roleName, fallback)
    local f = Library.GetRole
    if f then
        local ok, c = pcall(f, roleName)
        if ok and typeof(c) == "Color3" then return c end
    end
    return fallback
end

Library.AttachTooltip = function(holder, hoverTarget, text)
    if not holder or text == nil or tostring(text) == "" then return end
    hoverTarget = hoverTarget or holder
    local Tip = Instance.new("TextLabel")
    Tip.Name = "Tooltip"
    Tip.Parent = holder
    Tip.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Tip.AnchorPoint = Vector2.new(0, 1)
    Tip.Position = UDim2.new(0, 10, 0, -4)
    Tip.AutomaticSize = Enum.AutomaticSize.XY
    Tip.Size = UDim2.new(0, 0, 0, 0)
    Tip.ZIndex = 40
    Tip.Font = Library.Theme.TextFont
    Tip.Text = tostring(text)
    Tip.TextColor3 = Color3.fromRGB(0, 0, 0)
    Tip.TextSize = 14
    Tip.TextWrapped = true
    Tip.TextXAlignment = Enum.TextXAlignment.Left
    Tip.TextYAlignment = Enum.TextYAlignment.Top
    Tip.Visible = false
    local tc = Instance.new("UICorner")
    tc.CornerRadius = UDim.new(0, 5)
    tc.Parent = Tip
    local tp = Instance.new("UIPadding")
    tp.PaddingLeft = UDim.new(0, 7)
    tp.PaddingRight = UDim.new(0, 7)
    tp.PaddingTop = UDim.new(0, 4)
    tp.PaddingBottom = UDim.new(0, 4)
    tp.Parent = Tip
    local tl = Instance.new("UISizeConstraint")
    tl.MaxSize = Vector2.new(230, 1000)
    tl.Parent = Tip

    local function show()
        Tip.Visible = true
        task.spawn(function()
            RunService.Heartbeat:Wait()
            if not Tip.Visible or not Tip.Parent then return end
            local sf = holder:FindFirstAncestorOfClass("ScrollingFrame")
            local room = sf and (holder.AbsolutePosition.Y - sf.AbsolutePosition.Y) or math.huge
            if room < Tip.AbsoluteSize.Y + 8 then
                Tip.AnchorPoint = Vector2.new(0, 0)
                Tip.Position = UDim2.new(0, 10, 1, 2)
            else
                Tip.AnchorPoint = Vector2.new(0, 1)
                Tip.Position = UDim2.new(0, 10, 0, -4)
            end
        end)
    end
    local function isPointer(input)
        return input.UserInputType == Enum.UserInputType.Touch
            or input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.MouseMovement
    end
    hoverTarget.InputBegan:Connect(function(input)
        if isPointer(input) then show() end
    end)
    hoverTarget.InputEnded:Connect(function(input)
        if isPointer(input) then Tip.Visible = false end
    end)
end

Library._ResolveOptionIcon = function(icon)
    if icon == nil then return nil, false end
    local str = tostring(icon)
    local tint = not (str:match("^%d+$") or str:find("rbx", 1, true) or str:find("http", 1, true))
    local asset = Library.ResolveIcon and Library.ResolveIcon(str) or nil
    if not asset and not tint then
        asset = str:match("^%d+$") and ("rbxassetid://" .. str) or str
    end
    return asset, tint
end

Library._MakeDropShell = function(parent, frameName, titleText, z, withSearch)
    local Role = Library.Role
    local R = { Open = false }
    local function tinfo() return TweenInfo.new(0.28, Enum.EasingStyle.Quart, Enum.EasingDirection.Out) end
    local MAX_ROWS_H = 210

    local Frame = Instance.new("Frame")
    Frame.Name = frameName
    Frame.Parent = parent
    Frame.BackgroundTransparency = 1
    Frame.BorderSizePixel = 0
    Frame.Size = UDim2.new(1, 0, 0, 40)
    Frame.ZIndex = z
    R.Frame = Frame

    local Header = Instance.new("TextButton")
    Header.Name = "TitleToggle"
    Header.Parent = Frame
    Header.BackgroundColor3 = Role("Drop", Color3.fromRGB(30, 30, 33))
    Header.BorderSizePixel = 0
    Header.AutoButtonColor = false
    Header.Text = ""
    Header.Position = UDim2.new(0, 12, 0, 3)
    Header.Size = UDim2.new(1, -24, 0, 34)
    Header.ZIndex = z + 1
    local hc = Instance.new("UICorner")
    hc.CornerRadius = UDim.new(0, 8)
    hc.Parent = Header
    local HeaderStroke = Instance.new("UIStroke")
    HeaderStroke.Color = Role("SliderBg", Color3.fromRGB(62, 62, 70))
    HeaderStroke.Thickness = 1
    HeaderStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    HeaderStroke.Parent = Header
    R.Header = Header

    local NameLabel = Instance.new("TextLabel")
    NameLabel.Name = "Title"
    NameLabel.Parent = Header
    NameLabel.BackgroundTransparency = 1
    NameLabel.Position = UDim2.new(0, 12, 0, 0)
    NameLabel.Size = UDim2.new(0.5, -12, 1, 0)
    NameLabel.ZIndex = z + 2
    NameLabel.Font = Library.Theme.TextFont
    NameLabel.Text = tostring(titleText)
    NameLabel.TextColor3 = Library.Theme.TextColor
    NameLabel.TextSize = 15
    NameLabel.TextXAlignment = Enum.TextXAlignment.Left
    NameLabel.TextTruncate = Enum.TextTruncate.AtEnd
    table.insert(Library.LibraryColorTable, NameLabel)
    R.NameLabel = NameLabel

    local ValueLabel = Instance.new("TextLabel")
    ValueLabel.Name = "Value"
    ValueLabel.Parent = Header
    ValueLabel.BackgroundTransparency = 1
    ValueLabel.Position = UDim2.new(0.5, 0, 0, 0)
    ValueLabel.Size = UDim2.new(0.5, -32, 1, 0)
    ValueLabel.ZIndex = z + 2
    ValueLabel.Font = Library.Theme.TextFont
    ValueLabel.Text = ""
    ValueLabel.TextColor3 = Library.Theme.MainColor
    ValueLabel.TextSize = 14
    ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
    ValueLabel.TextTruncate = Enum.TextTruncate.AtEnd
    R.ValueLabel = ValueLabel

    local ValueIcon = Instance.new("ImageLabel")
    ValueIcon.Name = "ValueIcon"
    ValueIcon.Parent = Header
    ValueIcon.BackgroundTransparency = 1
    ValueIcon.AnchorPoint = Vector2.new(1, 0.5)
    ValueIcon.Position = UDim2.new(1, -60, 0.5, 0)
    ValueIcon.Size = UDim2.new(0, 16, 0, 16)
    ValueIcon.ZIndex = z + 2
    ValueIcon.Visible = false

    local icon = Library.ResolveIcon and Library.ResolveIcon("chevron-down")
    local Chevron
    if icon then
        Chevron = Instance.new("ImageLabel")
        Chevron.Image = icon
        Chevron.ImageColor3 = Color3.fromRGB(150, 150, 160)
    else
        Chevron = Instance.new("TextLabel")
        Chevron.Text = "v"
        Chevron.Font = Enum.Font.GothamBold
        Chevron.TextSize = 12
        Chevron.TextColor3 = Color3.fromRGB(150, 150, 160)
    end
    Chevron.Name = "Chevron"
    Chevron.Parent = Header
    Chevron.BackgroundTransparency = 1
    Chevron.AnchorPoint = Vector2.new(1, 0.5)
    Chevron.Position = UDim2.new(1, -9, 0.5, 0)
    Chevron.Size = UDim2.new(0, 16, 0, 16)
    Chevron.ZIndex = z + 2

    Header.MouseEnter:Connect(function()
        TweenService:Create(Header, TweenInfo.new(0.15), { BackgroundColor3 = Role("SliderVal", Color3.fromRGB(42, 42, 47)) }):Play()
    end)
    Header.MouseLeave:Connect(function()
        TweenService:Create(Header, TweenInfo.new(0.15), { BackgroundColor3 = Role("Drop", Color3.fromRGB(30, 30, 33)) }):Play()
    end)

    local List = Instance.new("Frame")
    List.Name = "Dropdown"
    List.Parent = Frame
    List.BackgroundColor3 = Role("Drop", Color3.fromRGB(30, 30, 33))
    List.BorderSizePixel = 0
    List.ClipsDescendants = true
    List.Visible = false
    List.Position = UDim2.new(0, 12, 0, 43)
    List.Size = UDim2.new(1, -24, 0, 0)
    List.ZIndex = z + 2
    local lc = Instance.new("UICorner")
    lc.CornerRadius = UDim.new(0, 8)
    lc.Parent = List
    local ListStroke = Instance.new("UIStroke")
    ListStroke.Color = Role("SliderBg", Color3.fromRGB(62, 62, 70))
    ListStroke.Thickness = 1
    ListStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    ListStroke.Parent = List
    R.List = List

    if withSearch then
        local Search = Instance.new("TextBox")
        Search.Name = "SearchTextBox"
        Search.Parent = List
        Search.BackgroundColor3 = Role("SliderVal", Color3.fromRGB(42, 42, 47))
        Search.BorderSizePixel = 0
        Search.Position = UDim2.new(0, 6, 0, 4)
        Search.Size = UDim2.new(1, -12, 0, 28)
        Search.PlaceholderText = "Search..."
        Search.PlaceholderColor3 = Color3.fromRGB(120, 120, 130)
        Search.Text = ""
        Search.TextColor3 = Color3.fromRGB(235, 235, 240)
        Search.Font = Library.Theme.TextFont
        Search.TextSize = 14
        Search.TextXAlignment = Enum.TextXAlignment.Left
        Search.ClearTextOnFocus = false
        Search.Visible = false
        Search.ZIndex = z + 3
        local sc = Instance.new("UICorner")
        sc.CornerRadius = UDim.new(0, 6)
        sc.Parent = Search
        local sp = Instance.new("UIPadding")
        sp.PaddingLeft = UDim.new(0, 10)
        sp.PaddingRight = UDim.new(0, 10)
        sp.Parent = Search
        R.Search = Search
    end

    local Scroll = Instance.new("ScrollingFrame")
    Scroll.Name = "Items"
    Scroll.Parent = List
    Scroll.BackgroundTransparency = 1
    Scroll.BorderSizePixel = 0
    Scroll.Position = UDim2.new(0, 6, 0, 4)
    Scroll.Size = UDim2.new(1, -12, 0, 0)
    Scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    Scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    Scroll.ScrollBarThickness = 3
    Scroll.ScrollBarImageColor3 = Role("Border", Color3.fromRGB(80, 80, 90))
    Scroll.ScrollingDirection = Enum.ScrollingDirection.Y
    Scroll.ScrollingEnabled = false
    Scroll.ClipsDescendants = true
    Scroll.ZIndex = z + 3
    local sl = Instance.new("UIListLayout")
    sl.Padding = UDim.new(0, 2)
    sl.SortOrder = Enum.SortOrder.LayoutOrder
    sl.Parent = Scroll
    R.Scroll = Scroll

    function R.SetValue(text, dim, icon)
        ValueLabel.Text = tostring(text or "")
        ValueLabel.TextColor3 = dim and Color3.fromRGB(140, 140, 150) or Library.Theme.MainColor
        local asset, tint
        if icon ~= nil then asset, tint = Library._ResolveOptionIcon(icon) end
        if asset then
            local w = 0
            pcall(function()
                w = game:GetService("TextService"):GetTextSize(ValueLabel.Text, 14, Library.Theme.TextFont, Vector2.new(400, 30)).X
            end)
            local cap = (Header.AbsoluteSize.X > 0) and (Header.AbsoluteSize.X * 0.5 - 32) or 120
            ValueIcon.Image = asset
            ValueIcon.ImageColor3 = tint and Library.Theme.MainColor or Color3.fromRGB(255, 255, 255)
            ValueIcon.Position = UDim2.new(1, -(32 + math.min(w, cap) + 6), 0.5, 0)
            ValueIcon.Visible = true
        else
            ValueIcon.Visible = false
        end
    end

    function R.Clear()
        for _, c in ipairs(Scroll:GetChildren()) do
            if c:IsA("GuiObject") then c:Destroy() end
        end
    end

    function R.MakeRow(text, selected, order, onClick, icon)
        local B = Instance.new("TextButton")
        B.Name = text .. "DropdownButton"
        B.Parent = Scroll
        B.LayoutOrder = order or 0
        B.BackgroundColor3 = Role("SliderVal", Color3.fromRGB(42, 42, 47))
        B.BackgroundTransparency = 1
        B.BorderSizePixel = 0
        B.AutoButtonColor = false
        B.Size = UDim2.new(1, 0, 0, 28)
        B.ZIndex = z + 4
        B.Font = Library.Theme.TextFont
        B.Text = text
        B.TextSize = 14
        B.TextXAlignment = Enum.TextXAlignment.Left
        B.TextTruncate = Enum.TextTruncate.AtEnd
        B.TextColor3 = selected and Library.Theme.MainColor or Library.Theme.TextColor
        local iconAsset, iconTint
        if icon ~= nil then iconAsset, iconTint = Library._ResolveOptionIcon(icon) end
        local padLeft = iconAsset and 40 or 14
        local bp = Instance.new("UIPadding")
        bp.PaddingLeft = UDim.new(0, padLeft)
        bp.PaddingRight = UDim.new(0, 8)
        bp.Parent = B
        if iconAsset then
            local OI = Instance.new("ImageLabel")
            OI.Name = "OptionIcon"
            OI.Parent = B
            OI.BackgroundTransparency = 1
            OI.AnchorPoint = Vector2.new(0, 0.5)
            OI.Position = UDim2.new(0, -(padLeft - 14), 0.5, 0)
            OI.Size = UDim2.new(0, 20, 0, 20)
            OI.ZIndex = z + 5
            OI.Image = iconAsset
            OI.ImageColor3 = iconTint and Library.Theme.TextColor or Color3.fromRGB(255, 255, 255)
        end
        local bc = Instance.new("UICorner")
        bc.CornerRadius = UDim.new(0, 6)
        bc.Parent = B
        local Mark = Instance.new("Frame")
        Mark.Name = "Mark"
        Mark.Parent = B
        Mark.AnchorPoint = Vector2.new(0, 0.5)
        Mark.Position = UDim2.new(0, 3 - padLeft, 0.5, 0)
        Mark.Size = UDim2.new(0, 3, 0, 14)
        Mark.BackgroundColor3 = Library.Theme.MainColor
        Mark.BorderSizePixel = 0
        Mark.Visible = selected and true or false
        Mark.ZIndex = z + 5
        local mc = Instance.new("UICorner")
        mc.CornerRadius = UDim.new(1, 0)
        mc.Parent = Mark
        B.MouseEnter:Connect(function()
            TweenService:Create(B, TweenInfo.new(0.12), { BackgroundTransparency = 0 }):Play()
        end)
        B.MouseLeave:Connect(function()
            TweenService:Create(B, TweenInfo.new(0.12), { BackgroundTransparency = 1 }):Play()
        end)
        if onClick then B.MouseButton1Click:Connect(onClick) end
        return B
    end

    function R.SetRowSelected(B, selected)
        if not B or not B.Parent then return end
        TweenService:Create(B, TweenInfo.new(0.2), { TextColor3 = selected and Library.Theme.MainColor or Library.Theme.TextColor }):Play()
        local m = B:FindFirstChild("Mark")
        if m then m.Visible = selected and true or false end
    end

    function R.MakeEmpty()
        local L = Instance.new("TextLabel")
        L.Name = "Empty"
        L.Parent = Scroll
        L.BackgroundTransparency = 1
        L.Size = UDim2.new(1, 0, 0, 28)
        L.ZIndex = z + 4
        L.Font = Enum.Font.Gotham
        L.Text = "No results"
        L.TextSize = 13
        L.TextColor3 = Color3.fromRGB(130, 130, 140)
        return L
    end

    function R.Measure(n, showSearch)
        n = math.max(tonumber(n) or 0, 0)
        local rows = (n > 0) and (n * 28 + (n - 1) * 2) or 0
        local scrollH = math.min(rows, MAX_ROWS_H)
        local top = 4
        if R.Search then
            if showSearch then
                R.Search.Visible = true
                top = 38
            else
                R.Search.Visible = false
            end
        end
        Scroll.Position = UDim2.new(0, 6, 0, top)
        Scroll.Size = UDim2.new(1, -12, 0, scrollH)
        Scroll.ScrollingEnabled = rows > MAX_ROWS_H
        return top + scrollH + 4
    end

    function R.SetOpen(open, listHeight)
        R.Open = open and true or false
        listHeight = tonumber(listHeight) or 0
        local ti = tinfo()
        if open then List.Visible = true end
        TweenService:Create(Frame, ti, { Size = UDim2.new(1, 0, 0, open and (43 + listHeight + 4) or 40) }):Play()
        TweenService:Create(List, ti, { Size = UDim2.new(1, -24, 0, open and listHeight or 0) }):Play()
        TweenService:Create(Chevron, ti, { Rotation = open and 180 or 0 }):Play()
        TweenService:Create(HeaderStroke, ti, {
            Color = open and Library.Theme.MainColor or Role("SliderBg", Color3.fromRGB(62, 62, 70))
        }):Play()
        if not open then
            task.delay(0.3, function()
                if not R.Open and List.Parent then List.Visible = false end
            end)
        end
    end

    return R
end


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
    NameTabButton.BackgroundColor3 = Color3.fromRGB(58, 58, 66)
    NameTabButton.BackgroundTransparency = 1.000
    NameTabButton.Size = TabNormalSize
    NameTabButton.ZIndex = 2
    NameTabButton.Image = ""
    NameTabButton.AutoButtonColor = false

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

local function SelectThisTab()
    if Library._CloseSearch then Library._CloseSearch() end
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
    if Library._OnTabSelect then pcall(Library._OnTabSelect, NameTab) end
    if Library._StageIn then pcall(Library._StageIn, SectionScrollingFrame) end
end
NameTabButton.MouseButton1Click:Connect(SelectThisTab)
Library.TabSelectors = Library.TabSelectors or {}
Library.TabSelectors[NameTab] = SelectThisTab

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

function TabElements:CreateSection(name, collapsible, startClosed)
    local NameSection = Instance.new("Frame")
    local SectionTitle = Instance.new("TextLabel")
    local SectionContent = Instance.new("Frame")
    local SectionContentLayout = Instance.new("UIListLayout")

    local SectionElements = { GameId = self.GameId }

    sectionOrder = sectionOrder + 1

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

    local Collapsed = false
    local SectionAnimating = false
    local function ResizeSection()
        local h = SectionContentLayout.AbsoluteContentSize.Y
        SectionContent.Size = UDim2.new(1, 0, 0, h)
        if SectionAnimating then return end
        NameSection.Size = UDim2.new(1, 0, 0, Collapsed and 30 or (h + 34))
    end
    SectionContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(ResizeSection)

    local childCounter = 0
    local tabNameForFav = NameTab.Name:sub(1, #NameTab.Name - 3)
    SectionContent.ChildAdded:Connect(function(child)
        task.defer(function()
            if child.Parent ~= SectionContent then return end
            if child:IsA("GuiObject") and child.LayoutOrder == 0 then
                childCounter = childCounter + 1
                child.LayoutOrder = childCounter
            end
            if child:IsA("Frame") and not child.Name:match("_ImageHolder$") and not child.Name:match("Button$") and not child.Name:match("Divider$") then
                child.BackgroundColor3 = Color3.fromRGB(46, 46, 52)
                child.BackgroundTransparency = 0.45
                if not child:FindFirstChildOfClass("UICorner") then
                    local corner = Instance.new("UICorner")
                    corner.CornerRadius = UDim.new(0, 6)
                    corner.Parent = child
                end
            end
            if Library._RegFav and child:IsA("Frame") then
                pcall(Library._RegFav, child, tabNameForFav, name, SectionContent)
            end
            if Library._RegBind and child:IsA("Frame") then
                pcall(Library._RegBind, child, tabNameForFav, name, SectionContent)
            end
        end)
    end)

    do
        local wantCollapsible = (collapsible == true)
        if type(collapsible) == "table" then
            wantCollapsible = collapsible.Collapsible ~= false
            startClosed = collapsible.Closed or collapsible.StartClosed or startClosed
        end

        local Arrow, HeaderToggle
        local animToken = 0

        local function SetCollapsed(value, instant)
            if not wantCollapsible then return end
            value = value and true or false
            if value == Collapsed then return end
            Collapsed = value
            animToken = animToken + 1
            local token = animToken
            local info = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

            if Arrow then
                if instant then Arrow.Rotation = Collapsed and -90 or 0
                else TweenService:Create(Arrow, info, { Rotation = Collapsed and -90 or 0 }):Play() end
            end

            if Collapsed then
                if instant then
                    SectionContent.Visible = false
                    NameSection.Size = UDim2.new(1, 0, 0, 30)
                    return
                end
                SectionAnimating = true
                NameSection.ClipsDescendants = true
                TweenService:Create(NameSection, info, { Size = UDim2.new(1, 0, 0, 30) }):Play()
                task.delay(0.22, function()
                    if token ~= animToken then return end
                    SectionContent.Visible = false
                    SectionAnimating = false
                end)
            else
                SectionContent.Visible = true
                if instant then
                    NameSection.ClipsDescendants = false
                    ResizeSection()
                    return
                end
                SectionAnimating = true
                NameSection.ClipsDescendants = true
                task.spawn(function()
                    local h = SectionContentLayout.AbsoluteContentSize.Y
                    if h <= 0 then
                        RunService.Heartbeat:Wait()
                        h = SectionContentLayout.AbsoluteContentSize.Y
                    end
                    if token ~= animToken then return end
                    TweenService:Create(NameSection, info, { Size = UDim2.new(1, 0, 0, h + 34) }):Play()
                    task.wait(0.22)
                    if token ~= animToken then return end
                    SectionAnimating = false
                    NameSection.ClipsDescendants = false
                    ResizeSection()
                end)
            end
        end

        if wantCollapsible then
            local iconId = ResolveIcon("chevron-down")
            if iconId then
                Arrow = Instance.new("ImageLabel")
                Arrow.Image = iconId
                Arrow.ImageColor3 = Library.Theme.TextColor
                Arrow.ImageTransparency = 0.25
            else
                Arrow = Instance.new("TextLabel")
                Arrow.Text = "v"
                Arrow.Font = Library.Theme.TextFont
                Arrow.TextSize = 14
                Arrow.TextColor3 = Library.Theme.TextColor
            end
            Arrow.Name = "Icon"
            Arrow.BackgroundTransparency = 1
            Arrow.AnchorPoint = Vector2.new(0.5, 0.5)
            Arrow.Position = UDim2.new(1, -14, 0, 12)
            Arrow.Size = UDim2.new(0, 16, 0, 16)
            Arrow.ZIndex = 6
            Arrow.Parent = NameSection

            HeaderToggle = Instance.new("TextButton")
            HeaderToggle.Name = "HeaderToggle"
            HeaderToggle.BackgroundTransparency = 1
            HeaderToggle.Text = ""
            HeaderToggle.AutoButtonColor = false
            HeaderToggle.Position = UDim2.new(0, 0, 0, 0)
            HeaderToggle.Size = UDim2.new(1, 0, 0, 27)
            HeaderToggle.ZIndex = 7
            HeaderToggle.Parent = NameSection
            HeaderToggle.MouseButton1Click:Connect(function()
                SetCollapsed(not Collapsed)
            end)

            Library.SectionToggles = Library.SectionToggles or {}
            Library.SectionToggles[NameSection] = SetCollapsed

            if startClosed then SetCollapsed(true, true) end
        end

        function SectionElements:SetCollapsed(value) SetCollapsed(value) end
        function SectionElements:IsCollapsed() return Collapsed end
        function SectionElements:Toggle() SetCollapsed(not Collapsed) end
    end

function SectionElements:CreateDivider(text)
    local Divider = Instance.new("Frame")
    Divider.Name = tostring(text or "") .. "Divider"
    Divider.Parent = SectionContent
    Divider.BackgroundTransparency = 1
    Divider.BorderSizePixel = 0
    Divider.Size = UDim2.new(1, 0, 0, (text and text ~= "") and 22 or 12)
    Divider.ZIndex = 5

    local hasText = text and text ~= ""
    local function makeLine(xPos, xSize)
        local Line = Instance.new("Frame")
        Line.Name = "Line"
        Line.Parent = Divider
        Line.AnchorPoint = Vector2.new(0, 0.5)
        Line.BackgroundColor3 = Color3.fromRGB(120, 120, 130)
        Line.BackgroundTransparency = 0.6
        Line.BorderSizePixel = 0
        Line.Position = xPos
        Line.Size = xSize
        Line.ZIndex = 5
        return Line
    end

    if hasText then
        local Label = Instance.new("TextLabel")
        Label.Name = "DividerText"
        Label.Parent = Divider
        Label.AnchorPoint = Vector2.new(0.5, 0.5)
        Label.BackgroundTransparency = 1
        Label.Position = UDim2.new(0.5, 0, 0.5, 0)
        Label.AutomaticSize = Enum.AutomaticSize.X
        Label.Size = UDim2.new(0, 0, 1, 0)
        Label.Font = Library.Theme.TextFont
        Label.Text = tostring(text)
        Label.TextColor3 = Color3.fromRGB(190, 190, 198)
        Label.TextSize = 13
        Label.ZIndex = 6
        local pad = Instance.new("UIPadding")
        pad.PaddingLeft = UDim.new(0, 8)
        pad.PaddingRight = UDim.new(0, 8)
        pad.Parent = Label

        local function layoutLines()
            local half = Label.AbsoluteSize.X / 2
            makeLine(UDim2.new(0, 10, 0.5, 0), UDim2.new(0.5, -half - 10, 0, 1)).Name = "LineLeft"
            makeLine(UDim2.new(0.5, half, 0.5, 0), UDim2.new(0.5, -half - 10, 0, 1)).Name = "LineRight"
        end
        task.defer(function()
            if Label.AbsoluteSize.X <= 0 then Label:GetPropertyChangedSignal("AbsoluteSize"):Wait() end
            layoutLines()
        end)
    else
        makeLine(UDim2.new(0, 10, 0.5, 0), UDim2.new(1, -20, 0, 1))
    end

    return Divider
end

function SectionElements:CreateParagraph(title, text, opts)
    local copyable = (opts == true) or (type(opts) == "table" and (opts.Copy or opts.Copyable)) and true or false
    local Paragraph = Instance.new("Frame")
    Paragraph.Name = tostring(title or "Text") .. "Paragraph"
    Paragraph.Parent = SectionContent
    Paragraph.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Paragraph.BackgroundTransparency = 1
    Paragraph.BorderSizePixel = 0
    Paragraph.AutomaticSize = Enum.AutomaticSize.Y
    Paragraph.Size = UDim2.new(1, 0, 0, 0)
    Paragraph.ZIndex = 5

    local pad = Instance.new("UIPadding")
    pad.PaddingTop = UDim.new(0, 9)
    pad.PaddingBottom = UDim.new(0, 10)
    pad.PaddingLeft = UDim.new(0, 13)
    pad.PaddingRight = UDim.new(0, 13)
    pad.Parent = Paragraph

    local list = Instance.new("UIListLayout")
    list.SortOrder = Enum.SortOrder.LayoutOrder
    list.Padding = UDim.new(0, 4)
    list.Parent = Paragraph

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "ParagraphTitle"
    TitleLabel.Parent = Paragraph
    TitleLabel.LayoutOrder = 1
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.AutomaticSize = Enum.AutomaticSize.Y
    TitleLabel.Size = UDim2.new(1, 0, 0, 0)
    TitleLabel.Font = Library.Theme.TextFont
    TitleLabel.Text = tostring(title or "")
    TitleLabel.TextColor3 = Library.Theme.TextColor
    TitleLabel.TextSize = 15
    TitleLabel.TextWrapped = true
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.TextYAlignment = Enum.TextYAlignment.Top
    TitleLabel.Visible = (title ~= nil and title ~= "")
    TitleLabel.ZIndex = 6
    table.insert(Library.LibraryColorTable, TitleLabel)

    local Body = Instance.new("TextLabel")
    Body.Name = "ParagraphText"
    Body.Parent = Paragraph
    Body.LayoutOrder = 2
    Body.BackgroundTransparency = 1
    Body.AutomaticSize = Enum.AutomaticSize.Y
    Body.Size = UDim2.new(1, 0, 0, 0)
    Body.Font = Enum.Font.SourceSans
    Body.Text = tostring(text or "")
    Body.TextColor3 = Color3.fromRGB(190, 190, 198)
    Body.TextSize = 14
    Body.TextWrapped = true
    Body.RichText = true
    Body.TextXAlignment = Enum.TextXAlignment.Left
    Body.TextYAlignment = Enum.TextYAlignment.Top
    Body.ZIndex = 6

    local function plainText()
        return (tostring(Body.Text):gsub("<[^>]+>", ""))
    end
    local function CopyText()
        local txt = plainText()
        local ok = pcall(function() setclipboard(txt) end)
        if Library.CreateNotification then
            local preview = #txt > 60 and (txt:sub(1, 57) .. "...") or txt
            Library:CreateNotification(ok and "Copied" or "Copy failed", preview, 3, nil, nil, ok and "success" or "error")
        end
    end

    if copyable then
        local bp = Instance.new("UIPadding")
        bp.PaddingRight = UDim.new(0, 22)
        bp.Parent = Body
        local copyIcon = Library.ResolveIcon and Library.ResolveIcon("copy")
        local Hint
        if copyIcon then
            Hint = Instance.new("ImageLabel")
            Hint.Image = copyIcon
            Hint.ImageColor3 = Color3.fromRGB(150, 150, 160)
            Hint.ImageTransparency = 0.3
        else
            Hint = Instance.new("TextLabel")
            Hint.Text = "copy"
            Hint.Font = Enum.Font.Gotham
            Hint.TextSize = 10
            Hint.TextColor3 = Color3.fromRGB(150, 150, 160)
        end
        Hint.Name = "CopyHint"
        Hint.Parent = Body
        Hint.BackgroundTransparency = 1
        Hint.AnchorPoint = Vector2.new(1, 0)
        Hint.Position = UDim2.new(1, 22, 0, 1)
        Hint.Size = UDim2.new(0, 16, 0, 16)
        Hint.ZIndex = 8
        local Click = Instance.new("TextButton")
        Click.Name = "CopyClick"
        Click.Parent = Body
        Click.BackgroundTransparency = 1
        Click.AutoButtonColor = false
        Click.Text = ""
        Click.Position = UDim2.new(0, 0, 0, 0)
        Click.Size = UDim2.new(1, 22, 1, 0)
        Click.ZIndex = 9
        Click.MouseButton1Click:Connect(CopyText)
        Click.MouseEnter:Connect(function()
            TweenService:Create(Paragraph, TweenInfo.new(0.15), { BackgroundTransparency = 0.93 }):Play()
            TweenService:Create(Hint, TweenInfo.new(0.15), copyIcon and { ImageTransparency = 0 } or { TextColor3 = Color3.fromRGB(235, 235, 240) }):Play()
        end)
        Click.MouseLeave:Connect(function()
            TweenService:Create(Paragraph, TweenInfo.new(0.15), { BackgroundTransparency = 1 }):Play()
            TweenService:Create(Hint, TweenInfo.new(0.15), copyIcon and { ImageTransparency = 0.3 } or { TextColor3 = Color3.fromRGB(150, 150, 160) }):Play()
        end)
    end

    local function SetText(a, b)
        local v = (type(a) == "table") and b or a
        Body.Text = tostring(v or "")
    end
    local function SetTitle(a, b)
        local v = (type(a) == "table") and b or a
        TitleLabel.Text = tostring(v or "")
        TitleLabel.Visible = (v ~= nil and v ~= "")
    end

    return { SetText = SetText, SetTitle = SetTitle, Copy = CopyText, GetText = plainText, Frame = Paragraph }
end

function SectionElements:CreateEmbed(source, imageUrl, width, height, title, card)
    source = tostring(source or "")
    local link, img, w, h, alt = source, imageUrl, tonumber(width), tonumber(height), title
    if source:find("<a", 1, true) or source:find("<img", 1, true) then
        local function unesc(x) return x and (x:gsub("&amp;", "&"):gsub("&quot;", '"'):gsub("&#39;", "'")) end
        link = unesc(source:match('href%s*=%s*"([^"]+)"') or source:match("href%s*=%s*'([^']+)'")) or ""
        img = img or unesc(source:match('src%s*=%s*"([^"]+)"') or source:match("src%s*=%s*'([^']+)'"))
        w = w or tonumber(source:match('width%s*=%s*"?(%d+)'))
        h = h or tonumber(source:match('height%s*=%s*"?(%d+)'))
        alt = alt or unesc(source:match('alt%s*=%s*"([^"]*)"'))
    end
    w = (w and w > 0) and w or 360
    h = (h and h > 0) and h or 132
    alt = (alt and alt ~= "") and alt or link

    local Holder = Instance.new("Frame")
    Holder.Name = tostring(alt) .. "Embed"
    Holder.Parent = SectionContent
    Holder.BackgroundTransparency = 1
    Holder.BorderSizePixel = 0
    Holder.AutomaticSize = Enum.AutomaticSize.Y
    Holder.Size = UDim2.new(1, 0, 0, 0)
    Holder.ZIndex = 5

    local pad = Instance.new("UIPadding")
    pad.PaddingTop = UDim.new(0, 6)
    pad.PaddingBottom = UDim.new(0, 6)
    pad.PaddingLeft = UDim.new(0, 10)
    pad.PaddingRight = UDim.new(0, 10)
    pad.Parent = Holder

    local Card = Instance.new("TextButton")
    Card.Name = "EmbedCard"
    Card.Parent = Holder
    Card.AutoButtonColor = false
    Card.Text = ""
    Card.AutomaticSize = Enum.AutomaticSize.Y
    Card.Size = UDim2.new(1, 0, 0, 0)
    Card.BackgroundColor3 = Color3.fromRGB(46, 46, 52)
    Card.BackgroundTransparency = 0.35
    Card.BorderSizePixel = 0
    Card.ZIndex = 6
    local cc = Instance.new("UICorner")
    cc.CornerRadius = UDim.new(0, 8)
    cc.Parent = Card
    local maxc = Instance.new("UISizeConstraint")
    maxc.MaxSize = Vector2.new(w, math.huge)
    maxc.Parent = Card
    local cl = Instance.new("UIListLayout")
    cl.SortOrder = Enum.SortOrder.LayoutOrder
    cl.Padding = UDim.new(0, 0)
    cl.Parent = Card

    local Img = Instance.new("ImageLabel")
    Img.Name = "EmbedImage"
    Img.Parent = Card
    Img.LayoutOrder = 1
    Img.BackgroundTransparency = 1
    Img.Size = UDim2.new(1, 0, 0, 0)
    Img.AutomaticSize = Enum.AutomaticSize.None
    Img.Image = ""
    Img.ScaleType = Enum.ScaleType.Fit
    Img.ZIndex = 7
    Img.Visible = false
    local ar = Instance.new("UIAspectRatioConstraint")
    ar.AspectRatio = w / h
    ar.DominantAxis = Enum.DominantAxis.Width
    ar.Parent = Img
    local ic = Instance.new("UICorner")
    ic.CornerRadius = UDim.new(0, 8)
    ic.Parent = Img

    local Info = Instance.new("TextLabel")
    Info.Name = "EmbedText"
    Info.Parent = Card
    Info.LayoutOrder = 2
    Info.BackgroundTransparency = 1
    Info.AutomaticSize = Enum.AutomaticSize.Y
    Info.Size = UDim2.new(1, 0, 0, 0)
    Info.Font = Library.Theme.TextFont
    Info.TextSize = 14
    Info.TextColor3 = Library.Theme.TextColor
    Info.TextWrapped = true
    Info.RichText = true
    Info.TextXAlignment = Enum.TextXAlignment.Left
    Info.TextYAlignment = Enum.TextYAlignment.Top
    Info.ZIndex = 7
    local ip = Instance.new("UIPadding")
    ip.PaddingTop = UDim.new(0, 8)
    ip.PaddingBottom = UDim.new(0, 8)
    ip.PaddingLeft = UDim.new(0, 10)
    ip.PaddingRight = UDim.new(0, 10)
    ip.Parent = Info
    table.insert(Library.LibraryColorTable, Info)

    local Native = Instance.new("Frame")
    Native.Name = "EmbedNative"
    Native.Parent = Card
    Native.LayoutOrder = 1
    Native.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
    Native.BorderSizePixel = 0
    Native.Size = UDim2.new(1, 0, 0, 128)
    Native.ClipsDescendants = true
    Native.Visible = false
    Native.ZIndex = 7
    local nc = Instance.new("UICorner")
    nc.CornerRadius = UDim.new(0, 10)
    nc.Parent = Native
    local ns = Instance.new("UIStroke")
    ns.Color = Color3.fromRGB(62, 62, 72)
    ns.Thickness = 1
    ns.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    ns.Parent = Native

    local Bar = Instance.new("Frame")
    Bar.Name = "AccentBar"
    Bar.Parent = Native
    Bar.BorderSizePixel = 0
    Bar.BackgroundColor3 = Color3.fromRGB(79, 110, 255)
    Bar.Size = UDim2.new(1, 0, 0, 4)
    Bar.ZIndex = 8

    local Avatar = Instance.new("Frame")
    Avatar.Name = "Avatar"
    Avatar.Parent = Native
    Avatar.BorderSizePixel = 0
    Avatar.BackgroundColor3 = Color3.fromRGB(0, 140, 125)
    Avatar.Position = UDim2.new(0, 14, 0, 22)
    Avatar.Size = UDim2.new(0, 56, 0, 56)
    Avatar.ZIndex = 8
    local avc = Instance.new("UICorner")
    avc.CornerRadius = UDim.new(1, 0)
    avc.Parent = Avatar
    local avs = Instance.new("UIStroke")
    avs.Color = Color3.fromRGB(110, 150, 140)
    avs.Thickness = 1
    avs.Parent = Avatar
    local AvatarLetter = Instance.new("TextLabel")
    AvatarLetter.Name = "Letter"
    AvatarLetter.Parent = Avatar
    AvatarLetter.BackgroundTransparency = 1
    AvatarLetter.Size = UDim2.new(1, 0, 1, 0)
    AvatarLetter.Font = Enum.Font.GothamBold
    AvatarLetter.TextSize = 28
    AvatarLetter.TextColor3 = Color3.fromRGB(255, 255, 255)
    AvatarLetter.ZIndex = 9
    local AvatarImg = Instance.new("ImageLabel")
    AvatarImg.Name = "AvatarImage"
    AvatarImg.Parent = Avatar
    AvatarImg.BackgroundTransparency = 1
    AvatarImg.Size = UDim2.new(1, 0, 1, 0)
    AvatarImg.ZIndex = 10
    AvatarImg.Visible = false
    local aic = Instance.new("UICorner")
    aic.CornerRadius = UDim.new(1, 0)
    aic.Parent = AvatarImg

    local function mk(name, y, size, font, color)
        local t = Instance.new("TextLabel")
        t.Name = name
        t.Parent = Native
        t.BackgroundTransparency = 1
        t.Position = UDim2.new(0, 82, 0, y)
        t.Size = UDim2.new(1, -94, 0, size + 4)
        t.Font = font
        t.TextSize = size
        t.TextColor3 = color
        t.TextXAlignment = Enum.TextXAlignment.Left
        t.TextTruncate = Enum.TextTruncate.AtEnd
        t.ZIndex = 8
        return t
    end
    local NName = mk("Name", 20, 19, Enum.Font.GothamBold, Color3.fromRGB(255, 255, 255))
    local NBio = mk("Bio", 45, 13, Enum.Font.Gotham, Color3.fromRGB(190, 190, 200))
    local NStats = mk("Stats", 66, 13, Enum.Font.Gotham, Color3.fromRGB(140, 140, 152))

    local Line = Instance.new("Frame")
    Line.Name = "Line"
    Line.Parent = Native
    Line.BorderSizePixel = 0
    Line.BackgroundColor3 = Color3.fromRGB(52, 52, 60)
    Line.Position = UDim2.new(0, 14, 0, 94)
    Line.Size = UDim2.new(1, -28, 0, 1)
    Line.ZIndex = 8

    local function foot(name, align, px)
        local t = Instance.new("TextLabel")
        t.Name = name
        t.Parent = Native
        t.BackgroundTransparency = 1
        t.Position = UDim2.new(0, 14, 0, 101)
        t.Size = UDim2.new(1, -28, 0, 20)
        t.Font = Enum.Font.GothamBold
        t.TextSize = px
        t.TextColor3 = Color3.fromRGB(160, 160, 172)
        t.TextXAlignment = align
        t.ZIndex = 8
        return t
    end
    local NFootL = foot("FooterLeft", Enum.TextXAlignment.Left, 12)
    local NFootR = foot("FooterRight", Enum.TextXAlignment.Right, 13)
    NFootL.Position = UDim2.new(0, 31, 0, 101)
    NFootL.Size = UDim2.new(0.5, 0, 0, 20)

    local Logo = Instance.new("ImageLabel")
    Logo.Name = "RscriptsLogo"
    Logo.Parent = Native
    Logo.BackgroundTransparency = 1
    Logo.Position = UDim2.new(0, 15, 0, 106)
    Logo.Size = UDim2.new(0, 12, 0, 12)
    Logo.ZIndex = 8
    Logo.Image = ""
    Logo.Visible = false

    local BadgeImgs = {}
    for i = 1, 4 do
        local im = Instance.new("ImageLabel")
        im.Name = "Badge" .. i
        im.Parent = Native
        im.BackgroundTransparency = 1
        im.Size = UDim2.new(0, 18, 0, 18)
        im.ZIndex = 9
        im.Visible = false
        BadgeImgs[i] = im
    end

    local VerBadge = Instance.new("ImageLabel")
    VerBadge.Name = "VerifiedBadge"
    VerBadge.Parent = Native
    VerBadge.BackgroundTransparency = 1
    VerBadge.Size = UDim2.new(0, 18, 0, 18)
    VerBadge.ImageColor3 = Color3.fromRGB(67, 150, 250)
    VerBadge.ZIndex = 9
    VerBadge.Visible = false
    VerBadge.Image = (Library.ResolveIcon and Library.ResolveIcon("verified")) or ""

    local TierBadge = Instance.new("TextLabel")
    TierBadge.Name = "TierBadge"
    TierBadge.Parent = Native
    TierBadge.BackgroundTransparency = 1
    TierBadge.Size = UDim2.new(0, 18, 0, 18)
    TierBadge.Font = Enum.Font.GothamBold
    TierBadge.TextSize = 16
    TierBadge.Text = "⚡"
    TierBadge.TextColor3 = Color3.fromRGB(245, 158, 11)
    TierBadge.ZIndex = 9
    TierBadge.Visible = false

    local function showNative(d)
        d = d or {}
        local nm = tostring(d.Name or alt or "")
        NName.RichText = false
        NName.Text = nm
        local nameW = 0
        pcall(function()
            nameW = game:GetService("TextService"):GetTextSize(nm, 19, Enum.Font.GothamBold, Vector2.new(1000, 40)).X
        end)
        local bx = 82 + nameW + 6
        for _, im in ipairs(BadgeImgs) do im.Visible = false end
        if type(d.Badges) == "table" and #d.Badges > 0 then
            VerBadge.Visible = false
            TierBadge.Visible = false
            for i, asset in ipairs(d.Badges) do
                local im = BadgeImgs[i]
                if im then
                    im.Image = asset
                    im.Position = UDim2.new(0, bx, 0, 21)
                    im.Visible = true
                    bx = bx + 22
                end
            end
        else
            VerBadge.Visible = d.Verified and true or false
            VerBadge.Position = UDim2.new(0, bx, 0, 21)
            if d.Verified then bx = bx + 22 end
            TierBadge.Visible = d.Tier and true or false
            TierBadge.Position = UDim2.new(0, bx, 0, 21)
        end
        if d.LogoAsset then
            Logo.Image = d.LogoAsset
            Logo.Visible = true
            NFootL.Position = UDim2.new(0, 31, 0, 101)
        else
            Logo.Visible = false
            NFootL.Position = UDim2.new(0, 14, 0, 101)
        end
        local bg = typeof(d.Bg) == "Color3" and d.Bg or Color3.fromRGB(28, 28, 34)
        Native.BackgroundColor3 = bg
        if typeof(d.TextColor) == "Color3" then
            NName.TextColor3 = d.TextColor
            NBio.TextColor3 = d.TextColor:Lerp(bg, 0.35)
            NStats.TextColor3 = d.TextColor:Lerp(bg, 0.54)
            NFootL.TextColor3 = d.TextColor:Lerp(bg, 0.46)
            NFootR.TextColor3 = d.TextColor:Lerp(bg, 0.35)
            Line.BackgroundColor3 = d.TextColor:Lerp(bg, 0.9)
        end
        if type(d.Gradient) == "table" and typeof(d.Gradient[1]) == "Color3" and typeof(d.Gradient[2]) == "Color3" then
            Bar.BackgroundColor3 = Color3.new(1, 1, 1)
            local ug = Bar:FindFirstChildOfClass("UIGradient") or Instance.new("UIGradient")
            ug.Color = ColorSequence.new(d.Gradient[1], d.Gradient[2])
            ug.Parent = Bar
        end
        NBio.Text = tostring(d.Bio or "")
        NStats.Text = tostring(d.Stats or "")
        NFootL.Text = tostring(d.Footer or "")
        do
            NBio.TextWrapped = true
            NBio.TextTruncate = Enum.TextTruncate.None
            NBio.TextYAlignment = Enum.TextYAlignment.Top
            local avail = Native.AbsoluteSize.X
            if not avail or avail < 100 then avail = math.max(120, w - 20) end
            local bw = math.max(80, avail - 94)
            local bh = 17
            pcall(function()
                bh = game:GetService("TextService"):GetTextSize(NBio.Text, 13, Enum.Font.Gotham, Vector2.new(bw, 1000)).Y + 4
            end)
            bh = math.clamp(bh, 17, 72)
            local extra = bh - 17
            NBio.Size = UDim2.new(1, -94, 0, bh)
            NStats.Position = UDim2.new(0, 82, 0, 66 + extra)
            Line.Position = UDim2.new(0, 14, 0, 94 + extra)
            NFootL.Position = UDim2.new(0, d.LogoAsset and 31 or 14, 0, 101 + extra)
            NFootR.Position = UDim2.new(0, 14, 0, 101 + extra)
            Logo.Position = UDim2.new(0, 15, 0, 106 + extra)
            Native.Size = UDim2.new(1, 0, 0, 128 + extra)
        end
        NFootL.Text = tostring(d.Footer or "")
        NFootR.Text = tostring(d.Action or "View profile  >")
        AvatarLetter.Text = (nm ~= "" and nm:sub(1, 1):lower()) or "?"
        if typeof(d.Accent) == "Color3" then Bar.BackgroundColor3 = d.Accent end
        if typeof(d.AvatarColor) == "Color3" then Avatar.BackgroundColor3 = d.AvatarColor end
        if d.Avatar and tostring(d.Avatar) ~= "" then
            local a = tostring(d.Avatar)
            if a:match("^%d+$") then a = "rbxassetid://" .. a end
            AvatarImg.Image = a
            AvatarImg.Visible = true
        else
            AvatarImg.Visible = false
        end
        Native.Visible = true
    end

    local B64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    local b64map = {}
    for i = 1, 64 do b64map[B64:sub(i, i)] = i - 1 end
    local function b64dec(data)
        data = data:gsub("[^%w%+/=]", "")
        local out, buf, bits = {}, 0, 0
        for i = 1, #data do
            local c = data:sub(i, i)
            if c == "=" then break end
            buf = buf * 64 + b64map[c]
            bits = bits + 6
            if bits >= 8 then
                bits = bits - 8
                local byte = math.floor(buf / 2 ^ bits)
                out[#out + 1] = string.char(byte)
                buf = buf % 2 ^ bits
            end
        end
        return table.concat(out)
    end

    local function parseSvg(svg)
        local texts = {}
        for body in svg:gmatch("<text[^>]*>(.-)</text>") do
            local t = body:gsub("&#10;", "\n"):gsub("</tspan>%s*<tspan", "</tspan>\n<tspan"):gsub("<[^>]+>", ""):gsub("&amp;", "&"):gsub("&lt;", "<"):gsub("&gt;", ">"):gsub("&quot;", '"'):gsub("&#39;", "'")
            t = t:gsub("^%s+", ""):gsub("%s+$", "")
            if t ~= "" then table.insert(texts, t) end
        end
        if #texts == 0 then return nil end
        local d = { Footer = "RSCRIPTS", Action = "View profile  >" }
        local rest = {}
        for _, t in ipairs(texts) do
            local low = t:lower()
            if low == "rscripts" then d.Footer = t
            elseif low:find("^view ") then d.Action = (t:gsub("→", ">"):gsub("➜", ">"))
            elseif t:find("·", 1, true) or low:find("views") or low:find("followers") then d.Stats = d.Stats or t
            else table.insert(rest, t) end
        end
        d.Name = rest[1]
        d.Bio = rest[2]
        if not d.Name then return nil end
        if writefile and getcustomasset then
            d.Badges = {}
            local badgeList = {}
            for attrs in svg:gmatch("<image%s+([^>]-)/>") do
                local mime, data = attrs:match("data:image/(%a+);base64,([%w%+/=]+)")
                if data then
                    local ix = tonumber(attrs:match('%sx="([%d%.]+)"')) or 0
                    local iy = tonumber(attrs:match('%sy="([%d%.]+)"')) or 0
                    local iw = tonumber(attrs:match('%swidth="([%d%.]+)"')) or 0
                    pcall(function()
                        local raw = b64dec(data)
                        local ext = (raw:sub(1, 4) == "\137PNG") and "png" or ((raw:sub(1, 2) == "\255\216") and "jpg" or nil)
                        if not ext then return end
                        if makefolder and isfolder and not isfolder("RndmEmbeds") then makefolder("RndmEmbeds") end
                        local kind = (iw >= 40 and "avatar") or (iy < 40 and "badge") or "logo"
                        local path = "RndmEmbeds/" .. kind .. "_" .. #raw .. "_" .. tostring(d.Name or "x"):gsub("%W", "") .. "_" .. math.floor(ix) .. "." .. ext
                        writefile(path, raw)
                        local asset = getcustomasset(path)
                        if kind == "avatar" then d.Avatar = d.Avatar or asset
                        elseif kind == "logo" then d.LogoAsset = d.LogoAsset or asset
                        else table.insert(badgeList, { x = ix, asset = asset }) end
                    end)
                end
            end
            table.sort(badgeList, function(p, q) return p.x < q.x end)
            for _, bdg in ipairs(badgeList) do table.insert(d.Badges, bdg.asset) end
        end
        local function hex(h)
            if not h then return nil end
            h = h:gsub("#", "")
            if #h == 3 then h = h:sub(1, 1):rep(2) .. h:sub(2, 2):rep(2) .. h:sub(3, 3):rep(2) end
            if #h ~= 6 then return nil end
            local r, g, b = tonumber(h:sub(1, 2), 16), tonumber(h:sub(3, 4), 16), tonumber(h:sub(5, 6), 16)
            if r and g and b then return Color3.fromRGB(r, g, b) end
        end
        d.Bg = hex(svg:match('<rect x="0" y="0" width="%d+" height="%d+" fill="(#%x+)"'))
        d.TextColor = hex(svg:match('font%-weight="700" fill="(#%x+)"'))
        local g1, g2 = svg:match('id="top%-bar".-stop%-color="(#%x+)".-stop%-color="(#%x+)"')
        if g1 and g2 then d.Gradient = { hex(g1), hex(g2) } end
        d.Verified = svg:find("#4396fa", 1, true) ~= nil
        d.Tier = svg:find("creator%-tier%-badge") ~= nil
        return d
    end

    local hasImage = false
    local function refreshText(state)
        local base = "<b>" .. tostring(alt):gsub("<", "&lt;") .. "</b>"
        local hint = '<font size="12" color="rgb(160,160,170)">Tap to copy link</font>'
        if state == "loading" then
            Info.Text = base .. "\n" .. '<font size="12" color="rgb(160,160,170)">Loading preview...</font>'
        elseif hasImage then
            Info.Text = hint
        else
            Info.Text = base .. "\n" .. hint
        end
    end
    refreshText("loading")

    local function readFile(url)
        local data
        local ok = pcall(function() data = game:HttpGet(url) end)
        if ok and data and #data > 0 then return data end
        local req = (syn and syn.request) or http_request or request or (http and http.request)
        if req then
            local ok2, res = pcall(req, { Url = url, Method = "GET" })
            if ok2 and res and res.Body and #res.Body > 0 then return res.Body end
        end
        return nil
    end

    local token = 0
    local overrides = (type(card) == "table") and card or nil
    local function loadImage(url)
        token = token + 1
        local my = token
        hasImage = false
        Img.Visible = false
        Native.Visible = false
        refreshText("loading")
        if not url or url == "" then refreshText() return end
        task.spawn(function()
            local asset
            local u = tostring(url)
            if u:match("^%d+$") then
                asset = "rbxassetid://" .. u
            elseif u:match("^rbxassetid://") or u:match("^rbxasset://") then
                asset = u
            else
                local data = readFile(u)
                if data then
                    local ext
                    if data:sub(1, 4) == "\137PNG" then ext = "png"
                    elseif data:sub(1, 2) == "\255\216" then ext = "jpg" end
                    if not ext and data:find("<svg", 1, true) then
                        local d = parseSvg(data)
                        if d and my == token then
                            if overrides then
                                for k, v in pairs(overrides) do d[k] = v end
                            end
                            showNative(d)
                            hasImage = true
                            refreshText()
                            return
                        end
                    end
                    if ext and writefile and getcustomasset then
                        pcall(function()
                            if makefolder and isfolder and not isfolder("RndmEmbeds") then makefolder("RndmEmbeds") end
                            local key = 0
                            for i = 1, #u do key = (key * 31 + u:byte(i)) % 4294967296 end
                            local path = "RndmEmbeds/" .. key .. "_" .. #data .. "." .. ext
                            writefile(path, data)
                            asset = getcustomasset(path)
                        end)
                    end
                end
            end
            if my ~= token then return end
            if not asset and overrides and overrides.Name then
                showNative(overrides)
                hasImage = true
                refreshText()
                return
            end
            if asset and asset ~= "" then
                Img.Image = asset
                Img.Visible = true
                hasImage = true
            end
            refreshText()
        end)
    end

    local function copyLink()
        if link == "" then return end
        local ok = pcall(function() setclipboard(link) end)
        if Library.CreateNotification then
            Library:CreateNotification("Link", ok and ("Copied: " .. link) or link, 4)
        end
    end
    Card.MouseButton1Click:Connect(copyLink)
    Card.MouseEnter:Connect(function()
        TweenService:Create(Card, TweenInfo.new(0.15), { BackgroundTransparency = 0.15 }):Play()
    end)
    Card.MouseLeave:Connect(function()
        TweenService:Create(Card, TweenInfo.new(0.15), { BackgroundTransparency = 0.35 }):Play()
    end)

    if type(card) == "table" and not (img and img ~= "") then
        showNative(card)
        hasImage = true
        refreshText()
    else
        loadImage(img)
    end

    return {
        SetCard = function(a, b)
            local v = (type(a) == "table" and a.Frame == nil and b == nil) and a or b
            if type(v) == "table" then
                token = token + 1
                Img.Visible = false
                showNative(v)
                hasImage = true
                refreshText()
            end
        end,
        SetLink = function(a, b) local v = (type(a) == "table") and b or a link = tostring(v or "") end,
        SetImage = function(a, b) local v = (type(a) == "table") and b or a loadImage(v) end,
        Reload = function() loadImage(img) end,
        Copy = copyLink,
        Frame = Holder,
    }
end

function SectionElements:CreateProgressBar(name, minimumvalue, maximumvalue, presetvalue, suffix)
    minimumvalue = tonumber(minimumvalue) or 0
    maximumvalue = tonumber(maximumvalue) or 100
    if maximumvalue == minimumvalue then maximumvalue = minimumvalue + 1 end
    local current = math.clamp(tonumber(presetvalue) or minimumvalue, minimumvalue, maximumvalue)
    local customText = nil

    local Bar = Instance.new("Frame")
    Bar.Name = tostring(name) .. "ProgressBar"
    Bar.Parent = SectionContent
    Bar.BackgroundTransparency = 1
    Bar.BorderSizePixel = 0
    Bar.Size = UDim2.new(1, 0, 0, 50)
    Bar.ZIndex = 5

    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Parent = Bar
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 12, 0, 0)
    Title.Size = UDim2.new(1, -90, 0, 35)
    Title.ZIndex = 5
    Title.Font = Library.Theme.TextFont
    Title.Text = tostring(name)
    Title.TextColor3 = Library.Theme.TextColor
    Title.TextSize = 15
    Title.TextXAlignment = Enum.TextXAlignment.Left
    table.insert(Library.LibraryColorTable, Title)

    local ValueLabel = Instance.new("TextLabel")
    ValueLabel.Name = "ValueLabel"
    ValueLabel.Parent = Bar
    ValueLabel.BackgroundTransparency = 1
    ValueLabel.AnchorPoint = Vector2.new(1, 0)
    ValueLabel.Position = UDim2.new(1, -12, 0, 0)
    ValueLabel.Size = UDim2.new(0, 120, 0, 35)
    ValueLabel.ZIndex = 5
    ValueLabel.Font = Library.Theme.TextFont
    ValueLabel.TextColor3 = Color3.fromRGB(190, 190, 198)
    ValueLabel.TextSize = 14
    ValueLabel.TextXAlignment = Enum.TextXAlignment.Right

    local Track = Instance.new("Frame")
    Track.Name = "Track"
    Track.Parent = Bar
    Track.BackgroundColor3 = Color3.fromRGB(62, 62, 70)
    Track.BorderSizePixel = 0
    Track.Position = UDim2.new(0, 12, 0, 38)
    Track.Size = UDim2.new(1, -24, 0, 6)
    Track.ZIndex = 5
    Instance.new("UICorner", Track).CornerRadius = UDim.new(1, 0)

    local Fill = Instance.new("Frame")
    Fill.Name = "Fill"
    Fill.Parent = Track
    Fill.BackgroundColor3 = Library.Theme.MainColor
    Fill.BorderSizePixel = 0
    Fill.Size = UDim2.new(0, 0, 1, 0)
    Fill.ZIndex = 6
    Instance.new("UICorner", Fill).CornerRadius = UDim.new(1, 0)

    local function fraction()
        return (current - minimumvalue) / (maximumvalue - minimumvalue)
    end
    local function refreshText()
        if customText then
            ValueLabel.Text = customText
        elseif suffix ~= nil then
            ValueLabel.Text = tostring(math.floor(current * 100 + 0.5) / 100) .. tostring(suffix)
        else
            ValueLabel.Text = tostring(math.floor(fraction() * 100 + 0.5)) .. "%"
        end
    end
    local function render(instant)
        local goal = UDim2.new(fraction(), 0, 1, 0)
        if instant then
            Fill.Size = goal
        else
            TweenService:Create(Fill, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = goal }):Play()
        end
        refreshText()
    end
    render(true)

    local api = {}
    function api.SetValue(a, b)
        local v = (type(a) == "table") and b or a
        v = tonumber(v)
        if not v then return end
        current = math.clamp(v, minimumvalue, maximumvalue)
        render(false)
    end
    function api.GetValue() return current end
    function api.SetText(a, b)
        local v = (type(a) == "table") and b or a
        customText = (v ~= nil) and tostring(v) or nil
        refreshText()
    end
    function api.SetRange(a, b, c)
        local lo, hi = a, b
        if type(a) == "table" then lo, hi = b, c end
        lo, hi = tonumber(lo), tonumber(hi)
        if not lo or not hi or lo == hi then return end
        minimumvalue, maximumvalue = lo, hi
        current = math.clamp(current, lo, hi)
        render(false)
    end
    api.Set, api.Get = api.SetValue, api.GetValue
    api.Frame = Bar
    return api
end

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

    return {
        ChangeText = ChangeText,
        Refresh = RefreshLabel
    }
end

        function SectionElements:CreateButton(name, callback, opts)
            opts = type(opts) == "table" and opts or {}
            name = tostring(name)
            local cooldown = tonumber(opts.Cooldown) or 0
            local loadingMode = opts.Loading and true or false

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

            local state = "idle"
            local token = 0
            local function dim(on)
                TweenService:Create(ButtonRounded, TweenInfo.new(0.2), { ImageTransparency = on and 0.6 or 0.2 }):Play()
                TweenService:Create(Button, TweenInfo.new(0.2), { TextTransparency = on and 0.35 or 0 }):Play()
            end
            local function setIdle()
                token = token + 1
                state = "idle"
                Button.Text = name
                dim(false)
            end
            local function startLoading()
                token = token + 1
                local my = token
                state = "loading"
                dim(true)
                task.spawn(function()
                    local frames = { "", ".", "..", "..." }
                    local n = 0
                    while token == my and state == "loading" and Button.Parent do
                        Button.Text = name .. frames[(n % 4) + 1]
                        n = n + 1
                        task.wait(0.25)
                    end
                end)
            end
            local function startCooldown(sec)
                sec = tonumber(sec) or 0
                if sec <= 0 then setIdle() return end
                token = token + 1
                local my = token
                state = "cooldown"
                dim(true)
                task.spawn(function()
                    local t0 = os.clock()
                    while token == my and Button.Parent do
                        local left = sec - (os.clock() - t0)
                        if left <= 0 then break end
                        Button.Text = name .. " (" .. math.ceil(left) .. "s)"
                        task.wait(0.1)
                    end
                    if token == my then setIdle() end
                end)
            end

            Button.MouseButton1Down:Connect(function()
                if state ~= "idle" then return end
                TweenService:Create(ButtonRounded, TweenInfo.new(0.25, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {ImageColor3 = DarkenObjectColor(Library.Theme.MainColor, 20)}):Play()

                RippleEffect(Button)
            end)

            local confirmOpt = opts.Confirm
            local function runAction()
                if state ~= "idle" then return end
                if type(callback) ~= "function" then return end
                if loadingMode then
                    startLoading()
                    local my = token
                    task.spawn(function()
                        local ok, err = pcall(callback, Button)
                        if not ok then warn(err) end
                        if token == my and state == "loading" then
                            if cooldown > 0 then startCooldown(cooldown) else setIdle() end
                        end
                    end)
                else
                    local ok, err = pcall(callback, Button)
                    if not ok then warn(err) end
                    if cooldown > 0 then startCooldown(cooldown) end
                end
            end

            local function press()
                if state ~= "idle" then return end
                if confirmOpt and Library.Confirm then
                    local c = type(confirmOpt) == "table" and confirmOpt or {}
                    local msg = type(confirmOpt) == "string" and confirmOpt or c.Message or c.Text
                    Library:Confirm(c.Title or name, msg or ("Run \"" .. name .. "\"?"), runAction, nil, { Yes = c.Yes, No = c.No })
                else
                    runAction()
                end
            end
            Button.MouseButton1Click:Connect(press)
            Library._Triggers = Library._Triggers or {}
            Library._Triggers[NameButton] = press

            Button.MouseButton1Up:Connect(function()
                TweenService:Create(ButtonRounded, TweenInfo.new(0.25, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {ImageColor3 = Library.Theme.MainColor}):Play()
            end)

            Button.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement then
                    TweenService:Create(ButtonRounded, TweenInfo.new(0.25, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {ImageColor3 = Library.Theme.MainColor}):Play()
                end
            end)

            table.insert(Library.LibraryColorTable, ButtonRounded)

            if opts.Tooltip then
                Library.AttachTooltip(NameButton, Button, opts.Tooltip)
            end

            local function arg(a, b) if type(a) == "table" then return b end return a end
            return {
                SetLoading = function(a, b)
                    if arg(a, b) then
                        if state == "idle" then startLoading() end
                    elseif state == "loading" then
                        setIdle()
                    end
                end,
                Cooldown = function(a, b) startCooldown(arg(a, b)) end,
                SetText = function(a, b)
                    name = tostring(arg(a, b) or "")
                    if state == "idle" then Button.Text = name end
                end,
                Frame = NameButton,
                Button = Button,
            }
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
    local Track = Instance.new("Frame")
    local Knob = Instance.new("Frame")
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
        Callback = callback,
        EnabledDuringLoad = true
    }

    local function textOn() return Library and Library.Theme and Library.Theme.TextColor or Color3.fromRGB(255, 255, 255) end
    local function trackOn() return Library and Library.Theme and Library.Theme.MainColor or Color3.fromRGB(255, 75, 75) end
    local function trackOff() return Library.Role("SliderBg", Color3.fromRGB(62, 62, 70)) end

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
    Title.Size = UDim2.new(1, -72, 0, 35)
    Title.ZIndex = 5
    Title.Font = Library and Library.Theme and Library.Theme.TextFont or Enum.Font.SourceSansBold
    Title.Text = name
    Title.TextColor3 = Toggled and textOn() or Color3.fromRGB(185, 185, 185)
    if Library and Library.LibraryColorTable then table.insert(Library.LibraryColorTable, Title) end
    if _G.UpdateTextColors then UpdateTextColors() end
    Title.TextSize = 15.000
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.TextTruncate = Enum.TextTruncate.AtEnd

    Toggle.Name = "Toggle"
    Toggle.Parent = NameToggle
    Toggle.BackgroundTransparency = 1.000
    Toggle.AnchorPoint = Vector2.new(1, 0.5)
    Toggle.Position = UDim2.new(1, -6, 0.5, 0)
    Toggle.Size = UDim2.new(0, 54, 0, 32)
    Toggle.ZIndex = 5
    Toggle.AutoButtonColor = false
    Toggle.Font = Library and Library.Theme and Library.Theme.TextFont or Enum.Font.SourceSansBold
    Toggle.Text = ""
    Toggle.TextSize = 14.000

    Track.Name = "SwitchTrack"
    Track.Parent = Toggle
    Track.AnchorPoint = Vector2.new(0.5, 0.5)
    Track.Position = UDim2.new(0.5, 0, 0.5, 0)
    Track.Size = UDim2.new(0, 38, 0, 20)
    Track.BorderSizePixel = 0
    Track.BackgroundColor3 = Toggled and trackOn() or trackOff()
    Track.ZIndex = 5
    local trackCorner = Instance.new("UICorner")
    trackCorner.CornerRadius = UDim.new(1, 0)
    trackCorner.Parent = Track

    Knob.Name = "SwitchKnob"
    Knob.Parent = Track
    Knob.AnchorPoint = Vector2.new(0, 0.5)
    Knob.Position = Toggled and UDim2.new(1, -17, 0.5, 0) or UDim2.new(0, 3, 0.5, 0)
    Knob.Size = UDim2.new(0, 14, 0, 14)
    Knob.BorderSizePixel = 0
    Knob.BackgroundColor3 = Toggled and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(200, 200, 208)
    Knob.ZIndex = 6
    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(1, 0)
    knobCorner.Parent = Knob

    local function render(animate)
        local ti = TweenInfo.new(animate and 0.18 or 0.01, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        TweenService:Create(Title, ti, {TextColor3 = Toggled and textOn() or Color3.fromRGB(185, 185, 185)}):Play()
        TweenService:Create(Track, ti, {BackgroundColor3 = Toggled and trackOn() or trackOff()}):Play()
        TweenService:Create(Knob, ti, {
            Position = Toggled and UDim2.new(1, -17, 0.5, 0) or UDim2.new(0, 3, 0.5, 0),
            BackgroundColor3 = Toggled and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(200, 200, 208),
        }):Play()
    end

    if tooltipText then
        Tooltip = Instance.new("TextLabel")
        Tooltip.Name = "Tooltip"
        Tooltip.Parent = NameToggle
        Tooltip.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Tooltip.AnchorPoint = Vector2.new(0, 1)
        Tooltip.Position = UDim2.new(0, 10, 0, -4)
        Tooltip.AutomaticSize = Enum.AutomaticSize.XY
        Tooltip.Size = UDim2.new(0, 0, 0, 0)
        Tooltip.ZIndex = 12
        Tooltip.Font = Library and Library.Theme and Library.Theme.TextFont or Enum.Font.SourceSansBold
        Tooltip.Text = tooltipText
        Tooltip.TextColor3 = Color3.fromRGB(0, 0, 0)
        Tooltip.TextSize = 14.000
        Tooltip.TextWrapped = true
        Tooltip.TextXAlignment = Enum.TextXAlignment.Left
        Tooltip.TextYAlignment = Enum.TextYAlignment.Top
        Tooltip.Visible = false

        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 5)
        UICorner.Parent = Tooltip

        local TipPad = Instance.new("UIPadding")
        TipPad.PaddingLeft = UDim.new(0, 7)
        TipPad.PaddingRight = UDim.new(0, 7)
        TipPad.PaddingTop = UDim.new(0, 4)
        TipPad.PaddingBottom = UDim.new(0, 4)
        TipPad.Parent = Tooltip

        local TipLimit = Instance.new("UISizeConstraint")
        TipLimit.MaxSize = Vector2.new(230, 1000)
        TipLimit.Parent = Tooltip

        local function ShowTooltip()
            Tooltip.Visible = true
            task.spawn(function()
                RunService.Heartbeat:Wait()
                if not Tooltip.Visible or not Tooltip.Parent then return end
                local sf = NameToggle:FindFirstAncestorOfClass("ScrollingFrame")
                local room = sf and (NameToggle.AbsolutePosition.Y - sf.AbsolutePosition.Y) or math.huge
                if room < Tooltip.AbsoluteSize.Y + 8 then
                    Tooltip.AnchorPoint = Vector2.new(0, 0)
                    Tooltip.Position = UDim2.new(0, 10, 1, 2)
                else
                    Tooltip.AnchorPoint = Vector2.new(0, 1)
                    Tooltip.Position = UDim2.new(0, 10, 0, -4)
                end
            end)
        end

        Title.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseMovement then
                ShowTooltip()
            end
        end)

        Title.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseMovement then
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
        render(true)
        Settings[gameId][name] = Toggled
        SaveSettings()
        safeCallback(Toggled)
        task.wait()
    end)

    if Toggled then
        task.wait(0.1)
    end

    task.delay(1, function()
        if UIReferences and UIReferences.Toggles[name] and UIReferences.Toggles[name].Toggled then
            UIReferences.Toggles[name].EnabledDuringLoad = true
            safeCallback(UIReferences.Toggles[name].Toggled)
        end
    end)

    local ToggleAPI = {
        SetState = function(state)
            Toggled = state
            UIReferences.Toggles[name].EnabledDuringLoad = true
            render(true)
            Settings[gameId][name] = state
            SaveSettings()
            safeCallback(state)
            task.wait()
        end,
        GetState = function() return Toggled end,
        Frame = NameToggle,
    }
    if Library._RegSetter then
        Library._RegSetter(gameId, name, function(v)
            if type(v) == "boolean" then ToggleAPI.SetState(v) end
        end)
    end
    Library._Triggers = Library._Triggers or {}
    Library._Triggers[NameToggle] = function() ToggleAPI.SetState(not Toggled) end
    return ToggleAPI
end
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

function SectionElements:CreateSlider(name, minimumvalue, maximumvalue, presetvalue, precisevalue, callback, bind, tooltip)
    local NameSlider = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local SliderBackground = Instance.new("ImageLabel")
    local SliderIndicator = Instance.new("ImageLabel")
    local CircleSelector = Instance.new("ImageLabel")
    local SliderValue = Instance.new("ImageLabel")
    local Value = Instance.new("TextBox")

    local SliderDragging = false
    local StartingValue = presetvalue

    local sliderGameId = self.GameId or tostring(game.PlaceId)
    if not Settings[sliderGameId] then Settings[sliderGameId] = {} end
    local savedSliderValue = Settings[sliderGameId][name]
    if type(savedSliderValue) == "number" then
        StartingValue = math.clamp(savedSliderValue, minimumvalue, maximumvalue)
    end
    local currentValue = StartingValue or minimumvalue
    callback = callback or function() end
    local bindName = (type(bind) == "string" and bind ~= "") and bind or nil
    local function PublishBind(v)
        if not bindName then return end
        pcall(function() getgenv()[bindName] = v end)
    end

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
    if tooltip then Library.AttachTooltip(NameSlider, Title, tooltip) end

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

    local ValueStroke = Instance.new("UIStroke")
    ValueStroke.Color = Library.Role("SliderBg", Color3.fromRGB(62, 62, 70))
    ValueStroke.Thickness = 1
    ValueStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    ValueStroke.Parent = SliderValue
    Value.Focused:Connect(function()
        TweenService:Create(ValueStroke, TweenInfo.new(0.15), {Color = Library.Theme.MainColor}):Play()
    end)

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
        currentValue = SlidingValue
        PublishBind(SlidingValue)
        callback(SlidingValue)
    end

    local function SaveSliderValue()
        Settings[sliderGameId][name] = currentValue
        SaveSettings()
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
            if SliderDragging then SaveSliderValue() end
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
    HitArea.MouseEnter:Connect(function()
        if not SliderDragging then
            TweenService:Create(CircleSelector, TweenInfo.new(0.1), {Size = UDim2.new(0, 17, 0, 17)}):Play()
        end
    end)
    HitArea.MouseLeave:Connect(function()
        if not SliderDragging then shrinkCircle() end
    end)
    HitArea.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            if SliderDragging then SaveSliderValue() end
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

    UserInputService.InputEnded:Connect(function(input)
        if SliderDragging and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
            SaveSliderValue()
            SliderDragging = false
            SectionScrollingFrame.ScrollingEnabled = true
            shrinkCircle()
        end
    end)

    Value.FocusLost:Connect(function()
        TweenService:Create(ValueStroke, TweenInfo.new(0.15), {Color = Library.Role("SliderBg", Color3.fromRGB(62, 62, 70))}):Play()
        local n = tonumber(Value.Text)
        if not n then n = currentValue end
        n = math.clamp(n, minimumvalue, maximumvalue)
        if precisevalue then
            n = tonumber(string.format("%.2f", n))
        else
            n = math.floor(n + 0.5)
        end
        Value.Text = tostring(n)

        TweenService:Create(SliderIndicator, TweenInfo.new(0.02, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new((n - minimumvalue) / (maximumvalue - minimumvalue), 0, 1, 0)}):Play()
        currentValue = n
        PublishBind(currentValue)
        SaveSliderValue()
        callback(n)
    end)

    local function SetValue(a, b)
        local v = (type(a) == "table") and b or a
        v = tonumber(v)
        if not v then return end
        v = math.clamp(v, minimumvalue, maximumvalue)
        if precisevalue then
            v = tonumber(string.format("%.2f", v))
        else
            v = math.floor(v + 0.5)
        end
        currentValue = v
        Value.Text = tostring(v)
        TweenService:Create(SliderIndicator, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.new((v - minimumvalue) / (maximumvalue - minimumvalue), 0, 1, 0)
        }):Play()
        PublishBind(v)
        SaveSliderValue()
        callback(v)
    end

    local function GetValue()
        return currentValue
    end

    PublishBind(currentValue)
    callback(StartingValue)

    if bindName then
        task.spawn(function()
            while NameSlider and NameSlider.Parent do
                task.wait(0.25)
                local ok, v = pcall(function() return getgenv()[bindName] end)
                if ok and type(v) == "number" and v ~= currentValue and not SliderDragging then
                    SetValue(v)
                end
            end
        end)
    end

    if Library._RegSetter then
        Library._RegSetter(sliderGameId, name, SetValue)
    end

    return {
        SetValue = SetValue,
        Set = SetValue,
        GetValue = GetValue,
        Get = GetValue
    }
end

function SectionElements:CreateNumberInput(name, minimumvalue, maximumvalue, presetvalue, callback, step, bind, tooltip)
    minimumvalue = tonumber(minimumvalue) or 0
    maximumvalue = tonumber(maximumvalue) or 100
    if maximumvalue < minimumvalue then minimumvalue, maximumvalue = maximumvalue, minimumvalue end
    step = tonumber(step)
    if not step or step <= 0 then step = 1 end
    callback = callback or function() end
    local bindName = (type(bind) == "string" and bind ~= "") and bind or nil

    local decimals = 0
    do
        local frac = tostring(step):match("%.(%d+)$")
        if frac then decimals = math.min(#frac, 4) end
    end
    local function norm(v)
        v = math.clamp(v, minimumvalue, maximumvalue)
        if decimals == 0 then return math.floor(v + 0.5) end
        return tonumber(string.format("%." .. decimals .. "f", v))
    end

    local numGameId = self.GameId or tostring(game.PlaceId)
    if not Settings[numGameId] then Settings[numGameId] = {} end
    local startValue = presetvalue
    if type(Settings[numGameId][name]) == "number" then startValue = Settings[numGameId][name] end
    local current = norm(tonumber(startValue) or minimumvalue)

    local Row = Instance.new("Frame")
    Row.Name = tostring(name) .. "NumberInput"
    Row.Parent = SectionContent
    Row.BackgroundTransparency = 1
    Row.BorderSizePixel = 0
    Row.Size = UDim2.new(1, 0, 0, 40)
    Row.ZIndex = 5

    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Parent = Row
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 12, 0, 0)
    Title.Size = UDim2.new(1, -150, 1, 0)
    Title.ZIndex = 5
    Title.Font = Library.Theme.TextFont
    Title.Text = tostring(name)
    Title.TextColor3 = Library.Theme.TextColor
    Title.TextSize = 15
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.TextTruncate = Enum.TextTruncate.AtEnd
    table.insert(Library.LibraryColorTable, Title)
    if tooltip then Library.AttachTooltip(Row, Title, tooltip) end

    local function makeStepButton(text, xOffset)
        local B = Instance.new("TextButton")
        B.Name = "Step"
        B.Parent = Row
        B.AnchorPoint = Vector2.new(1, 0.5)
        B.Position = UDim2.new(1, xOffset, 0.5, 0)
        B.Size = UDim2.new(0, 26, 0, 26)
        B.BackgroundColor3 = Color3.fromRGB(62, 62, 70)
        B.BorderSizePixel = 0
        B.AutoButtonColor = false
        B.ZIndex = 6
        B.Font = Library.Theme.TextFont
        B.Text = text
        B.TextColor3 = Library.Theme.TextColor
        B.TextSize = 18
        Instance.new("UICorner", B).CornerRadius = UDim.new(0, 5)
        table.insert(Library.LibraryColorTable, B)
        return B
    end
    local Plus = makeStepButton("+", -10)
    local Minus = makeStepButton("-", -108)

    local Box = Instance.new("TextBox")
    Box.Name = "NumberBox"
    Box.Parent = Row
    Box.AnchorPoint = Vector2.new(1, 0.5)
    Box.Position = UDim2.new(1, -40, 0.5, 0)
    Box.Size = UDim2.new(0, 64, 0, 26)
    Box.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    Box.BackgroundTransparency = 0.1
    Box.BorderSizePixel = 0
    Box.ZIndex = 6
    Box.Font = Library.Theme.TextFont
    Box.Text = tostring(current)
    Box.TextColor3 = Color3.fromRGB(255, 255, 255)
    Box.TextSize = 14
    Box.ClearTextOnFocus = false
    Instance.new("UICorner", Box).CornerRadius = UDim.new(0, 5)

    local function publish(v)
        if bindName then pcall(function() getgenv()[bindName] = v end) end
    end

    local function setNumber(v, silent)
        v = tonumber(v)
        if not v then return end
        current = norm(v)
        Box.Text = tostring(current)
        Settings[numGameId][name] = current
        SaveSettings()
        publish(current)
        if not silent then
            local ok, err = pcall(callback, current)
            if not ok then warn(err) end
        end
    end

    Box.FocusLost:Connect(function()
        local n = tonumber(Box.Text)
        if n then setNumber(n) else Box.Text = tostring(current) end
    end)
    Plus.MouseButton1Click:Connect(function() setNumber(current + step) end)
    Minus.MouseButton1Click:Connect(function() setNumber(current - step) end)

    publish(current)
    pcall(callback, current)

    if bindName then
        task.spawn(function()
            while Row and Row.Parent do
                task.wait(0.25)
                local ok, v = pcall(function() return getgenv()[bindName] end)
                if ok and type(v) == "number" and v ~= current and not Box:IsFocused() then
                    setNumber(v)
                end
            end
        end)
    end

    if Library._RegSetter then
        Library._RegSetter(numGameId, name, function(v) setNumber(v) end)
    end

    local api = {}
    function api.SetValue(a, b)
        local v = (type(a) == "table") and b or a
        setNumber(v)
    end
    function api.GetValue() return current end
    api.Set, api.Get = api.SetValue, api.GetValue
    api.Frame = Row
    return api
end

function SectionElements:CreateTextBox(name, characterLimit, placeholderText, callback, tooltip)
            local NameTextBox = Instance.new("Frame")
            local Title = Instance.new("TextLabel")
            local Field = Instance.new("Frame")
            local InputBox = Instance.new("TextBox")
            local limit = tonumber(characterLimit) or 1000000

            local gameId = self.GameId
            if not Settings[gameId] then Settings[gameId] = {} end
            local SavedText = Settings[gameId][name] or placeholderText or ""

            NameTextBox.Name = name .. "TextBox"
            NameTextBox.Parent = SectionContent
            NameTextBox.BackgroundTransparency = 1.000
            NameTextBox.Size = UDim2.new(1, 0, 0, 56)
            NameTextBox.ZIndex = 5

            Title.Name = "Title"
            Title.Parent = NameTextBox
            Title.BackgroundTransparency = 1.000
            Title.Position = UDim2.new(0, 13, 0, 2)
            Title.Size = UDim2.new(1, -26, 0, 18)
            Title.ZIndex = 5
            Title.Font = Library.Theme.TextFont
            Title.Text = name
            Title.TextColor3 = Library.Theme.TextColor
            Title.TextSize = 15.000
            Title.TextXAlignment = Enum.TextXAlignment.Left
            Title.TextTruncate = Enum.TextTruncate.AtEnd
            table.insert(Library.LibraryColorTable, Title)
            if tooltip then Library.AttachTooltip(NameTextBox, Title, tooltip) end

            local IDLE_BG = Color3.fromRGB(30, 30, 34)
            local HOVER_BG = Color3.fromRGB(36, 36, 41)
            local IDLE_STROKE = Color3.fromRGB(58, 58, 66)
            local tweenInfo = TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

            Field.Name = "Field"
            Field.Parent = NameTextBox
            Field.BackgroundColor3 = IDLE_BG
            Field.BorderSizePixel = 0
            Field.Position = UDim2.new(0, 12, 0, 23)
            Field.Size = UDim2.new(1, -24, 0, 30)
            Field.ZIndex = 5
            local fieldCorner = Instance.new("UICorner")
            fieldCorner.CornerRadius = UDim.new(0, 8)
            fieldCorner.Parent = Field
            local fieldStroke = Instance.new("UIStroke")
            fieldStroke.Color = IDLE_STROKE
            fieldStroke.Thickness = 1
            fieldStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            fieldStroke.Parent = Field

            InputBox.Name = "InputBox"
            InputBox.Parent = Field
            InputBox.BackgroundTransparency = 1
            InputBox.BorderSizePixel = 0
            InputBox.Position = UDim2.new(0, 11, 0, 0)
            InputBox.Size = UDim2.new(1, -62, 1, 0)
            InputBox.ZIndex = 6
            InputBox.Font = Library.Theme.TextFont
            InputBox.PlaceholderText = placeholderText or "message..."
            InputBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 130)
            InputBox.Text = SavedText
            InputBox.TextColor3 = Color3.fromRGB(235, 235, 240)
            InputBox.TextSize = 14.000
            InputBox.TextXAlignment = Enum.TextXAlignment.Left
            InputBox.ClearTextOnFocus = false
            InputBox.ClipsDescendants = true

            local Counter = Instance.new("TextLabel")
            Counter.Name = "Counter"
            Counter.Parent = Field
            Counter.BackgroundTransparency = 1
            Counter.AnchorPoint = Vector2.new(1, 0.5)
            Counter.Position = UDim2.new(1, -28, 0.5, 0)
            Counter.Size = UDim2.new(0, 44, 0, 14)
            Counter.ZIndex = 6
            Counter.Font = Enum.Font.Gotham
            Counter.TextSize = 11
            Counter.TextColor3 = Color3.fromRGB(120, 120, 130)
            Counter.TextXAlignment = Enum.TextXAlignment.Right
            Counter.Visible = false

            local Clear = Instance.new("TextButton")
            Clear.Name = "Clear"
            Clear.Parent = Field
            Clear.AnchorPoint = Vector2.new(1, 0.5)
            Clear.Position = UDim2.new(1, -5, 0.5, 0)
            Clear.Size = UDim2.new(0, 20, 0, 20)
            Clear.BackgroundColor3 = Color3.fromRGB(52, 52, 60)
            Clear.BackgroundTransparency = 1
            Clear.BorderSizePixel = 0
            Clear.AutoButtonColor = false
            Clear.ZIndex = 7
            Clear.Font = Enum.Font.GothamBold
            Clear.Text = "x"
            Clear.TextSize = 12
            Clear.TextColor3 = Color3.fromRGB(130, 130, 142)
            Clear.Visible = false
            local clearCorner = Instance.new("UICorner")
            clearCorner.CornerRadius = UDim.new(1, 0)
            clearCorner.Parent = Clear

            local hovering, focused = false, false
            local function refreshVisual()
                local accent = (Library.Theme and Library.Theme.MainColor) or Color3.fromRGB(100, 100, 110)
                TweenService:Create(fieldStroke, tweenInfo, { Color = focused and accent or IDLE_STROKE, Thickness = focused and 1.5 or 1 }):Play()
                TweenService:Create(Field, tweenInfo, { BackgroundColor3 = (focused or hovering) and HOVER_BG or IDLE_BG }):Play()
                Clear.Visible = InputBox.Text ~= "" and (focused or hovering)
                Counter.Visible = focused and limit <= 1000
                Counter.Text = #InputBox.Text .. "/" .. limit
                Counter.TextColor3 = (#InputBox.Text >= limit) and Color3.fromRGB(235, 110, 110) or Color3.fromRGB(120, 120, 130)
                InputBox.Size = UDim2.new(1, (Counter.Visible and -108 or -62), 1, 0)
            end

            Field.MouseEnter:Connect(function() hovering = true refreshVisual() end)
            Field.MouseLeave:Connect(function() hovering = false refreshVisual() end)
            InputBox.Focused:Connect(function() focused = true refreshVisual() end)
            InputBox.FocusLost:Connect(function() focused = false refreshVisual() end)
            Clear.MouseEnter:Connect(function()
                TweenService:Create(Clear, tweenInfo, { BackgroundTransparency = 0, TextColor3 = Color3.fromRGB(235, 235, 240) }):Play()
            end)
            Clear.MouseLeave:Connect(function()
                TweenService:Create(Clear, tweenInfo, { BackgroundTransparency = 1, TextColor3 = Color3.fromRGB(130, 130, 142) }):Play()
            end)
            Clear.MouseButton1Click:Connect(function()
                InputBox.Text = ""
                InputBox:CaptureFocus()
            end)

            InputBox:GetPropertyChangedSignal("Text"):Connect(function()
                if #InputBox.Text > limit then
                    InputBox.Text = InputBox.Text:sub(1, limit)
                end
                if not Settings[gameId] then Settings[gameId] = {} end
                Settings[gameId][name] = InputBox.Text ~= "" and InputBox.Text or placeholderText
                SaveSettings()
                refreshVisual()
                if callback then
                    callback(InputBox.Text ~= "" and InputBox.Text or placeholderText)
                end
            end)

            if Library._RegSetter then
                Library._RegSetter(gameId, name, function(v)
                    InputBox.Text = tostring(v)
                end)
            end

            refreshVisual()
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

            local GuiService = game:GetService("GuiService")
            local function IsPointer(input)
                return input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch
            end
            local function PointerXY(input)
                if input.UserInputType == Enum.UserInputType.Touch then
                    local x, y = input.Position.X, input.Position.Y
                    local gui = ColorPicker:FindFirstAncestorOfClass("ScreenGui")
                    if gui and not gui.IgnoreGuiInset then
                        y = y - GuiService:GetGuiInset().Y
                    end
                    return x, y
                end
                return Mouse.X, Mouse.Y
            end
            local function LockScroll(lock)
                local sf = ColorPicker:FindFirstAncestorOfClass("ScrollingFrame")
                if sf then sf.ScrollingEnabled = not lock end
            end

            local function BindDrag(area, getConn, setConn, step)
                area.InputBegan:Connect(function(input)
                    if not IsPointer(input) then return end
                    if RainbowColorPicker then return end
                    local old = getConn()
                    if old then old:Disconnect() end
                    LockScroll(true)

                    local conn
                    conn = RunService.RenderStepped:Connect(function()
                        local px, py = PointerXY(input)
                        step(px, py)
                    end)
                    setConn(conn)

                    input.Changed:Connect(function()
                        if input.UserInputState == Enum.UserInputState.End then
                            conn:Disconnect()
                            if getConn() == conn then setConn(nil) end
                            LockScroll(false)
                        end
                    end)
                end)
            end

            BindDrag(Color, function() return ColorInput end, function(c) ColorInput = c end, function(px, py)
                local ColorX = math.clamp(px - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) / Color.AbsoluteSize.X
                local ColorY = math.clamp(py - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) / Color.AbsoluteSize.Y
                ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
                ColorS = ColorX
                ColorV = 1 - ColorY
                UpdateColorPicker(true)
            end)

            BindDrag(Hue, function() return HueInput end, function(c) HueInput = c end, function(px, py)
                local HueY = math.clamp(py - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) / Hue.AbsoluteSize.Y
                HueSelection.Position = UDim2.new(0.48, 0, HueY, 0)
                ColorH = 1 - HueY
                UpdateColorPicker(true)
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
function SectionElements:CreateDropdown(name, options, presetoption, callback, opts)
    options = options or {}
    local gameId = self.GameId
    local noNone = type(opts) == "table" and opts.NoNone
    local optIcons = (type(opts) == "table" and type(opts.Icons) == "table") and opts.Icons or {}
    if not noNone then table.insert(options, 1, "None") end
    if not Settings[gameId] then Settings[gameId] = {} end
    local SelectedOption = tostring(Settings[gameId][name] or options[presetoption] or options[1] or "None")

    local Shell = Library._MakeDropShell(SectionContent, name .. "Dropdown", name, 10, true)
    local lastToggleClock = 0
    if type(opts) == "table" and opts.Tooltip then
        Library.AttachTooltip(Shell.Frame, Shell.NameLabel, opts.Tooltip)
    end

    local function fire(v)
        if type(callback) == "function" then
            local ok, err = pcall(callback, v)
            if not ok then warn(err) end
        end
    end

    local function showValue()
        Shell.SetValue(SelectedOption, SelectedOption == "None", optIcons[SelectedOption])
    end

    local setOpen
    local function choose(label)
        SelectedOption = label
        showValue()
        if not Settings[gameId] then Settings[gameId] = {} end
        Settings[gameId][name] = SelectedOption
        SaveSettings()
        fire(SelectedOption)
        setOpen(false)
    end

    local function rebuild(filterText)
        filterText = string.lower(tostring(filterText or ""))
        Shell.Clear()
        local n = 0
        for i, v in ipairs(options) do
            local label = tostring(v)
            if filterText == "" or string.find(string.lower(label), filterText, 1, true) then
                n = n + 1
                Shell.MakeRow(label, label == SelectedOption, i, function() choose(label) end, optIcons[label] or optIcons[v])
            end
        end
        if n == 0 then
            Shell.MakeEmpty()
            n = 1
        end
        return n
    end

    setOpen = function(v)
        if v then
            if Shell.Search then Shell.Search.Text = "" end
            local n = rebuild("")
            Shell.SetOpen(true, Shell.Measure(n, #options > 6))
        else
            Shell.SetOpen(false, 0)
        end
    end

    Shell.Header.MouseButton1Click:Connect(function()
        if os.clock() - lastToggleClock < 0.25 then return end
        lastToggleClock = os.clock()
        setOpen(not Shell.Open)
    end)

    if Shell.Search then
        Shell.Search:GetPropertyChangedSignal("Text"):Connect(function()
            if Shell.Open then
                local n = rebuild(Shell.Search.Text)
                Shell.SetOpen(true, Shell.Measure(n, true))
            end
        end)
    end

    local function Refresh(newoptions, newpresetoption, newcallback)
        options = newoptions or options
        local presetValue = options[newpresetoption] or Settings[gameId][name] or options[1]
        SelectedOption = tostring(presetValue or "None")

        if SelectedOption ~= "None" and type(newcallback) == "function" then
            fire(SelectedOption)
        end

        showValue()
        Settings[gameId][name] = SelectedOption
        SaveSettings()
        setOpen(false)
    end

    local function SetSelected(v)
        v = tostring(v)
        if not table.find(options, v) then return end
        SelectedOption = v
        showValue()
        Settings[gameId][name] = SelectedOption
        SaveSettings()
        if SelectedOption ~= "None" then fire(SelectedOption) end
        setOpen(false)
    end
    if Library._RegSetter then Library._RegSetter(gameId, name, SetSelected) end

    showValue()
    if SelectedOption ~= "None" then fire(SelectedOption) end

    return {
        Refresh = Refresh,
        SetValue = SetSelected,
        GetValue = function() return SelectedOption end,
        Frame = Shell.Frame,
    }
end
function SectionElements:CreateMultiDropdown(name, options, minSelect, maxSelect, presetOptions, callback, opts)
    options = options or {}
    local optIcons = (type(opts) == "table" and type(opts.Icons) == "table") and opts.Icons or {}
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

    local Shell = Library._MakeDropShell(SectionContent, name .. "MultiDropdown", name, 5, false)
    local lastToggleClock = 0
    if type(opts) == "table" and opts.Tooltip then
        Library.AttachTooltip(Shell.Frame, Shell.NameLabel, opts.Tooltip)
    end

    local function UpdateTitle()
        Shell.SetValue(#SelectedOptions .. "/" .. maxSelect, false)
        if callback then
            local ok, err = pcall(callback, SelectedOptions)
            if not ok then warn(err) end
        end
    end

    local function PopulateDropdown()
        Shell.Clear()
        local n = 0
        for i, v in ipairs(options) do
            n = n + 1
            local btn
            btn = Shell.MakeRow(tostring(v), table.find(SelectedOptions, v) ~= nil, i, function()
                local index = table.find(SelectedOptions, v)
                if index then
                    if #SelectedOptions > minSelect then
                        table.remove(SelectedOptions, index)
                        Shell.SetRowSelected(btn, false)
                        Settings[gameId][name] = SelectedOptions
                        SaveSettings()
                        UpdateTitle()
                    end
                else
                    if #SelectedOptions < maxSelect then
                        table.insert(SelectedOptions, v)
                        Shell.SetRowSelected(btn, true)
                        Settings[gameId][name] = SelectedOptions
                        SaveSettings()
                        UpdateTitle()
                    end
                end
            end, optIcons[tostring(v)] or optIcons[v])
        end
        if n == 0 then
            Shell.MakeEmpty()
            n = 1
        end
        return n
    end

    Shell.Header.MouseButton1Click:Connect(function()
        if os.clock() - lastToggleClock < 0.25 then return end
        lastToggleClock = os.clock()
        if Shell.Open then
            Shell.SetOpen(false, 0)
        else
            local n = PopulateDropdown()
            Shell.SetOpen(true, Shell.Measure(n, false))
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

        if Shell.Open then
            local n = PopulateDropdown()
            Shell.SetOpen(true, Shell.Measure(n, false))
        end
    end

    if Library._RegSetter then
        Library._RegSetter(gameId, name, function(v)
            if type(v) ~= "table" then return end
            local list = {}
            for _, x in ipairs(v) do table.insert(list, x) end
            Refresh(nil, nil, nil, list)
        end)
    end

    UpdateTitle()
    return {
        Refresh = Refresh,
        GetSelected = function() return SelectedOptions end,
        Frame = Shell.Frame,
    }
end


        function SectionElements:CreateKeybind(name, presetbind, keyboardonly, holdmode, callback, tooltip)
            local NameKeybind = Instance.new("Frame")
            local Title = Instance.new("TextLabel")
            local KeybindButtonBorder = Instance.new("Frame")
            local KeybindButton = Instance.new("TextButton")

            local OldBind = "Unknown"
            if typeof(presetbind) == "EnumItem" then
                OldBind = presetbind.Name
            elseif type(presetbind) == "string" and presetbind ~= "" then
                OldBind = presetbind
            end
            local JustBinded = false
            local conns = {}

            local kbGameId = tostring(game.PlaceId)
            if not Settings[kbGameId] then Settings[kbGameId] = {} end
            local savedBind = Settings[kbGameId][name]
            if type(savedBind) == "string" and savedBind ~= "" then
                OldBind = savedBind
            end

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

            local Role = Library.Role
            local IDLE_STROKE = Role("SliderBg", Color3.fromRGB(62, 62, 70))

            NameKeybind.Name = (name .. "Keybind")
            NameKeybind.Parent = SectionContent
            NameKeybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            NameKeybind.BackgroundTransparency = 1.000
            NameKeybind.Size = UDim2.new(1, 0, 0, 38)

            Title.Name = "Title"
            Title.Parent = NameKeybind
            Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title.BackgroundTransparency = 1.000
            Title.Position = UDim2.new(0, 13, 0, 0)
            Title.Size = UDim2.new(1, -130, 1, 0)
            Title.ZIndex = 5
            Title.Font = Library.Theme.TextFont
            Title.Text = name
            Title.TextColor3 = Library.Theme.TextColor
            Title.TextSize = 15.000
            Title.TextXAlignment = Enum.TextXAlignment.Left
            Title.TextTruncate = Enum.TextTruncate.AtEnd
            table.insert(Library.LibraryColorTable, Title)
            if tooltip then Library.AttachTooltip(NameKeybind, Title, tooltip) end

            KeybindButtonBorder.Name = "KeybindButtonBorder"
            KeybindButtonBorder.Parent = NameKeybind
            KeybindButtonBorder.AnchorPoint = Vector2.new(1, 0.5)
            KeybindButtonBorder.BackgroundColor3 = Role("Drop", Color3.fromRGB(30, 30, 33))
            KeybindButtonBorder.BorderSizePixel = 0
            KeybindButtonBorder.Position = UDim2.new(1, -12, 0.5, 0)
            KeybindButtonBorder.Size = UDim2.new(0, 56, 0, 26)
            KeybindButtonBorder.ZIndex = 5
            local kbCorner = Instance.new("UICorner")
            kbCorner.CornerRadius = UDim.new(0, 7)
            kbCorner.Parent = KeybindButtonBorder
            local kbStroke = Instance.new("UIStroke")
            kbStroke.Color = IDLE_STROKE
            kbStroke.Thickness = 1
            kbStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            kbStroke.Parent = KeybindButtonBorder

            KeybindButton.Name = "KeybindButton"
            KeybindButton.Parent = KeybindButtonBorder
            KeybindButton.BackgroundTransparency = 1.000
            KeybindButton.Size = UDim2.new(1, 0, 1, 0)
            KeybindButton.ZIndex = 6
            KeybindButton.AutoButtonColor = false
            KeybindButton.Font = Library.Theme.TextFont
            KeybindButton.Text = "None"
            KeybindButton.TextColor3 = Color3.fromRGB(235, 235, 240)
            KeybindButton.TextSize = 14.000
            KeybindButton.TextWrapped = false

            local listening = false
            local function resize()
                local w = 56
                pcall(function()
                    local tw = game:GetService("TextService"):GetTextSize(KeybindButton.Text, 14, Library.Theme.TextFont, Vector2.new(400, 30)).X
                    w = math.clamp(tw + 24, 46, 120)
                end)
                TweenService:Create(KeybindButtonBorder, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.new(0, w, 0, 26) }):Play()
            end
            local function setListening(on)
                listening = on
                TweenService:Create(kbStroke, TweenInfo.new(0.15), { Color = on and Library.Theme.MainColor or IDLE_STROKE }):Play()
                TweenService:Create(KeybindButton, TweenInfo.new(0.15), { TextColor3 = on and Library.Theme.MainColor or Color3.fromRGB(235, 235, 240) }):Play()
            end
            local function setText(t)
                KeybindButton.Text = t
                resize()
            end

            KeybindButton.MouseEnter:Connect(function()
                if not listening then
                    TweenService:Create(KeybindButtonBorder, TweenInfo.new(0.12), { BackgroundColor3 = Role("SliderVal", Color3.fromRGB(42, 42, 47)) }):Play()
                end
            end)
            KeybindButton.MouseLeave:Connect(function()
                TweenService:Create(KeybindButtonBorder, TweenInfo.new(0.12), { BackgroundColor3 = Role("Drop", Color3.fromRGB(30, 30, 33)) }):Play()
            end)

            local function applyBind(bindName)
                OldBind = bindName
                if bindName == "Unknown" then
                    setText("None")
                else
                    setText(ShortenedNames[bindName] or bindName)
                end
            end

            local function saveBind()
                Settings[kbGameId][name] = OldBind
                SaveSettings()
            end

            applyBind(OldBind)

            local function fire(v)
                if type(callback) ~= "function" then return end
                local ok, err = pcall(callback, v)
                if not ok then warn(err) end
            end

            KeybindButton.MouseButton1Click:Connect(function()
                if Library.CurrentlyBinding then return end

                setText("...")
                setListening(true)

                local Input, Bruh = UserInputService.InputBegan:wait()
                Library.CurrentlyBinding = true

                if Input.KeyCode.Name == "Backspace" or Input.KeyCode.Name == "Delete" then
                    setText("None")
                    setListening(false)
                    OldBind = Enum.KeyCode.Unknown.Name
                    Library.CurrentlyBinding = false
                    JustBinded = false
                    saveBind()
                    return
                end

                if (Input.UserInputType ~= Enum.UserInputType.Keyboard and (AllowedMouseTypes[Input.UserInputType.Name]) and (not keyboardonly)) or (Input.KeyCode and (not NotAllowedKeys[Input.KeyCode.Name])) then
                    local BindName = ((Input.UserInputType ~= Enum.UserInputType.Keyboard and Input.UserInputType.Name) or Input.KeyCode.Name)
                    setText(ShortenedNames[BindName] or BindName)
                    setListening(false)
                    OldBind = BindName
                    Library.CurrentlyBinding = false
                    JustBinded = true
                    saveBind()
                else
                    applyBind(OldBind)
                    setListening(false)
                    Library.CurrentlyBinding = false
                end
            end)

            local function currentName(input)
                return ((input.UserInputType ~= Enum.UserInputType.Keyboard and input.UserInputType.Name) or input.KeyCode.Name)
            end

            if not holdmode then
                table.insert(conns, UserInputService.InputBegan:Connect(function(input, gameprocessedevent)
                    if not gameprocessedevent then
                        if UserInputService:GetFocusedTextBox() then return end
                        if OldBind == Enum.KeyCode.Unknown.Name then return end
                        if JustBinded then JustBinded = false return end
                        if currentName(input) == OldBind then
                            fire()
                        end
                    end
                end))
            else
                table.insert(conns, UserInputService.InputBegan:Connect(function(input, gameprocessedevent)
                    if not gameprocessedevent then
                        if UserInputService:GetFocusedTextBox() then return end
                        if OldBind == Enum.KeyCode.Unknown.Name then return end
                        if JustBinded then JustBinded = false return end
                        if currentName(input) == OldBind then
                            fire(true)
                        end
                    end
                end))

                table.insert(conns, UserInputService.InputEnded:Connect(function(input, gameprocessedevent)
                    if not gameprocessedevent then
                        if UserInputService:GetFocusedTextBox() then return end
                        if OldBind == Enum.KeyCode.Unknown.Name then return end
                        if JustBinded then JustBinded = false return end
                        if currentName(input) == OldBind then
                            fire(false)
                        end
                    end
                end))
            end

            NameKeybind.Destroying:Connect(function()
                for _, c in ipairs(conns) do pcall(function() c:Disconnect() end) end
            end)

            if Library._RegSetter then
                Library._RegSetter(kbGameId, name, function(v)
                    if type(v) == "string" and v ~= "" then
                        applyBind(v)
                        JustBinded = false
                    end
                end)
            end

            return {
                SetKey = function(k)
                    local n = (typeof(k) == "EnumItem" and k.Name) or tostring(k)
                    applyBind(n)
                    JustBinded = false
                    saveBind()
                end,
                GetKey = function() return OldBind end,
                Frame = NameKeybind,
            }
        end

        SectionElements.Content = SectionContent
        SectionElements.Frame = NameSection
        return SectionElements
    end

    return TabElements
end

do
    local function C(r, g, b) return Color3.fromRGB(r, g, b) end
    local function ch(x) return math.clamp(math.floor(x + 0.5), 0, 255) end
    local function colorKey(c) return ch(c.R * 255) * 65536 + ch(c.G * 255) * 256 + ch(c.B * 255) end
    local function shift(c, d) return C(ch(c.R * 255 + d), ch(c.G * 255 + d), ch(c.B * 255 + d)) end

    local DefaultRoles = {
        Accent = Library.Theme.MainColor, Background = Library.Theme.BackgroundColor,
        Card = C(46, 46, 52), Panel = C(20, 20, 24), TabSel = C(58, 58, 66),
        SliderBg = C(62, 62, 70), SliderVal = C(42, 42, 47), Drop = C(30, 30, 33),
        Border = C(80, 80, 90), Line = C(120, 120, 130), Notif = C(28, 28, 32), Pick = C(45, 45, 45),
        Text = Library.Theme.TextColor, Dim = C(185, 185, 185), Label = C(190, 190, 198),
    }
    local BG_ROLES = { "Accent", "Background", "Card", "Panel", "TabSel", "SliderBg", "SliderVal", "Drop", "Border", "Line", "Notif", "Pick" }
    local TEXT_ROLES = { "Text", "Dim", "Label", "Accent" }

    local function Derive(accent, bg, text)
        local light = (0.299 * bg.R + 0.587 * bg.G + 0.114 * bg.B) > 0.5
        local sg = light and -1 or 1
        return {
            Accent = accent, Background = bg, Text = text,
            Card = shift(bg, sg * 11), Panel = shift(bg, -sg * 15), TabSel = shift(bg, sg * 23),
            SliderBg = shift(bg, sg * 27), SliderVal = shift(bg, sg * 7), Drop = shift(bg, -sg * 5),
            Border = shift(bg, sg * 45), Line = shift(bg, sg * 85), Notif = shift(bg, -sg * 7), Pick = shift(bg, sg * 10),
            Dim = text:Lerp(bg, 0.28), Label = text:Lerp(bg, 0.25),
        }
    end

    Library.ThemePresets = {
        Default  = { Default = true },
        Dark     = { Accent = C(125, 125, 140), Background = C(22, 22, 26),   Text = C(255, 255, 255) },
        Light    = { Accent = C(70, 110, 220),  Background = C(236, 238, 244), Text = C(28, 30, 38) },
        Ocean    = { Accent = C(0, 150, 205),   Background = C(12, 30, 46),   Text = C(228, 242, 252) },
        Midnight = { Accent = C(115, 95, 235),  Background = C(12, 12, 26),   Text = C(245, 245, 255) },
        Rose     = { Accent = C(225, 85, 125),  Background = C(34, 20, 26),   Text = C(255, 240, 244) },
        Forest   = { Accent = C(65, 175, 105),  Background = C(16, 30, 22),   Text = C(235, 250, 240) },
        Amber    = { Accent = C(235, 165, 45),  Background = C(32, 26, 16),   Text = C(255, 248, 232) },
        Purple   = { Accent = C(160, 90, 230),  Background = C(26, 16, 36),   Text = C(250, 240, 255) },
        Crimson  = { Accent = C(220, 50, 60),   Background = C(30, 14, 16),   Text = C(255, 238, 238) },
        Sunset   = { Accent = C(250, 110, 70),  Background = C(34, 20, 22),   Text = C(255, 242, 236) },
        Mint     = { Accent = C(70, 210, 170),  Background = C(14, 30, 28),   Text = C(232, 255, 250) },
        Sky      = { Accent = C(90, 170, 250),  Background = C(16, 26, 40),   Text = C(235, 245, 255) },
        Lavender = { Accent = C(170, 150, 240), Background = C(28, 24, 40),   Text = C(246, 242, 255) },
        Cherry   = { Accent = C(235, 70, 110),  Background = C(32, 14, 22),   Text = C(255, 238, 244) },
        Gold     = { Accent = C(215, 175, 60),  Background = C(26, 24, 16),   Text = C(255, 250, 232) },
        Coffee   = { Accent = C(190, 135, 90),  Background = C(32, 24, 20),   Text = C(250, 240, 232) },
        Slate    = { Accent = C(110, 150, 190), Background = C(24, 28, 34),   Text = C(236, 242, 248) },
        Neon     = { Accent = C(40, 255, 150),  Background = C(10, 14, 12),   Text = C(230, 255, 240) },
        Cyber    = { Accent = C(250, 230, 50),  Background = C(16, 14, 28),   Text = C(250, 248, 235) },
        Ice      = { Accent = C(120, 205, 245), Background = C(226, 238, 246), Text = C(24, 36, 48) },
        Sand     = { Accent = C(200, 140, 70),  Background = C(240, 232, 218), Text = C(46, 38, 28) },
        Blossom  = { Accent = C(235, 100, 150), Background = C(248, 232, 238), Text = C(58, 30, 42) },
        Graphite = { Accent = C(160, 160, 170), Background = C(34, 34, 38),   Text = C(240, 240, 244) },
    }

    local function PresetNames()
        local names = {}
        for n in pairs(Library.ThemePresets) do if n ~= "Default" then table.insert(names, n) end end
        table.sort(names)
        table.insert(names, 1, "Default")
        return names
    end

    local currentRoles = {}
    for k, v in pairs(DefaultRoles) do currentRoles[k] = v end
    Library.GetRole = function(r) return currentRoles[r] or DefaultRoles[r] end

    local function BuildLookups()
        local lb, lt = {}, {}
        for _, r in ipairs(BG_ROLES) do lb[colorKey(DefaultRoles[r])] = r end
        for _, r in ipairs(BG_ROLES) do lb[colorKey(currentRoles[r])] = r end
        for _, r in ipairs(TEXT_ROLES) do lt[colorKey(DefaultRoles[r])] = r end
        for _, r in ipairs(TEXT_ROLES) do lt[colorKey(currentRoles[r])] = r end
        return lb, lt
    end

    local function Recolor(inst, prop, lookup, target)
        local ok, v = pcall(function() return inst[prop] end)
        if ok and typeof(v) == "Color3" then
            local role = lookup[colorKey(v)]
            if role and target[role] then inst[prop] = target[role] end
        end
    end

    local ApplyGradient
    local function ApplyRoles(target, transparency)
        pcall(function() getgenv().StopRGB = true end)
        local lookupBG, lookupText = BuildLookups()
        for _, inst in ipairs(UILibrary:GetDescendants()) do
            if inst:IsA("GuiObject") then Recolor(inst, "BackgroundColor3", lookupBG, target) end
            if inst:IsA("ImageLabel") or inst:IsA("ImageButton") then
                if inst.Name == "Icon" then
                    inst.ImageColor3 = target.Text
                else
                    Recolor(inst, "ImageColor3", lookupBG, target)
                end
            end
            if inst:IsA("TextLabel") or inst:IsA("TextButton") or inst:IsA("TextBox") then
                Recolor(inst, "TextColor3", lookupText, target)
            end
            if inst:IsA("ScrollingFrame") then Recolor(inst, "ScrollBarImageColor3", lookupBG, target) end
            if inst:IsA("UIStroke") then Recolor(inst, "Color", lookupBG, target) end
        end
        for k, v in pairs(target) do currentRoles[k] = v end
        Library.Theme.MainColor = target.Accent
        Library.Theme.BackgroundColor = target.Background
        Library.Theme.TextColor = target.Text
        if transparency then
            Main.BackgroundTransparency = transparency
            mainImageTransparency = transparency
        end
        if ApplyGradient then ApplyGradient() end
    end

    local state = { Preset = "Default", Custom = nil, Transparency = nil, Gradient = nil }
    local initialTransparency = Main.BackgroundTransparency

    local function BuildRoles()
        if state.Custom then
            return Derive(state.Custom.Accent, state.Custom.Background, state.Custom.Text)
        end
        local pr = Library.ThemePresets[state.Preset]
        if not pr or pr.Default then return DefaultRoles end
        return Derive(pr.Accent, pr.Background, pr.Text)
    end

    local pending = false
    local function RequestApply()
        if pending then return end
        pending = true
        task.delay(0.08, function()
            pending = false
            ApplyRoles(BuildRoles(), state.Transparency)
        end)
    end

    local saveQueued = false
    local function pack(c) return { ch(c.R * 255), ch(c.G * 255), ch(c.B * 255) } end
    local function SaveTheme()
        if saveQueued then return end
        saveQueued = true
        task.delay(0.6, function()
            saveQueued = false
            if state.Custom then
                Settings.__Theme = {
                    Accent = pack(state.Custom.Accent), Background = pack(state.Custom.Background), Text = pack(state.Custom.Text),
                }
            else
                Settings.__Theme = nil
            end
            local g = state.Gradient
            if g and g.On then
                Settings.__Gradient = {
                    Mode = g.Mode, Name = g.Name, Angle = g.Angle,
                    C1 = g.C1 and pack(g.C1) or nil, C2 = g.C2 and pack(g.C2) or nil,
                }
            else
                Settings.__Gradient = nil
            end
            SaveSettings()
        end)
    end

    Library.GradientPresets = {
        Sunset       = { C(150, 60, 60),  C(60, 30, 90),   45 },
        ["Ocean Deep"] = { C(10, 70, 110),  C(10, 20, 50),   90 },
        Aurora       = { C(20, 110, 100), C(60, 40, 120),  60 },
        ["Neon Night"] = { C(90, 20, 130),  C(10, 10, 40),   90 },
        Ember        = { C(140, 50, 20),  C(40, 15, 15),   90 },
        Candy        = { C(170, 70, 130), C(70, 60, 150),  45 },
        ["Forest Mist"] = { C(30, 100, 70),  C(12, 35, 35),   90 },
        Royal        = { C(50, 50, 140),  C(15, 15, 45),  120 },
        Steel        = { C(80, 90, 110),  C(25, 28, 36),   90 },
        Peach        = { C(190, 110, 90), C(90, 50, 80),   45 },
        Lagoon       = { C(20, 130, 150), C(20, 50, 100),  60 },
        Midnight     = { C(40, 40, 90),   C(8, 8, 20),     90 },
        Rose         = { C(170, 60, 100), C(50, 20, 50),   60 },
        Graphite     = { C(70, 70, 78),   C(18, 18, 22),   90 },
    }

    local glassSeq = ColorSequence.new(C(255, 255, 255), C(200, 200, 212))
    local CoverGradient = Instance.new("UIGradient")
    CoverGradient.Name = "ThemeGradient"
    CoverGradient.Enabled = false
    CoverGradient.Parent = AnimCover

    local function SetGradientColors(c1, c2, angle)
        local seq = ColorSequence.new(c1, c2)
        local gg = Library.GlassGradient
        if gg then gg.Color = seq; gg.Rotation = angle end
        CoverGradient.Color = seq
        CoverGradient.Rotation = angle
    end

    local rgbRunning = false
    local function StartRGB()
        if rgbRunning then return end
        rgbRunning = true
        task.spawn(function()
            local h = 0
            while rgbRunning and state.Gradient and state.Gradient.On and state.Gradient.Mode == "rgb" do
                h = (h + 0.004) % 1
                SetGradientColors(Color3.fromHSV(h, 0.75, 0.5), Color3.fromHSV((h + 0.25) % 1, 0.75, 0.4), state.Gradient.Angle or 90)
                task.wait(0.06)
            end
            rgbRunning = false
        end)
    end

    ApplyGradient = function()
        local g = state.Gradient
        if g and g.On then
            Main.BackgroundColor3 = C(255, 255, 255)
            AnimCover.BackgroundColor3 = C(255, 255, 255)
            CoverGradient.Enabled = true
            if g.Mode == "rgb" then
                StartRGB()
            else
                SetGradientColors(g.C1, g.C2, g.Angle or 90)
            end
        else
            rgbRunning = false
            CoverGradient.Enabled = false
            local gg = Library.GlassGradient
            if gg then gg.Color = glassSeq; gg.Rotation = 90 end
            Main.BackgroundColor3 = currentRoles.Background
            AnimCover.BackgroundColor3 = currentRoles.Background
        end
    end

    function Library:SetGradient(arg)
        if arg == nil or arg == false or arg == "Off" or arg == "None" then
            state.Gradient = nil
        elseif type(arg) == "table" then
            state.Gradient = {
                On = true, Mode = "custom",
                C1 = arg.Color1 or arg[1] or C(60, 40, 100),
                C2 = arg.Color2 or arg[2] or C(20, 20, 40),
                Angle = arg.Angle or arg[3] or 90,
            }
        elseif arg == "RGB" then
            state.Gradient = { On = true, Mode = "rgb", Angle = (state.Gradient and state.Gradient.Angle) or 90 }
        elseif Library.GradientPresets[arg] then
            local gp = Library.GradientPresets[arg]
            state.Gradient = { On = true, Mode = "preset", Name = arg, C1 = gp[1], C2 = gp[2], Angle = gp[3] or 90 }
        else
            warn("[Rndm] Gradient '" .. tostring(arg) .. "' not found")
            return
        end
        ApplyGradient()
        SaveTheme()
    end

    function Library:SetTheme(nameOrColors)
        if type(nameOrColors) == "table" then
            state.Custom = {
                Accent = nameOrColors.Accent or currentRoles.Accent,
                Background = nameOrColors.Background or currentRoles.Background,
                Text = nameOrColors.Text or currentRoles.Text,
            }
        elseif Library.ThemePresets[nameOrColors] then
            state.Preset = nameOrColors
            state.Custom = nil
        else
            warn("[Rndm] Theme '" .. tostring(nameOrColors) .. "' not found")
            return
        end
        ApplyRoles(BuildRoles(), state.Transparency)
        SaveTheme()
    end

    function Library:CreateThemeTab(tabName, icon)
        tabName = tabName or "Theme"

        local saved = Settings.__Theme
        if type(saved) == "table" and type(saved.Accent) == "table" and type(saved.Background) == "table" and type(saved.Text) == "table" then
            local function unpack3(t) return C(t[1] or 0, t[2] or 0, t[3] or 0) end
            state.Custom = { Accent = unpack3(saved.Accent), Background = unpack3(saved.Background), Text = unpack3(saved.Text) }
        end
        local usingCustom = state.Custom ~= nil
        local initializing = true

        local savedGrad = Settings.__Gradient
        if type(savedGrad) == "table" and not state.Gradient then
            local function un3(t) return t and C(t[1] or 0, t[2] or 0, t[3] or 0) or nil end
            if savedGrad.Mode == "rgb" then
                state.Gradient = { On = true, Mode = "rgb", Angle = savedGrad.Angle or 90 }
            elseif un3(savedGrad.C1) and un3(savedGrad.C2) then
                state.Gradient = { On = true, Mode = savedGrad.Mode or "custom", Name = savedGrad.Name, C1 = un3(savedGrad.C1), C2 = un3(savedGrad.C2), Angle = savedGrad.Angle or 90 }
            end
        end

        local Tab = Library:CreateTab(tabName, icon or "palette")
        local tabBtn = TabScrollingFrame:FindFirstChild(tabName .. "TabButton")
        if tabBtn then tabBtn.LayoutOrder = 1000 end

        local PresetSection = Tab:CreateSection("Preset")
        local names = PresetNames()
        local presetIndex = 2
        for i, n in ipairs(names) do
            if n == state.Preset then presetIndex = i + 1 end
        end
        PresetSection:CreateDropdown("Theme Preset", names, presetIndex, function(opt)
            if opt == "None" or not Library.ThemePresets[opt] then return end
            if initializing and usingCustom then return end
            usingCustom = false
            state.Preset = opt
            state.Custom = nil
            RequestApply()
            if not initializing then SaveTheme() end
        end)
        PresetSection:CreateParagraph("Theme", "Pick a preset, or set your own colors in the <b>Colors</b> section. Your choice is saved automatically.")

        local ColorSection = Tab:CreateSection("Colors")
        local base = BuildRoles()
        local function setCustom(key, color)
            if initializing then return end
            usingCustom = true
            local cur = state.Custom or { Accent = currentRoles.Accent, Background = currentRoles.Background, Text = currentRoles.Text }
            cur[key] = color
            state.Custom = cur
            RequestApply()
            SaveTheme()
        end
        ColorSection:CreateColorPicker("Accent", base.Accent, function(c) setCustom("Accent", c) end)
        ColorSection:CreateColorPicker("Background", base.Background, function(c) setCustom("Background", c) end)
        ColorSection:CreateColorPicker("Text", base.Text, function(c) setCustom("Text", c) end)
        ColorSection:CreateDivider("Appearance")
        ColorSection:CreateSlider("Window Transparency", 0, 90, math.floor(initialTransparency * 100 + 0.5), false, function(v)
            state.Transparency = v / 100
            if not initializing then RequestApply() end
        end)

        local GradSection = Tab:CreateSection("Gradient", true, true)
        local gradNames = { "Off" }
        do
            local list = {}
            for n in pairs(Library.GradientPresets) do table.insert(list, n) end
            table.sort(list)
            for _, n in ipairs(list) do table.insert(gradNames, n) end
            table.insert(gradNames, "RGB")
        end
        local gradIndex = 2
        do
            local cur = state.Gradient and state.Gradient.On and (state.Gradient.Mode == "rgb" and "RGB" or state.Gradient.Name) or "Off"
            for i, n in ipairs(gradNames) do
                if n == cur then gradIndex = i + 1 end
            end
        end
        local angleValue = (state.Gradient and state.Gradient.Angle) or 90
        local angleSlider
        GradSection:CreateDropdown("Gradient Preset", gradNames, gradIndex, function(opt)
            if initializing or opt == "None" then return end
            Library:SetGradient(opt)
            local g = state.Gradient
            if g and g.Angle and angleSlider then
                angleValue = g.Angle
                angleSlider.SetValue(g.Angle)
            end
        end)
        GradSection:CreateParagraph("Gradient", "Pick a preset, <b>RGB</b> for a color-cycling background, or set two colors and an angle yourself below.")
        local function setGrad(key, value)
            if initializing then return end
            local g = state.Gradient
            local base1 = (g and g.C1) or C(60, 40, 100)
            local base2 = (g and g.C2) or C(20, 20, 40)
            state.Gradient = { On = true, Mode = "custom", C1 = base1, C2 = base2, Angle = angleValue }
            state.Gradient[key] = value
            ApplyGradient()
            SaveTheme()
        end
        GradSection:CreateColorPicker("Gradient Color 1", (state.Gradient and state.Gradient.C1) or C(60, 40, 100), function(c) setGrad("C1", c) end)
        GradSection:CreateColorPicker("Gradient Color 2", (state.Gradient and state.Gradient.C2) or C(20, 20, 40), function(c) setGrad("C2", c) end)
        angleSlider = GradSection:CreateSlider("Gradient Angle", 0, 360, angleValue, false, function(v)
            angleValue = v
            if initializing then return end
            local g = state.Gradient
            if g and g.On then
                g.Angle = v
                ApplyGradient()
                SaveTheme()
            end
        end)

        local ResetSection = Tab:CreateSection("Reset")
        ResetSection:CreateButton("Reset Theme", function()
            usingCustom = false
            state.Preset = "Default"
            state.Custom = nil
            state.Gradient = nil
            state.Transparency = initialTransparency
            ApplyRoles(DefaultRoles, initialTransparency)
            SaveTheme()
        end)

        initializing = false
        ApplyRoles(BuildRoles(), state.Transparency)
        return Tab
    end
end

do
    local UserInputService = game:GetService("UserInputService")

    local SearchBar = Instance.new("Frame")
    SearchBar.Name = "SearchBar"
    SearchBar.Parent = TabButtons
    SearchBar.BackgroundColor3 = Color3.fromRGB(46, 46, 52)
    SearchBar.BackgroundTransparency = 0.3
    SearchBar.BorderSizePixel = 0
    SearchBar.Position = UDim2.new(0, 6, 0, 6)
    SearchBar.Size = UDim2.new(1, -12, 0, 26)
    SearchBar.ZIndex = 4
    Instance.new("UICorner", SearchBar).CornerRadius = UDim.new(0, 6)

    local searchIconId = ResolveIcon("search")
    if searchIconId then
        local SIcon = Instance.new("ImageLabel")
        SIcon.Name = "Icon"
        SIcon.Parent = SearchBar
        SIcon.BackgroundTransparency = 1
        SIcon.AnchorPoint = Vector2.new(0, 0.5)
        SIcon.Position = UDim2.new(0, 7, 0.5, 0)
        SIcon.Size = UDim2.new(0, 14, 0, 14)
        SIcon.ZIndex = 5
        SIcon.Image = searchIconId
        SIcon.ImageColor3 = Library.Theme.TextColor
        SIcon.ImageTransparency = 0.35
    end

    local SearchBox = Instance.new("TextBox")
    SearchBox.Name = "SearchBox"
    SearchBox.Parent = SearchBar
    SearchBox.BackgroundTransparency = 1
    SearchBox.Position = UDim2.new(0, 26, 0, 0)
    SearchBox.Size = UDim2.new(1, -30, 1, 0)
    SearchBox.ZIndex = 5
    SearchBox.Font = Library.Theme.TextFont
    SearchBox.PlaceholderText = "Search..."
    SearchBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 158)
    SearchBox.Text = ""
    SearchBox.TextColor3 = Library.Theme.TextColor
    SearchBox.TextSize = 13
    SearchBox.TextXAlignment = Enum.TextXAlignment.Left
    SearchBox.ClearTextOnFocus = false
    SearchBox.TextTruncate = Enum.TextTruncate.AtEnd

    TabScrollingFrame.Position = UDim2.new(0, 0, 0, 38)
    TabScrollingFrame.Size = UDim2.new(1, 0, 1, -38)
    TabListPadding.PaddingTop = UDim.new(0, 4)

    local Results = Instance.new("Frame")
    Results.Name = "SearchResults"
    Results.Parent = UITabs
    Results.BackgroundColor3 = Library.Theme.BackgroundColor
    Results.BackgroundTransparency = 0
    Results.BorderSizePixel = 0
    Results.Position = Tabs.Position
    Results.Size = Tabs.Size
    Results.Visible = false
    Results.ZIndex = 50
    Results.Active = true
    Instance.new("UICorner", Results).CornerRadius = UDim.new(0, 8)

    local ResultsTitle = Instance.new("TextLabel")
    ResultsTitle.Name = "ResultsTitle"
    ResultsTitle.Parent = Results
    ResultsTitle.BackgroundTransparency = 1
    ResultsTitle.Position = UDim2.new(0, 11, 0, 0)
    ResultsTitle.Size = UDim2.new(1, -11, 0, 30)
    ResultsTitle.ZIndex = 51
    ResultsTitle.Font = Library.Theme.TextFont
    ResultsTitle.Text = "Search"
    ResultsTitle.TextColor3 = Library.Theme.TextColor
    ResultsTitle.TextSize = 22
    ResultsTitle.TextXAlignment = Enum.TextXAlignment.Left
    table.insert(Library.LibraryColorTable, ResultsTitle)

    local List = Instance.new("ScrollingFrame")
    List.Name = "ResultsList"
    List.Parent = Results
    List.BackgroundTransparency = 1
    List.BorderSizePixel = 0
    List.Position = UDim2.new(0, 0, 0, 34)
    List.Size = UDim2.new(1, 0, 1, -34)
    List.ScrollBarThickness = 4
    List.ScrollBarImageColor3 = Color3.fromRGB(110, 110, 110)
    List.CanvasSize = UDim2.new(0, 0, 0, 0)
    List.AutomaticCanvasSize = Enum.AutomaticSize.Y
    List.ScrollingDirection = Enum.ScrollingDirection.Y
    List.ZIndex = 51
    local ListLayout = Instance.new("UIListLayout")
    ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ListLayout.Padding = UDim.new(0, 4)
    ListLayout.Parent = List
    local ListPad = Instance.new("UIPadding")
    ListPad.PaddingLeft = UDim.new(0, 4)
    ListPad.PaddingRight = UDim.new(0, 8)
    ListPad.PaddingBottom = UDim.new(0, 4)
    ListPad.Parent = List

    local EmptyLabel = Instance.new("TextLabel")
    EmptyLabel.Name = "EmptyLabel"
    EmptyLabel.Parent = Results
    EmptyLabel.BackgroundTransparency = 1
    EmptyLabel.Position = UDim2.new(0, 0, 0, 44)
    EmptyLabel.Size = UDim2.new(1, 0, 0, 30)
    EmptyLabel.ZIndex = 51
    EmptyLabel.Font = Library.Theme.TextFont
    EmptyLabel.Text = "No results"
    EmptyLabel.TextColor3 = Color3.fromRGB(190, 190, 198)
    EmptyLabel.TextSize = 14
    EmptyLabel.Visible = false

    local SUFFIXES = { "NumberInput", "Embed", "MultiDropdown", "ColorPicker", "ProgressBar", "Dropdown", "TextBox", "Keybind", "Toggle", "Slider", "Button", "Label", "Paragraph" }
    local function ElementInfo(child)
        local n = child.Name
        if n:match("Divider$") or n:match("_ImageHolder$") then return nil end
        for _, suf in ipairs(SUFFIXES) do
            if #n > #suf and n:sub(-#suf) == suf then
                return n:sub(1, #n - #suf), suf
            end
        end
        return nil
    end

    Library._ElementInfo = ElementInfo

    local function Highlight(target)
        if not target or not target.Parent then return end
        local stroke = Instance.new("UIStroke")
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Color = Library.Theme.MainColor
        stroke.Thickness = 2
        stroke.Transparency = 0
        stroke.Parent = target
        local info = TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 2, true)
        TweenService:Create(stroke, info, { Transparency = 0.75 }):Play()
        task.delay(1.6, function()
            TweenService:Create(stroke, TweenInfo.new(0.3), { Transparency = 1 }):Play()
            task.wait(0.35)
            stroke:Destroy()
        end)
    end

    local function GoTo(tabFrame, section, target)
        Library._CloseSearch()
        local selector = Library.TabSelectors and Library.TabSelectors[tabFrame]
        if selector then selector() end
        local toggler = Library.SectionToggles and Library.SectionToggles[section]
        if toggler then toggler(false) end
        task.delay(0.4, function()
            local sf = tabFrame:FindFirstChild("SectionScrollingFrame")
            if sf and target and target.Parent then
                local y = target.AbsolutePosition.Y - sf.AbsolutePosition.Y + sf.CanvasPosition.Y - 8
                TweenService:Create(sf, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    CanvasPosition = Vector2.new(0, math.max(0, y))
                }):Play()
            end
            Highlight(target)
        end)
    end

    local function Collect(query)
        local words = {}
        for w in query:lower():gmatch("%S+") do table.insert(words, w) end
        local found = {}
        if #words == 0 then return found end
        local function matches(...)
            local hay = table.concat({ ... }, " "):lower()
            for _, w in ipairs(words) do
                if not hay:find(w, 1, true) then return false end
            end
            return true
        end
        for _, tabFrame in ipairs(Tabs:GetChildren()) do
            if tabFrame:IsA("Frame") and tabFrame.Name:match("Tab$") then
                local tabName = tabFrame.Name:sub(1, #tabFrame.Name - 3)
                local sf = tabFrame:FindFirstChild("SectionScrollingFrame")
                if sf then
                    for _, sec in ipairs(sf:GetChildren()) do
                        if sec:IsA("Frame") and sec.Name:match("Section$") then
                            local secName = sec.Name:sub(1, #sec.Name - 7)
                            local content = sec:FindFirstChild("SectionContent")
                            if matches(secName) and #found < 60 then
                                table.insert(found, { name = secName, kind = "Section", path = tabName, tab = tabFrame, section = sec, target = sec })
                            end
                            if content then
                                for _, child in ipairs(content:GetChildren()) do
                                    local display, kind = ElementInfo(child)
                                    if display and matches(display, kind, secName, tabName) and #found < 60 then
                                        table.insert(found, { name = display, kind = kind, path = tabName .. "  >  " .. secName, tab = tabFrame, section = sec, target = child })
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        return found
    end

    local function ClearList()
        for _, c in ipairs(List:GetChildren()) do
            if c:IsA("GuiObject") then c:Destroy() end
        end
    end

    local MAX_HISTORY = 8
    local function getHistory()
        if type(Settings.__SearchHistory) ~= "table" then Settings.__SearchHistory = {} end
        return Settings.__SearchHistory
    end
    local function addHistory(q)
        q = tostring(q or ""):gsub("^%s+", ""):gsub("%s+$", "")
        if #q < 2 then return end
        local h = getHistory()
        for i = #h, 1, -1 do
            if tostring(h[i]):lower() == q:lower() then table.remove(h, i) end
        end
        table.insert(h, 1, q)
        while #h > MAX_HISTORY do table.remove(h) end
        pcall(SaveSettings)
    end
    local showingHistory = false

    local ClearHist = Instance.new("TextButton")
    ClearHist.Name = "ClearHistory"
    ClearHist.Parent = Results
    ClearHist.BackgroundTransparency = 1
    ClearHist.AnchorPoint = Vector2.new(1, 0)
    ClearHist.Position = UDim2.new(1, -10, 0, 6)
    ClearHist.Size = UDim2.new(0, 60, 0, 22)
    ClearHist.ZIndex = 52
    ClearHist.Font = Enum.Font.SourceSans
    ClearHist.Text = "Clear"
    ClearHist.TextColor3 = Color3.fromRGB(190, 190, 198)
    ClearHist.TextSize = 14
    ClearHist.Visible = false

    local function RenderHistory()
        ClearList()
        local h = getHistory()
        showingHistory = true
        ResultsTitle.Text = "Recent searches"
        ClearHist.Visible = #h > 0
        EmptyLabel.Text = "No recent searches"
        EmptyLabel.Visible = #h == 0
        for i, q in ipairs(h) do
            local Item = Instance.new("TextButton")
            Item.Name = "Result"
            Item.LayoutOrder = i
            Item.Parent = List
            Item.AutoButtonColor = false
            Item.Text = ""
            Item.BackgroundColor3 = Color3.fromRGB(46, 46, 52)
            Item.BackgroundTransparency = 0.35
            Item.BorderSizePixel = 0
            Item.Size = UDim2.new(1, 0, 0, 30)
            Item.ZIndex = 52
            Instance.new("UICorner", Item).CornerRadius = UDim.new(0, 6)
            local L = Instance.new("TextLabel")
            L.BackgroundTransparency = 1
            L.Position = UDim2.new(0, 12, 0, 0)
            L.Size = UDim2.new(1, -24, 1, 0)
            L.ZIndex = 53
            L.Font = Library.Theme.TextFont
            L.Text = tostring(q)
            L.TextColor3 = Library.Theme.TextColor
            L.TextSize = 14
            L.TextXAlignment = Enum.TextXAlignment.Left
            L.TextTruncate = Enum.TextTruncate.AtEnd
            L.Parent = Item
            Item.MouseButton1Click:Connect(function()
                SearchBox.Text = tostring(q)
                SearchBox:CaptureFocus()
            end)
        end
    end

    ClearHist.MouseButton1Click:Connect(function()
        Settings.__SearchHistory = {}
        pcall(SaveSettings)
        RenderHistory()
    end)

    local function Render(query)
        showingHistory = false
        ResultsTitle.Text = "Search"
        ClearHist.Visible = false
        EmptyLabel.Text = "No results"
        ClearList()
        local items = Collect(query)
        EmptyLabel.Visible = #items == 0
        for i, it in ipairs(items) do
            local Item = Instance.new("TextButton")
            Item.Name = "Result"
            Item.LayoutOrder = i
            Item.Parent = List
            Item.AutoButtonColor = false
            Item.Text = ""
            Item.BackgroundColor3 = Color3.fromRGB(46, 46, 52)
            Item.BackgroundTransparency = 0.35
            Item.BorderSizePixel = 0
            Item.Size = UDim2.new(1, 0, 0, 38)
            Item.ZIndex = 52
            Instance.new("UICorner", Item).CornerRadius = UDim.new(0, 6)

            local NameL = Instance.new("TextLabel")
            NameL.BackgroundTransparency = 1
            NameL.Position = UDim2.new(0, 12, 0, 3)
            NameL.Size = UDim2.new(1, -90, 0, 18)
            NameL.ZIndex = 53
            NameL.Font = Library.Theme.TextFont
            NameL.Text = it.name
            NameL.TextColor3 = Library.Theme.TextColor
            NameL.TextSize = 15
            NameL.TextXAlignment = Enum.TextXAlignment.Left
            NameL.TextTruncate = Enum.TextTruncate.AtEnd
            NameL.Parent = Item
            table.insert(Library.LibraryColorTable, NameL)

            local PathL = Instance.new("TextLabel")
            PathL.BackgroundTransparency = 1
            PathL.Position = UDim2.new(0, 12, 0, 20)
            PathL.Size = UDim2.new(1, -90, 0, 14)
            PathL.ZIndex = 53
            PathL.Font = Enum.Font.SourceSans
            PathL.Text = it.path
            PathL.TextColor3 = Color3.fromRGB(190, 190, 198)
            PathL.TextSize = 12
            PathL.TextXAlignment = Enum.TextXAlignment.Left
            PathL.TextTruncate = Enum.TextTruncate.AtEnd
            PathL.Parent = Item

            local KindL = Instance.new("TextLabel")
            KindL.BackgroundTransparency = 1
            KindL.AnchorPoint = Vector2.new(1, 0.5)
            KindL.Position = UDim2.new(1, -10, 0.5, 0)
            KindL.Size = UDim2.new(0, 76, 0, 16)
            KindL.ZIndex = 53
            KindL.Font = Enum.Font.SourceSans
            KindL.Text = it.kind
            KindL.TextColor3 = Color3.fromRGB(190, 190, 198)
            KindL.TextSize = 12
            KindL.TextXAlignment = Enum.TextXAlignment.Right
            KindL.Parent = Item

            Item.MouseButton1Click:Connect(function()
                addHistory(query)
                GoTo(it.tab, it.section, it.target)
            end)
        end
    end

    function Library._CloseSearch()
        SearchBox.Text = ""
        Results.Visible = false
        showingHistory = false
        ClearHist.Visible = false
        ClearList()
    end

    local token = 0
    SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        token = token + 1
        local my = token
        local q = SearchBox.Text
        if q:match("^%s*$") then
            if SearchBox:IsFocused() and Library.RememberSearch ~= false and #getHistory() > 0 then
                Results.Visible = true
                RenderHistory()
            else
                Results.Visible = false
                showingHistory = false
                ClearHist.Visible = false
                ClearList()
            end
            return
        end
        task.delay(0.12, function()
            if my ~= token then return end
            Results.Visible = true
            Render(SearchBox.Text)
        end)
    end)

    Library.RememberSearch = true
    SearchBox.Focused:Connect(function()
        if Library.RememberSearch == false then return end
        if SearchBox.Text:match("^%s*$") and #getHistory() > 0 then
            Results.Visible = true
            RenderHistory()
        end
    end)
    SearchBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then addHistory(SearchBox.Text) end
        if showingHistory then
            task.delay(0.25, function()
                if showingHistory and SearchBox.Text:match("^%s*$") and not SearchBox:IsFocused() then
                    Results.Visible = false
                    showingHistory = false
                    ClearHist.Visible = false
                    ClearList()
                end
            end)
        end
    end)

    function Library:Search(text)
        SearchBox.Text = tostring(text or "")
    end
    function Library:GetSearchHistory()
        local out = {}
        for i, v in ipairs(getHistory()) do out[i] = v end
        return out
    end
end

-- ===== Favorites =====
do
    local favOn, favMode = false, false
    local registry, byInst = {}, {}
    local saved, savedIndex = {}, {}
    local favCounter = 0
    local favContent, favTabName, emptyLabel, ModeBtn, ModeLbl

    local function gid() return tostring(game.PlaceId) end
    local function loadSaved()
        saved, savedIndex = {}, {}
        local all = Settings.__Favorites
        local list = type(all) == "table" and all[gid()] or nil
        if type(list) == "table" then
            for i, k in ipairs(list) do
                saved[k] = true
                savedIndex[k] = i
                if i > favCounter then favCounter = i end
            end
        end
    end
    local function persist()
        local arr = {}
        for k in pairs(saved) do table.insert(arr, k) end
        table.sort(arr, function(a, b)
            local ia = (registry[a] and registry[a].favOrder) or savedIndex[a] or 1e9
            local ib = (registry[b] and registry[b].favOrder) or savedIndex[b] or 1e9
            return ia < ib
        end)
        if type(Settings.__Favorites) ~= "table" then Settings.__Favorites = {} end
        Settings.__Favorites[gid()] = arr
        pcall(SaveSettings)
    end
    local function updateEmpty()
        if not emptyLabel then return end
        local any = false
        for _, info in pairs(registry) do if info.faved then any = true break end end
        emptyLabel.Visible = not any
        emptyLabel.Size = UDim2.new(1, 0, 0, any and 0 or 44)
    end
    local function refreshStar(info)
        if info.star then
            info.star.Text = info.faved and "★" or "☆"
            info.star.TextColor3 = info.faved and Color3.fromRGB(250, 200, 70) or Color3.fromRGB(180, 180, 190)
        end
    end

    local favOpen = false
    local function pull(info)
        if info.pulled or not favContent then return end
        info.pulled = true
        info.el.LayoutOrder = info.favOrder or 1
        info.el.Parent = favContent
    end
    local function push(info)
        if not info.pulled then return end
        info.pulled = false
        info.el.LayoutOrder = info.order
        if info.home and info.home.Parent then info.el.Parent = info.home end
    end
    function Library._OnTabSelect(tabFrame)
        if not favOn then return end
        favOpen = (tabFrame.Name == favTabName .. "Tab")
        for _, info in pairs(registry) do
            if favOpen and info.faved then pull(info)
            elseif not favOpen then push(info) end
        end
    end

    local function setFav(info, on, silent)
        if on == info.faved then return end
        if on then
            if not favContent then return end
            info.faved = true
            if savedIndex[info.key] then
                info.favOrder = savedIndex[info.key]
            else
                favCounter = favCounter + 1
                info.favOrder = favCounter
            end
            saved[info.key] = true
            if favOpen then pull(info) end
        else
            info.faved = false
            push(info)
            saved[info.key] = nil
            savedIndex[info.key] = nil
        end
        refreshStar(info)
        updateEmpty()
        if not silent then persist() end
    end

    local function hideOriginal(info, on)
        local el = info.el
        if el.AutomaticSize ~= Enum.AutomaticSize.None then return end
        if on then
            info.hidden = {}
            for _, c in ipairs(el:GetChildren()) do
                if c:IsA("GuiObject") and c ~= info.ov then
                    info.hidden[c] = c.Visible
                    c.Visible = false
                end
            end
        elseif info.hidden then
            for c, v in pairs(info.hidden) do
                if c.Parent then c.Visible = v end
            end
            info.hidden = nil
        end
    end

    local function ensureOverlay(info)
        if info.ov or not info.el.Parent then return info.ov end
        local ov = Instance.new("TextButton")
        ov.Name = "FavOverlay"
        ov.Text = ""
        ov.AutoButtonColor = false
        ov.BackgroundColor3 = Color3.fromRGB(38, 38, 46)
        ov.BackgroundTransparency = 0
        ov.BorderSizePixel = 0
        ov.Size = UDim2.new(1, 0, 1, 0)
        ov.ZIndex = 60
        ov.Visible = favMode
        ov.Parent = info.el
        Instance.new("UICorner", ov).CornerRadius = UDim.new(0, 6)
        local st = Instance.new("UIStroke")
        st.Color = Library.Theme.MainColor
        st.Transparency = 0.5
        st.Thickness = 1
        st.Parent = ov
        local display, kind = Library._ElementInfo(info.el)
        local nameL = Instance.new("TextLabel")
        nameL.BackgroundTransparency = 1
        nameL.Position = UDim2.new(0, 12, 0, 0)
        nameL.Size = UDim2.new(1, -52, 1, 0)
        nameL.ZIndex = 61
        nameL.Font = Library.Theme.TextFont
        nameL.Text = tostring(display or info.el.Name) .. "  ·  " .. tostring(kind or "")
        nameL.TextColor3 = Color3.fromRGB(225, 225, 232)
        nameL.TextSize = 14
        nameL.TextXAlignment = Enum.TextXAlignment.Left
        nameL.TextTruncate = Enum.TextTruncate.AtEnd
        nameL.Parent = ov
        local star = Instance.new("TextLabel")
        star.BackgroundTransparency = 1
        star.AnchorPoint = Vector2.new(1, 0.5)
        star.Position = UDim2.new(1, -10, 0.5, 0)
        star.Size = UDim2.new(0, 30, 0, 30)
        star.ZIndex = 61
        star.Font = Enum.Font.SourceSansBold
        star.TextSize = 26
        star.Text = "☆"
        star.Parent = ov
        info.ov, info.star = ov, star
        refreshStar(info)
        if favMode then info.applyHide(true) end
        ov.MouseButton1Click:Connect(function()
            setFav(info, not info.faved)
        end)
        return ov
    end

    function Library._RegFav(el, tabName, secName, home)
        if byInst[el] then return end
        if not Library._ElementInfo or not Library._ElementInfo(el) then return end
        if favTabName and tabName == favTabName then return end
        local key = tabName .. "\t" .. secName .. "\t" .. el.Name
        if registry[key] then return end
        local info = { el = el, key = key, home = home, order = el.LayoutOrder }
        info.applyHide = function(on) hideOriginal(info, on) end
        registry[key] = info
        byInst[el] = info
        if favOn then
            if favMode then ensureOverlay(info) end
            if saved[key] then setFav(info, true, true) end
        end
    end

    function Library:SetFavoriteMode(on)
        if not favOn then return end
        favMode = on and true or false
        if favMode and Library._OnFavMode then Library._OnFavMode() end
        if ModeBtn then
            TweenService:Create(ModeBtn, TweenInfo.new(0.15), {
                BackgroundColor3 = favMode and Color3.fromRGB(240, 190, 60) or Color3.fromRGB(58, 58, 66)
            }):Play()
            ModeLbl.TextColor3 = favMode and Color3.fromRGB(30, 24, 8) or Color3.fromRGB(235, 235, 240)
        end
        for _, info in pairs(registry) do
            if favMode then
                ensureOverlay(info)
                if info.ov then info.ov.Visible = true end
                if not info.hidden then hideOriginal(info, true) end
            else
                if info.ov then info.ov.Visible = false end
                hideOriginal(info, false)
            end
        end
        if Library.Notify and favMode then
            pcall(function() Library:Notify("info", "Favorite mode", "Tap an element to pin / unpin it.", 2.5) end)
        end
    end

    function Library:IsFavorite(tabName, secName, elName)
        local info = registry[tostring(tabName) .. "\t" .. tostring(secName) .. "\t" .. tostring(elName)]
        return info and info.faved or false
    end

    function Library:EnableFavorites(tabName, icon)
        if favOn then return end
        favOn = true
        favTabName = tostring(tabName or "Favorites")
        loadSaved()

        local Tab = Library:CreateTab(favTabName, icon or "star")
        local btn = TabScrollingFrame:FindFirstChild(favTabName .. "TabButton")
        if btn then btn.LayoutOrder = 980 end
        local Sec = Tab:CreateSection("Pinned")
        favContent = Sec.Content

        emptyLabel = Instance.new("TextLabel")
        emptyLabel.Name = "FavHint"
        emptyLabel.Parent = favContent
        emptyLabel.LayoutOrder = -1
        emptyLabel.BackgroundTransparency = 1
        emptyLabel.Size = UDim2.new(1, 0, 0, 44)
        emptyLabel.ZIndex = 5
        emptyLabel.Font = Enum.Font.SourceSans
        emptyLabel.TextSize = 14
        emptyLabel.TextWrapped = true
        emptyLabel.TextColor3 = Color3.fromRGB(190, 190, 198)
        emptyLabel.Text = "No favorites yet. Tap the star button in the top bar, then tap any element to pin it here."

        ModeBtn = Instance.new("TextButton")
        ModeBtn.Name = "FavModeBtn"
        ModeBtn.Parent = Topbar
        ModeBtn.Position = UDim2.new(1, -46, 0, 7)
        ModeBtn.Size = UDim2.new(0, 15, 0, 15)
        ModeBtn.BackgroundColor3 = Color3.fromRGB(58, 58, 66)
        ModeBtn.BorderSizePixel = 0
        ModeBtn.AutoButtonColor = false
        ModeBtn.Text = ""
        ModeBtn.ZIndex = 10
        Instance.new("UICorner", ModeBtn).CornerRadius = UDim.new(0, 4)
        ModeLbl = Instance.new("TextLabel")
        ModeLbl.Parent = ModeBtn
        ModeLbl.BackgroundTransparency = 1
        ModeLbl.Size = UDim2.new(1, 0, 1, 0)
        ModeLbl.ZIndex = 11
        ModeLbl.Font = Enum.Font.SourceSansBold
        ModeLbl.TextSize = 14
        ModeLbl.Text = "★"
        ModeLbl.TextColor3 = Color3.fromRGB(235, 235, 240)
        ModeBtn.MouseButton1Click:Connect(function()
            Library:SetFavoriteMode(not favMode)
        end)
        pcall(function() Library.AttachTooltip(ModeBtn, ModeBtn, "Favorite mode") end)

        for _, info in pairs(registry) do
            if saved[info.key] then setFav(info, true, true) end
        end
        updateEmpty()
    end
end

-- ===== Per-element hotkeys (toggles & buttons) =====
do
    local UIS = game:GetService("UserInputService")
    local bindOn, bindMode = false, false
    local registry, byInst = {}, {}
    local binds = {}
    local listening
    local ModeBtn, ModeLbl

    local function gid() return tostring(game.PlaceId) end
    local function load()
        binds = {}
        local all = Settings.__Binds
        local t = type(all) == "table" and all[gid()] or nil
        if type(t) == "table" then
            for k, v in pairs(t) do if type(v) == "string" then binds[k] = v end end
        end
    end
    local function persist()
        if type(Settings.__Binds) ~= "table" then Settings.__Binds = {} end
        local copy = {}
        for k, v in pairs(binds) do copy[k] = v end
        Settings.__Binds[gid()] = copy
        pcall(SaveSettings)
    end

    local function chipText(info)
        return binds[info.key] or nil
    end
    local function refresh(info)
        local kn = chipText(info)
        if info.badge then
            info.badge.Visible = kn ~= nil and not bindMode
            info.badge.Text = kn or ""
        end
        if info.chip then
            if listening == info then
                info.chip.Text = "Press a key..."
                info.chip.TextColor3 = Color3.fromRGB(250, 200, 70)
            else
                info.chip.Text = kn or "Tap to bind"
                info.chip.TextColor3 = kn and Color3.fromRGB(235, 235, 240) or Color3.fromRGB(150, 150, 160)
            end
        end
    end

    local function hideOriginal(info, on)
        local el = info.el
        if on then
            info.hidden = {}
            for _, c in ipairs(el:GetChildren()) do
                if c:IsA("GuiObject") and c ~= info.ov then
                    info.hidden[c] = c.Visible
                    c.Visible = false
                end
            end
        elseif info.hidden then
            for c, v in pairs(info.hidden) do
                if c.Parent then c.Visible = v end
            end
            info.hidden = nil
        end
    end

    local function stopListening()
        local prev = listening
        listening = nil
        if prev then refresh(prev) end
    end

    local function setBind(info, keyName)
        if keyName then
            for k, v in pairs(binds) do
                if v == keyName and k ~= info.key then
                    binds[k] = nil
                    local other = registry[k]
                    if other then refresh(other) end
                    pcall(function() Library:Notify("warning", "Hotkey moved", keyName .. " was used by \"" .. tostring(other and other.display or "another element") .. "\".", 3) end)
                end
            end
        end
        binds[info.key] = keyName
        persist()
        refresh(info)
    end

    local function ensureBadge(info)
        if info.badge then return end
        local b = Instance.new("TextLabel")
        b.Name = "BindBadge"
        b.AnchorPoint = Vector2.new(1, 0.5)
        b.Position = UDim2.new(1, info.kind == "Toggle" and -58 or -8, 0.5, 0)
        b.Size = UDim2.new(0, 0, 0, 16)
        b.AutomaticSize = Enum.AutomaticSize.X
        b.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
        b.BackgroundTransparency = 0.2
        b.BorderSizePixel = 0
        b.ZIndex = 30
        b.Font = Enum.Font.GothamBold
        b.TextSize = 11
        b.TextColor3 = Color3.fromRGB(235, 235, 240)
        b.Visible = false
        local pad = Instance.new("UIPadding")
        pad.PaddingLeft = UDim.new(0, 6)
        pad.PaddingRight = UDim.new(0, 6)
        pad.Parent = b
        Instance.new("UICorner", b).CornerRadius = UDim.new(0, 4)
        local st = Instance.new("UIStroke")
        st.Color = Library.Theme.MainColor
        st.Transparency = 0.4
        st.Parent = b
        b.Parent = info.el
        info.badge = b
    end

    local function ensureOverlay(info)
        if info.ov or not info.el.Parent then return end
        local ov = Instance.new("TextButton")
        ov.Name = "BindOverlay"
        ov.Text = ""
        ov.AutoButtonColor = false
        ov.BackgroundColor3 = Color3.fromRGB(38, 38, 46)
        ov.BorderSizePixel = 0
        ov.Size = UDim2.new(1, 0, 1, 0)
        ov.ZIndex = 60
        ov.Visible = bindMode
        ov.Parent = info.el
        Instance.new("UICorner", ov).CornerRadius = UDim.new(0, 6)
        local st = Instance.new("UIStroke")
        st.Color = Library.Theme.MainColor
        st.Transparency = 0.5
        st.Parent = ov
        local nameL = Instance.new("TextLabel")
        nameL.BackgroundTransparency = 1
        nameL.Position = UDim2.new(0, 12, 0, 0)
        nameL.Size = UDim2.new(1, -130, 1, 0)
        nameL.ZIndex = 61
        nameL.Font = Library.Theme.TextFont
        nameL.Text = info.display
        nameL.TextColor3 = Color3.fromRGB(225, 225, 232)
        nameL.TextSize = 14
        nameL.TextXAlignment = Enum.TextXAlignment.Left
        nameL.TextTruncate = Enum.TextTruncate.AtEnd
        nameL.Parent = ov
        local chip = Instance.new("TextLabel")
        chip.AnchorPoint = Vector2.new(1, 0.5)
        chip.Position = UDim2.new(1, -8, 0.5, 0)
        chip.Size = UDim2.new(0, 112, 0, 22)
        chip.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
        chip.BorderSizePixel = 0
        chip.ZIndex = 61
        chip.Font = Enum.Font.GothamBold
        chip.TextSize = 12
        chip.Parent = ov
        Instance.new("UICorner", chip).CornerRadius = UDim.new(0, 6)
        info.ov, info.chip = ov, chip
        refresh(info)
        ov.MouseButton1Click:Connect(function()
            local prev = listening
            listening = info
            if prev then refresh(prev) end
            refresh(info)
        end)
        if bindMode then hideOriginal(info, true) end
    end

    function Library._RegBind(el, tabName, secName, home)
        if byInst[el] then return end
        local trig = Library._Triggers and Library._Triggers[el]
        if not trig then return end
        local display, kind = Library._ElementInfo(el)
        local key = tabName .. "\t" .. secName .. "\t" .. el.Name
        if registry[key] then return end
        local info = { el = el, key = key, display = tostring(display or el.Name), kind = kind }
        registry[key] = info
        byInst[el] = info
        if bindOn then
            ensureBadge(info)
            refresh(info)
            if bindMode then ensureOverlay(info) end
        end
    end

    function Library:SetBindMode(on)
        if not bindOn then return end
        on = on and true or false
        if on and Library.SetFavoriteMode then Library:SetFavoriteMode(false) end
        bindMode = on
        if not on then stopListening() end
        if ModeBtn then
            TweenService:Create(ModeBtn, TweenInfo.new(0.15), {
                BackgroundColor3 = on and Color3.fromRGB(90, 160, 250) or Color3.fromRGB(58, 58, 66)
            }):Play()
            ModeLbl.TextColor3 = on and Color3.fromRGB(10, 20, 40) or Color3.fromRGB(235, 235, 240)
        end
        for _, info in pairs(registry) do
            if on then
                ensureOverlay(info)
                info.ov.Visible = true
                if not info.hidden then hideOriginal(info, true) end
            else
                if info.ov then info.ov.Visible = false end
                hideOriginal(info, false)
            end
            refresh(info)
        end
        if on then
            pcall(function() Library:Notify("info", "Hotkey mode", "Tap a toggle or button, then press a key. Esc cancels, Backspace clears.", 4) end)
        end
    end
    -- favorites mode turns this off
    Library._OnFavMode = function() if bindMode then Library:SetBindMode(false) end end

    function Library:GetBind(tabName, secName, elName)
        return binds[tostring(tabName) .. "\t" .. tostring(secName) .. "\t" .. tostring(elName)]
    end

    function Library:EnableBinds()
        if bindOn then return end
        bindOn = true
        load()

        ModeBtn = Instance.new("TextButton")
        ModeBtn.Name = "BindModeBtn"
        ModeBtn.Parent = Topbar
        ModeBtn.Position = UDim2.new(1, -68, 0, 7)
        ModeBtn.Size = UDim2.new(0, 15, 0, 15)
        ModeBtn.BackgroundColor3 = Color3.fromRGB(58, 58, 66)
        ModeBtn.BorderSizePixel = 0
        ModeBtn.AutoButtonColor = false
        ModeBtn.Text = ""
        ModeBtn.ZIndex = 10
        Instance.new("UICorner", ModeBtn).CornerRadius = UDim.new(0, 4)
        ModeLbl = Instance.new("TextLabel")
        ModeLbl.Parent = ModeBtn
        ModeLbl.BackgroundTransparency = 1
        ModeLbl.Size = UDim2.new(1, 0, 1, 0)
        ModeLbl.ZIndex = 11
        ModeLbl.Font = Enum.Font.GothamBold
        ModeLbl.TextSize = 10
        ModeLbl.Text = "K"
        ModeLbl.TextColor3 = Color3.fromRGB(235, 235, 240)
        ModeBtn.MouseButton1Click:Connect(function()
            Library:SetBindMode(not bindMode)
        end)

        for _, info in pairs(registry) do
            ensureBadge(info)
            refresh(info)
        end

        UIS.InputBegan:Connect(function(input, gp)
            if input.UserInputType ~= Enum.UserInputType.Keyboard then return end
            local kn = input.KeyCode.Name
            if kn == "Unknown" then return end
            if listening then
                local info = listening
                if kn == "Escape" then
                    stopListening()
                elseif kn == "Backspace" or kn == "Delete" then
                    listening = nil
                    setBind(info, nil)
                else
                    listening = nil
                    setBind(info, kn)
                end
                return
            end
            if gp or UIS:GetFocusedTextBox() then return end
            for k, v in pairs(binds) do
                if v == kn then
                    local info = registry[k]
                    local trig = info and Library._Triggers[info.el]
                    if trig and info.el.Parent then
                        task.spawn(function()
                            local ok, err = pcall(trig)
                            if not ok then warn(err) end
                        end)
                    end
                end
            end
        end)
    end
end

do
    Library._ConfigSetters = {}
    Library._ConfigIgnore = {
        ["Profile"] = true, ["Profile Name"] = true, ["Import JSON"] = true,
        ["Theme Preset"] = true, ["Window Transparency"] = true, ["Gradient Preset"] = true, ["Gradient Angle"] = true,
    }
    function Library._RegSetter(gameId, name, fn)
        Library._ConfigSetters[tostring(gameId) .. "\n" .. tostring(name)] = fn
    end

    local function gid() return tostring(game.PlaceId) end
    local function copy(v)
        if type(v) == "table" then
            local t = {}
            for k, x in pairs(v) do t[k] = copy(x) end
            return t
        end
        return v
    end
    local function gameSettings()
        local id = gid()
        if not Settings[id] then Settings[id] = {} end
        return Settings[id]
    end
    local function profiles()
        if type(Settings.__Profiles) ~= "table" then Settings.__Profiles = {} end
        if type(Settings.__Profiles[gid()]) ~= "table" then Settings.__Profiles[gid()] = {} end
        return Settings.__Profiles[gid()]
    end
    local function snapshot()
        local out = {}
        for k, v in pairs(gameSettings()) do
            if type(k) == "string" and not Library._ConfigIgnore[k] then out[k] = copy(v) end
        end
        return out
    end
    local function profileNames()
        local names = {}
        for n in pairs(profiles()) do table.insert(names, n) end
        table.sort(names)
        return names
    end
    local function notify(title, msg)
        pcall(function() Library:CreateNotification(title, msg, 3) end)
    end

    local function applyData(data)
        local id = gid()
        Library._BulkLoading = true
        pcall(function()
            for key, value in pairs(data) do
                local setter = Library._ConfigSetters[id .. "\n" .. key]
                if setter then
                    pcall(setter, copy(value))
                else
                    gameSettings()[key] = copy(value)
                end
            end
        end)
        Library._BulkLoading = false
        SaveSettings()
    end

    local function userKey() return tostring(LocalPlayer.UserId) end
    local function getAutoload()
        local al = Settings.__AutoLoad
        if type(al) == "table" and type(al[userKey()]) == "table" then return al[userKey()][gid()] end
        return nil
    end
    local function setAutoload(name)
        if type(Settings.__AutoLoad) ~= "table" then Settings.__AutoLoad = {} end
        if type(Settings.__AutoLoad[userKey()]) ~= "table" then Settings.__AutoLoad[userKey()] = {} end
        Settings.__AutoLoad[userKey()][gid()] = name
        SaveSettings()
    end

    function Library:GetProfiles() return profileNames() end
    function Library:SaveProfile(name)
        name = tostring(name or ""):gsub("^%s+", ""):gsub("%s+$", "")
        if name == "" then return false end
        profiles()[name] = snapshot()
        SaveSettings()
        return true
    end
    function Library:LoadProfile(name)
        local data = profiles()[tostring(name)]
        if not data then return false end
        task.spawn(applyData, copy(data))
        return true
    end
    function Library:DeleteProfile(name)
        if profiles()[tostring(name)] == nil then return false end
        profiles()[tostring(name)] = nil
        SaveSettings()
        return true
    end

    local DEFAULT_TOGGLE_KEY = "RightShift"
    local rebinding = false
    local function getToggleKey()
        local k = Settings.__ToggleKey
        if k == nil then return DEFAULT_TOGGLE_KEY end
        if k == false or k == "None" then return nil end
        return k
    end
    function Library:SetToggleKey(key)
        local name
        if typeof(key) == "EnumItem" then name = key.Name elseif type(key) == "string" and key ~= "" then name = key end
        Settings.__ToggleKey = name or "None"
        SaveSettings()
    end
    function Library:GetToggleKey()
        return getToggleKey()
    end
    UserInputService.InputBegan:Connect(function(input, processed)
        if processed or rebinding then return end
        if input.UserInputType ~= Enum.UserInputType.Keyboard then return end
        if UserInputService:GetFocusedTextBox() then return end
        local k = getToggleKey()
        if k and input.KeyCode.Name == k and Library.ToggleUI then
            Library.ToggleUI()
        end
    end)

    function Library:CreateConfigTab(tabName, icon)
        tabName = tabName or "Config"
        local gs = gameSettings()
        gs["Profile"], gs["Profile Name"], gs["Import JSON"] = nil, nil, nil

        local Tab = Library:CreateTab(tabName, icon or "settings")
        local tabBtn = TabScrollingFrame:FindFirstChild(tabName .. "TabButton")
        if tabBtn then tabBtn.LayoutOrder = 990 end

        local selected = nil
        local dd

        local function refreshDropdown(select)
            local list = { "None" }
            local idx = 1
            for _, n in ipairs(profileNames()) do
                table.insert(list, n)
                if n == select then idx = #list end
            end
            selected = (idx > 1) and select or nil
            if dd then dd.Refresh(list, idx) end
        end

        local Prof = Tab:CreateSection("Profiles")
        dd = Prof:CreateDropdown("Profile", profileNames(), 1, function(opt)
            selected = (opt ~= "None") and opt or nil
        end)
        local _, nameBox = Prof:CreateTextBox("Profile Name", 30, "", function() end)
        nameBox.PlaceholderText = "New profile name..."
        local function readName()
            local t = nameBox.Text:gsub("^%s+", ""):gsub("%s+$", "")
            return t ~= "" and t or nil
        end

        Prof:CreateButton("Save Profile", function()
            local n = readName() or selected
            if not n then notify("Config", "Type a profile name first") return end
            Library:SaveProfile(n)
            nameBox.Text = ""
            gameSettings()["Profile Name"] = nil
            refreshDropdown(n)
            notify("Config", "Saved profile '" .. n .. "'")
        end)
        Prof:CreateButton("Load Profile", function()
            if not selected then notify("Config", "Select a profile first") return end
            if Library:LoadProfile(selected) then notify("Config", "Loaded '" .. selected .. "'") end
        end)
        Prof:CreateButton("Delete Profile", function()
            if not selected then notify("Config", "Select a profile first") return end
            local n = selected
            Library:DeleteProfile(n)
            if getAutoload() == n then setAutoload(nil) end
            refreshDropdown(nil)
            notify("Config", "Deleted '" .. n .. "'")
        end)

        local Share = Tab:CreateSection("Share")
        Share:CreateButton("Export to Clipboard", function()
            local ok = pcall(function()
                setclipboard(HttpService:JSONEncode({ rndm = 1, place = gid(), data = snapshot() }))
            end)
            notify("Config", ok and "Copied to clipboard" or "Clipboard not supported by this executor")
        end)
        local _, importBox = Share:CreateTextBox("Import JSON", 100000, "", function() end)
        importBox.PlaceholderText = "Paste exported config here..."
        Share:CreateButton("Import and Apply", function()
            local raw = importBox.Text
            local ok, decoded = pcall(function() return HttpService:JSONDecode(raw) end)
            if not ok or type(decoded) ~= "table" or type(decoded.data) ~= "table" then
                notify("Import failed", "Invalid config text")
                return
            end
            local clean = {}
            for k, v in pairs(decoded.data) do
                if type(k) == "string" and not Library._ConfigIgnore[k] then clean[k] = copy(v) end
            end
            local n = readName() or "Imported"
            profiles()[n] = clean
            SaveSettings()
            refreshDropdown(n)
            task.spawn(applyData, copy(clean))
            importBox.Text = ""
            gameSettings()["Import JSON"] = nil
            notify("Config", "Imported as '" .. n .. "'")
        end)

        local Short = Tab:CreateSection("Shortcut")
        local keyPara = Short:CreateParagraph("Minimize / Maximize Key", "")
        local function refreshKey()
            local k = getToggleKey()
            keyPara.SetText("Current key: " .. (k or "none") .. "\nPC only. Press the key to minimize or maximize the window.")
        end
        refreshKey()
        Short:CreateButton("Change Shortcut Key", function()
            if rebinding then return end
            rebinding = true
            keyPara.SetText("Press a key... (Backspace or Delete disables the shortcut)")
            local conn
            conn = UserInputService.InputBegan:Connect(function(input)
                if input.UserInputType ~= Enum.UserInputType.Keyboard then return end
                conn:Disconnect()
                local n = input.KeyCode.Name
                if n == "Backspace" or n == "Delete" then
                    Library:SetToggleKey(nil)
                elseif n ~= "Unknown" then
                    Library:SetToggleKey(input.KeyCode)
                end
                task.delay(0.1, function()
                    rebinding = false
                    refreshKey()
                end)
            end)
        end)
        Short:CreateButton("Reset Shortcut Key", function()
            Settings.__ToggleKey = nil
            SaveSettings()
            refreshKey()
        end)

        local Acc = Tab:CreateSection("Account")
        local accPara = Acc:CreateParagraph("Account", "")
        local function refreshAccount()
            accPara.SetText(LocalPlayer.Name .. " (" .. LocalPlayer.UserId .. ")\nAutoload: " .. (getAutoload() or "none"))
        end
        refreshAccount()
        Acc:CreateButton("Autoload Selected Profile", function()
            if not selected then notify("Config", "Select a profile first") return end
            setAutoload(selected)
            refreshAccount()
            notify("Config", "'" .. selected .. "' will load automatically on this account")
        end)
        Acc:CreateButton("Clear Autoload", function()
            setAutoload(nil)
            refreshAccount()
        end)

        local al = getAutoload()
        if al and profiles()[al] then
            task.delay(0.6, function()
                refreshDropdown(al)
                Library:LoadProfile(al)
            end)
        end
        return Tab
    end
end

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

Library.ActiveNotifications = {}

Library.NotificationKinds = {
    success = { Color = Color3.fromRGB(80, 200, 120), Icon = "circle-check", Fallback = "check-circle" },
    error   = { Color = Color3.fromRGB(235, 85, 85),  Icon = "circle-x",     Fallback = "x-circle" },
    warning = { Color = Color3.fromRGB(240, 175, 60), Icon = "triangle-alert", Fallback = "alert-triangle" },
    info    = { Color = Color3.fromRGB(90, 160, 250), Icon = "info",         Fallback = "info" },
}
Library.NotificationKinds.warn = Library.NotificationKinds.warning
Library.NotificationKinds.err = Library.NotificationKinds.error
Library.NotificationKinds.ok = Library.NotificationKinds.success

function Library:Notify(kind, title, message, duration, buttons, buttonCallbacks)
    return Library:CreateNotification(title, message, duration, buttons, buttonCallbacks, kind)
end

function Library:CreateNotification(title, message, duration, buttons, buttonCallbacks, kind)
    local kindInfo = type(kind) == "string" and Library.NotificationKinds[string.lower(kind)] or nil
    local accentColor = kindInfo and kindInfo.Color or Library.Theme.MainColor
    if Library._BumpBadge then pcall(Library._BumpBadge) end
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
    local msgMin = hasButtons and 38 or 30
    local msgH = msgMin
    pcall(function()
        local measured = game:GetService("TextService"):GetTextSize(tostring(message or ""), 14, Library.Theme.TextFont, Vector2.new(256, 1000)).Y
        msgH = math.clamp(math.max(measured, msgMin), msgMin, 100)
    end)
    local notifHeight = 32 + msgH + (hasButtons and 40 or 18)

    NotificationFrame.Name = "Notification"
    NotificationFrame.Parent = UILibrary
    NotificationFrame.BackgroundTransparency = 1
    NotificationFrame.Position = UDim2.new(1, 0, 1, -110)
    NotificationFrame.Size = UDim2.new(0, 300, 0, notifHeight)
    NotificationFrame.ZIndex = 100

    NotificationBackground.Name = "Background"
    NotificationBackground.Parent = NotificationFrame
    NotificationBackground.BackgroundColor3 = Color3.fromRGB(28, 28, 32)
    NotificationBackground.Size = UDim2.new(1, 0, 1, 0)
    NotificationBackground.ZIndex = 100
    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = NotificationBackground

    TopAccent.Name = "TopAccent"
    TopAccent.Parent = NotificationBackground
    TopAccent.BackgroundColor3 = accentColor
    TopAccent.BorderSizePixel = 0
    TopAccent.Position = UDim2.new(0, 0, 0, 0)
    TopAccent.Size = UDim2.new(1, 0, 0, 3)
    TopAccent.ZIndex = 101
    TopCorner.CornerRadius = UDim.new(0, 10)
    TopCorner.Parent = TopAccent

    TitleLabel.Name = "Title"
    TitleLabel.Parent = NotificationBackground
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(0, kindInfo and 36 or 12, 0, 8)
    TitleLabel.Size = UDim2.new(0, kindInfo and 226 or 250, 0, 22)
    TitleLabel.ZIndex = 101
    TitleLabel.Font = Library.Theme.TextFont
    TitleLabel.Text = title or "Notification"
    TitleLabel.TextColor3 = accentColor
    TitleLabel.TextSize = 16
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.TextTruncate = Enum.TextTruncate.AtEnd

    if kindInfo then
        local iconId = Library.ResolveIcon and (Library.ResolveIcon(kindInfo.Icon) or Library.ResolveIcon(kindInfo.Fallback))
        local KindIcon
        if iconId then
            KindIcon = Instance.new("ImageLabel")
            KindIcon.Image = iconId
            KindIcon.ImageColor3 = accentColor
        else
            KindIcon = Instance.new("TextLabel")
            KindIcon.Font = Enum.Font.GothamBold
            KindIcon.TextSize = 16
            KindIcon.TextColor3 = accentColor
            KindIcon.Text = (kind == "success" or kind == "ok") and "+" or ((kind == "error" or kind == "err") and "x" or ((kind == "warning" or kind == "warn") and "!" or "i"))
        end
        KindIcon.Name = "KindIcon"
        KindIcon.Parent = NotificationBackground
        KindIcon.BackgroundTransparency = 1
        KindIcon.Position = UDim2.new(0, 12, 0, 10)
        KindIcon.Size = UDim2.new(0, 18, 0, 18)
        KindIcon.ZIndex = 101
    end

    MessageLabel.Name = "Message"
    MessageLabel.Parent = NotificationBackground
    MessageLabel.BackgroundTransparency = 1
    MessageLabel.Position = UDim2.new(0, 12, 0, 32)
    MessageLabel.Size = UDim2.new(0, 256, 0, msgH)
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
    TimerBarFill.BackgroundColor3 = accentColor
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
        local stackY = -110
        for i, notif in ipairs(Library.ActiveNotifications) do
            if notif.Parent then
                TweenService:Create(notif, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    Position = UDim2.new(1, -310, 1, stackY)
                }):Play()
                stackY = stackY - (notif.Size.Y.Offset + 10)
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
            ActionButton.BackgroundColor3 = accentColor
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
                TweenService:Create(ActionButton, TweenInfo.new(0.08), {BackgroundColor3 = DarkenObjectColor(accentColor, 35)}):Play()
            end)
            ActionButton.MouseButton1Up:Connect(function()
                TweenService:Create(ActionButton, TweenInfo.new(0.15, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {BackgroundColor3 = accentColor}):Play()
            end)
            ActionButton.MouseButton1Click:Connect(function()
                if buttonCallbacks and buttonCallbacks[i] then task.spawn(buttonCallbacks[i]) end
                closeNotification()
            end)
        end
    end

    table.insert(Library.ActiveNotifications, 1, NotificationFrame)
    local stackY = -110
    for i, notif in ipairs(Library.ActiveNotifications) do
        if notif.Parent then
            TweenService:Create(notif, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                Position = UDim2.new(1, -310, 1, stackY)
            }):Play()
            stackY = stackY - (notif.Size.Y.Offset + 10)
        end
    end

    local dur = duration or 5
    TweenService:Create(TimerBarFill, TweenInfo.new(dur, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 0, 1, 0)}):Play()
    task.delay(dur, function()
        if not isClosing then closeNotification() end
    end)

    CloseButton.MouseButton1Click:Connect(closeNotification)

    NotificationFrame.Position = UDim2.new(1, 20, 1, -110)
    TweenService:Create(NotificationFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Position = UDim2.new(1, -310, 1, -110)
    }):Play()

    return NotificationFrame
end

function Library:CreateKeySystem(config)
    config = config or {}
    local ksTabs = config.tabs or {}
    local tabCount = math.clamp(#ksTabs, 1, 2)

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

    local HeaderSep = Instance.new("Frame")
    HeaderSep.Parent = KSOverlay
    HeaderSep.BackgroundColor3 = KS_BORDER
    HeaderSep.BorderSizePixel = 0
    HeaderSep.Position = UDim2.new(0, 0, 0, 45)
    HeaderSep.Size = UDim2.new(1, 0, 0, 1)
    HeaderSep.ZIndex = 202

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

            AddLabel = function(self, text)
                local t = text or ""

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

function Library:CreateBottomBar()
    local overlay   = Library._lastKSOverlay
    local contentArea = Library._lastKSContentArea

    if not overlay or not overlay.Parent then
        warn("CreateBottomBar: No KeySystem overlay found!")
        return {SetPlaceholder=function()end, OnSubmit=function()end, AddButton=function()end}
    end

    if contentArea then
        contentArea.Size = UDim2.new(1, -24, 1, -158)
    end

    local KS_BG      = Color3.fromRGB(22, 22, 26)
    local KS_SURFACE = Color3.fromRGB(30, 30, 36)
    local KS_BORDER  = Color3.fromRGB(48, 48, 58)

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
