local t = Def.ActorFrame{
  LoadActor("star.png")..{
    InitCommand=cmd(Center);
    OnCommand=cmd(diffuse,color("0,0,0,1");zoom,0;rotationz,0;linear,0.3;rotationz,-1000;zoom,3);
  };
};

return t;
