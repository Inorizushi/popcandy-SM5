local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  LoadActor("_swoosh.ogg")..{
    StartTransitioningCommand=cmd(play);
  };
  LoadActor("stagetemp/loadingframe2")..{
    InitCommand=cmd(xy,SCREEN_CENTER_X,SCREEN_CENTER_Y+60);
    OnCommand=cmd(addy,480;linear,0.2;addy,-480;sleep,1;);
  };
  LoadActor("stagetemp/loadingframe1")..{
    InitCommand=cmd(xy,SCREEN_CENTER_X,SCREEN_CENTER_Y-158);
    OnCommand=cmd(addy,-480;linear,0.2;addy,480;sleep,1;);
  };
};

return t;
