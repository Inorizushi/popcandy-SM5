local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  LoadActor("back1.png")..{
    InitCommand=cmd(Center;setsize,SCREEN_WIDTH,SCREEN_HEIGHT);
  };
  Def.ActorFrame{
    InitCommand=cmd(Center;);
    LoadActor("back3")..{
      InitCommand=cmd(y,-180;zoomtowidth,SCREEN_WIDTH);
      OnCommand=function(self)
        local w = SCREEN_HEIGHT*1.333333 / self:GetWidth();
        local h = DISPLAY:GetDisplayHeight() / self:GetHeight();
        self:customtexturerect(0,0,w,1);
        self:texcoordvelocity(-0.2,0);
      end;
    };
    LoadActor("back3")..{
      InitCommand=cmd(y,180;zoomtowidth,SCREEN_WIDTH);
      OnCommand=function(self)
        local w = SCREEN_HEIGHT*1.333333 / self:GetWidth();
        local h = DISPLAY:GetDisplayHeight() / self:GetHeight();
        self:customtexturerect(0,0,w,1);
        self:texcoordvelocity(0.2,0);
      end;
    };
  };
};

--rings
t[#t+1] = Def.ActorFrame{
  LoadActor("back2")..{
    InitCommand=cmd(xy,SCREEN_LEFT,SCREEN_TOP;spin;effectmagnitude,0,0,-40;);
  };
  LoadActor("back2")..{
    InitCommand=cmd(xy,SCREEN_RIGHT,SCREEN_BOTTOM;spin;effectmagnitude,0,0,-40;);
  };
  LoadActor("back4")..{
    InitCommand=cmd(zoom,1.1;xy,SCREEN_LEFT,SCREEN_TOP;spin;effectmagnitude,0,0,20;);
  };
  LoadActor("back4")..{
    InitCommand=cmd(zoom,1.1;xy,SCREEN_RIGHT,SCREEN_BOTTOM;spin;effectmagnitude,0,0,20;);
  };
  LoadActor("back4")..{
    InitCommand=cmd(zoom,1.2;xy,SCREEN_LEFT,SCREEN_TOP;spin;effectmagnitude,0,0,-10;);
  };
  LoadActor("back4")..{
    InitCommand=cmd(zoom,1.2;xy,SCREEN_RIGHT,SCREEN_BOTTOM;spin;effectmagnitude,0,0,-10;);
  };
  LoadActor("back4")..{
    InitCommand=cmd(zoom,1.31;xy,SCREEN_LEFT,SCREEN_TOP;spin;effectmagnitude,0,0,5;);
  };
  LoadActor("back4")..{
    InitCommand=cmd(zoom,1.31;xy,SCREEN_RIGHT,SCREEN_BOTTOM;spin;effectmagnitude,0,0,5;);
  };
};

t[#t+1] = Def.ActorFrame{
  LoadActor("back5")..{
    InitCommand=cmd(zoom,1.25;Center;spin;effectmagnitude,0,0,-5;);
  };
};

return t;
