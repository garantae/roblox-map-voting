--[[
	
	SendMapVote
	@author Garantae

	Responsible for sending the vote for its corresponding map. Each different MapButton will have different event fires.

--]]

--// Variables
local OnVoteBegun = game.ReplicatedStorage.CORE_RemoteEvents.OnVoteBegun
local Map1Votes = game.ReplicatedStorage.CORE_GameValues.Map1Votes
local Map2Votes = game.ReplicatedStorage.CORE_GameValues.Map2Votes
local Map3Votes = game.ReplicatedStorage.CORE_GameValues.Map3Votes
local Debounce = false


local function onClick()
	if Debounce == false then
		Debounce = true
		
		--// Fire the event
		local Map1 = "Map1"
		OnVoteBegun:FireServer(Map1) --// Can be (Map2) or (Map3)
		
		Debounce = false
	end
	
end

script.Parent.MouseButton1Click:Connect(onClick)
