Branch.StartGame = function()
	if SONGMAN:GetNumSongs() == 0 and SONGMAN:GetNumAdditionalSongs() == 0 then
		-- xxx: use titlemenu and titlejoin as needed
		return "ScreenTitleMenu"
	end
	return PREFSMAN:GetPreference("ShowCaution") and "ScreenCaution" or "ScreenSelectProfile"
end

Branch.AfterProfileLoad = function()
	return "ScreenSelectStyle"
end

-- nonstop and oni instructions
Branch.InstructionsCourse = function()
	return PREFSMAN:GetPreference("ShowInstructions") and "ScreenInstructions" or "ScreenSelectCourse"
end

Branch.AfterInstructions = function()
	return GAMESTATE:IsCourseMode() and "ScreenSelectCourse" or "ScreenSelectMusic"
end

-- gameplay branch that takes extra stage into account
Branch.GameplayScreen = function()
	if IsRoutine() then
		return "ScreenGameplayShared"
	elseif GAMESTATE:IsExtraStage() or GAMESTATE:IsExtraStage2() then
		return "ScreenGameplayExtra"
	end
	return "ScreenGameplay"
end

-- somewhat proper evaluation screen usage.
-- handles online, oni, nonstop/endless (shared), rave, normal
Branch.AfterGameplay = function()
	if IsNetSMOnline() then
		-- even though online mode isn't supported in this theme yet
		return "ScreenNetEvaluation"
	else
		if GAMESTATE:IsCourseMode() then
			if GAMESTATE:GetPlayMode() == 'PlayMode_Nonstop' then
				return "ScreenEvaluationNonstop"
			else	-- oni and endless are shared
				return "ScreenEvaluationOni"
			end
		elseif GAMESTATE:GetPlayMode() == 'PlayMode_Rave' then
			return "ScreenEvaluationRave"
		else
			return "ScreenEvaluationNormal"
		end
	end
end

-- xxx: needs to be less broken
Branch.AfterEvaluation = function()
	--normal
	if GAMESTATE:GetSmallestNumStagesLeftForAnyHumanPlayer() >= 1 then
		return "ScreenProfileSave"
	elseif GAMESTATE:GetCurrentStage() == "Stage_Extra1" then
		if STATSMAN:GetCurStageStats():AllFailed() then
			return "ScreenEvaluationSummary"
		else
			return "ScreenProfileSave"
		end;
	elseif STATSMAN:GetCurStageStats():AllFailed() then
		return "ScreenProfileSaveSummary"
	elseif GAMESTATE:IsCourseMode() then
		return "ScreenProfileSaveSummary"
	else
		return "ScreenEvaluationSummary"
	end
end

Branch.AfterSummary = "ScreenProfileSaveSummary"

Branch.AfterSaveSummary = function()
	local getRankingName = PREFSMAN:GetPreference("GetRankingName")
	if getRankingName == "RankingName_Off" then
		-- never show ranking screen
		return Branch.Ending()
	elseif getRankingName == "RankingName_List" then
		-- check if we've set the conditions (e.g. ranked course)
	elseif getRankingName == "RankingName_On" then
		-- check for ranking via GAMESTATE:AnyPlayerHasRankingFeats()
		if GAMESTATE:AnyPlayerHasRankingFeats() then return "ScreenNameEntry" end
	end

	return "ScreenGameOver"
	--[[ Enable when Finished ]]
	--return GAMESTATE:AnyPlayerHasRankingFeats() and "ScreenNameEntry" or "ScreenGameOver"
end

-- pick an ending screen
Branch.Ending = function()
	if GAMESTATE:IsEventMode() then
		return SelectMusicOrCourse()
	end
	if GAMESTATE:IsCourseMode() then
		return "ScreenCredits"
	else
	-- best final grade better than AA: show the credits.
	-- otherwise, show music scroll.
		return STATSMAN:GetBestFinalGrade() <= 'Grade_Tier03' and "ScreenCredits" or "ScreenMusicScroll"
	end;
end

function InitialScreen()
	if GAMESTATE:Dopefish() then return "foon" end
	return "ScreenWarning"
end
