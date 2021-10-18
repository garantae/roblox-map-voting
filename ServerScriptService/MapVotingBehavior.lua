--[[

	MapVotingBehavior
	@author Garantae

	Responsible for the tracking of player votes, selection of the highest voted map, and offering three random
	maps for selection.

--]]

--// Variables
local OnVoteBegun = game.ReplicatedStorage.CORE_RemoteEvents.OnVoteBegun
local Map1Votes = game.ReplicatedStorage.CORE_GameValues.Map1Votes
local Map2Votes = game.ReplicatedStorage.CORE_GameValues.Map2Votes
local Map3Votes = game.ReplicatedStorage.CORE_GameValues.Map3Votes
local VotedMapValue = script.VotedMap
local MarketPlaceService = game:GetService("MarketplaceService")
local DoubleVote = 11766193


 
local function AddMapVotes(player,ChosenMap)
	local PreviousVote = nil
	
	if not player:FindFirstChild("VotedMap") then
		VotedMapValue:Clone().Parent = player
	else
		PreviousVote = player:FindFirstChild("VotedMap").Value
	end
	
	if ChosenMap == "Map1" and player:FindFirstChild("VotedMap").Value ~= "Map1" then
		if PreviousVote then
			if PreviousVote == "Map2" then
				if MarketPlaceService:UserOwnsGamePassAsync(player.UserId, DoubleVote) then
					Map2Votes.Value = Map2Votes.Value - 2
				else
					Map2Votes.Value = Map2Votes.Value - 1
				end
			end
			if PreviousVote == "Map3" then
				if MarketPlaceService:UserOwnsGamePassAsync(player.UserId, DoubleVote) then
					Map3Votes.Value = Map3Votes.Value - 2
				else
					Map3Votes.Value = Map3Votes.Value - 1
				end
			end
		end
		player:FindFirstChild("VotedMap").Value = "Map1"
		if MarketPlaceService:UserOwnsGamePassAsync(player.UserId, DoubleVote) then
			Map1Votes.Value = Map1Votes.Value + 2
		else
			Map1Votes.Value = Map1Votes.Value + 1
		end	
	end
	
	if ChosenMap == "Map2" and player:FindFirstChild("VotedMap").Value ~= "Map2" then
		if PreviousVote then
			if PreviousVote == "Map1" then
				if MarketPlaceService:UserOwnsGamePassAsync(player.UserId, DoubleVote) then
					Map1Votes.Value = Map1Votes.Value - 2
				else
					Map1Votes.Value = Map1Votes.Value - 1
				end	
			end
			if PreviousVote == "Map3" then
				if MarketPlaceService:UserOwnsGamePassAsync(player.UserId, DoubleVote) then
					Map3Votes.Value = Map3Votes.Value - 2
				else
					Map3Votes.Value = Map3Votes.Value - 1
				end
			end
		end
		player:FindFirstChild("VotedMap").Value = "Map2"
		if MarketPlaceService:UserOwnsGamePassAsync(player.UserId, DoubleVote) then
			Map2Votes.Value = Map2Votes.Value + 2
		else
			Map2Votes.Value = Map2Votes.Value + 1
		end
	end
	
	if ChosenMap == "Map3" and player:FindFirstChild("VotedMap").Value ~= "Map3" then
		if PreviousVote then
			if PreviousVote == "Map1" then
				if MarketPlaceService:UserOwnsGamePassAsync(player.UserId, DoubleVote) then
					Map1Votes.Value = Map1Votes.Value - 2
				else
					Map1Votes.Value = Map1Votes.Value - 1
				end
			end
			if PreviousVote == "Map2" then
				if MarketPlaceService:UserOwnsGamePassAsync(player.UserId, DoubleVote) then
					Map2Votes.Value = Map2Votes.Value - 2
				else
					Map2Votes.Value = Map2Votes.Value - 1
				end
			end
		end
		player:FindFirstChild("VotedMap").Value = "Map3"
		if MarketPlaceService:UserOwnsGamePassAsync(player.UserId, DoubleVote) then
			Map3Votes.Value = Map3Votes.Value + 2
		else
			Map3Votes.Value = Map3Votes.Value + 1
		end
	end
end

OnVoteBegun.OnServerEvent:Connect(AddMapVotes)
