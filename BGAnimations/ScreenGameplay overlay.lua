local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  Def.TextBanner{
    InitCommand=cmd(CenterX;Load,"TextBannerGameplay");
		OnCommand=function(self)
			if GAMESTATE:GetPlayMode() == 'PlayMode_Nonstop' or GAMESTATE:GetPlayMode() == 'PlayMode_Endless' then
				self:y(SCREEN_TOP+31):zoom(0.5):addy(-100):decelerate(1.2):addy(100)
			else
				self:y(SCREEN_CENTER_Y):sleep(5):diffusealpha(1):linear(1):diffusealpha(0)
			end;
			if GAMESTATE:GetCurrentSong() then
    		self:SetFromSong(GAMESTATE:GetCurrentSong())
			end;
		end;
		CurrentSongChangedMessageCommand = function(self)
			self:SetFromSong(GAMESTATE:GetCurrentSong())
		end;
  };
};

return t;
