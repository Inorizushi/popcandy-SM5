local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  LoadActor("stagetemp/loadingframe2")..{
    InitCommand=cmd(xy,SCREEN_CENTER_X,SCREEN_CENTER_Y+60);
    OnCommand=cmd(linear,0.2;addy,480;);
  };
  LoadActor("stagetemp/loadingframe1")..{
    InitCommand=cmd(xy,SCREEN_CENTER_X,SCREEN_CENTER_Y-158);
    OnCommand=cmd(linear,0.2;addy,-480;);
  };
};

return t;
