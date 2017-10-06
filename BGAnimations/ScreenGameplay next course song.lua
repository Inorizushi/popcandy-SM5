-- BeforeLoadingNextCourseSongMessageCommand
-- StartCommand
-- ChangeCourseSongInMessageCommand
-- ChangeCourseSongOutMessageCommand
-- FinishCommand

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

return Def.ActorFrame {
	Def.Sprite{
		InitCommand=cmd(Center;setsize,SCREEN_WIDTH,SCREEN_HEIGHT);
		BeforeLoadingNextCourseSongMessageCommand=function(self)
			self:LoadFromSongBanner( SCREENMAN:GetTopScreen():GetNextCourseSong() )
		end;
		StartCommand=cmd(diffusealpha,0;linear,1;diffusealpha,1);
		FinishCommand=cmd(sleep,1.7;diffusealpha,1;linear,0.3;diffusealpha,0);
	};
	LoadActor(THEME:GetPathB("","stagetemp/courseframe1.png"))..{
		InitCommand=cmd(xy,SCREEN_CENTER_X-640,SCREEN_TOP+84);
		ChangeCourseSongInMessageCommand=cmd(diffusealpha,0;linear,0.3;diffusealpha,1;x,SCREEN_CENTER_X;);
		FinishCommand=cmd(diffusealpha,1;sleep,1.7;linear,0.3;diffusealpha,0;x,SCREEN_CENTER_X-640;);
	};
	LoadActor(THEME:GetPathB("","stagetemp/courseframe2.png"))..{
		InitCommand=cmd(xy,SCREEN_CENTER_X+640,SCREEN_BOTTOM-84);
		ChangeCourseSongInMessageCommand=cmd(diffusealpha,0;linear,0.3;diffusealpha,1;x,SCREEN_CENTER_X;);
		FinishCommand=cmd(diffusealpha,1;sleep,1.7;linear,0.3;diffusealpha,0;x,SCREEN_CENTER_X+640;);
	};
	LoadActor(THEME:GetPathB("","stagetemp/stageframe2.png"))..{
		InitCommand=cmd(xy,SCREEN_LEFT+76,SCREEN_TOP+76);
		ChangeCourseSongInMessageCommand=cmd(zoom,0;linear,0.3;zoom,1;);
		FinishCommand=cmd(sleep,1.7;linear,0.3;zoom,0;);
	};
	LoadActor(THEME:GetPathB("","stagetemp/stageframe2.png"))..{
		InitCommand=cmd(xy,SCREEN_RIGHT-76,SCREEN_BOTTOM-76);
		ChangeCourseSongInMessageCommand=cmd(zoom,0;linear,0.3;zoom,1;);
		FinishCommand=cmd(sleep,1.7;linear,0.3;zoom,0;);
	};
	LoadActor("num")..{
		InitCommand=cmd(xy,SCREEN_LEFT+76,SCREEN_TOP+76);
		ChangeCourseSongInMessageCommand=cmd(diffusealpha,0;linear,0.3;zoom,0.8;diffusealpha,1;linear,1.5;rotationz,-660;);
		FinishCommand=cmd(zoom,0.8;sleep,1.7;diffusealpha,1;linear,0.3;zoom,0;diffusealpha,0;);
	};
	LoadActor("num")..{
		InitCommand=cmd(xy,SCREEN_RIGHT-76,SCREEN_BOTTOM-76);
		ChangeCourseSongInMessageCommand=cmd(diffusealpha,0;linear,0.3;zoom,0.8;diffusealpha,1;linear,1.5;rotationz,-660;);
		FinishCommand=cmd(zoom,0.8;sleep,1.7;diffusealpha,1;linear,0.3;zoom,0;diffusealpha,0;);
	};
	Def.Sprite{
		InitCommand=cmd(Center);
		BeforeLoadingNextCourseSongMessageCommand=function(self)
			self:LoadFromSongBanner( SCREENMAN:GetTopScreen():GetNextCourseSong() )
		end;
		StartCommand=cmd(linear,0.3;diffusealpha,1);
		FinishCommand=cmd(linear,0.3;diffusealpha,0);
	};
};
