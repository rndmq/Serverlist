local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "unknowns scripthub",
   LoadingTitle = "Loading Script Hub",
   LoadingSubtitle = "By mrbest6317",
   ConfigurationSaving = {
      Enabled =  true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Player Changer"
   },
   Discord = {
      Enabled =  true,
      Invite = "AU4CnDTbxt", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins =  true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to  true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey =  true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is  true, set Key below to the RAW site you would like Rayfield to get the key from
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

if game.PlaceId == 2607868379 then -- Arsenal
    local ArsenalTab = Window:CreateTab("Arsenal")
    local Section = ArsenalTab:CreateSection("Script list")
    local Button = ArsenalTab:CreateButton({
       Name = "Arsenal",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/ex55/weed-client/refs/heads/main/main.lua"))()
       end,
    })

elseif game.PlaceId == 6261586777 then -- Piggy
    local PiggyTab = Window:CreateTab("Piggy")
    local Section = PiggyTab:CreateSection("Script list")
    local Button = PiggyTab:CreateButton({
       Name = "Piggy",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/anandadefa/Loader/refs/heads/main/loader.lua"))()
       end,
    })

elseif game.PlaceId == 366400023 then -- Tower of Hell
    local TowerOfHellTab = Window:CreateTab("Tower of Hell")
    local Section = TowerOfHellTab:CreateSection("Script list")
    local Button = TowerOfHellTab:CreateButton({
       Name = "Another Hub",
       Callback = function()
       loadstring(game:HttpGet("https://anotherhub.agency/script/loader.lua"))() 
       end,
    })
    local Button = TowerOfHellTab:CreateButton({
       Name = "Pulse Hub",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/Mochimochi12321/Loader/refs/heads/main/newloader"))()
       end,
    })

elseif game.PlaceId == 142823291 then -- Murder Mystery 2
    local MurderMystery2Tab = Window:CreateTab("Murder Mystery 2")
    local Section = MurderMystery2Tab:CreateSection("Script list")
    local Button = MurderMystery2Tab:CreateButton({
       Name = "Forge Hub",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/Skzuppy/forge-hub/main/loader.lua"))()
       end,
    })

elseif game.PlaceId == 6152642114 then -- Shindo Life
    local ShindoLifeTab = Window:CreateTab("Shindo Life")
    local Section = ShindoLifeTab:CreateSection("Script list")
    local Button = ShindoLifeTab:CreateButton({
       Name = "ImpHub",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/alan11ago/Hub/refs/heads/main/ImpHub.lua"))()
       end,
    })
    local Button = ShindoLifeTab:CreateButton({
       Name = "Auto farm",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/ahmadsgamer2/Script--Game/main/Script%20Game"))()
       end,
    })

elseif game.PlaceId == 8238266136 then -- BedWars
    local BedWarsTab = Window:CreateTab("BedWars")
    local Section = BedWarsTab:CreateSection("Script list")
    local Button = BedWarsTab:CreateButton({
       Name = "Aurora Hub",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/cocotv666/Aurora/main/Aurora_Loader"))()
       end,
    })

elseif game.PlaceId == 243360221 then -- Dungeon Quest
    local DungeonQuestTab = Window:CreateTab("Dungeon Quest")
    local Section = DungeonQuestTab:CreateSection("Script list")
    local Button = DungeonQuestTab:CreateButton({
       Name = "Dungeon Quest",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
       end,
    })

elseif game.PlaceId == 303427120 then -- Jailbreak
    local JailbreakTab = Window:CreateTab("Jailbreak")
    local Section = JailbreakTab:CreateSection("Script list")
    local Button = JailbreakTab:CreateButton({
       Name = "cata hub",
       Callback = function()
       loadstring(game:HttpGet("https://weinzspace.com/cata/hub.lua"))()
       end,
    })

elseif game.PlaceId == 4894412858 then -- Breaking Point
    local BreakingPointTab = Window:CreateTab("Breaking Point")
    local Section = BreakingPointTab:CreateSection("Script list")
    local Button = BreakingPointTab:CreateButton({
       Name = "JailBreak",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/devil-sbeakingpointgui/main/main"))()
       end,
    })

elseif game.PlaceId == 763106014 then -- Natural Disaster Survival
    local NaturalDisasterSurvivalTab = Window:CreateTab("Natural Disaster Survival")
    local Section = NaturalDisasterSurvivalTab:CreateSection("Script list")
    local Button = NaturalDisasterSurvivalTab:CreateButton({
       Name = "ZeeroxHub",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/RunDTM/ZeeroxHub/main/Loader.lua"))()
       end,
    })

elseif game.PlaceId == 1658616937 then -- Flee the Facility
    local FleeTheFacilityTab = Window:CreateTab("Flee the Facility")
    local Section = FleeTheFacilityTab:CreateSection("Script list")
    local Button = FleeTheFacilityTab:CreateButton({
       Name = "Spimine",
       Callback = function()
       loadstring(game:HttpGet('https://raw.githubusercontent.com/antisocialb2/SPIMINE-FLEETHEFACILITY/main/script.lua"))()
       end,
    })

elseif game.PlaceId == 183364845 then -- Speed Run 4
    local SpeedRun4Tab = Window:CreateTab("Speed Run 4")
    local Section = SpeedRun4Tab:CreateSection("Script list")
    local Button = SpeedRun4Tab:CreateButton({
       Name = "Dragonismcode",
       Callback = function()
       loadstring(game:HttpGet(('https://raw.githubusercontent.com/dragonismcode/robloxscripts/main/speedrun4.lua'),  true))()
       end,
    })

elseif game.PlaceId == 4878686481 then -- Bee Swarm Simulator
    local BeeSwarmSimulatorTab = Window:CreateTab("Bee Swarm Simulator")
    local Section = BeeSwarmSimulatorTab:CreateSection("Script list")
    local Button = BeeSwarmSimulatorTab:CreateButton({
       Name = "VerbalHub",
       Callback = function()
       loadstring(game:HttpGet('https://raw.githubusercontent.com/VerbalHubz/Verbal-Hub/refs/heads/main/Bee%20Swarm%20Sim.Lua'), true))()
       end,
    })
    local Button = BeeSwarmSimulatorTab:CreateButton({
       Name = "kronhub",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/DevKron/Kron_Hub/refs/heads/main/version_1.0"))()
       end,
    })
    local Button = BeeSwarmSimulatorTab:CreateButton({
       Name = "atlasHub",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/Chris8889/atlasbss/main/script.lua"))()
       end,
    })
    local Button = BeeSwarmSimulatorTab:CreateButton({
       Name = "HistyHub",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/raw/main/Histy"))()
       end,
    })
elseif game.PlaceId == 586749480 then -- Vehicle Legends
    local VehicleLegendsTab = Window:CreateTab("Vehicle Legends")
    local Section = VehicleLegendsTab:CreateSection("Script list")
    local Button = VehicleLegendsTab:CreateButton({
       Name = "MarcoHub",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/Vehicle%20legends"))()
       end,
    })

elseif game.PlaceId == 278742457 then -- Epic Minigames
    local EpicMinigamesTab = Window:CreateTab("Epic Minigames")
    local Section = EpicMinigamesTab:CreateSection("Script list")
    local Button = EpicMinigamesTab:CreateButton({
       Name = "Epic Minigames",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/SlamminPig/rblxgames/main/Epic%20Minigames/EpicMinigamesGUI"))()
       end,
    })

elseif game.PlaceId == 191413249 then -- Flood Escape 2
    local FloodEscape2Tab = Window:CreateTab("Flood Escape 2")
    local Section = FloodEscape2Tab:CreateSection("Script list")
    local Button = FloodEscape2Tab:CreateButton({
       Name = "Flood escape 2",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/Ruinins/scripts/main/Multiple%20scripts%20for%20FE2"))()
       end,
    })

elseif game.PlaceId == 167648520 then -- Mining Simulator 2
    local MiningSimulator2Tab = Window:CreateTab("Mining Simulator 2")
    local Section = MiningSimulator2Tab:CreateSection("Script list")
    local Button = MiningSimulator2Tab:CreateButton({
       Name = "Synta Hub",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/DareQPlaysRBX/SYNTA-HUB/main/SYNTAHUB.lua"))()
       end,
    })

elseif game.PlaceId == 631892440 then -- Build A Boat For Treasure
    local BuildABoatForTreasureTab = Window:CreateTab("Build A Boat For Treasure")
    local Section = BuildABoatForTreasureTab:CreateSection("Script list")
    local Button = BuildABoatForTreasureTab:CreateButton({
       Name = "1201for",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/littlegui/main/Build-A-Boat"))()
       end,
    })
    local Button = BuildABoatForTreasureTab:CreateButton({
       Name = "artherHub",
       Callback = function()
       loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/2529a5f9dfddd5523ca4e22f21cceffa.lua"))()
       end,
    })
    local Button = BuildABoatForTreasureTab:CreateButton({
       Name = "autoBuild",
       Callback = function()
       loadstring(game:HttpGet(('https://raw.githubusercontent.com/catblox1346/StensUIReMake/main/Script/StensUIRemakev2.0.0'), true))()
       end,
    })

elseif game.PlaceId == 173087702 then -- Ninja Legends 2
    local NinjaLegends2Tab = Window:CreateTab("Ninja Legends 2")
    local Section = NinjaLegends2Tab:CreateSection("Script list")
    local Button = NinjaLegends2Tab:CreateButton({
       Name = "HiraHub",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/Stochalt/HiraganaDev-Hub/main/HiraHub.lua"))()
       end,
    })

elseif game.PlaceId == 194190221 then -- Super Power Fighting Simulator
    local SuperPowerFightingSimulatorTab = Window:CreateTab("Super Power Fighting Simulator")
    local Section = SuperPowerFightingSimulatorTab:CreateSection("Script list")
    local Button = SuperPowerFightingSimulatorTab:CreateButton({
       Name = "Antonis",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/ExtremeAntonis/KeySystemUI/main/KeySystemUI-Obfuscated.lua"))()
       end,
    })
    local Button = SuperPowerFightingSimulatorTab:CreateButton({
       Name = "prodoka",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/Podroka626/Scripts/main/Loader"))()
       end,
    })

elseif game.PlaceId == 195498200 then -- Dragon Adventures
    local DragonAdventuresTab = Window:CreateTab("Dragon Adventures")
    local Section = DragonAdventuresTab:CreateSection("Script list")
    local Button = DragonAdventuresTab:CreateButton({
       Name = "ImpHub",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/alan11ago/Hub/refs/heads/main/ImpHub.lua"))()
       end,
    })
    local Button = DragonAdventuresTab:CreateButton({
       Name = "NeuronHub",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/Yumiara/Python/main/Main.lua"))()
       end,
    })

elseif game.PlaceId == 467313030 then -- Zombie Attack
    local ZombieAttackTab = Window:CreateTab("Zombie Attack")
    local Section = ZombieAttackTab:CreateSection("Script list")
    local Button = ZombieAttackTab:CreateButton({
       Name = "CrazyFui",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/crazyfuy/ghost-hub/main/Loader.lua"))()
       end,
    })
    local Button = ZombieAttackTab:CreateButton({
       Name = "GhostHub",
       Callback = function()
       loadstring(game:HttpGet('https://ghost-storage.7m.pl/scripts/ghosthublauncher.lua'))()
       end,
    })

elseif game.PlaceId == 4546769788 then -- King Legacy
    local KingLegacyTab = Window:CreateTab("King Legacy")
    local Section = KingLegacyTab:CreateSection("Script list")
    local Button = KingLegacyTab:CreateButton({
       Name = "TsuoHub",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/Tsuo7/TsuoHub/main/king%20legacy"))()
       end,
    })
    local Button = KingLegacyTab:CreateButton({
       Name = "arcHub",
       Callback = function()
       getgenv().CustomDistance = 10
       loadstring(game:HttpGet("https://raw.githubusercontent.com/ChopLoris/ArcHub/main/main.lua"))()
       end,
    })
    local Button = KingLegacyTab:CreateButton({
       Name = "ZeeHub",
       Callback = function()
       loadstring(game:HttpGet("https://zuwz.me/Ls-Zee-Hub-KL"))()
       end,
    })
    local Button = KingLegacyTab:CreateButton({
       Name = "HulkHub",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/HULKUexe/mobileX/main/FreeScript.lua"))()
       end,
    })

elseif game.PlaceId == 149300737 then -- Prison Life
    local PrisonLifeTab = Window:CreateTab("Prison Life")
    local Section = PrisonLifeTab:CreateSection("Script list")
    local Button = PrisonLifeTab:CreateButton({
       Name = "Nexus Hub",
       Callback = function()
       loadstring(game:HttpGet(('https://raw.githubusercontent.com/GwnStefano/NexusHub/main/Main'), true))()
       end,
    })
    local Button = PrisonLifeTab:CreateButton({
       Name = "AdminFe",
       Callback = function()
       loadstring(game:HttpGet(('https://raw.githubusercontent.com/XTheMasterX/Scripts/Main/PrisonLife'), true))()
       end,
    })

elseif game.PlaceId == 206702380 then -- SharkBite
    local SharkBiteTab = Window:CreateTab("SharkBite")
    local Section = SharkBiteTab:CreateSection("Script list")
    local Button = SharkBiteTab:CreateButton({
       Name = "Sharkbite",
       Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/Luces245434/script/main/sharkbite2"))()
       end,
    })

elseif game.PlaceId == 2840070148 then -- Time Travel Adventures
    local TimeTravelAdventuresTab = Window:CreateTab("Time Travel Adventures")
    local Section = TimeTravelAdventuresTab:CreateSection("Script list")
    local Button = TimeTravelAdventuresTab:CreateButton({
       Name = "Button Example",
       Callback = function()
       print("Hey")
       end,
    })

elseif game.PlaceId == 6053088507 then -- Superhero Tycoon
    local SuperheroTycoonTab = Window:CreateTab("Superhero Tycoon")
    local Section = SuperheroTycoonTab:CreateSection("Script list")
    local Button = SuperheroTycoonTab:CreateButton({
       Name = "Button Example",
       Callback = function()
       print("Hey")
       end,
    })

elseif game.PlaceId == 2552494531 then -- Pet Simulator X
    local PetSimulatorXTab = Window:CreateTab("Pet Simulator X")
    local Section = PetSimulatorXTab:CreateSection("Script list")
    local Button = PetSimulatorXTab:CreateButton({
       Name = "Button Example",
       Callback = function()
       print("Hey")
       end,
    })

elseif game.PlaceId == 1286980859 then -- The Wild West
    local TheWildWestTab = Window:CreateTab("The Wild West")
    local Section = TheWildWestTab:CreateSection("Script list")
    local Button = TheWildWestTab:CreateButton({
       Name = "Button Example",
       Callback = function()
       print("Hey")
       end,
    })

elseif game.PlaceId == 171177310 then -- Dragon Ball Z: Final Stand
    local DragonBallZFinalStandTab = Window:CreateTab("Dragon Ball Z: Final Stand")
    local Section = DragonBallZFinalStandTab:CreateSection("Script list")
    local Button = DragonBallZFinalStandTab:CreateButton({
       Name = "Button Example",
       Callback = function()
       print("Hey")
       end,
    })

elseif game.PlaceId == 4781735222 then -- Deathrun
    local DeathrunTab = Window:CreateTab("Deathrun")
    local Section = DeathrunTab:CreateSection("Script list")
    local Button = DeathrunTab:CreateButton({
       Name = "Button Example",
       Callback = function()
       print("Hey")
       end,
    })

elseif game.PlaceId == 6062060725 then -- Obby Creator
    local ObbyCreatorTab = Window:CreateTab("Obby Creator")
    local Section = ObbyCreatorTab:CreateSection("Script list")
    local Button = ObbyCreatorTab:CreateButton({
       Name = "Button Example",
       Callback = function()
       print("Hey")
       end,
    })

elseif game.PlaceId == 2916758764 then -- Hide and Seek Extreme
    local HideAndSeekExtremeTab = Window:CreateTab("Hide and Seek Extreme")
    local Section = HideAndSeekExtremeTab:CreateSection("Script list")
    local Button = HideAndSeekExtremeTab:CreateButton({
       Name = "Button Example",
       Callback = function()
       print("Hey")
       end,
    })
    else
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Notice",
        Text = "Not Supported Games."
    })
end