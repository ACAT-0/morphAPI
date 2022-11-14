MorphAPI = RegisterMod("MorphAPI",1)
local hud = Game():GetHUD()
local sfx=SFXManager()

function MorphAPI:AddTransformation(name,items,id,min,costume)
    return {
        name=name,
        items=items,
        id=id,
        status=false,
        min=min,
        costume=costume
    }
end

function MorphAPI:CheckTransformation(trans)
if trans.status==false then
    local items=trans.items
    local ITEMCOUNT=0
for i,v in pairs(items) do 
    if player:HasCollectible(v) then ITEMCOUNT=ITEMCOUNT+1 end
---@diagnostic disable-next-line: missing-parameter
    if ITEMCOUNT>trans.min-1 then hud:ShowItemText(string.upper(trans.name).."!") trans.status=true sfx:Play(SoundEffect.SOUND_POWERUP_SPEWER) player:AddNullCostume(trans.costume) end
end
else return 0 end
end

function MorphAPI:getStatus(trans) 
return trans.status
end

function MorphAPI:init()
    local player = Isaac.GetPlayer()

end

MorphAPI:AddCallback(ModCallbacks.MC_POST_GAME_STARTED,MorphAPI.init)