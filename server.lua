ESX = nil
MySQL = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function sendDiscord(title, text, url)

    local embeds = {
        {
            ["title"] = title,
            ["type"] = "rich",
            ["color"] = 16711680,
            ["description"] = text,
            ["footer"] = {
                ["text"] = os.date('%x %X')
            }
        }
    }

    PerformHttpRequest(url, function(err, text, headers) end, 'POST', json.encode({username = Config.server_name, embeds = embeds}), { ['Content-Type'] = 'application/json'})
end

RegisterNetEvent('logss:log')
AddEventHandler('logss:log', function(Command, args, url)

    local id = source
    local xPlayer = ESX.GetPlayerFromId(id)
    local first = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", {['@identifier'] = xPlayer.getIdentifier()})
    local last = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", {['@identifier'] = xPlayer.getIdentifier()})
    local name = first .." ".. last
    sendDiscord(Command, "Spieler: ".. name .."\nID: ".. id .."\nSteamID: ".. GetPlayerName(id) .."\nargs: " ..args, url)
end)

ESX = exports["es_extended"]:getSharedObject()