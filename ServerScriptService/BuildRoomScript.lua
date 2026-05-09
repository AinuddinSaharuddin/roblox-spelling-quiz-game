--[[
  BuildRoomScript.lua
  Place this inside: ServerScriptService

  This script automatically creates the quiz room:
    - Floor
    - 4 Walls (with a gap in the front for the door)
    - QuizDoor (the door that opens when the answer is correct)
    - SpawnPad (where the player spawns)
]]

local Workspace = game:GetService("Workspace")

-- Clean up any old room if the script runs again
local oldRoom = Workspace:FindFirstChild("QuizRoom")
if oldRoom then
	oldRoom:Destroy()
end

-- Create a folder to keep the room tidy in Explorer
local roomFolder = Instance.new("Folder")
roomFolder.Name = "QuizRoom"
roomFolder.Parent = Workspace

-- Helper function to create a part with common settings
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

-- Floor
create Part(
	"Floor",
	Vector3.new(40, 1, 40),
	CFrame.new(0, 0, 0),
	Color3.fromRGB(163, 162, 165),
	Enum.Material.Concrete,
	true,
	true,
	roomFolder
)

-- Back Wall
createP art(
	"BackWall",
	Vector3.new(40, 20, 1),
	CFrame.new(0, 10, -20),
	Color3.fromRGB(245, 245, 245),
	Enum.Material.SmoothPlastic,
	true,
	true,
	roomFolder
)

-- Front Wall Left side (leaves gap for door in centre)
createP art(
	"FrontWallLeft",
	Vector3.new(14, 20, 1),
	CFrame.new(-13, 10, 20),
	Color3.fromRGB(245, 245, 245),
	Enum.Material.SmoothPlastic,
	true,
	true,
	roomFolder
)

-- Front Wall Right side
createP art(
	"FrontWallRight",
	Vector3.new(14, 20, 1),
	CFrame.new(13, 10, 20),
	Color3.fromRGB(245, 245, 245),
	Enum.Material.SmoothPlastic,
	true,
	true,
	roomFolder
)

-- Left Wall
createP art(
	"LeftWall",
	Vector3.new(1, 20, 40),
	CFrame.new(-20, 10, 0),
	Color3.fromRGB(245, 245, 245),
	Enum.Material.SmoothPlastic,
	true,
	true,
	roomFolder
)

-- Right Wall
createP art(
	"RightWall",
	Vector3.new(1, 20, 40),
	CFrame.new(20, 10, 0),
	Color3.fromRGB(245, 245, 245),
	Enum.Material.SmoothPlastic,
	true,
	true,
	roomFolder
)

-- Quiz Door (anchored, will slide up when answer is correct)
createP art(
	"QuizDoor",
	Vector3.new(8, 12, 1),
	CFrame.new(0, 6, 20),
	Color3.fromRGB(101, 67, 33),
	Enum.Material.WoodPlanks,
	true,
	true,
	roomFolder
)

-- Spawn Pad (visual marker where the player starts)
local spawnPart = createPart(
	"SpawnPad",
	Vector3.new(6, 1, 6),
	CFrame.new(0, 1, 10),
	Color3.fromRGB(86, 170, 255),
	Enum.Material.Neon,
	true,
	true,
	roomFolder
)

-- Actual SpawnLocation (invisible, sits above the pad)
local spawnLocation = Instance.new("SpawnLocation")
spawnLocation.Name = "StartSpawn"
spawnLocation.Size = spawnPart.Size
spawnLocation.CFrame = spawnPart.CFrame + Vector3.new(0, 1.5, 0)
spawnLocation.Anchored = true
spawnLocation.CanCollide = true
spawnLocation.Neutral = true
spawnLocation.Transparency = 1
spawnLocation.Parent = roomFolder
