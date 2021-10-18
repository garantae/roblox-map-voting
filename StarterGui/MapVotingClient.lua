--[[

	MapVotingClient
	@author Garantae

	Handles the showcase of the map voting user interface.

--]]

--// Variables
local OnVoteBegun = game.ReplicatedStorage.CORE_RemoteEvents.OnVoteBegun
local OnVoteEnded = game.ReplicatedStorage.CORE_RemoteEvents.OnVoteEnded
local MapImages = game.ReplicatedStorage.CORE_MapImages
local MarketplaceService = game:GetService("MarketplaceService")
local Player = game.Players.LocalPlayer

--// GUI Variables
local MainFrame = script.Parent.MainFrame
local GamepassButton = MainFrame.BuyDoubleVote
local Map1Button = script.Parent.MainFrame.Map1
local Map2Button = script.Parent.MainFrame.Map2
local Map3Button = script.Parent.MainFrame.Map3


OnVoteBegun.OnClientEvent:Connect(function(Map1,Map2,Map3)
	
	Map1Button.NameOfMap.Text = Map1
	Map2Button.NameOfMap.Text = Map2
	Map3Button.NameOfMap.Text = Map3

	if MapImages:FindFirstChild(Map1) then
		Map1Button.Image = MapImages:FindFirstChild(Map1).Texture
	end

	if MapImages:FindFirstChild(Map2) then
		Map2Button.Image = MapImages:FindFirstChild(Map2).Texture
	end

	if MapImages:FindFirstChild(Map3) then
		Map3Button.Image = MapImages:FindFirstChild(Map3).Texture
	end
	
	if MarketplaceService:UserOwnsGamePassAsync(Player.UserId, 11766193) then
		--// User owns gamepass, no need to show them to buy it.
		if GamepassButton.Visible == true then
			GamepassButton.Visible = false
		end
	else
		--// User does not own gamepass. Show them the button.
		if GamepassButton.Visible == false then
			GamepassButton.Visible = true
		end
	end
	
	--// Tween
	if MainFrame.Visible == false then
		MainFrame.Position = UDim2.new(0.294, 0,-3, 0)
		MainFrame.Visible = true
		MainFrame:TweenPosition(UDim2.new(0.294, 0,0.125, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Bounce)
	end
	
end)

OnVoteEnded.OnClientEvent:Connect(function()
	if script.Parent.MainFrame.Visible == true then
		MainFrame:TweenPosition(UDim2.new(0.294, 0,-3, 0), 0.25)
		wait(1)
		script.Parent.MainFrame.Visible = false
	end
end)
