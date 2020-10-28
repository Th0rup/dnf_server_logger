local logs = "" -- Change this to your weebhook
local communityname = "" -- Change this to your community name
local communtiylogo = "" -- replace this with a webpicture to your community logo (end this jpg - png)

AddEventHandler('playerConnecting', function()
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local connect = {
        {
            ["color"] = "8663711",
            ["title"] = "Player Connecting",
            ["description"] = "Player: **"..name.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",
	              ["footer"] = {
                ["text"] = communityname,
                ["icon_url"] = communtiylogo,
            },
        }
    }

PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "dnf_server_logger", embeds = connect}), { ['Content-Type'] = 'application/json' })
end)

AddEventHandler('playerDropped', function(reason)
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local disconnect = {
        {
            ["color"] = "8663711",
            ["title"] = "Player Disconnected from Server #1",
            ["description"] = "Player: **"..name.."** \nReason: **"..reason.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",
	              ["footer"] = {
                ["text"] = communityname,
                ["icon_url"] = communtiylogo,
            },
        }
    }

    PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "dnf_server_logger", embeds = disconnect}), { ['Content-Type'] = 'application/json' })
end)

TriggerEvent("chatMessage", GetPlayerName(PlayerId()), {255, 255, 255}, "Player: **"..name.."connecting the server!")
end

local name = GetPlayerName(source)
print(('Player %s - ID %i are joining the server!'):format(name, playerID))
end
