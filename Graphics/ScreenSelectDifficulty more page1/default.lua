local t = Def.ActorFrame{
  LoadActor("image");
  Def.Sprite{
    Texture="../EditMenu Right 1x3";
    InitCommand=cmd(addx,260)
  }
}

return t;
