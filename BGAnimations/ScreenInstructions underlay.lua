local t = Def.ActorFrame{
  LoadActor("stagetemp/loadingframe2")..{
    InitCommand=cmd(xy,SCREEN_CENTER_X,SCREEN_CENTER_Y+60);
  };
  LoadActor("stagetemp/loadingframe1")..{
    InitCommand=cmd(xy,SCREEN_CENTER_X,SCREEN_CENTER_Y-158);
  };
};

return t;
