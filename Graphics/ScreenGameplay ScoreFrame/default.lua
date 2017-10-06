-- gameplay score frame
local scoreFrame = "normal"

-- todo: show oni on life meter battery as well
if GAMESTATE:GetPlayMode() == 'PlayMode_Oni' then
	scoreFrame = "oni"
end

if GAMESTATE:IsExtraStage() or GAMESTATE:IsExtraStage2() then scoreFrame = "extra" end

local t = Def.ActorFrame{
	LoadActor("BPMBar");
	LoadActor(scoreFrame);
	LoadActor("BPMBar/BPMDisplay")..{
		InitCommand=function(self)
			if GAMESTATE:IsAnExtraStage() then
				self:y(13)
			else
				self:y(-13)
			end
		end
	};
};

return t;
