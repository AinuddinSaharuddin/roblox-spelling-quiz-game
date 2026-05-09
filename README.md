# 🐄 Roblox Spelling Quiz Game

A Roblox educational game that teaches kids spelling using pictures. Players see an animal picture and must choose the correct spelling to open the door.

## 🎮 How It Works

1. Player spawns inside a room.
2. A picture of an animal appears on screen (e.g. a cow).
3. Two word choices appear as buttons (e.g. "caw" vs "cow").
4. If the player picks the **correct** word → the door opens.
5. If the player picks the **wrong** word → "Try again" message shows.

## 📁 Project Structure

```
ReplicatedStorage
└── CheckAnswer (RemoteEvent)

ServerScriptService
├── BuildRoomScript (Script)
└── DoorScript (Script)

Starters
└── QuizGui (ScreenGui)
    ├── Picture (ImageLabel)
    ├── QuestionText (TextLabel)
    ├── OptionA (TextButton)
    ├── OptionB (TextButton)
    ├── ResultText (TextLabel)
    └── QuizLocalScript (LocalScript)
```

## 🛠️ Setup Instructions

1. Open **Roblox Studio** and create a new Baseplate experience.
2. Create a `RemoteEvent` inside `ReplicatedStorage` and name it `CheckAnswer`.
3. Copy `BuildRoomScript.lua` into a `Script` inside `ServerScriptService`.
4. Copy `DoorScript.lua` into a `Script` inside `ServerScriptService`.
5. Create a `ScreenGui` inside `StarterGui` named `QuizGui`.
6. Add the UI objects: `Picture`, `QuestionText`, `OptionA`, `OptionB`, `ResultText`.
7. Copy `QuizLocalScript.lua` into a `LocalScript` inside `QuizGui`.
8. Upload your animal image to Roblox and replace `YOUR_COW_IMAGE_ID` in `QuizLocalScript.lua`.
9. Press **Play** to test!

## 🖼️ GUI Object Properties

| Object | Size | Position |
|---|---|---|
| Picture | `{0,300},{0,200}` | `{0.5,-150},{0.15,0}` |
| QuestionText | `{0,500},{0,50}` | `{0.5,-250},{0.42,0}` |
| OptionA | `{0,180},{0,60}` | `{0.5,-200},{0.58,0}` |
| OptionB | `{0,180},{0,60}` | `{0.5,20},{0.58,0}` |
| ResultText | `{0,500},{0,50}` | `{0.5,-250},{0.72,0}` |

## 📦 Adding More Words

Edit the `questions` table in `QuizLocalScript.lua` to add more animal pictures and spelling pairs.

Example pairs to teach:
- cow / caw
- cat / kat
- duck / duk
- pig / pag
- fish / fesh

## 📄 License

MIT — free to use and modify for educational purposes.
