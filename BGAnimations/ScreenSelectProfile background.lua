local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  LoadActor("ScreenWithMenuElements background");
  Def.Quad{
    InitCommand=cmd(FullScreen;diffuse,color("#eb67ff");diffusealpha,0.5);
  };
};

return t;
