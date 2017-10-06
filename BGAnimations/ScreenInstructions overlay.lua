local instructionPage = "normal"

if GAMESTATE:GetPlayMode() == 'PlayMode_Nonstop' then instructionPage = "nonstop"
elseif GAMESTATE:GetPlayMode() == 'PlayMode_Oni' then instructionPage = "oni"
end

local t = Def.ActorFrame{
  LoadActor("stagetemp/loadingframe2")..{
    InitCommand=cmd(xy,SCREEN_CENTER_X,SCREEN_CENTER_Y+60);
  };
  LoadActor("stagetemp/loadingframe1")..{
    InitCommand=cmd(xy,SCREEN_CENTER_X,SCREEN_CENTER_Y-158);
  };
  LoadActor("_swoosh.ogg")..{
    OnCommand=cmd(play);
    OffCommand=cmd(play);
  };
};


t[#t+1] = Def.ActorFrame{
	LoadActor(THEME:GetPathG("_instructions",instructionPage))..{
		InitCommand=cmd(x,SCREEN_LEFT-SCREEN_CENTER_X;CenterY;);
		OnCommand=cmd(decelerate,0.3;CenterX);
		OffCommand=cmd(accelerate,0.3;x,SCREEN_RIGHT+SCREEN_CENTER_X);
	};
};

return t;
