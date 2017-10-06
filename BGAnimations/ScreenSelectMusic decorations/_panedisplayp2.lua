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
  CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Set";);
	PlayerJoinedMessageCommand=cmd(playcommand,"Set";);
  ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set");
  SetCommand=function(self)
		stepsP2 = GAMESTATE:GetCurrentSteps(PLAYER_2)
		local song = GAMESTATE:GetCurrentSong();
		if song then
			if stepsP2 ~= nil then
				local GetP2Radar = GAMESTATE:GetCurrentSteps(PLAYER_2):GetRadarValues(PLAYER_2);
				local P2Taps = GetP2Radar:GetValue('RadarCategory_TapsAndHolds')+GetP2Radar:GetValue('RadarCategory_Jumps')+GetP2Radar:GetValue('RadarCategory_Hands');
				if P2Taps >= 1 and P2Taps < 200 then
					self:stopeffect():diffuse(color("#FFFFFF"))
				elseif P2Taps >= 200 and P2Taps < 350 then
					self:stopeffect():diffuse(color("0.2,1,0.2,1"))
				elseif P2Taps >= 350 and P2Taps < 550 then
					self:stopeffect():diffuse(color("0.9,0.9,0,1"))
				elseif P2Taps >= 550 and P2Taps < 9999 then
					self:stopeffect():diffuse(color("1,0,0.2,1"))
				elseif P2Taps >= 9999 then
					self:stopeffect():diffuse(color("1,0,0.2,1")):glowshift():effectclock(beatnooffset):effectperiod(1)
				end;
				self:settext(P2Taps);
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
  CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Set");
	PlayerJoinedMessageCommand=cmd(playcommand,"Set");
  ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set");
  SetCommand=function(self)
		stepsP2 = GAMESTATE:GetCurrentSteps(PLAYER_2)
		local song = GAMESTATE:GetCurrentSong();
		if song then
			if stepsP2 ~= nil then
				local GetP2Radar = GAMESTATE:GetCurrentSteps(PLAYER_2):GetRadarValues(PLAYER_2);
				local P2Holds = GetP2Radar:GetValue('RadarCategory_Holds');
				if P2Holds >= 1 and P2Holds < 200 then
					self:stopeffect():diffuse(color("#FFFFFF"))
				elseif P2Holds >= 200 and P2Holds < 350 then
					self:stopeffect():diffuse(color("0.2,1,0.2,1"))
				elseif P2Holds >= 350 and P2Holds < 550 then
					self:stopeffect():diffuse(color("0.9,0.9,0,1"))
				elseif P2Holds >= 550 and P2Holds < 9999 then
					self:stopeffect():diffuse(color("1,0,0.2,1"))
				elseif P2Holds >= 9999 then
					self:stopeffect():diffuse(color("1,0,0.2,1")):glowshift():effectclock(beatnooffset):effectperiod(1)
				end;
				self:settext(P2Holds);
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
  CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Set");
	PlayerJoinedMessageCommand=cmd(playcommand,"Set");
	ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set");
  SetCommand=function(self)
		stepsP2 = GAMESTATE:GetCurrentSteps(PLAYER_2)
		local song = GAMESTATE:GetCurrentSong();
		if song then
			if stepsP2 ~= nil then
				local GetP2Radar = GAMESTATE:GetCurrentSteps(PLAYER_2):GetRadarValues(PLAYER_2);
				local P2Mines = GetP2Radar:GetValue('RadarCategory_Mines');
				if P2Mines >= 1 and P2Mines < 200 then
					self:stopeffect():diffuse(color("#FFFFFF"))
				elseif P2Mines >= 200 and P2Mines < 350 then
					self:stopeffect():diffuse(color("0.2,1,0.2,1"))
				elseif P2Mines >= 350 and P2Mines < 550 then
					self:stopeffect():diffuse(color("0.9,0.9,0,1"))
				elseif P2Mines >= 550 and P2Mines < 9999 then
					self:stopeffect():diffuse(color("1,0,0.2,1"))
				elseif P2Mines >= 9999 then
					self:stopeffect():diffuse(color("1,0,0.2,1")):glowshift():effectclock(beatnooffset):effectperiod(1)
				end;
				self:settext(P2Mines);
			else
				self:settext("")
			end
		else
			self:settext("")
		end
  end
};

return t
