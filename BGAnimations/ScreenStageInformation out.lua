return Def.ActorFrame{
  LoadActor("stagetemp/loadingframe2")..{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+60);
    OnCommand=cmd(addy,480;linear,0.2;addy,-480;sleep,1;);
  };
  LoadActor("stagetemp/loadingframe1")..{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-158);
    OnCommand=cmd(addy,-480;linear,0.2;addy,480;sleep,1;);
  };
}
