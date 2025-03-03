local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local ContentProvider = game:GetService("ContentProvider")
local CoreGui = game:GetService("CoreGui")
getgenv().MainColor = "black"
getgenv().TextColor = "rgb"
Library = {
    LibraryColorTable = {},
    TabCount = 0,
    FirstTab = nil,
    CurrentlyBinding = false,
    RainbowColorValue = 0,
    HueSelectionPosition = 0,
    Theme = {
        MainColor = Color3.fromRGB(255, 75, 75),
        BackgroundColor = Color3.fromRGB(35, 35, 35),
        UIToggleKey = Enum.KeyCode.RightControl,
        TextFont = Enum.Font.SourceSansBold,
        EasingStyle = Enum.EasingStyle.Quart,
        Color = Color3.fromRGB(255, 75, 75),      
        TextColor = Color3.fromRGB(255, 255, 255) 
    }
}
local selectedColor = Color3.fromRGB(255, 75, 75) -- Default

pcall(function()
    if getgenv and not getgenv().Color then
    Library.Theme.Color = Color3.fromRGB(255, 75, 75)
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
            default = Color3.fromRGB(255, 75, 75),
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
    if getgenv().font then
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
        local fontKey = string.lower(getgenv().Font)
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

        Ripple.Position = UDim2.new((Mouse.X - Ripple.AbsolutePosition.X) / object.AbsoluteSize.X, 0, (Mouse.Y - Ripple.AbsolutePosition.Y) / object.AbsoluteSize.Y, 0)
        TweenService:Create(Ripple, TweenInfo.new(1, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Position = UDim2.new(-5.5, 0, -5.5, 0), Size = UDim2.new(12, 0, 12, 0)}):Play()

        wait(0.5)
        TweenService:Create(Ripple, TweenInfo.new(1, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()

        wait(1)
        Ripple:Destroy()
    end)
end

local UILibrary = Instance.new("ScreenGui")
local Main = Instance.new("ImageLabel")
local Border = Instance.new("ImageLabel")
local Topbar = Instance.new("Frame")
local UITabs = Instance.new("Frame")
local Tabs = Instance.new("Frame")
local TabButtons = Instance.new("ImageLabel")
local TabButtonLayout = Instance.new("UIListLayout")

UILibrary.Name = HttpService:GenerateGUID(false)
UILibrary.Parent = CoreGui
UILibrary.DisplayOrder = 1
UILibrary.ZIndexBehavior = Enum.ZIndexBehavior.Global

Main.Name = "Main"
Main.Parent = UILibrary
Main.BackgroundColor3 = Library.Theme.BackgroundColor
Main.BackgroundTransparency = 1
Main.Position = UDim2.new(0.5, -225, 0.5, -125)
Main.Size = UDim2.new(0, 0, 0, 0)
Main.ZIndex = 2
Main.Image = "rbxassetid://3570695787"
Main.ImageColor3 = Library.Theme.BackgroundColor
Main.ScaleType = Enum.ScaleType.Slice
Main.SliceCenter = Rect.new(0, 0, 0, 0)
Main.SliceScale = 0
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Main
Border.Name = "Border"
Border.Parent = Main
Border.BackgroundColor3 = Library.Theme.MainColor
Border.BackgroundTransparency = 1
Border.Position = UDim2.new(0, 0, 0, 0)
Border.Size = UDim2.new(0, 0, 0, 0)
Border.Image = "rbxassetid://3570695787"
Border.ImageColor3 = Library.Theme.MainColor
Border.ScaleType = Enum.ScaleType.Slice
Border.SliceCenter = Rect.new(0, 0, 0, 0)
Border.SliceScale = 0.000
Border.ImageTransparency = 0

Topbar.Name = "Topbar"
Topbar.Parent = Main
Topbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Topbar.BackgroundTransparency = 1.000
Topbar.Size = UDim2.new(0, 0, 0, 0)
Topbar.ZIndex = 2

UITabs.Name = "UITabs"
UITabs.Parent = Main
UITabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UITabs.BackgroundTransparency = 1
UITabs.ClipsDescendants = true
UITabs.Size = UDim2.new(0, 0, 1, 0)

Tabs.Name = "Tabs"
Tabs.Parent = UITabs
Tabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Tabs.BackgroundTransparency = 1
Tabs.Position = UDim2.new(0, 0, 0, 0)
Tabs.Size = UDim2.new(0, 0, 0, 0)
Tabs.ZIndex = 2

TabButtons.Name = "TabButtons"
TabButtons.Parent = UITabs
TabButtons.BackgroundColor3 = Library.Theme.MainColor
TabButtons.BackgroundTransparency = 1
TabButtons.Position = UDim2.new(0, 0, 0, 0)
TabButtons.Size = UDim2.new(0, 0, 0, 0)
TabButtons.ZIndex = 2
TabButtons.Image = "rbxassetid://3570695787"
TabButtons.ImageColor3 = Library.Theme.MainColor
TabButtons.ScaleType = Enum.ScaleType.Slice
TabButtons.SliceCenter = Rect.new(0, 0, 0, 0)
TabButtons.SliceScale = 0.050
TabButtons.ClipsDescendants = true

TabButtonLayout.Name = "TabButtonLayout"
TabButtonLayout.Parent = TabButtons
TabButtonLayout.FillDirection = Enum.FillDirection.Horizontal
TabButtonLayout.SortOrder = Enum.SortOrder.LayoutOrder

TweenService:Create(Main, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(0, 450, 0, 250)}):Play()
TweenService:Create(Border, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()

table.insert(Library.LibraryColorTable, Border)
table.insert(Library.LibraryColorTable, TabButtons)
MakeDraggable(Topbar, Main)


local TweenService = game:GetService("TweenService")

local MinimizeBtn = Instance.new("ImageButton")
MinimizeBtn.Name = "MinimizeBtn"
MinimizeBtn.Parent = Topbar
MinimizeBtn.BackgroundTransparency = 1
MinimizeBtn.Position = UDim2.new(0, 0, 0, 0)
MinimizeBtn.Size = UDim2.new(0, 0, 0, 0)
MinimizeBtn.ZIndex = 10
MinimizeBtn.Image = "rbxassetid://3570695787"
MinimizeBtn.ImageColor3 = Library.Theme.MainColor
MinimizeBtn.ScaleType = Enum.ScaleType.Slice
MinimizeBtn.SliceCenter = Rect.new(0, 0, 0, 0)
MinimizeBtn.SliceScale = 0.000

local MinIcon = Instance.new("TextLabel")
MinIcon.Name = "MinIcon"
MinIcon.Parent = MinimizeBtn
MinIcon.BackgroundTransparency = 1
MinIcon.Size = UDim2.new(0, 0, 0, 0)
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
FloatingIcon.Size = UDim2.new(0, 0, 0, 0)
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
FloatingText.Size = UDim2.new(0, 0, 0, 0)
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



local function CloseAllTabs()
    for i, v in pairs(Tabs:GetChildren()) do
        if v:IsA("Frame") then
            v.Visible = false
        end
    end
end

local function ResetAllTabButtons()
    for i, v in pairs(TabButtons:GetChildren()) do
        if v:IsA("ImageButton") then
            TweenService:Create(v, TweenInfo.new(0.3, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {ImageColor3 = Library.Theme.MainColor}):Play()
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

        for i, v in pairs(TabButtons:GetChildren()) do
            if v:IsA("ImageButton") then
                if v.Name:find(Library.FirstTab .. "TabButton") then
                    TweenService:Create(v, TweenInfo.new(0.3, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {ImageColor3 = DarkenObjectColor(Library.Theme.MainColor, 15)}):Play()
                else
                    TweenService:Create(v, TweenInfo.new(0.3, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {ImageColor3 = Library.Theme.MainColor}):Play()
                end
            end
        end
    end
end

local function ToggleUI()
    Library.UIOpen = not Library.UIOpen
            
    if Library.UIOpen then
        TweenService:Create(Main, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(0, 450, 0, 0)}):Play()
        TweenService:Create(Border, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
    elseif not Library.UIOpen then
        TweenService:Create(Main, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(0, 450, 0, 250)}):Play()
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
Library.ActiveNotifications = {}

function Library:CreateNotification(title, message, duration, buttons, buttonCallbacks)
    local NotificationFrame = Instance.new("Frame")
    local NotificationBackground = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local TitleLabel = Instance.new("TextLabel")
    local MessageLabel = Instance.new("TextLabel")
    local CloseButton = Instance.new("TextButton")
    local TimerBar = Instance.new("Frame")
    local TimerBarFill = Instance.new("Frame")

    local hasButtons = buttons and #buttons > 0
    local notifHeight = hasButtons and 100 or 70

    NotificationFrame.Name = "Notification"
    NotificationFrame.Parent = UILibrary
    NotificationFrame.BackgroundTransparency = 1
    NotificationFrame.Position = UDim2.new(1, 0, 1, -110)
    NotificationFrame.Size = UDim2.new(0, 300, 0, notifHeight)
    NotificationFrame.ZIndex = 100

    NotificationBackground.Name = "Background"
    NotificationBackground.Parent = NotificationFrame
    NotificationBackground.BackgroundColor3 = Library.Theme.MainColor
    NotificationBackground.Size = UDim2.new(1, 0, 1, 0)
    NotificationBackground.ZIndex = 100
    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = NotificationBackground

    TitleLabel.Name = "Title"
    TitleLabel.Parent = NotificationBackground
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(0, 10, 0, 5)
    TitleLabel.Size = UDim2.new(0, 260, 0, 20)
    TitleLabel.ZIndex = 101
    TitleLabel.Font = Library.Theme.TextFont
    TitleLabel.Text = title or "Notification"
    TitleLabel.TextColor3 = Library.Theme.TextColor
    table.insert(Library.LibraryColorTable, TitleLabel)
    TitleLabel.TextSize = 16
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    MessageLabel.Name = "Message"
    MessageLabel.Parent = NotificationBackground
    MessageLabel.BackgroundTransparency = 1
    MessageLabel.Position = UDim2.new(0, 10, 0, 25)
    MessageLabel.Size = UDim2.new(0, 260, 0, hasButtons and 40 or 30)
    MessageLabel.ZIndex = 101
    MessageLabel.Font = Library.Theme.TextFont
    MessageLabel.Text = message or ""
    MessageLabel.TextColor3 = Library.Theme.TextColor
    table.insert(Library.LibraryColorTable, MessageLabel)
    MessageLabel.TextSize = 14
    MessageLabel.TextWrapped = true
    MessageLabel.TextXAlignment = Enum.TextXAlignment.Left


    pcall(function()
        local envColor = getgenv().Color and string.lower(getgenv().Color) or nil
        if envColor == "white" then
            TitleLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
        elseif envColor == "black" then
            MessageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
    end)

    CloseButton.Name = "CloseButton"
    CloseButton.Parent = NotificationBackground
    CloseButton.BackgroundTransparency = 1
    CloseButton.Position = UDim2.new(1, -25, 0, 5)
    CloseButton.Size = UDim2.new(0, 20, 0, 20)
    CloseButton.ZIndex = 102
    CloseButton.Font = Library.Theme.TextFont
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Library.Theme.TextColor
    table.insert(Library.LibraryColorTable, CloseButton)
    CloseButton.TextSize = 16

    TimerBar.Name = "TimerBar"
    TimerBar.Parent = NotificationBackground
    TimerBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    TimerBar.BorderSizePixel = 0
    TimerBar.Position = UDim2.new(0, 10, 1, -15)
    TimerBar.Size = UDim2.new(0, 280, 0, 5)
    TimerBar.ZIndex = 101

    TimerBarFill.Name = "TimerBarFill"
    TimerBarFill.Parent = TimerBar
    TimerBarFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TimerBarFill.BorderSizePixel = 0
    TimerBarFill.Size = UDim2.new(1, 0, 1, 0)
    TimerBarFill.ZIndex = 102

    local function closeNotification()
        local index = table.find(Library.ActiveNotifications, NotificationFrame)
        if index then
            table.remove(Library.ActiveNotifications, index)
            TweenService:Create(NotificationFrame, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {
                Position = UDim2.new(1, 0, NotificationFrame.Position.Y.Scale, NotificationFrame.Position.Y.Offset)
            }):Play()
            wait(0.5)
            NotificationFrame:Destroy()
            for i, notif in pairs(Library.ActiveNotifications) do
                local targetY = -110 - (i - 1) * (notif.Size.Y.Offset + 10)
                TweenService:Create(notif, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    Position = UDim2.new(1, -310, 1, targetY)
                }):Play()
            end
        end
    end

    if hasButtons then
        local buttonCount = math.clamp(#buttons, 1, 5)
        local buttonWidth = 280 / buttonCount - 5
        for i = 1, buttonCount do
            local ActionButton = Instance.new("TextButton")
            ActionButton.Name = "ActionButton" .. i
            ActionButton.Parent = NotificationBackground
            ActionButton.BackgroundColor3 = DarkenObjectColor(Library.Theme.MainColor, 20)
            ActionButton.Position = UDim2.new(0, 10 + (i - 1) * (buttonWidth + 5), 0, 65)
            ActionButton.Size = UDim2.new(0, buttonWidth, 0, 20)
            ActionButton.ZIndex = 102
            ActionButton.Font = Library.Theme.TextFont
            ActionButton.Text = buttons[i] or "Button " .. i
                ActionButton.TextColor3 = Library.Theme.TextColor
    table.insert(Library.LibraryColorTable, ActionButton)
            ActionButton.TextSize = 14
            
            local ButtonRounded = Instance.new("UICorner")
            ButtonRounded.CornerRadius = UDim.new(0, 5)
            ButtonRounded.Parent = ActionButton

            ActionButton.MouseButton1Click:Connect(function()
                if buttonCallbacks and buttonCallbacks[i] then
                    buttonCallbacks[i]()
                end
                closeNotification()
            end)
        end
    end

    table.insert(Library.ActiveNotifications, 1, NotificationFrame)
    for i, notif in pairs(Library.ActiveNotifications) do
        local targetY = -110 - (i - 1) * (notif.Size.Y.Offset + 10)
        TweenService:Create(notif, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
            Position = UDim2.new(1, -310, 1, targetY)
        }):Play()
    end

    local duration = duration or 5
    TweenService:Create(TimerBarFill, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
        Size = UDim2.new(0, 0, 1, 0)
    }):Play()
    spawn(function()
        wait(duration)
        closeNotification()
    end)

    CloseButton.MouseButton1Click:Connect(closeNotification)

    return NotificationFrame
end