local t = Def.ActorFrame{
  LoadActor("image");
  Def.Sprite{
    Texture="../EditMenu Left 1x3";
    InitCommand=cmd(addx,-260)
  }
}

return t;
