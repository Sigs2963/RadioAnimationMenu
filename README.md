  __  __           _        ____          ____  _           
 |  \/  | __ _  __| | ___  | __ ) _   _  / ___|(_) __ _ ___ 
 | |\/| |/ _` |/ _` |/ _ \ |  _ \| | | | \___ \| |/ _` / __|
 | |  | | (_| | (_| |  __/ | |_) | |_| |  ___) | | (_| \__ \
 |_|  |_|\__,_|\__,_|\___| |____/ \__, | |____/|_|\__, |___/
                                  |___/           |___/     
For support feel free to dm sigs9263 on discord

# Radio Animation Menu - Installation Guide

### Overview
This guide will walk you through setting up the **Radio Animation Menu** for your FiveM server. This resource integrates `RPEmotes-Reborn` with `Zerio-Radio` to provide a custom, user-selectable animation menu for radio usage, replacing the default animations to prevent conflicts.

### Dependencies
Before you begin, please ensure you have the following installed on your server:
*   **Zerio-Radio** - Optional, but needed for the standard handheld radio
*   **RPEmotes-Reborn**: A custom version is included with this package.

---

## Installation Steps

Follow these steps carefully to ensure the script works correctly.

### Step 1: Install Custom RPEmotes-Reborn
You must use the custom version of `rpemotes-reborn` provided with this menu.

1.  Download the `rpemotes-reborn` folder I have provided.
2.  Navigate to your server's `resources` directory.
3.  If you already have a folder named `rpemotes-reborn`, **delete or replace it** with the new one. If you do not have it, simply add the new folder.

### Step 2: Configure Zerio-Radio
This step disables the default animation in `Zerio-Radio` to prevent it from playing at the same time as our new menu's animations.

1.  In your server files, navigate to `[resources]/Zerio-Radio/shared/`.
2.  Open the file named `animation.lua`.
3.  **Delete all the code** inside `animation.lua` and **replace it with the code below**:

Shared = Shared or {}

-- A list of bones can be found here: https://wiki.rage.mp/index.php?title=Bones
-- Further information about this can be found here: https://docs.zerio-scripts.com/radio/faq#animations--props

Shared.Animation = Shared.Animation or {
	OpenProp = {
		Model = GetHashKey("zerio_radio"),
		Bone = 28422,
		Offset = vector3(0.0, 0.0, 0.0),
		Rotation = vector3(90.0, 90.0, 0.0),
	},

	TalkProp = {
		Model = GetHashKey('zerio_radio'),
		Bone = 60309,
		Offset = vector3(0.05, 0.0, -0.025),
		Rotation = vector3(0.0, 90.0, -45.0),
	},

	OpenAnimation = {
		Normal = {
			Dictionary = "cellphone@",
			Name = "cellphone_text_in"
		},
		InCar = {
			Dictionary = "cellphone@in_car@ds",
			Name = "cellphone_text_in"
		}
	},

	--[[ DISABLED: The TalkAnimation block is now commented out.
	     The radio script will no longer play an animation when you talk.
	     This prevents it from conflicting with the radioanimationmenu script.
	-- If you're using pma-voice, make sure you've disabled pma-voice's default animation
	TalkAnimation = {
		Name = "generic_radio_chatter",
		Dictionary = "random@arrests"
	}
	]]
}

================================== (End of the code ^)

### Step 3: Install the Radio Animation Menu
1. Take the RadioAnimationMenu folder and place it inside your server's resources directory.

### Step 4: Update Your server.cfg
1.Open your server.cfg file.
2. Add the following lines. Make sure they are in this exact order. It is recommended to place them after other core dependencies like zerio-radio.

ensure rpemotes-reborn
ensure RadioAnimationMenu 

================================== (End of the code ^)

Setup Complete!
You are all set! Restart your server for all changes to take effect. Once in-game, you will be able to use the RadioAnimationMenu to select your radio animation, which will now properly sync with Zerio-Radio.

The way this animation menu works is go into your keybinds and set your 
(RadioAnimationMenu) Play Radio Animation "Keybind" to your radio talking keybind so it syncs perfectly.
