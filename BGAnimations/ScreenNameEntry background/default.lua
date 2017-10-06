-- in 2004, Meriken DDR are invaded by ITG. no one is laughin.
return Def.ActorFrame{
	LoadActor("../ScreenLogo background/back1")..{
    InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;FullScreen);
    OnCommand=function(self)
			local w = DISPLAY:GetDisplayWidth() / self:GetWidth();
			local h = DISPLAY:GetDisplayHeight() / self:GetHeight();
			self:customtexturerect(0,0,w,h);
			self:texcoordvelocity(0,0.1);
		end;
  };
	LoadActor("../star")..{
		InitCommand=cmd(Center;spin;diffuse,color("1,0.9,0.9,1");effectmagnitude,0,0,-5;)
	};
	LoadActor("back1")..{
		InitCommand=cmd(Center;spin;diffuse,color("1,0.9,0.9,1");effectmagnitude,0,0,5;)
	};
};
