local TweenService = game:GetService("TweenService")
local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")


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
        Textcolorrr = Color3.fromRGB(255, 255, 255) 
    },
    ActiveNotifications = {}
}

local UILibrary = Instance.new("ScreenGui")
UILibrary.Name = "NotificationGui"
UILibrary.ResetOnSpawn = false

local player = game:GetService("Players").LocalPlayer
if player and player:FindFirstChild("PlayerGui") then
    UILibrary.Parent = player:WaitForChild("PlayerGui")
else
    UILibrary.Parent = game:GetService("CoreGui")
end

UILibrary.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
UILibrary.Enabled = true
pcall(function()
    local colorMap = {
        b = Color3.fromRGB(0, 0, 0),
        default = Color3.fromRGB(255, 75, 75)
    }
    local colorKey = string.lower(getgenv().PKJ)
    Library.Theme.MainColor = colorMap[colorKey] or colorMap.default
end)
local function Update()
    for _, v in pairs(Library.LibraryColorTable) do
        if typeof(v) == "Instance" then
if (v:IsA("TextLabel") or v:IsA("TextButton")) and (v.Name == "Title" or v.Name == "Message" or v.Name == "CloseButton" or string.match(v.Name, "ActionButton")) then
    v.TextColor3 = Library.Theme.Textcolorrr
            end
        end
    end
end
pcall(function()
    if getgenv().SJJs == "rb" then
task.spawn(function()
    while not getgenv().Stop do 
        for i = 0, 1, 0.002 do
            if getgenv().Stop then break end
            Library.Theme.Textcolorrr = Color3.fromHSV(i, 1, 1)
            for _, v in pairs(Library.LibraryColorTable) do
                if (v:IsA("TextLabel") or v:IsA("TextButton")) and (v.Name == "Title" or v.Name == "Message" or v.Name == "CloseButton" or string.match(v.Name, "ActionButton")) then
                    v.TextColor3 = Library.Theme.Textcolorrr
                end
            end
            task.wait(0.01)
        end
    end
end)
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
        local colorKey = string.lower(tostring(getgenv().SJJs))
        Library.Theme.Textcolorrr = colorMap[colorKey] or Color3.fromRGB(255, 255, 255)
        Update()
    end
end)
local function Darkned(object, amount)
    local h, s, v = Color3.toHSV(object)
    v = math.clamp(v - (amount / 255), 0, 1)
    s = math.clamp(s - (amount / 510), 0, 1)
    return Color3.fromHSV(h, s, v)
end

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
    TitleLabel.TextColor3 = Library.Theme.Textcolorrr
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
    MessageLabel.TextColor3 = Library.Theme.Textcolorrr
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
    CloseButton.TextColor3 = Library.Theme.Textcolorrr
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
            ActionButton.BackgroundColor3 = Darkned(Library.Theme.MainColor, 20)
            ActionButton.Position = UDim2.new(0, 10 + (i - 1) * (buttonWidth + 5), 0, 65)
            ActionButton.Size = UDim2.new(0, buttonWidth, 0, 20)
            ActionButton.ZIndex = 102
            ActionButton.Font = Library.Theme.TextFont
            ActionButton.Text = buttons[i] or "Button " .. i
            ActionButton.TextColor3 = Library.Theme.Textcolorrr
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

