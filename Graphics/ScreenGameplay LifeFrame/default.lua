-- gameplay life frame
local lifeFrame = "normal"

-- todo: show oni on life meter battery as well
if GAMESTATE:GetPlayMode() == 'PlayMode_Oni' then
	lifeFrame = "oni"
end

if GAMESTATE:GetPlayMode() == 'PlayMode_Nonstop' or GAMESTATE:GetPlayMode() == 'PlayMode_Endless' then
	lifeFrame = "course"
end

if GAMESTATE:IsExtraStage() or GAMESTATE:IsExtraStage2() then lifeFrame = "extra" end

return Def.ActorFrame{ LoadActor(lifeFrame) };
