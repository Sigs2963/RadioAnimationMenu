local selectedRadioAnim = "radio" 
local menuOpen = false

CreateThread(function()
    Wait(1000) 
    local savedAnim = GetResourceKvpString("ram_selected_anim")

    if savedAnim and savedAnim ~= "" then
        selectedRadioAnim = savedAnim
    end
end)


RegisterCommand("ram", function()
    menuOpen = not menuOpen
    SetNuiFocus(menuOpen, menuOpen)
    SendNUIMessage({ type = "ui", status = menuOpen })
end, false)

TriggerEvent('chat:addSuggestion', '/ram', 'Open or close the radio animation menu.')

RegisterNUICallback("playAnim", function(data, cb)
    if data.anim then
        selectedRadioAnim = data.anim
        
        SetResourceKvp("ram_selected_anim", data.anim)
    end
    cb("ok")

    menuOpen = false
    SetNuiFocus(false, false)
    SendNUIMessage({ type = "ui", status = false })
end)

RegisterNUICallback("close", function(_, cb)
    menuOpen = false
    SetNuiFocus(false, false)
    SendNUIMessage({ type = "ui", status = false })
    cb("ok")
end)

RegisterCommand("+radioanim", function()
    if menuOpen then
        return
    end
    ExecuteCommand("e " .. selectedRadioAnim)
end, false)

RegisterCommand("-radioanim", function()
    ExecuteCommand("e c") 
end, false)

RegisterKeyMapping("+radioanim", "Play Radio Animation", "keyboard", "capital")