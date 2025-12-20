#!/usr/bin/env lua

function split_notifications(text)
    local notifications = {}
    local current_notification = {}

    for line in text:gmatch("[^\r\n]+") do
        if line:match("^Notification %d+:") then
            if not current_notification.title ~= nil then
                table.insert(notifications, current_notification)
                current_notification = {}
            end

            local number, title = line:match("^Notification (%d+): (.+)$")
            current_notification = {
                number = tonumber(number),
                title = title:gsub("^%s*(.-)%s*$", "%1") -- Remove espaços extras
            }
        elseif line:match("^  Desktop entry:") then
            local desktop_entry = line:match("^  Desktop entry: (.+)$")
            current_notification.desktop_entry = desktop_entry
        elseif line:match("^  Urgency:") then
            local urgency = line:match("^  Urgency: (.+)$")
            current_notification.urgency = urgency
        elseif line:match("^  Actions:") then
            current_notification.has_actions = true
            current_notification.actions = {}
        elseif line:match("^    default:") then
            table.insert(current_notification.actions, "default")
        end
    end

    if not current_notification.title ~= nil then
        table.insert(notifications, current_notification)
    end

    return notifications
end

function formatar_para_rofi(notifications)
    if #notifications < 1 then
        return nil
    end

    local opcoes = {}
    for _, notif in ipairs(notifications) do
        if notif.title == nil then
            goto continue
        end

        local linha = string.format("%d: %s [%s]",
            notif.number,
            notif.title,
            notif.desktop_entry
        )
        table.insert(opcoes, linha)
        ::continue::
    end

    return table.concat(opcoes, "\n")
end

function mostrar_notificacoes_rofi(notifications)
    local opcoes_rofi = formatar_para_rofi(notifications)

    local comando = string.format('echo "%s" | rofi -dmenu -p "Notificações: "',
        opcoes_rofi:gsub('"', '\\"'))

    local handle = io.popen(comando)
    local selecao = handle:read("*a")
    handle:close()

    return selecao
end

-- executando makoctl history
local handle = io.popen("makoctl history")
local stdout = handle:read("*a")
handle:close()

local notifications = split_notifications(stdout)
print(mostrar_notificacoes_rofi(notifications))
