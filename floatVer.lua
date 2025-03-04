local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")

local Library = {
    Theme = {
        MainColor = Color3.fromRGB(255, 75, 75),
        BackgroundColor = Color3.fromRGB(35, 35, 35),
        TextColor = Color3.fromRGB(255, 255, 255),
        DefaultTextColor = Color3.fromRGB(185, 185, 185),
        TextFont = Enum.Font.SourceSansBold,
        EasingStyle = Enum.EasingStyle.Quart
    },
    TabCount = 0,
    LibraryColorTable = {},
    ActiveNotifications = {}
}

local Settings = {}
local saveFile = "FloatRndm.json"

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

local function LoadSettings()
    if isfile(saveFile) then
        local success, result = pcall(function()
            return HttpService:JSONDecode(readfile(saveFile))
        end)
        if success and type(result) == "table" then
            Settings = result
        end
    end
end

local function SaveSettings()
    local settingsToSave = {
        Tabs = Settings.Tabs or {}
    }
    pcall(function()
        writefile(saveFile, HttpService:JSONEncode(settingsToSave))
    end)
end

LoadSettings()

local function UpdateColors()
    pcall(function()
        if getgenv().Color then
            local colorKey = string.lower(getgenv().Color)
            if colorKey == "rgb" then
                coroutine.wrap(function()
                    while true do
                        if getgenv().StopRGB then break end
                        for i = 0, 1, 0.001 do
                            Library.Theme.MainColor = Color3.fromHSV(i, 1, 1)
                            UpdateColors()
                            task.wait(0.01)
                        end
                    end
                end)()
            else
                Library.Theme.MainColor = colorMap[colorKey] or colorMap.default
            end
        end
        if getgenv().TextColor then
            local textColorKey = string.lower(getgenv().TextColor)
            if textColorKey == "rgb" then
                coroutine.wrap(function()
                    while true do
                        if getgenv().StopRGB then break end
                        for i = 0, 1, 0.002 do
                            Library.Theme.TextColor = Color3.fromHSV(i, 1, 1)
                            UpdateColors()
                            task.wait(0.01)
                        end
                    end
                end)()
            else
                Library.Theme.TextColor = colorMap[textColorKey] or Color3.fromRGB(255, 255, 255)
            end
        end
    end)
    
    for _, obj in pairs(Library.LibraryColorTable) do
        if obj:IsA("ImageLabel") then
            if obj.Name:find("Background") or obj.Name:find("Border") then
                obj.ImageColor3 = Library.Theme.BackgroundColor
            else
                obj.ImageColor3 = Library.Theme.MainColor
            end
        elseif obj:IsA("Frame") and obj.Name == "ToggleCircle" then
            obj.BackgroundColor3 = obj.Parent.Toggled and Library.Theme.MainColor or Color3.fromRGB(65, 65, 65)
        elseif obj:IsA("TextLabel") or obj:IsA("TextButton") then
            if obj.Name == "ToggleTitle" then
                obj.TextColor3 = obj.Parent.Toggled and Library.Theme.TextColor or Library.Theme.DefaultTextColor
            elseif obj.Name:find("DropdownOption") then
                obj.TextColor3 = obj.Selected and Library.Theme.MainColor or Library.Theme.TextColor
            else
                obj.TextColor3 = Library.Theme.TextColor
            end
        end
    end
end

local UILibrary = Instance.new("ScreenGui")
UILibrary.Name = HttpService:GenerateGUID(false)
UILibrary.Parent = CoreGui
UILibrary.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local TabsContainer = Instance.new("Frame")
TabsContainer.Name = "TabsContainer"
TabsContainer.Parent = UILibrary
TabsContainer.BackgroundTransparency = 1
TabsContainer.Position = UDim2.new(0, 50, 0, 50)
TabsContainer.Size = UDim2.new(0, 0, 0, 40)

local TabLayout = Instance.new("UIListLayout")
TabLayout.Parent = TabsContainer
TabLayout.FillDirection = Enum.FillDirection.Horizontal
TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabLayout.Padding = UDim.new(0, 10)

local function MakeDraggable(object)
    local Dragging, DragInput, DragStart, StartPos
    object.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            Dragging = true
            DragStart = input.Position
            StartPos = object.Parent.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    Dragging = false
                end
            end)
        end
    end)
    
    object.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            DragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == DragInput and Dragging then
            local Delta = input.Position - DragStart
            object.Parent.Position = UDim2.new(
                StartPos.X.Scale, 
                StartPos.X.Offset + Delta.X,
                StartPos.Y.Scale, 
                StartPos.Y.Offset + Delta.Y
            )
        end
    end)
end

function Library:CreateTab(name)
    Library.TabCount = Library.TabCount + 1
    
    local TabFrame = Instance.new("Frame")
    TabFrame.Name = name .. "Tab"
    TabFrame.Parent = TabsContainer
    TabFrame.BackgroundTransparency = 1
    TabFrame.Size = UDim2.new(0, 100, 0, 40)
    TabFrame.LayoutOrder = Library.TabCount
    
    local TabButton = Instance.new("ImageLabel")
    TabButton.Name = "TabButton"
    TabButton.Parent = TabFrame
    TabButton.BackgroundTransparency = 1
    TabButton.Size = UDim2.new(1, 0, 0, 40)
    TabButton.Image = "rbxassetid://3570695787"
    TabButton.ImageColor3 = Library.Theme.MainColor
    TabButton.ScaleType = Enum.ScaleType.Slice
    TabButton.SliceCenter = Rect.new(100, 100, 100, 100)
    TabButton.SliceScale = 0.050
    
    local TabTitle = Instance.new("TextLabel")
    TabTitle.Parent = TabButton
    TabTitle.BackgroundTransparency = 1
    TabTitle.Size = UDim2.new(1, 0, 1, 0)
    TabTitle.Text = name
    TabTitle.TextColor3 = Library.Theme.TextColor
    TabTitle.Font = Library.Theme.TextFont
    TabTitle.TextSize = 16
    
    local SectionsFrame = Instance.new("Frame")
    SectionsFrame.Name = "Sections"
    SectionsFrame.Parent = TabFrame
    SectionsFrame.BackgroundTransparency = 1
    SectionsFrame.Position = UDim2.new(0, 0, 1, 0)
    SectionsFrame.Size = UDim2.new(0, 100, 0, 0)
    
    local SectionLayout = Instance.new("UIListLayout")
    SectionLayout.Parent = SectionsFrame
    SectionLayout.SortOrder = Enum.SortOrder.LayoutOrder
    SectionLayout.Padding = UDim.new(0, 10)
    
    local minimized = false
    
    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Parent = TabButton
    MinimizeButton.BackgroundTransparency = 1
    MinimizeButton.Position = UDim2.new(1, -20, 0, 0)
    MinimizeButton.Size = UDim2.new(0, 20, 0, 20)
    MinimizeButton.Text = "-"
    MinimizeButton.TextColor3 = Library.Theme.TextColor
    MinimizeButton.Font = Library.Theme.TextFont
    MinimizeButton.TextSize = 16
    
    table.insert(Library.LibraryColorTable, TabButton)
    table.insert(Library.LibraryColorTable, TabTitle)
    table.insert(Library.LibraryColorTable, MinimizeButton)
    
    local function ToggleMinimize()
        minimized = not minimized
        if minimized then
            TweenService:Create(SectionsFrame, TweenInfo.new(0.3, Library.Theme.EasingStyle), {
                Size = UDim2.new(0, 100, 0, 0)
            }):Play()
            MinimizeButton.Text = "+"
        else
            TweenService:Create(SectionsFrame, TweenInfo.new(0.3, Library.Theme.EasingStyle), {
                Size = UDim2.new(0, 100, 0, SectionLayout.AbsoluteContentSize.Y + 10)
            }):Play()
            MinimizeButton.Text = "-"
        end
    end
    
    MinimizeButton.MouseButton1Click:Connect(ToggleMinimize)
    MakeDraggable(TabButton)
    
    UpdateColors()
    
    local TabElements = {}
    
    function TabElements:CreateSection(name)
        local SectionFrame = Instance.new("ImageLabel")
        SectionFrame.Name = name .. "Section"
        SectionFrame.Parent = SectionsFrame
        SectionFrame.BackgroundTransparency = 1
        SectionFrame.Size = UDim2.new(0, 100, 0, 30)
        SectionFrame.Image = "rbxassetid://3570695787"
        SectionFrame.ImageColor3 = Library.Theme.BackgroundColor
        SectionFrame.ScaleType = Enum.ScaleType.Slice
        SectionFrame.SliceCenter = Rect.new(100, 100, 100, 100)
        SectionFrame.SliceScale = 0.050
        
        local SectionTitle = Instance.new("TextLabel")
        SectionTitle.Parent = SectionFrame
        SectionTitle.BackgroundTransparency = 1
        SectionTitle.Size = UDim2.new(1, 0, 0, 30)
        SectionTitle.Text = name
        SectionTitle.TextColor3 = Library.Theme.TextColor
        SectionTitle.Font = Library.Theme.TextFont
        SectionTitle.TextSize = 14
        
        local ContentFrame = Instance.new("Frame")
        ContentFrame.Parent = SectionFrame
        ContentFrame.BackgroundTransparency = 1
        ContentFrame.Position = UDim2.new(0, 0, 0, 30)
        ContentFrame.Size = UDim2.new(0, 100, 0, 0)
        
        local ContentLayout = Instance.new("UIListLayout")
        ContentLayout.Parent = ContentFrame
        ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
        ContentLayout.Padding = UDim.new(0, 5)
        
        local minimized = false
        
        local MinimizeButton = Instance.new("TextButton")
        MinimizeButton.Parent = SectionFrame
        MinimizeButton.BackgroundTransparency = 1
        MinimizeButton.Position = UDim2.new(1, -20, 0, 0)
        MinimizeButton.Size = UDim2.new(0, 20, 0, 20)
        MinimizeButton.Text = "-"
        MinimizeButton.TextColor3 = Library.Theme.TextColor
        MinimizeButton.Font = Library.Theme.TextFont
        MinimizeButton.TextSize = 14
        
        table.insert(Library.LibraryColorTable, SectionFrame)
        table.insert(Library.LibraryColorTable, SectionTitle)
        table.insert(Library.LibraryColorTable, MinimizeButton)
        
        local function ToggleSection()
            minimized = not minimized
            if minimized then
                TweenService:Create(ContentFrame, TweenInfo.new(0.3, Library.Theme.EasingStyle), {
                    Size = UDim2.new(0, 100, 0, 0)
                }):Play()
                TweenService:Create(SectionFrame, TweenInfo.new(0.3, Library.Theme.EasingStyle), {
                    Size = UDim2.new(0, 100, 0, 30)
                }):Play()
                MinimizeButton.Text = "+"
            else
                TweenService:Create(ContentFrame, TweenInfo.new(0.3, Library.Theme.EasingStyle), {
                    Size = UDim2.new(0, 100, 0, ContentLayout.AbsoluteContentSize.Y + 5)
                }):Play()
                TweenService:Create(SectionFrame, TweenInfo.new(0.3, Library.Theme.EasingStyle), {
                    Size = UDim2.new(0, 100, 0, ContentLayout.AbsoluteContentSize.Y + 35)
                }):Play()
                MinimizeButton.Text = "-"
            end
            if not minimized then
                ToggleMinimize()
            end
        end
        
        MinimizeButton.MouseButton1Click:Connect(ToggleSection)
        
        local SectionElements = {}
        
        function SectionElements:CreateButton(name, callback)
            local Button = Instance.new("TextButton")
            Button.Parent = ContentFrame
            Button.BackgroundColor3 = Library.Theme.MainColor
            Button.Size = UDim2.new(0, 90, 0, 25)
            Button.Text = name
            Button.TextColor3 = Library.Theme.TextColor
            Button.Font = Library.Theme.TextFont
            Button.TextSize = 14
            
            local Corner = Instance.new("UICorner")
            Corner.CornerRadius = UDim.new(0, 8)
            Corner.Parent = Button
            
            Button.MouseButton1Click:Connect(callback)
            table.insert(Library.LibraryColorTable, Button)
            
            UpdateColors()
            ToggleSection()
        end
        
        function SectionElements:CreateToggle(name, default, callback)
            local ToggleFrame = Instance.new("Frame")
            ToggleFrame.Parent = ContentFrame
            ToggleFrame.BackgroundTransparency = 1
            ToggleFrame.Size = UDim2.new(0, 100, 0, 25)
            ToggleFrame.Toggled = default or false
            
            local ToggleTitle = Instance.new("TextLabel")
            ToggleTitle.Name = "ToggleTitle"
            ToggleTitle.Parent = ToggleFrame
            ToggleTitle.BackgroundTransparency = 1
            ToggleTitle.Size = UDim2.new(0, 70, 1, 0)
            ToggleTitle.Text = name
            ToggleTitle.TextColor3 = ToggleFrame.Toggled and Library.Theme.TextColor or Library.Theme.DefaultTextColor
            ToggleTitle.Font = Library.Theme.TextFont
            ToggleTitle.TextSize = 14
            ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left
            
            local ToggleCircle = Instance.new("Frame")
            ToggleCircle.Name = "ToggleCircle"
            ToggleCircle.Parent = ToggleFrame
            ToggleCircle.Position = UDim2.new(0, 80, 0, 5)
            ToggleCircle.Size = UDim2.new(0, 15, 0, 15)
            ToggleCircle.BackgroundColor3 = ToggleFrame.Toggled and Library.Theme.MainColor or Color3.fromRGB(65, 65, 65)
            
            local Corner = Instance.new("UICorner")
            Corner.CornerRadius = UDim.new(1, 0)
            Corner.Parent = ToggleCircle
            
            local ToggleButton = Instance.new("TextButton")
            ToggleButton.Parent = ToggleFrame
            ToggleButton.BackgroundTransparency = 1
            ToggleButton.Size = UDim2.new(1, 0, 1, 0)
            ToggleButton.Text = ""
            
            ToggleButton.MouseButton1Click:Connect(function()
                ToggleFrame.Toggled = not ToggleFrame.Toggled
                TweenService:Create(ToggleCircle, TweenInfo.new(0.3, Library.Theme.EasingStyle), {
                    BackgroundColor3 = ToggleFrame.Toggled and Library.Theme.MainColor or Color3.fromRGB(65, 65, 65)
                }):Play()
                ToggleTitle.TextColor3 = ToggleFrame.Toggled and Library.Theme.TextColor or Library.Theme.DefaultTextColor
                callback(ToggleFrame.Toggled)
            end)
            
            table.insert(Library.LibraryColorTable, ToggleTitle)
            table.insert(Library.LibraryColorTable, ToggleCircle)
            UpdateColors()
            ToggleSection()
            callback(ToggleFrame.Toggled)
        end
        
        function SectionElements:CreateDropdown(name, options, presetoption, callback)
            local DropdownFrame = Instance.new("Frame")
            DropdownFrame.Parent = ContentFrame
            DropdownFrame.BackgroundTransparency = 1
            DropdownFrame.Size = UDim2.new(0, 100, 0, 25)
            
            local TitleToggle = Instance.new("TextButton")
            TitleToggle.Parent = DropdownFrame
            TitleToggle.BackgroundTransparency = 1
            TitleToggle.Size = UDim2.new(1, 0, 0, 25)
            TitleToggle.Text = name .. " - " .. (options[presetoption] or options[1])
            TitleToggle.TextColor3 = Library.Theme.TextColor
            TitleToggle.Font = Library.Theme.TextFont
            TitleToggle.TextSize = 14
            TitleToggle.TextXAlignment = Enum.TextXAlignment.Left
            
            local DropdownContent = Instance.new("ImageLabel")
            DropdownContent.Parent = DropdownFrame
            DropdownContent.BackgroundTransparency = 1
            DropdownContent.Position = UDim2.new(1, 5, 0, 0)
            DropdownContent.Size = UDim2.new(0, 100, 0, 0)
            DropdownContent.Image = "rbxassetid://3570695787"
            DropdownContent.ImageColor3 = Library.Theme.BackgroundColor
            DropdownContent.ScaleType = Enum.ScaleType.Slice
            DropdownContent.SliceCenter = Rect.new(100, 100, 100, 100)
            DropdownContent.SliceScale = 0.050
            DropdownContent.ClipsDescendants = true
            
            local DropdownLayout = Instance.new("UIListLayout")
            DropdownLayout.Parent = DropdownContent
            DropdownLayout.SortOrder = Enum.SortOrder.LayoutOrder
            
            local selectedOption = options[presetoption] or options[1]
            local toggled = false
            
            local function UpdateDropdown()
                for _, v in pairs(DropdownContent:GetChildren()) do
                    if v:IsA("TextButton") then v:Destroy() end
                end
                for _, option in pairs(options) do
                    local OptionButton = Instance.new("TextButton")
                    OptionButton.Name = "DropdownOption"
                    OptionButton.Parent = DropdownContent
                    OptionButton.BackgroundTransparency = 1
                    OptionButton.Size = UDim2.new(0, 100, 0, 20)
                    OptionButton.Text = option
                    OptionButton.TextColor3 = option == selectedOption and Library.Theme.MainColor or Library.Theme.TextColor
                    OptionButton.Font = Library.Theme.TextFont
                    OptionButton.TextSize = 14
                    OptionButton.Selected = option == selectedOption
                    
                    local textBounds = OptionButton.TextBounds
                    OptionButton.Size = UDim2.new(0, textBounds.X + 10, 0, 20)
                    OptionButton.Position = UDim2.new(0, (100 - textBounds.X - 10) / 2, 0, 0)
                    
                    OptionButton.MouseButton1Click:Connect(function()
                        selectedOption = option
                        TitleToggle.Text = name .. " - " .. selectedOption
                        callback(selectedOption)
                        toggled = false
                        TweenService:Create(DropdownContent, TweenInfo.new(0.3, Library.Theme.EasingStyle), {
                            Size = UDim2.new(0, 100, 0, 0)
                        }):Play()
                        for _, btn in pairs(DropdownContent:GetChildren()) do
                            if btn:IsA("TextButton") then
                                btn.Selected = btn.Text == selectedOption
                                btn.TextColor3 = btn.Selected and Library.Theme.MainColor or Library.Theme.TextColor
                            end
                        end
                    end)
                    table.insert(Library.LibraryColorTable, OptionButton)
                end
            end
            
            TitleToggle.MouseButton1Click:Connect(function()
                toggled = not toggled
                if toggled then
                    UpdateDropdown()
                    TweenService:Create(DropdownContent, TweenInfo.new(0.3, Library.Theme.EasingStyle), {
                        Size = UDim2.new(0, 100, 0, #options * 20)
                    }):Play()
                else
                    TweenService:Create(DropdownContent, TweenInfo.new(0.3, Library.Theme.EasingStyle), {
                        Size = UDim2.new(0, 100, 0, 0)
                    }):Play()
                end
                ToggleSection()
            end)
            
            table.insert(Library.LibraryColorTable, TitleToggle)
            table.insert(Library.LibraryColorTable, DropdownContent)
            UpdateColors()
            callback(selectedOption)
        end
        
        UpdateColors()
        return SectionElements
    end
    
    function Library:CreateNotification(title, message, duration)
        local NotificationFrame = Instance.new("Frame")
        NotificationFrame.Parent = UILibrary
        NotificationFrame.BackgroundColor3 = Library.Theme.MainColor
        NotificationFrame.Position = UDim2.new(1, -210, 1, -60)
        NotificationFrame.Size = UDim2.new(0, 200, 0, 50)
        
        local Corner = Instance.new("UICorner")
        Corner.CornerRadius = UDim.new(0, 8)
        Corner.Parent = NotificationFrame
        
        local TitleLabel = Instance.new("TextLabel")
        TitleLabel.Parent = NotificationFrame
        TitleLabel.BackgroundTransparency = 1
        TitleLabel.Position = UDim2.new(0, 5, 0, 5)
        TitleLabel.Size = UDim2.new(0, 190, 0, 20)
        TitleLabel.Text = title
        TitleLabel.TextColor3 = Library.Theme.TextColor
        TitleLabel.Font = Library.Theme.TextFont
        TitleLabel.TextSize = 14
        TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        local MessageLabel = Instance.new("TextLabel")
        MessageLabel.Parent = NotificationFrame
        MessageLabel.BackgroundTransparency = 1
        MessageLabel.Position = UDim2.new(0, 5, 0, 25)
        MessageLabel.Size = UDim2.new(0, 190, 0, 20)
        MessageLabel.Text = message
        MessageLabel.TextColor3 = Library.Theme.TextColor
        MessageLabel.Font = Library.Theme.TextFont
        MessageLabel.TextSize = 12
        MessageLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        table.insert(Library.ActiveNotifications, NotificationFrame)
        table.insert(Library.LibraryColorTable, NotificationFrame)
        table.insert(Library.LibraryColorTable, TitleLabel)
        table.insert(Library.LibraryColorTable, MessageLabel)
        
        for i, notif in pairs(Library.ActiveNotifications) do
            TweenService:Create(notif, TweenInfo.new(0.3, Enum.EasingStyle.Sine), {
                Position = UDim2.new(1, -210, 1, -60 - (i * 60))
            }):Play()
        end
        spawn(function()
            wait(duration or 5)
            local index = table.find(Library.ActiveNotifications, NotificationFrame)
            if index then
                table.remove(Library.ActiveNotifications, index)
                TweenService:Create(NotificationFrame, TweenInfo.new(0.3, Library.Theme.EasingStyle), {
                    Position = UDim2.new(1, 0, NotificationFrame.Position.Y.Scale, NotificationFrame.Position.Y.Offset)
                }):Play()
                wait(0.3)
                NotificationFrame:Destroy()
                for i, notif in pairs(Library.ActiveNotifications) do
                    TweenService:Create(notif, TweenInfo.new(0.3, Enum.EasingStyle.Sine), {
                        Position = UDim2.new(1, -210, 1, -60 - (i * 60))
                    }):Play()
                end
            end
        end)
        
        UpdateColors()
    end
    
    return TabElements
end

UpdateColors()

return Library