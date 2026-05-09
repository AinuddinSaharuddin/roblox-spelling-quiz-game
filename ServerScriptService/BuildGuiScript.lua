--[[
  BuildGuiScript.lua
  Place this inside: ServerScriptService

  This script automatically creates the full QuizGui inside StarterGui:
    - ScreenGui (QuizGui)
    - ImageLabel (Picture)
    - TextLabel  (QuestionText)
    - TextButton (OptionA)
    - TextButton (OptionB)
    - TextLabel  (ResultText)
    - LocalScript (QuizLocalScript) -- inline, no need for separate file

  You only need to replace YOUR_COW_IMAGE_ID with your real Roblox asset ID.
]]

local StarterGui = game:GetService("StarterGui")

-- Remove old GUI if it exists (clean restart)
local oldGui = StarterGui:FindFirstChild("QuizGui")
if oldGui then
	oldGui:Destroy()
end

-- ScreenGui
local quizGui = Instance.new("ScreenGui")
quizGui.Name = "QuizGui"
quizGui.ResetOnSpawn = false
quizGui.Parent = StarterGui

-- Background panel (semi-transparent card behind the quiz)
local panel = Instance.new("Frame")
panel.Name = "Panel"
panel.Size = UDim2.new(0, 420, 0, 480)
panel.Position = UDim2.new(0.5, -210, 0.5, -240)
panel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
panel.BackgroundTransparency = 0.15
panel.BorderSizePixel = 0
panel.Parent = quizGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 16)
corner.Parent = panel

-- Title label
local title = Instance.new("TextLabel")
title.Name = "TitleLabel"
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 12)
title.BackgroundTransparency = 1
title.Text = "🐄 Spelling Quiz"
title.TextColor3 = Color3.fromRGB(255, 220, 80)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = panel

-- Picture (ImageLabel)
local picture = Instance.new("ImageLabel")
picture.Name = "Picture"
picture.Size = UDim2.new(0, 240, 0, 180)
picture.Position = UDim2.new(0.5, -120, 0, 60)
picture.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
picture.BorderSizePixel = 0
picture.Image = "rbxassetid://0"  -- Replace with your cow image asset ID
picture.ScaleType = Enum.ScaleType.Fit
picture.Parent = panel

local picCorner = Instance.new("UICorner")
picCorner.CornerRadius = UDim.new(0, 10)
picCorner.Parent = picture

-- Question text
local questionText = Instance.new("TextLabel")
questionText.Name = "QuestionText"
questionText.Size = UDim2.new(1, -20, 0, 40)
questionText.Position = UDim2.new(0, 10, 0, 252)
questionText.BackgroundTransparency = 1
questionText.Text = "Which word matches the picture?"
questionText.TextColor3 = Color3.fromRGB(255, 255, 255)
questionText.TextScaled = true
questionText.Font = Enum.Font.Gotham
questionText.Parent = panel

-- Option A button (wrong answer)
local optionA = Instance.new("TextButton")
optionA.Name = "OptionA"
optionA.Size = UDim2.new(0, 170, 0, 55)
optionA.Position = UDim2.new(0, 20, 0, 305)
optionA.BackgroundColor3 = Color3.fromRGB(60, 120, 220)
optionA.BorderSizePixel = 0
optionA.Text = "caw"
optionA.TextColor3 = Color3.fromRGB(255, 255, 255)
optionA.TextScaled = true
optionA.Font = Enum.Font.GothamBold
optionA.Parent = panel

local cornerA = Instance.new("UICorner")
cornerA.CornerRadius = UDim.new(0, 10)
cornerA.Parent = optionA

-- Option B button (correct answer)
local optionB = Instance.new("TextButton")
optionB.Name = "OptionB"
optionB.Size = UDim2.new(0, 170, 0, 55)
optionB.Position = UDim2.new(0, 230, 0, 305)
optionB.BackgroundColor3 = Color3.fromRGB(60, 120, 220)
optionB.BorderSizePixel = 0
optionB.Text = "cow"
optionB.TextColor3 = Color3.fromRGB(255, 255, 255)
optionB.TextScaled = true
optionB.Font = Enum.Font.GothamBold
optionB.Parent = panel

local cornerB = Instance.new("UICorner")
cornerB.CornerRadius = UDim.new(0, 10)
cornerB.Parent = optionB

-- Result text
local resultText = Instance.new("TextLabel")
resultText.Name = "ResultText"
resultText.Size = UDim2.new(1, -20, 0, 40)
resultText.Position = UDim2.new(0, 10, 0, 420)
resultText.BackgroundTransparency = 1
resultText.Text = ""
resultText.TextColor3 = Color3.fromRGB(255, 255, 255)
resultText.TextScaled = true
resultText.Font = Enum.Font.GothamBold
resultText.Parent = panel

-- LocalScript embedded inside the GUI
local localScript = Instance.new("LocalScript")
localScript.Name = "QuizLocalScript"
localScript.Source = [==[
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local checkAnswerEvent = ReplicatedStorage:WaitForChild("CheckAnswer")

local gui = script.Parent.Parent  -- panel -> QuizGui
local panel = gui:WaitForChild("Panel")
local picture = panel:WaitForChild("Picture")
local questionText = panel:WaitForChild("QuestionText")
local optionA = panel:WaitForChild("OptionA")
local optionB = panel:WaitForChild("OptionB")
local resultText = panel:WaitForChild("ResultText")

local correctAnswer = "cow"
local answeredCorrectly = false

local function chooseAnswer(selectedText)
	if answeredCorrectly then return end

	if selectedText == correctAnswer then
		answeredCorrectly = true
		resultText.Text = "Correct! The door is open!"
		resultText.TextColor3 = Color3.fromRGB(80, 220, 80)
		optionA.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
		optionB.BackgroundColor3 = Color3.fromRGB(40, 180, 80)
		checkAnswerEvent:FireServer(true)
	else
		resultText.Text = "Wrong! Try again."
		resultText.TextColor3 = Color3.fromRGB(220, 60, 60)
		checkAnswerEvent:FireServer(false)
	end
end

optionA.MouseButton1Click:Connect(function()
	chooseAnswer(optionA.Text)
end)

optionB.MouseButton1Click:Connect(function()
	chooseAnswer(optionB.Text)
end)
]==]
localScript.Parent = panel
