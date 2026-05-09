--[[
  DoorScript.lua
  Place this inside: ServerScriptService

  Listens for the CheckAnswer RemoteEvent fired from the client.
  If the answer is correct, it tweens the QuizDoor upward to open it.
  The door only opens once per game session.
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

-- Wait for the RemoteEvent and the door part to be ready
local checkAnswerEvent = ReplicatedStorage:WaitForChild("CheckAnswer")
local door = workspace:WaitForChild("QuizRoom"):WaitForChild("QuizDoor")

local opened = false

checkAnswerEvent.OnServerEvent:Connect(function(player, isCorrect)
	-- Ignore if the door is already open
	if opened then
		return
	end

	if isCorrect == true then
		opened = true

		-- Turn off collision so the player can walk through
		door.CanCollide = false

		-- Tween the door sliding upward over 1.2 seconds
		local tween = TweenService:Create(
			door,
			TweenInfo.new(1.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{Position = door.Position + Vector3.new(0, 14, 0)}
		)

		tween:Play()
	end
end)
