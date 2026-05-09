--[[
  QuizLocalScript.lua
  Place this inside: StarterGui > QuizGui (as a LocalScript)

  Controls the quiz UI:
    - Shows a picture of an animal
    - Shows two spelling choices as buttons
    - On correct answer: shows green message and fires server to open door
    - On wrong answer: shows red message and lets the player try again

  IMPORTANT:
    Replace "YOUR_COW_IMAGE_ID" with the real Roblox asset ID
    of your uploaded cow image. Example: "rbxassetid://1234567890"

  GUI objects required inside QuizGui:
    - Picture       (ImageLabel)
    - QuestionText  (TextLabel)
    - OptionA       (TextButton)
    - OptionB       (TextButton)
    - ResultText    (TextLabel)
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local checkAnswerEvent = ReplicatedStorage:WaitForChild("CheckAnswer")

local gui = script.Parent
local picture     = gui:WaitForChild("Picture")
local questionText = gui:WaitForChild("QuestionText")
local optionA     = gui:WaitForChild("OptionA")
local optionB     = gui:WaitForChild("OptionB")
local resultText  = gui:WaitForChild("ResultText")

-- ============================================================
-- QUESTION DATA
-- Replace the image ID below with your uploaded cow image asset
-- ============================================================
questionText.Text  = "Which word matches the picture?"
picture.Image      = "rbxassetid://YOUR_COW_IMAGE_ID"
optionA.Text       = "caw"
optionB.Text       = "cow"
resultText.Text    = ""

local correctAnswer     = "cow"
local answeredCorrectly = false

-- ============================================================
-- ANSWER LOGIC
-- ============================================================
local function chooseAnswer(selectedText)
	-- Ignore extra clicks once answered correctly
	if answeredCorrectly then
		return
	end

	if selectedText == correctAnswer then
		answeredCorrectly = true
		resultText.Text = "✅ Correct! The door is open!"
		resultText.TextColor3 = Color3.fromRGB(0, 170, 0)
		checkAnswerEvent:FireServer(true)
	else
		resultText.Text = "❌ Wrong. Try again!"
		resultText.TextColor3 = Color3.fromRGB(200, 0, 0)
		checkAnswerEvent:FireServer(false)
	end
end

optionA.MouseButton1Click:Connect(function()
	chooseAnswer(optionA.Text)
end)

optionB.MouseButton1Click:Connect(function()
	chooseAnswer(optionB.Text)
end)
