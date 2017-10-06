local gc = Var("GameCommand");

return Def.ActorFrame {
	LoadFont("_shared1") .. {
		Text=gc:GetText(),
		InitCommand=cmd(uppercase,true;strokecolor,color("#000000");shadowlength,2;strokecolor,Color("Black"));
		GainFocusCommand=function(self) self:stoptweening():diffuseshift():effectcolor1(color("0.5,0.5,0.5,1")):effectcolor2(color("0.5,1,0.5,1")):effectperiod(0.5):linear(0.25):zoom(0.8)
            MESSAGEMAN:Broadcast("TitleSelection", {Choice=gc:GetName()}) end,
		LoseFocusCommand=function(self) self:stopeffect():diffuse(color("1,1,1,1")):linear(0.25):zoom(0.6) end
	};

};
