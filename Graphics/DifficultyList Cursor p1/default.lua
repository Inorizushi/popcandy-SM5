local t = Def.ActorFrame{
	LoadActor("p1")..{
		InitCommand=cmd(x,-34;diffusealpha,0;);
		OnCommand=cmd(linear,.4;diffusealpha,1;);
	};
};

return t;
