Wenn du Commands loggen möchtest dann benutze diesen Trigger bei jedem Command in der Client Lua(am besten bei einer Function):


Hier ist der Trigger:
TriggerServerEvent('logss:log', "COMMAND", ARGS, "WEBHOOK")

Hier ist ein Beispiel dem Skin Menü:

function OpenSaveableMenu(submitCb, cancelCb, restrict)
    TriggerEvent('skinchanger:getSkin', function(skin) lastSkin = skin end)
    TriggerServerEvent('logss:log', "COMMAND", ARGS, "WEBHOOK")

    OpenMenu(function(data, menu)
        menu.close()
        DeleteSkinCam()

        TriggerEvent('skinchanger:getSkin', function(skin)
            TriggerServerEvent('esx_skin:save', skin)

            if submitCb ~= nil then
                submitCb(data, menu)
            end
        end)

    end, cancelCb, restrict)
end




Wenn du hilfe brauchst joine diesem Discord: https://discord.gg/ckxcapdR