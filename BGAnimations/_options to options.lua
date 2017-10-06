return Def.ActorFrame{
  LoadActor("_swoosh.ogg")..{
    OnCommand=cmd(play);
    OffCommand=cmd(play);
  };
  Def.Actor{
    OffCommand=cmd(sleep,0.5);
  }
};
