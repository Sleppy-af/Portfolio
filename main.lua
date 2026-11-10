local Licznik = 0

function Initialize(Plugin)
    cPluginManager:AddHook(cPluginManager.HOOK_WORLD_TICK, OnWorldTick)
    LOG(">>> Plugin zaladowany <<<")
    return true
end

function OnWorldTick(World)
    -- Reaguje TYLKO na główny świat, bo inaczej licznik bum bum
    if (World:GetName() ~= "world") then
        return
    end

    Licznik = Licznik + 1

    if (Licznik >= 6000) then
        Licznik = 0
        -- BroadcastChat do wszystkich swiatow recznie
        cRoot:Get():ForEachWorld(function(W)
            W:BroadcastChat(
                cChatColor.Green .. "[Serwer] " ..
                cChatColor.White .. "Podoba ci sie to co robie? Zapraszamy do ZEGu! (i na https://github.com/sleppy.af)"
            )
        end)
    end
end
