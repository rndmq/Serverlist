# For github Moderation:
## This repository contains a list of servers used for UI-related purposes in a Roblox game. 
## The files included here do not contain any malicious content, exploits, cheats, or any code that violates Roblox’s Terms of Service.

## This repository is solely intended for managing and listing available servers.
## No scripts in this repository provide unauthorized advantages, hacks, or manipulations of Roblox’s system.
## All files are structured in a way that complies with Roblox’s guidelines and policies.

### Epic UI:
```lua
getgenv().Color = "default"
getgenv().TextColor = "default"
loadstring(game:HttpGet("https://raw.githubusercontent.com/rndmq/Serverlist/refs/heads/main/Loader"))()
```
Documentation:
```lua

getgenv().Color = "default" --[[white,black, brown,green,cyan,blue,pink,purple,red,yellow,orange ]]--
getgenv().TextColor = "default" --[[ rgb,white,black, brown,green,cyan,blue,pink,purple,red,yellow,orange ]]--
getgenv().Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/rndmq/Serverlist/refs/heads/main/source.lua.txt"))()
local whateveryoulikehere = getgenv().Lib
↑ Change into any name you like.

Tab:
Library:CreateTab(string name)

Section:
Tab:CreateSection(string name)

Label:
Section:CreateLabel(string name, string text, function (don't add this if no any function), {holdColor = true/false})
ChangeText(string name, string text) -- no anim
Label.Refresh(strung name, string text) -- fade out
ex:
local label3 = Section:CreateLabel("HoldLabel", "Hold me!", function()
print("Clicked label 3!")
end, {holdColor = true})

Button:
Section:CreateButton(string name, function callback)

Toggle:
Section:CreateToggle(string name, function callback, string tooltip(optional))

Slider:
Section:CreateSlider(string name, int minvalue, int maxvalue, int presetvalue, bool precisemode, function callback)

Color Picker:
Section:CreateColorPicker(string name, color3 presetcolor, function callback)

Dropdown:
Section:CreateDropdown(string name, table options, int presetoption, function callback)

dropdown.Refresh(newOptions, newPresetOption, newCallback)

MultiDropdown:
Section:CreateMultiDropdown(string name, table options, number minSelect, number maxSelect, table presetOptions, function callback)

Keybind:
Section:CreateKeybind(string name, enum presetkeycode, bool keyboardonly, bool holdmode, function callback)

Textbox:
Section:CreateTextBox(string name, number characterLimit, string placeholderText, function callback)

Notification:
Library:CreateNotification(string title, string message, number duration, table buttonTexts (max 5), function buttonCallback)
```
