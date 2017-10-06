local t = LoadFallbackB();

local sStage = GAMESTATE:GetCurrentStage();
local tRemap = {
	Stage_1st		= 1,
	Stage_2nd		= 2,
	Stage_3rd		= 3,
	Stage_4th		= 4,
	Stage_5th		= 5,
	Stage_6th		= 6,
};

if tRemap[sStage] == PREFSMAN:GetPreference("SongsPerPlay") then
	sStage = "Stage_Final";
else
	sStage = sStage;
end;
if not GAMESTATE:IsCourseMode() then
t[#t+1] = Def.ActorFrame{
  Def.Sprite{
    InitCommand=cmd(Center;setsize,SCREEN_WIDTH,SCREEN_HEIGHT);
    BeginCommand=cmd(playcommand,"Set");
    SetCommand=function(self)
      local song = GAMESTATE:GetCurrentSong();
      if song:HasBackground() == true then
        self:LoadFromSongBackground(song)
      else
        self:Load(THEME:GetPathG("","Common fallback background"));
      end;
    end;
  };
};
end;

t[#t+1] = Def.ActorFrame{
  InitCommand=function(self)
  end;
	Def.Quad{
	   InitCommand=cmd(Center;setsize,SCREEN_WIDTH,SCREEN_HEIGHT;playcommand,"Set");
	   OnCommand=cmd(diffusealpha,0.25);
		 OnCommand=function(self)
			 if GAMESTATE:IsCourseMode() then
				 self:diffusealpha(0.25)
			 else
				 self:diffusealpha(1):linear(0.3):diffusealpha(0.25)
			 end
		 end;
		 SetCommand=function(self)
			 if GAMESTATE:GetPlayMode() == 'PlayMode_Nonstop' then
				 self:diffuse(color("1.0,1.0,0.0,1"))
			 elseif GAMESTATE:GetPlayMode() == 'PlayMode_Oni' then
				 self:diffuse(color("0.0,0.0,1.0,1"))
			 elseif GAMESTATE:GetPlayMode() == 'PlayMode_Endless' then
				 self:diffuse(color("1.0,0.0,0.0,1"))
			 else
				 self:diffuse(color("0,0,0,1"))
			 end;
		 end;
	 };
  LoadActor("../stagetemp/stageframe1")..{
    InitCommand=cmd(xy,-SCREEN_WIDTH,SCREEN_CENTER_Y-158;halign,1;playcommand,"Set");
    OnCommand=cmd(diffusealpha,0;linear,0.3;diffusealpha,1;x,SCREEN_RIGHT);
		SetCommand=function(self)
			if GAMESTATE:GetPlayMode() == 'PlayMode_Nonstop' then
				self:diffuse(color("1.0,1.0,0.0,1"))
			elseif GAMESTATE:GetPlayMode() == 'PlayMode_Oni' then
				self:diffuse(color("0.0,0.0,1.0,1"))
			elseif GAMESTATE:GetPlayMode() == 'PlayMode_Endless' then
				self:diffuse(color("1.0,0.0,0.0,1"))
			elseif GAMESTATE:IsExtraStage() then
				self:diffuse(color("1.0,0.0,0.0,1"))
			elseif GAMESTATE:IsExtraStage2() then
				self:diffuse(color("1.0,0.5,0.9,1"))
			end;
		end;
  };
  LoadActor("../stagetemp/stageframe1")..{
    InitCommand=cmd(xy,SCREEN_WIDTH,SCREEN_CENTER_Y+158;rotationz,-180;halign,1;playcommand,"Set");
    OnCommand=cmd(diffusealpha,0;linear,0.3;diffusealpha,1;x,SCREEN_LEFT;sleep,4);
		SetCommand=function(self)
			if GAMESTATE:GetPlayMode() == 'PlayMode_Nonstop' then
				self:diffuse(color("1.0,1.0,0.0,1"))
			elseif GAMESTATE:GetPlayMode() == 'PlayMode_Oni' then
				self:diffuse(color("0.0,0.0,1.0,1"))
			elseif GAMESTATE:GetPlayMode() == 'PlayMode_Endless' then
				self:diffuse(color("1.0,0.0,0.0,1"))
			elseif GAMESTATE:IsExtraStage() then
				self:diffuse(color("1.0,0.0,0.0,1"))
			elseif GAMESTATE:IsExtraStage2() then
				self:diffuse(color("1.0,0.5,0.9,1"))
			end;
		end;
  };
};

t[#t+1] = Def.ActorFrame{
  LoadFont("Common normal")..{
    InitCommand=cmd(Center);
    SetCommand=function(self)
      local song = GAMESTATE:GetCurrentSong()
      local text
      if song then
        text = song:GetDisplayFullTitle()
      else
        text = ""
      end
      self:settext(text)
    end;
    OnCommand=cmd(diffusealpha,0;linear,0.3;addy,-32;diffusealpha,1;playcommand,"Set");
  };
  LoadFont("Common normal")..{
    InitCommand=cmd(Center);
    SetCommand=function(self)
      local song = GAMESTATE:GetCurrentSong()
      local text
      if song then
        text = song:GetDisplayArtist()
      else
        text = ""
      end
      self:settext(text)
    end;
    OnCommand=cmd(diffusealpha,0;linear,0.3;addy,32;diffusealpha,1;playcommand,"Set");
  };
};

if GAMESTATE:GetPlayMode() == 'PlayMode_Regular' or GAMESTATE:GetPlayMode() == 'PlayMode_Battle' or GAMESTATE:GetPlayMode() == 'PlayMode_Rave' then
	t[#t+1] = LoadActor(THEME:GetPathB("ScreenStageInformation","decorations/stage " .. ToEnumShortString(sStage) ));
elseif GAMESTATE:GetPlayMode() == 'PlayMode_Oni' then
	t[#t+1] = LoadActor(THEME:GetPathB("ScreenStageInformation","decorations/stage oni"));
elseif GAMESTATE:GetPlayMode() == 'PlayMode_Nonstop' then
	t[#t+1] = LoadActor(THEME:GetPathB("ScreenStageInformation","decorations/stage nonstop"));
elseif GAMESTATE:GetPlayMode() == 'PlayMode_Endless' then
	t[#t+1] = LoadActor(THEME:GetPathB("ScreenStageInformation","decorations/stage endless"));
end

return t;
