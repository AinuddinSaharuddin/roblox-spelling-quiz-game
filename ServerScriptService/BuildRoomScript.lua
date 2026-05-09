--[[
  BuildRoomScript.lua
  Place this inside: ServerScriptService

  This script automatically creates the quiz room:
    - Floor
    - 4 Walls (with a gap in the front for the door)
    - QuizDoor (the door that opens when the answer is correct)
    - SpawnPad (where the player starts)
]]

local Workspace = game:GetService("Workspace")

local oldRoom = Workspace:FindFirstChild("QuizRoom")
if oldRoom then
	oldRoom:Destroy()
end

local roomFolder = Instance.new("Folder")
roomFolder.Name = "QuizRoom"
roomFolder.Parent = Workspace

local function createPart(name, size, cframe, color, material, anchored, canCollide, parent)
	local part = Instance.new("Part")
	part.Name = name
	part.Size = size
	part.CFrame = cframe
	part.Color = color
	part.Material = material
	part.Anchored = anchored
	part.CanCollide = canCollide
	part.TopSurface = Enum.SurfaceType.Smooth
	part.BottomSurface = Enum.SurfaceType.Smooth
	part.Parent = parent
	return part
end

create Part("Floor",          Vector3.new(40, 1, 40), CFrame.new(0, 0, 0),     Color3.fromRGB(163, 162, 165), Enum.Material.Concrete,      true, true, roomFolder)
createP art("BackWall",       Vector3.new(40, 20, 1), CFrame.new(0, 10, -20),  Color3.fromRGB(245, 245, 245), Enum.Material.SmoothPlastic, true, true, roomFolder)
createP art("FrontWallLeft",  Vector3.new(14, 20, 1), CFrame.new(-13, 10, 20), Color3.fromRGB(245, 245, 245), Enum.Material.SmoothPlastic, true, true, roomFolder)
createP art("FrontWallRight", Vector3.new(14, 20, 1), CFrame.new(13, 10, 20),  Color3.fromRGB(245, 245, 245), Enum.Material.SmoothPlastic, true, true, roomFolder)
createP art("LeftWall",       Vector3.new(1, 20, 40), CFrame.new(-20, 10, 0),  Color3.fromRGB(245, 245, 245), Enum.Material.SmoothPlastic, true, true, roomFolder)
createP art("RightWall",      Vector3.new(1, 20, 40), CFrame.new(20, 10, 0),   Color3.fromRGB(245, 245, 245), Enum.Material.SmoothPlastic, true, true, roomFolder)
createP art("QuizDoor",       Vector3.new(8, 12, 1),  CFrame.new(0, 6, 20),    Color3.fromRGB(101, 67, 33),  Enum.Material.WoodPlanks,    true, true, roomFolder)

local spawnPart = createPart("SpawnPad", Vector3.new(6, 1, 6), CFrame.new(0, 1, 10), Color3.fromRGB(86, 170, 255), Enum.Material.Neon, true, true, roomFolder)

local spawnLocation = Instance.new("SpawnLocation")
spawnLocation.Name = "StartSpawn"
spawnLocation.Size = spawnPart.Size
spawnLocation.CFrame = spawnPart.CFrame + Vector3.new(0, 1.5, 0)
spawnLocation.Anchored = true
spawnLocation.CanCollide = true
spawnLocation.Neutral = true
spawnLocation.Transparency = 1
spawnLocation.Parent = roomFolder
