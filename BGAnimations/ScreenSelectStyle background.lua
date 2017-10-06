local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  LoadActor("ScreenWithMenuElements background");
  Def.Quad{
    InitCommand=cmd(FullScreen;diffuse,color("#ff67a0");diffusealpha,0.5);
  };
};

return t;
