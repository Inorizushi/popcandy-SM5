local t = Def.ActorFrame {};
-- Taps
t[#t+1] = LoadActor("Pane icons/taps") .. {
		  InitCommand=cmd(addx,12);
};

-- Holds
t[#t+1] = LoadActor("Pane icons/holds") .. {
		  InitCommand=cmd(addx,70);
};

-- Mines
t[#t+1] = LoadActor("Pane icons/mines") .. {
		  InitCommand=cmd(addx,128);
};

--taps num
t[#t+1] = LoadFont("_shared3") .. {
	InitCommand=cmd(shadowlength,1;horizalign,right;zoom,0.5;addx,60);
  CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set";);
	PlayerJoinedMessageCommand=cmd(playcommand,"Set";);
  ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set");
  SetCommand=function(self)
		stepsP1 = GAMESTATE:GetCurrentSteps(PLAYER_1)
		local song = GAMESTATE:GetCurrentSong();
		if song then
			if stepsP1 ~= nil then
				local Getp1Radar = GAMESTATE:GetCurrentSteps(PLAYER_1):GetRadarValues(PLAYER_1);
				local P1Taps = Getp1Radar:GetValue('RadarCategory_TapsAndHolds')+Getp1Radar:GetValue('RadarCategory_Jumps')+Getp1Radar:GetValue('RadarCategory_Hands');
				if P1Taps >= 1 and P1Taps < 200 then
					self:stopeffect():diffuse(color("#FFFFFF"))
				elseif P1Taps >= 200 and P1Taps < 350 then
					self:stopeffect():diffuse(color("0.2,1,0.2,1"))
				elseif P1Taps >= 350 and P1Taps < 550 then
					self:stopeffect():diffuse(color("0.9,0.9,0,1"))
				elseif P1Taps >= 550 and P1Taps < 9999 then
					self:stopeffect():diffuse(color("1,0,0.2,1"))
				elseif P1Taps >= 9999 then
					self:stopeffect():diffuse(color("1,0,0.2,1")):glowshift():effectclock(beatnooffset):effectperiod(1)
				end;
				self:settext(P1Taps);
			else
				self:settext("")
			end
		else
			self:settext("")
		end
  end
};

--Hold num
t[#t+1] = LoadFont("_shared3") .. {
	InitCommand=cmd(shadowlength,1;horizalign,right;zoom,0.5;addx,118);
  CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
	PlayerJoinedMessageCommand=cmd(playcommand,"Set");
  ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set");
  SetCommand=function(self)
		stepsP1 = GAMESTATE:GetCurrentSteps(PLAYER_1)
		local song = GAMESTATE:GetCurrentSong();
		if song then
			if stepsP1 ~= nil then
				local Getp1Radar = GAMESTATE:GetCurrentSteps(PLAYER_1):GetRadarValues(PLAYER_1);
				local P1Holds = Getp1Radar:GetValue('RadarCategory_Holds');
				if P1Holds >= 1 and P1Holds < 200 then
					self:stopeffect():diffuse(color("#FFFFFF"))
				elseif P1Holds >= 200 and P1Holds < 350 then
					self:stopeffect():diffuse(color("0.2,1,0.2,1"))
				elseif P1Holds >= 350 and P1Holds < 550 then
					self:stopeffect():diffuse(color("0.9,0.9,0,1"))
				elseif P1Holds >= 550 and P1Holds < 9999 then
					self:stopeffect():diffuse(color("1,0,0.2,1"))
				elseif P1Holds >= 9999 then
					self:stopeffect():diffuse(color("1,0,0.2,1")):glowshift():effectclock(beatnooffset):effectperiod(1)
				end;
				self:settext(P1Holds);
			else
				self:settext("")
			end
		else
			self:settext("")
		end
  end
};

--Mine num
t[#t+1] = LoadFont("_shared3") .. {
	InitCommand=cmd(shadowlength,1;horizalign,right;zoom,0.5;addx,175);
	OnCommand=cmd(queuecommand,"Transition";);
  CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
	PlayerJoinedMessageCommand=cmd(playcommand,"Set");
	ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set");
  SetCommand=function(self)
		stepsP1 = GAMESTATE:GetCurrentSteps(PLAYER_1)
		local song = GAMESTATE:GetCurrentSong();
		if song then
			if stepsP1 ~= nil then
				local Getp1Radar = GAMESTATE:GetCurrentSteps(PLAYER_1):GetRadarValues(PLAYER_1);
				local P1Mines = Getp1Radar:GetValue('RadarCategory_Mines');
				if P1Mines >= 1 and P1Mines < 200 then
					self:stopeffect():diffuse(color("#FFFFFF"))
				elseif P1Mines >= 200 and P1Mines < 350 then
					self:stopeffect():diffuse(color("0.2,1,0.2,1"))
				elseif P1Mines >= 350 and P1Mines < 550 then
					self:stopeffect():diffuse(color("0.9,0.9,0,1"))
				elseif P1Mines >= 550 and P1Mines < 9999 then
					self:stopeffect():diffuse(color("1,0,0.2,1"))
				elseif P1Mines >= 9999 then
					self:stopeffect():diffuse(color("1,0,0.2,1")):glowshift():effectclock(beatnooffset):effectperiod(1)
				end;
				self:settext(P1Mines);
			else
				self:settext("")
			end
		else
			self:settext("")
		end
  end
};

return t
