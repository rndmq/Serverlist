local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local Library = {
    Theme = {
        TabColor = Color3.fromRGB(0, 0, 0), -- Warna tab hitam
        SectionColor = Color3.fromRGB(50, 50, 50), -- Warna section abu-abu
        TextColor = Color3.fromRGB(255, 255, 255),
        TextFont = Enum.Font.SourceSansBold,
        EasingStyle = Enum.EasingStyle.Quart
    },
    TabCount = 0,
    LibraryColorTable = {},
    ActiveNotifications = {}
}

local function UpdateColors()
    for _, obj in pairs(Library.LibraryColorTable) do
        if obj:IsA("ImageLabel") then
            if obj.Name == "TabButton" then
                obj.ImageColor3 = Library.Theme.TabColor
            elseif obj.Name:find("Section") then
                obj.ImageColor3 = Library.Theme.SectionColor
            end
        elseif obj:IsA("TextLabel") or obj:IsA("TextButton") then
            obj.TextColor3 = Library.Theme.TextColor
        end
    end
end

local UILibrary = Instance.new("ScreenGui")
UILibrary.Name = "FloatingGUI"
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
    TabFrame.Size = UDim2.new(0, 200, 0, 40)
    TabFrame.LayoutOrder = Library.TabCount
    
    local TabButton = Instance.new("ImageLabel")
    TabButton.Name = "TabButton"
    TabButton.Parent = TabFrame
    TabButton.BackgroundTransparency = 1
    TabButton.Size = UDim2.new(1, 0, 1, 0)
    TabButton.Image = "rbxassetid://3570695787"
    TabButton.ImageColor3 = Library.Theme.TabColor
    TabButton.ScaleType = Enum.ScaleType.Slice
    TabButton.SliceCenter = Rect.new(100, 100, 100, 100)
    TabButton.SliceScale = 0.050
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = TabButton
    
    local TabTitle = Instance.new("TextLabel")
    TabTitle.Parent = TabButton
    TabTitle.BackgroundTransparency = 1
    TabTitle.Size = UDim2.new(1, -30, 1, 0)
    TabTitle.Position = UDim2.new(0, 10, 0, 0)
    TabTitle.Text = name
    TabTitle.TextColor3 = Library.Theme.TextColor
    TabTitle.Font = Library.Theme.TextFont
    TabTitle.TextSize = 16
    TabTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    local ToggleButton = Instance.new("TextButton")
    ToggleButton.Parent = TabButton
    ToggleButton.BackgroundTransparency = 1
    ToggleButton.Position = UDim2.new(1, -20, 0, 0)
    ToggleButton.Size = UDim2.new(0, 20, 0, 20)
    ToggleButton.Text = "↓"
    ToggleButton.TextColor3 = Library.Theme.TextColor
    ToggleButton.Font = Library.Theme.TextFont
    ToggleButton.TextSize = 16
    
    local SectionsFrame = Instance.new("Frame")
    SectionsFrame.Name = "Sections"
    SectionsFrame.Parent = TabFrame
    SectionsFrame.BackgroundTransparency = 1
    SectionsFrame.Position = UDim2.new(0, 0, 1, 0)
    SectionsFrame.Size = UDim2.new(0, 200, 0, 0)
    
    local SectionLayout = Instance.new("UIListLayout")
    SectionLayout.Parent = SectionsFrame
    SectionLayout.SortOrder = Enum.SortOrder.LayoutOrder
    SectionLayout.Padding = UDim.new(0, 5)
    
    local minimized = true
    
    table.insert(Library.LibraryColorTable, TabButton)
    table.insert(Library.LibraryColorTable, TabTitle)
    table.insert(Library.LibraryColorTable, ToggleButton)
    
    local function ToggleMinimize()
        minimized = not minimized
        if minimized then
            TweenService:Create(SectionsFrame, TweenInfo.new(0.3, Library.Theme.EasingStyle), {
                Size = UDim2.new(0, 200, 0, 0)
            }):Play()
            ToggleButton.Text = "↓"
        else
            TweenService:Create(SectionsFrame, TweenInfo.new(0.3, Library.Theme.EasingStyle), {
                Size = UDim2.new(0, 200, 0, SectionLayout.AbsoluteContentSize.Y + 5)
            }):Play()
            ToggleButton.Text = "↑"
        end
    end
    
    ToggleButton.MouseButton1Click:Connect(ToggleMinimize)
    MakeDraggable(TabButton)
    
    UpdateColors()
    
    local TabElements = {}
    
    function TabElements:CreateSection(name)
        local SectionFrame = Instance.new("ImageLabel")
        SectionFrame.Name = name .. "Section"
        SectionFrame.Parent = SectionsFrame
        SectionFrame.BackgroundTransparency = 1
        SectionFrame.Size = UDim2.new(0, 200, 0, 30)
        SectionFrame.Image = "rbxassetid://3570695787"
        SectionFrame.ImageColor3 = Library.Theme.SectionColor
        SectionFrame.ScaleType = Enum.ScaleType.Slice
        SectionFrame.SliceCenter = Rect.new(100, 100, 100, 100)
        SectionFrame.SliceScale = 0.050
        
        local Corner = Instance.new("UICorner")
        Corner.CornerRadius = UDim.new(0, 8)
        Corner.Parent = SectionFrame
        
        local SectionTitle = Instance.new("TextLabel")
        SectionTitle.Parent = SectionFrame
        SectionTitle.BackgroundTransparency = 1
        SectionTitle.Size = UDim2.new(1, -30, 0, 30)
        SectionTitle.Position = UDim2.new(0, 10, 0, 0)
        SectionTitle.Text = name
        SectionTitle.TextColor3 = Library.Theme.TextColor
        SectionTitle.Font = Library.Theme.TextFont
        SectionTitle.TextSize = 14
        SectionTitle.TextXAlignment = Enum.TextXAlignment.Left
        
        local ToggleButton = Instance.new("TextButton")
        ToggleButton.Parent = SectionFrame
        ToggleButton.BackgroundTransparency = 1
        ToggleButton.Position = UDim2.new(1, -20, 0, 0)
        ToggleButton.Size = UDim2.new(0, 20, 0, 20)
        ToggleButton.Text = "↓"
        ToggleButton.TextColor3 = Library.Theme.TextColor
        ToggleButton.Font = Library.Theme.TextFont
        ToggleButton.TextSize = 16
        
        local ContentFrame = Instance.new("Frame")
        ContentFrame.Parent = SectionFrame
        ContentFrame.BackgroundTransparency = 1
        ContentFrame.Position = UDim2.new(0, 0, 0, 30)
        ContentFrame.Size = UDim2.new(0, 200, 0, 0)
        
        local ContentLayout = Instance.new("UIListLayout")
        ContentLayout.Parent = ContentFrame
        ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
        ContentLayout.Padding = UDim.new(0, 5)
        
        local minimized = true
        
        table.insert(Library.LibraryColorTable, SectionFrame)
        table.insert(Library.LibraryColorTable, SectionTitle)
        table.insert(Library.LibraryColorTable, ToggleButton)
        
        local function ToggleSection()
            minimized = not minimized
            if minimized then
                TweenService:Create(ContentFrame, TweenInfo.new(0.3, Library.Theme.EasingStyle), {
                    Size = UDim2.new(0, 200, 0, 0)
                }):Play()
                ToggleButton.Text = "↓"
            else
                TweenService:Create(ContentFrame, TweenInfo.new(0.3, Library.Theme.EasingStyle), {
                    Size = UDim2.new(0, 200, 0, ContentLayout.AbsoluteContentSize.Y + 5)
                }):Play()
                ToggleButton.Text = "↑"
            end
        end
        
        ToggleButton.MouseButton1Click:Connect(ToggleSection)
        
        local SectionElements = {}
        
        function SectionElements:CreateButton(name, callback)
            local Button = Instance.new("TextButton")
            Button.Parent = ContentFrame
            Button.BackgroundColor3 = Library.Theme.MainColor
            Button.Size = UDim2.new(0, 180, 0, 25)
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
        
        function SectionElements:CreateTextBox(name, default, callback)
            local TextBoxFrame = Instance.new("Frame")
            TextBoxFrame.Parent = ContentFrame
            TextBoxFrame.BackgroundTransparency = 1
            TextBoxFrame.Size = UDim2.new(0, 200, 0, 25)
            
            local TextBoxLabel = Instance.new("TextLabel")
            TextBoxLabel.Parent = TextBoxFrame
            TextBoxLabel.BackgroundTransparency = 1
            TextBoxLabel.Size = UDim2.new(0, 150, 1, 0)
            TextBoxLabel.Position = UDim2.new(0, 10, 0, 0)
            TextBoxLabel.Text = name
            TextBoxLabel.TextColor3 = Library.Theme.TextColor
            TextBoxLabel.Font = Library.Theme.TextFont
            TextBoxLabel.TextSize = 14
            TextBoxLabel.TextXAlignment = Enum.TextXAlignment.Left
            
            local TextBoxInput = Instance.new("TextBox")
            TextBoxInput.Parent = TextBoxFrame
            TextBoxInput.BackgroundColor3 = Library.Theme.SectionColor
            TextBoxInput.Size = UDim2.new(0, 40, 0, 20)
            TextBoxInput.Position = UDim2.new(1, -50, 0, 2)
            TextBoxInput.Text = default or ""
            TextBoxInput.TextColor3 = Library.Theme.TextColor
            TextBoxInput.Font = Library.Theme.TextFont
            TextBoxInput.TextSize = 14
            
            local Corner = Instance.new("UICorner")
            Corner.CornerRadius = UDim.new(0, 8)
            Corner.Parent = TextBoxInput
            
            TextBoxInput.FocusLost:Connect(function(enterPressed)
                callback(TextBoxInput.Text, enterPressed)
            end)
            
            table.insert(Library.LibraryColorTable, TextBoxLabel)
            table.insert(Library.LibraryColorTable, TextBoxInput)
            UpdateColors()
            ToggleSection()
        end
        
        function SectionElements:CreateToggle(name, default, callback)
            local ToggleFrame = Instance.new("Frame")
            ToggleFrame.Parent = ContentFrame
            ToggleFrame.BackgroundTransparency = 1
            ToggleFrame.Size = UDim2.new(0, 200, 0, 25)
            ToggleFrame.Toggled = default or false
            
            local ToggleTitle = Instance.new("TextLabel")
            ToggleTitle.Name = "ToggleTitle"
            ToggleTitle.Parent = ToggleFrame
            ToggleTitle.BackgroundTransparency = 1
            ToggleTitle.Size = UDim2.new(0, 170, 1, 0)
            ToggleTitle.Position = UDim2.new(0, 10, 0, 0)
            ToggleTitle.Text = name
            ToggleTitle.TextColor3 = ToggleFrame.Toggled and Library.Theme.TextColor or Library.Theme.TextColor
            ToggleTitle.Font = Library.Theme.TextFont
            ToggleTitle.TextSize = 14
            ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left
            
            local ToggleCircle = Instance.new("Frame")
            ToggleCircle.Name = "ToggleCircle"
            ToggleCircle.Parent = ToggleFrame
            ToggleCircle.Position = UDim2.new(1, -25, 0, 5)
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
            DropdownFrame.Size = UDim2.new(0, 200, 0, 25)
            
            local TitleToggle = Instance.new("TextButton")
            TitleToggle.Parent = DropdownFrame
            TitleToggle.BackgroundTransparency = 1
            TitleToggle.Size = UDim2.new(1, -20, 0, 25)
            TitleToggle.Position = UDim2.new(0, 10, 0, 0)
            TitleToggle.Text = name .. " "
            TitleToggle.TextColor3 = Library.Theme.TextColor
            TitleToggle.Font = Library.Theme.TextFont
            TitleToggle.TextSize = 14
            TitleToggle.TextXAlignment = Enum.TextXAlignment.Left
            
            local DropdownArrow = Instance.new("TextLabel")
            DropdownArrow.Parent = TitleToggle
            DropdownArrow.BackgroundTransparency = 1
            DropdownArrow.Size = UDim2.new(0, 20, 1, 0)
            DropdownArrow.Position = UDim2.new(1, 0, 0, 0)
            DropdownArrow.Text = ">"
            DropdownArrow.TextColor3 = Library.Theme.TextColor
            DropdownArrow.Font = Library.Theme.TextFont
            DropdownArrow.TextSize = 14
            DropdownArrow.TextXAlignment = Enum.TextXAlignment.Right
            
            local DropdownContent = Instance.new("ImageLabel")
            DropdownContent.Parent = DropdownFrame
            DropdownContent.BackgroundTransparency = 1
            DropdownContent.Position = UDim2.new(0, 0, 1, 0)
            DropdownContent.Size = UDim2.new(0, 200, 0, 0)
            DropdownContent.Image = "rbxassetid://3570695787"
            DropdownContent.ImageColor3 = Library.Theme.SectionColor
            DropdownContent.ScaleType = Enum.ScaleType.Slice
            DropdownContent.SliceCenter = Rect.new(100, 100, 100, 100)
            DropdownContent.SliceScale = 0.050
            DropdownContent.ClipsDescendants = true
            
            local DropdownLayout = Instance.new("UIListLayout")
            DropdownLayout.Parent = DropdownContent
            DropdownLayout.SortOrder = Enum.SortOrder.LayoutOrder
            
            local selectedOption = options[presetoption] or options[1]
            TitleToggle.Text = name .. " " .. selectedOption
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
                    OptionButton.Size = UDim2.new(0, 180, 0, 20)
                    OptionButton.Position = UDim2.new(0, 10, 0, 0)
                    OptionButton.Text = option
                    OptionButton.TextColor3 = option == selectedOption and Library.Theme.MainColor or Library.Theme.TextColor
                    OptionButton.Font = Library.Theme.TextFont
                    OptionButton.TextSize = 14
                    OptionButton.Selected = option == selectedOption
                    
                    local ClickArea = Instance.new("TextButton")
                    ClickArea.Parent = OptionButton
                    ClickArea.BackgroundTransparency = 1
                    ClickArea.Size = UDim2.new(0, OptionButton.TextBounds.X + 10, 1, 0)
                    ClickArea.Position = UDim2.new(0, 0, 0, 0)
                    ClickArea.Text = ""
                    ClickArea.ZIndex = OptionButton.ZIndex + 1
                    
                    ClickArea.MouseButton1Click:Connect(function()
                        selectedOption = option
                        TitleToggle.Text = name .. " " .. selectedOption
                        callback(selectedOption)
                        toggled = false
                        TweenService:Create(DropdownContent, TweenInfo.new(0.3, Library.Theme.EasingStyle), {
                            Size = UDim2.new(0, 200, 0, 0)
                        }):Play()
                        for _, btn in pairs(DropdownContent:GetChildren()) do
                            if btn:IsA("TextButton") and btn.Name == "DropdownOption" then
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
                        Size = UDim2.new(0, 200, 0, #options * 20)
                    }):Play()
                else
                    TweenService:Create(DropdownContent, TweenInfo.new(0.3, Library.Theme.EasingStyle), {
                        Size = UDim2.new(0, 200, 0, 0)
                    }):Play()
                end
                ToggleSection()
            end)
            
            table.insert(Library.LibraryColorTable, TitleToggle)
            table.insert(Library.LibraryColorTable, DropdownArrow)
            table.insert(Library.LibraryColorTable, DropdownContent)
            UpdateColors()
            callback(selectedOption)
            ToggleSection()
        end
        
        function SectionElements:CreateSlider(name, min, max, default, callback)
            local SliderFrame = Instance.new("Frame")
            SliderFrame.Parent = ContentFrame
            SliderFrame.BackgroundTransparency = 1
            SliderFrame.Size = UDim2.new(0, 200, 0, 25)
            
            local SliderLabel = Instance.new("TextLabel")
            SliderLabel.Parent = SliderFrame
            SliderLabel.BackgroundTransparency = 1
            SliderLabel.Size = UDim2.new(0, 150, 1, 0)
            SliderLabel.Position = UDim2.new(0, 10, 0, 0)
            SliderLabel.Text = name .. " "
            SliderLabel.TextColor3 = Library.Theme.TextColor
            SliderLabel.Font = Library.Theme.TextFont
            SliderLabel.TextSize = 14
            SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
            
            local SliderValue = Instance.new("TextLabel")
            SliderValue.Parent = SliderFrame
            SliderValue.BackgroundTransparency = 1
            SliderValue.Size = UDim2.new(0, 40, 1, 0)
            SliderValue.Position = UDim2.new(1, -50, 0, 0)
            SliderValue.Text = tostring(default or min)
            SliderValue.TextColor3 = Library.Theme.TextColor
            SliderValue.Font = Library.Theme.TextFont
            SliderValue.TextSize = 14
            SliderValue.TextXAlignment = Enum.TextXAlignment.Right
            
            local SliderBar = Instance.new("Frame")
            SliderBar.Parent = SliderFrame
            SliderBar.BackgroundColor3 = Library.Theme.SectionColor
            SliderBar.Size = UDim2.new(0, 180, 0, 5)
            SliderBar.Position = UDim2.new(0, 10, 0, 20)
            
            local Corner = Instance.new("UICorner")
            Corner.CornerRadius = UDim.new(0, 2)
            Corner.Parent = SliderBar
            
            local SliderFill = Instance.new("Frame")
            SliderFill.Parent = SliderBar
            SliderFill.BackgroundColor3 = Library.Theme.MainColor
            SliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
            SliderFill.BorderSizePixel = 0
            
            local CornerFill = Instance.new("UICorner")
            CornerFill.CornerRadius = UDim.new(0, 2)
            CornerFill.Parent = SliderFill
            
            local SliderHandle = Instance.new("Frame")
            SliderHandle.Parent = SliderFill
            SliderHandle.BackgroundColor3 = Library.Theme.TextColor
            SliderHandle.Size = UDim2.new(0, 10, 0, 15)
            SliderHandle.Position = UDim2.new(1, -5, -0.5, -5)
            
            local CornerHandle = Instance.new("UICorner")
            CornerHandle.CornerRadius = UDim.new(1, 0)
            CornerHandle.Parent = SliderHandle
            
            local dragging = false
            local function UpdateSlider(input)
                local sizeX = math.clamp((input.Position.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1)
                local value = math.floor(min + (max - min) * sizeX)
                SliderFill.Size = UDim2.new(sizeX, 0, 1, 0)
                SliderValue.Text = tostring(value)
                callback(value)
            end
            
            SliderHandle.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = true
                end
            end)
            
            SliderHandle.InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                    UpdateSlider(input)
                end
            end)
            
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                end
            end)
            
            table.insert(Library.LibraryColorTable, SliderLabel)
            table.insert(Library.LibraryColorTable, SliderValue)
            table.insert(Library.LibraryColorTable, SliderBar)
            table.insert(Library.LibraryColorTable, SliderFill)
            table.insert(Library.LibraryColorTable, SliderHandle)
            UpdateColors()
            ToggleSection()
        end
        
        function SectionElements:CreatePicker(name, default, callback)
            local PickerFrame = Instance.new("Frame")
            PickerFrame.Parent = ContentFrame
            PickerFrame.BackgroundTransparency = 1
            PickerFrame.Size = UDim2.new(0, 200, 0, 25)
            
            local PickerLabel = Instance.new("TextLabel")
            PickerLabel.Parent = PickerFrame
            PickerLabel.BackgroundTransparency = 1
            PickerLabel.Size = UDim2.new(0, 170, 1, 0)
            PickerLabel.Position = UDim2.new(0, 10, 0, 0)
            PickerLabel.Text = name .. " "
            PickerLabel.TextColor3 = Library.Theme.TextColor
            PickerLabel.Font = Library.Theme.TextFont
            PickerLabel.TextSize = 14
            PickerLabel.TextXAlignment = Enum.TextXAlignment.Left
            
            local PickerButton = Instance.new("TextButton")
            PickerButton.Parent = PickerFrame
            PickerButton.BackgroundColor3 = default or Color3.fromRGB(255, 255, 255)
            PickerButton.Size = UDim2.new(0, 20, 0, 20)
            PickerButton.Position = UDim2.new(1, -30, 0, 2)
            
            local Corner = Instance.new("UICorner")
            Corner.CornerRadius = UDim.new(0, 8)
            Corner.Parent = PickerButton
            
            PickerButton.MouseButton1Click:Connect(function()
                local newColor = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
                PickerButton.BackgroundColor3 = newColor
                callback(newColor)
            end)
            
            table.insert(Library.LibraryColorTable, PickerLabel)
            table.insert(Library.LibraryColorTable, PickerButton)
            UpdateColors()
            ToggleSection()
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