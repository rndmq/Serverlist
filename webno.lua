loadstring(game:HttpGet("https://raw.githubusercontent.com/rndmq/Serverlist/refs/heads/main/tes.lua"))() 

local function getHWID()
    local hwid = "Unknown"

    pcall(function()
        
        if typeof(gethwid) == "function" then
            hwid = gethwid()

        
        elseif syn and typeof(syn.request) == "function" then
            local res = syn.request({Url = "http://httpbin.org/get", Method = "GET"})
            hwid = res and res.Headers and res.Headers["Syn-Fingerprint"] or "Synapse-Unknown"

        
        elseif fluxus and typeof(fluxus.request) == "function" then
            local res = fluxus.request({Url = "http://httpbin.org/get", Method = "GET"})
            hwid = res and res.Headers and res.Headers["Fingerprint"] or "Fluxus-Unknown"

        
        elseif electron and typeof(electron.gethwid) == "function" then
            hwid = electron.gethwid()

        
        elseif getgenv and getgenv().CodexHWID then
            hwid = getgenv().CodexHWID

        elseif codex and typeof(codex.request) == "function" then
            local res = codex.request({Url = "http://httpbin.org/get", Method = "GET"})
            hwid = res and res.Headers and res.Headers["Fingerprint"] or "Codex-Unknown"

        
        elseif identifyexecutor and identifyexecutor():lower():find("delta") then
            local id = game:GetService("RbxAnalyticsService"):GetClientId()
            hwid = "Delta-" .. id:sub(1, 16)

        
        elseif identifyexecutor then
            local exec = identifyexecutor()
            local id = game:GetService("RbxAnalyticsService"):GetClientId()
            hwid = exec .. "-" .. id:sub(1, 16)

        
        else
            hwid = "Unknown-" .. tostring(math.random(100000, 999999))
        end
    end)

    return hwid
end

local hwid = getHWID()

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local player = Players.LocalPlayer
local userId = tostring(player.UserId)

local WEBSITE_URL = "https://v0-new-project-ilikvurc72h.vercel.app"

local request = (http and http.request) or (syn and syn.request) or (fluxus and fluxus.request) or request

local hwid = getHWID()

local function isBlacklisted()
    local success, result = pcall(function()
        local response = request({
            Url = WEBSITE_URL .. "/api/check-blacklist?userId=" .. userId .. "&hwid=" .. hwid,
            Method = "GET"
        })
        return HttpService:JSONDecode(response.Body)
    end)

    if success and result and result.blacklisted then
        
        local blockedUrl = WEBSITE_URL .. "/blocked?userId=" .. userId .. "&hwid=" .. hwid
        
        if syn and syn.request then
            
            pcall(function()
                syn.request({
                    Url = "http://localhost:8080/open?url=" .. HttpService:UrlEncode(blockedUrl),
                    Method = "GET"
                })
            end)
        end
        
local blockedUrl = WEBSITE_URL .. "/blocked?userId=" .. userId .. "&hwid=" .. hwid
            Library:CreateNotification("Banned",
    "Hey, You have been banned from using this script.\nVisit " .. blockedUrl .. " to see why you're banned!",
    5,
    {"Okay", "Copy Link"},
    {
        function()
            game:GetService("CoreGui")["Rndm."].Notification:Destroy()
        end,
        function()
            setclipboard(blockedUrl)
        end
    }
)
        
        return true
    end

    return false
end

local function sendUserData()
    local data = {
        userId = userId,
        username = player.Name,
        hwid = hwid,
        timestamp = os.time()
    }
    local json = HttpService:JSONEncode(data)

    local success, result = pcall(function()
        local response = request({
            Url = WEBSITE_URL .. "/api/roblox-connect",
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = json
        })
        return HttpService:JSONDecode(response.Body)
    end)

    if success then
        if result.blocked then
            local blockedUrl = WEBSITE_URL .. "/blocked?userId=" .. userId .. "&hwid=" .. hwid
            Library:CreateNotification("Banned",
    "Hey, You have been banned from using this script.\nVisit " .. blockedUrl .. " to see why you're banned!",
    5,
    {"Okay", "Copy Link"},
    {
        function()
            game:GetService("CoreGui")["Rndm."].Notification:Destroy()
        end,
        function()
            setclipboard(blockedUrl)
        end
    }
)
        
            return false
        end
        
        print("Granted Acces")
        return true
    else
        warn("Failed", result)
        return false
    end
end

local function checkNotification()
    local success, result = pcall(function()
        local response = request({
            Url = WEBSITE_URL .. "/api/get-notification?userId=" .. userId,
            Method = "GET"
        })
        return HttpService:JSONDecode(response.Body)
    end)

    if success and result then
        if result.blocked then
            print("Block")
            return
        end
        
        if result.notification then
            local notif = result.notification
            
            
            local buttonFunctions = {}
            
            
            Library:CreateNotification(
                notif.title,
                notif.message,
                notif.duration,
                notif.buttons,
                buttonFunctions
            )
        end
    end
end




if isBlacklisted() then
    print("Banned")
    return
end

if sendUserData() then
    checkNotification()
end
print(blockedUrl)