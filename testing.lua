local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "unknowns scripthub",
   LoadingTitle = "Loading Script Hub",
   LoadingSubtitle = "By mrbest6317",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Player Changer"
   },
   Discord = {
      Enabled = true,
      Invite = "AU4CnDTbxt", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("Main", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Main")

Rayfield:Notify({
   Title = "Executed The Script Successfully",
   Content = "A Good Script Hub",
   Duration = 5,
   Image = nil,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay!",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})


local Button = MainTab:CreateButton({
   Name = "Rebirth legends",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/rndmq/Serverlist/refs/heads/main/Server1"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "anime lootify",
   Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/Hj3BHdan"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Doors Vynixius Hub",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Doors/Script.lua"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Shark Bite 2 Pearl Hub",
   Callback = function()
        loadstring(game:HttpGet('https://ppearl.vercel.app'))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Notoriety Requiem",
   Callback = function()
        loadstring(game:HttpGet("https://scriptblox.com/raw/RUSH-HOUR-Notoriety-Requiem-Evolution-11364"))()
   end,
})


local Button = MainTab:CreateButton({
   Name = "Destruction Simulator Aqua Modz",
   Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/AquaModz/DestructionSIMModded/main/DestructionSimAqua.lua'))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "snipers",
   Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/fwRPNCxW"))()
   end,
})

if game.PlaceId == 2607868379 then -- Arsenal
    local Tab = Window:CreateTab("Arsenal") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "Arsenal",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/ex55/weed-client/refs/heads/main/main.lua"))()
       end,
    })

elseif game.PlaceId == 6261586777 then -- Piggy
    local Tab = Window:CreateTab("Piggy") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "Piggy",
       Callback = function()
       loadstring(game:HttpGet('https://raw.githubusercontent.com/anandadefa/Loader/refs/heads/main/loader.lua'))()
       end,
    })

elseif game.PlaceId == 366400023 then -- Tower of Hell
    local Tab = Window:CreateTab("Tower of Hell") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "Another Hub",
       Callback = function()
       loadstring(game:HttpGet("https://anotherhub.agency/script/loader.lua"))() 
       end,
    })
    local Button = Tab:CreateButton({
       Name = "Pulse Hub",
       Callback = function()
       -- Made by Pulse Hub Team
loadstring(game:HttpGet("https://raw.githubusercontent.com/Mochimochi12321/Loader/refs/heads/main/newloader"))()
       end,
    })
elseif game.PlaceId == 417215597 then -- Murder Mystery 2
    local Tab = Window:CreateTab("Murder Mystery 2") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "Forge Hub",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/Skzuppy/forge-hub/main/loader.lua"))()
       end,
    })

elseif game.PlaceId == 6152642114 then -- Shindo Life
    local Tab = Window:CreateTab("Shindo Life") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "ImpHub",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/alan11ago/Hub/refs/heads/main/ImpHub.lua"))()
       end,
    })
    local Button = Tab:CreateButton({
       Name = "Auto farm",
       Callback = function()
       loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ahmadsgamer2/Script--Game/main/Script%20Game"))()
       end,
    })

elseif game.PlaceId == 8238266136 then -- BedWars
    local Tab = Window:CreateTab("BedWars") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "Aurora Hub",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/cocotv666/Aurora/main/Aurora_Loader"))()
       end,
    })

elseif game.PlaceId == 243360221 then -- Dungeon Quest
    local Tab = Window:CreateTab("Dungeon Quest") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "Dungeon Quest",
       Callback = function()
       loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI'))()
       end,
    })
elseif game.PlaceId == 303427120 then -- Jailbreak
    local Tab = Window:CreateTab("Jailbreak") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "cata hub",
       Callback = function()
       loadstring(game:HttpGet('https://weinzspace.com/cata/hub.lua'))()
       end,
    })

elseif game.PlaceId == 4894412858 then -- Breaking Point
    local Tab = Window:CreateTab("Breaking Point") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "JailBreak",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/devil-sbeakingpointgui/main/main"))();
       end,
    })

elseif game.PlaceId == 763106014 then -- Natural Disaster Survival
    local Tab = Window:CreateTab("Natural Disaster Survival") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "ZeeroxHub",
       Callback = function()
       loadstring(game:HttpGet'https://raw.githubusercontent.com/RunDTM/ZeeroxHub/main/Loader.lua')()
       end,
    })

elseif game.PlaceId == 1658616937 then -- Flee the Facility
    local Tab = Window:CreateTab("Flee the Facility") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "Spimine",
       Callback = function()
       loadstring(game:HttpGet('https://raw.githubusercontent.com/antisocialb2/SPIMINE-FLEETHEFACILITY/main/script.lua'))()
       end,
    })

elseif game.PlaceId == 142823291 then -- Speed Run 4
    local Tab = Window:CreateTab("Speed Run 4") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "Dragonismcode",
       Callback = function()
       loadstring(game:HttpGet(('https://raw.githubusercontent.com/dragonismcode/robloxscripts/main/speedrun4.lua'), true))()
       
       end,
    })

elseif game.PlaceId == 4878686481 then -- Bee Swarm Simulator
    local Tab = Window:CreateTab("Bee Swarm Simulator") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "VerbalHub",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/VerbalHubz/Verbal-Hub/refs/heads/main/Bee%20Swarm%20Sim.Lua",true))()
       end,
    })
    local Button = Tab:CreateButton({
       Name = "kronhub",
       Callback = function()
       loadstring(game:HttpGet('https://raw.githubusercontent.com/DevKron/Kron_Hub/refs/heads/main/version_1.0'))
       end,
    })
    local Button = Tab:CreateButton({
       Name = "atlasHub",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/Chris8889/atlasbss/main/script.lua"))()
       end,
    })
    local Button = Tab:CreateButton({
       Name = "HistyHub",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/raw/main/Histy"))() 
       end,
    })

elseif game.PlaceId == 153769602 then -- Super Bomb Survival
    local Tab = Window:CreateTab("Super Bomb Survival") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "Super Bomb",
       Callback = function()
       loadstring(game:HttpGet("https://pastebin.com/raw/8gqCXFsw"))()
       end,
    })

elseif game.PlaceId == 758099204 then -- Escape Room
    local Tab = Window:CreateTab("Escape Room") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "Button Example",
       Callback = function()
       end,
    })

elseif game.PlaceId == 3707403478 then -- Murder Mystery X
    local Tab = Window:CreateTab("Murder Mystery X") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "XHub",
       Callback = function()      
loadstring(game:HttpGet("https://raw.githubusercontent.com/Au0yX/Community/main/XhubMM2"))()
       end,
    })

elseif game.PlaceId == 4519342333 then -- Lumber Tycoon 2
    local Tab = Window:CreateTab("Lumber Tycoon 2") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "lua ware",
       Callback = function()
       loadstring(game:HttpGet('https://raw.githubusercontent.com/frencaliber/LuaWareLoader.lw/main/luawareloader.wtf',true))()
       end,
    })
     local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "DarkX",
       Callback = function()
       loadstring(game:HttpGet"https://raw.githubusercontent.com/darkxwin/darkxsourcethinkyoutousedarkx/main/darkx")()
       end,
    })

elseif game.PlaceId == 2331414739 then -- MeepCity
    local Tab = Window:CreateTab("MeepCity") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "MeepCity",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraScript/Script/main/MeepCity"))()
       end,
    })

elseif game.PlaceId == 3482120195 then -- Ninja Legends
    local Tab = Window:CreateTab("Ninja Legends") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "Proxima Hub",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/TrixAde/Proxima-Hub/main/Main.lua"))()       
       end,
    })

elseif game.PlaceId == 1000012865 then -- Blox Hunt
    local Tab = Window:CreateTab("Blox Hunt") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "Blox Hunt",
       Callback = function()

 loadstring(game:HttpGet("https://pastebin.com/raw/wJw57ccR"))()
       end,
    })

elseif game.PlaceId == 1367362135 then -- Restaurant Tycoon 2
    local Tab = Window:CreateTab("Restaurant Tycoon 2") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "Zeid Hub",
       Callback = function()
       loadstring(game:HttpGet('https://raw.githubusercontent.com/iz037/Zeld-Hub/main/Script/Restaurant%20Tycoon%202.lua'))()
       end,
    })

elseif game.PlaceId == 1427581585 then -- Tower Defense Simulator
    local Tab = Window:CreateTab("Tower Defense Simulator") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "Demonic Hub",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/Prosexy/Demonic-HUB-V2/main/DemonicHub_V2.lua", true))()
       end,
    })

elseif game.PlaceId == 383535367 then -- Theme Park Tycoon 2
    local Tab = Window:CreateTab("Theme Park Tycoon 2") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "ParadiseHub",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/Valenity/ParadiseHub-Open-Source/main/loader"))()
       end,
    })

elseif game.PlaceId == 176332526 then -- Work at a Pizza Place
    local Tab = Window:CreateTab("Work at a Pizza Place") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "LDS Hub",
       Callback = function()
       loadstring(game:HttpGet('https://api.luarmor.net/files/v3/loaders/49f02b0d8c1f60207c84ae76e12abc1e.lua'))()
       end,
    })
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "Work at pizza plaze",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/Scripting-Gods/Monkeys/main/Monkeys/WAPP.lua")()
       end,
    })

elseif game.PlaceId == 586749480 then -- Vehicle Legends
    local Tab = Window:CreateTab("Vehicle Legends") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "MarcoHub",
       Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/Vehicle%20legends"))()

       end,
    })

elseif game.PlaceId == 278742457 then -- Epic Minigames
    local Tab = Window:CreateTab("Epic Minigames") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "Epic Minigames",
       Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/SlamminPig/rblxgames/main/Epic%20Minigames/EpicMinigamesGUI"))()
       end,
    })

elseif game.PlaceId == 191413249 then -- Flood Escape 2
    local Tab = Window:CreateTab("Flood Escape 2") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "Flood escape 2",
       Callback = function()
       loadstring(game:HttpGet('https://raw.githubusercontent.com/Ruinins/scripts/main/Multiple%20scripts%20for%20FE2'))()
       end,
    })

elseif game.PlaceId == 167648520 then -- Mining Simulator 2
    local Tab = Window:CreateTab("Mining Simulator 2") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "Synta Hub",
       Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/DareQPlaysRBX/SYNTA-HUB/main/SYNTAHUB.lua"))()
       end,
    })

elseif game.PlaceId == 631892440 then -- Build A Boat For Treasure
    local Tab = Window:CreateTab("Build A Boat For Treasure") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "1201for",
       Callback = function()
       loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/littlegui/main/Build-A-Boat'))()
       end,
    })
    local Button = Tab:CreateButton({
       Name = "artherHub",
       Callback = function()
       loadstring(game:HttpGet('https://api.luarmor.net/files/v3/loaders/2529a5f9dfddd5523ca4e22f21cceffa.lua'))()
       end,
    })
    local Button = Tab:CreateButton({
       Name = "autoBuild",
       Callback = function()
       loadstring(game:HttpGet(("https://raw.githubusercontent.com/catblox1346/StensUIReMake/main/Script/StensUIRemakev2.0.0"),true))()
       end,
    })

elseif game.PlaceId == 173087702 then -- Ninja Legends 2
    local Tab = Window:CreateTab("Ninja Legends 2") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "HiraHub",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/Stochalt/HiraganaDev-Hub/main/HiraHub.lua"))()
       end,
    })

elseif game.PlaceId == 194190221 then -- Super Power Fighting Simulator
    local Tab = Window:CreateTab("Super Power Fighting Simulator") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "Antonis",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/ExtremeAntonis/KeySystemUI/main/KeySystemUI-Obfuscated.lua"))()
       
       end,
    })
    local Button = Tab:CreateButton({
       Name = "prodoka",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/Podroka626/Scripts/main/Loader"))()
       end,
    })

elseif game.PlaceId == 195498200 then -- Dragon Adventures
    local Tab = Window:CreateTab("Dragon Adventures") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "ImpHub",
       Callback = function()
       loadstring(game:HttpGet('https://raw.githubusercontent.com/alan11ago/Hub/refs/heads/main/ImpHub.lua'))()
       end,
    })
    local Button = Tab:CreateButton({
       Name = "NeuronHub",
       Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Yumiara/Python/main/Main.lua"))(); 
       end,
    })

elseif game.PlaceId == 467313030 then -- Zombie Attack
    local Tab = Window:CreateTab("Zombie Attack") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "CrazyFui",
       Callback = function()
       loadstring(game:HttpGet('https://raw.githubusercontent.com/crazyfuy/ghost-hub/main/Loader.lua'))()
       end,
    })
    local Button = Tab:CreateButton({
       Name = "GhostHub",
       Callback = function()
loadstring(game:HttpGet('https://ghost-storage.7m.pl/scripts/ghosthublauncher.lua'))()
-- Credits to Source Code Owner
       end,
    })

elseif game.PlaceId == 4546769788 then -- King Legacy
    local Tab = Window:CreateTab("King Legacy") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "TsuoHub",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/Tsuo7/TsuoHub/main/king%20legacy"))()
       end,
    })
    local Button = Tab:CreateButton({
       Name = "arcHub",
       Callback = function()
       getgenv().CustomDistance = 10
loadstring(game:HttpGet("https://raw.githubusercontent.com/ChopLoris/ArcHub/main/main.lua"))()
       end,
    })
    local Button = Tab:CreateButton({
       Name = "ZeeHub",
       Callback = function()
       loadstring(game:HttpGet('https://zuwz.me/Ls-Zee-Hub-KL'))() 
       end,
    })
    local Button = Tab:CreateButton({
       Name = "HulkHub",
       Callback = function()
       loadstring(game:HttpGet"https://raw.githubusercontent.com/HULKUexe/mobileX/main/FreeScript.lua")() 
       end,
    })

elseif game.PlaceId == 149300737 then -- Prison Life
    local Tab = Window:CreateTab("Prison Life") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "Nexus Hub",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/GwnStefano/NexusHub/main/Main", true))()
       end,
    })
    local Button = Tab:CreateButton({
       Name = "AdminFe",
       Callback = function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/XTheMasterX/Scripts/Main/PrisonLife'),true))()
       end,
    })

elseif game.PlaceId == 206702380 then -- SharkBite
    local Tab = Window:CreateTab("SharkBite") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "Sharkbite,
       Callback = function()
       --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
loadstring(game:HttpGet(('https://raw.githubusercontent.com/Luces245434/script/main/sharkbite2')))()
       end,
    })

elseif game.PlaceId == 2840070148 then -- Time Travel Adventures
    local Tab = Window:CreateTab("Time Travel Adventures") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "Button Example",
       Callback = function()
       end,
    })

elseif game.PlaceId == 6053088507 then -- Superhero Tycoon
    local Tab = Window:CreateTab("Superhero Tycoon") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "Button Example",
       Callback = function()
       end,
    })

elseif game.PlaceId == 2552494531 then -- Pet Simulator X
    local Tab = Window:CreateTab("Pet Simulator X") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "Button Example",
       Callback = function()
       end,
    })

elseif game.PlaceId == 1286980859 then -- The Wild West
    local Tab = Window:CreateTab("The Wild West") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "Button Example",
       Callback = function()
       end,
    })

elseif game.PlaceId == 171177310 then -- Dragon Ball Z: Final Stand
    local Tab = Window:CreateTab("Dragon Ball Z: Final Stand") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "Button Example",
       Callback = function()
       end,
    })

elseif game.PlaceId == 4781735222 then -- Deathrun
    local Tab = Window:CreateTab("Deathrun") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "Button Example",
       Callback = function()
       end,
    })

elseif game.PlaceId == 6062060725 then -- Obby Creator
    local Tab = Window:CreateTab("Obby Creator") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "Button Example",
       Callback = function()
       end,
    })

elseif game.PlaceId == 2916758764 then -- Hide and Seek Extreme
    local Tab = Window:CreateTab("Hide and Seek Extreme") 
    local Section = Tab:CreateSection("Script list")
    local Button = Tab:CreateButton({
       Name = "Button Example",
       Callback = function()
       end,
    })
   
local MainTab = Window:CreateTab("universal", nil) -- Title, Image
local MainSection = MainTab:CreateSection("universal")

local Button = MainTab:CreateButton({
   Name = "Infinite Yield",
   Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})


local Button = MainTab:CreateButton({
   Name = "trolling Hub",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cnPthPiGon/RamDRuomFirirueieiid8didj/refs/heads/main/Fe%20sus%20hub"))()
   end,
})

local Tab = Window:CreateTab("Info", nil) -- Title, Image

local Paragraph = Tab:CreateParagraph({Title = "info", Content = "By mrbest6317"})

local Paragraph = Tab:CreateParagraph({Title = "Info", Content = "Discord Server : https://discord.gg/AU4CnDTbxt"})local Paragraph = Tab:CreateParagraph({Title = "Credits", Content = "thanks to rndm for fixing the script"})


