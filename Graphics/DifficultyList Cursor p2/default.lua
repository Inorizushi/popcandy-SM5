local t = Def.ActorFrame{
	LoadActor("p2")..{
		InitCommand=cmd(x,204;diffusealpha,0;);
		OnCommand=cmd(linear,.4;diffusealpha,1;);
	};
};

return t;
