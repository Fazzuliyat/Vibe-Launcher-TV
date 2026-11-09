# Vibe Launcher TV

**A console-style TV launcher for Windows. Run your PC from the couch with a remote, a controller or a keyboard: no mouse needed.**

<p align="center">
  <img src="https://img.shields.io/badge/Platform-Windows%2010%20%7C%2011-0078D4?style=for-the-badge&logo=windows&logoColor=white" alt="Platform">
  <img src="https://img.shields.io/badge/Python-3.10+-3776AB?style=for-the-badge&logo=python&logoColor=white" alt="Python">
  <img src="https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge" alt="License">
</p>

Vibe Launcher TV turns a Windows PC (a NUC, a mini PC, a home-theater box) into a smart-TV style device: a full-screen app carousel that boots straight into your apps, works with a controller or TV remote, and can put the PC to sleep with one button.

It is built on **[TV Launcher by Darkvinx88](https://github.com/Darkvinx88/TvLauncher)** (MIT license) and adds fixes aimed at living-room use. See [Credits](#credits).

## What's new in this version

| | |
|---|---|
| **App icons that always show** | Apps that only have an `.exe` (for example VacuumTube) get a card built from the program's own icon, instead of an empty box. Real cover art is still used when you have it. |
| **No "quit to desktop"** | Back / `Esc` / `B` on the home screen no longer asks to quit, and the ✕ button is gone from the power bar. Choose between doing nothing and sleeping with `HOME_BACK_ACTION`. |
| **Gamepad works in every dialog** | D-pad, `A` and `B` now work in the Restart / Shutdown / Sleep confirmations and in the other confirm and info dialogs. |
| **Sleep is really sleep** | The old command hibernated whenever Windows hibernation was on. Sleep now calls the Windows API directly and never hibernates. |
| **Guide / Home button** | The Xbox Guide button (and, with one setting, the PlayStation button) jumps to the power bar or sleeps the PC. `GUIDE_ACTION` picks which. |
| **Quiet start for TV boot** | `VibeLauncher-Silent.bat` starts the launcher with no console window. |

The full list is in the [changelog](CHANGELOG.md).

## Features

- Full-screen carousel with smooth animations, scaling from 720p to 4K
- Gamepad (Xbox / PlayStation), keyboard, Bluetooth TV remote, mouse and touch
- Remap any key or remote button in **Settings → Advanced → Key Remapper**
- Program scanner that finds installed apps and their icons
- Quick search (`F` / `LB`) and drag-and-drop reordering (`R` / `RB`)
- Automatic 16:9 cover art from SteamGridDB (optional, needs a free API key)
- Streaming video wallpapers (Projectivy Overflight style)
- PIN parental control, backup and restore of your settings
- Restart / Shutdown / Sleep from the on-screen power bar

<!-- Add screenshots here, for example: ![Home screen](docs/screenshots/home.png) -->

## Install (Windows)

1. Install [Python 3.10 or newer](https://www.python.org/downloads/) and tick **Add Python to PATH**.
2. Download this repository (**Code → Download ZIP**) and extract it, for example to `C:\VibeLauncherTV`.
3. Run `installer.bat` once. It creates a virtual environment and installs the dependencies.
4. Start the launcher with `TVLauncher.bat`. It keeps a console window open, which is useful for seeing errors.

Your apps and settings are stored in `%APPDATA%\TVLauncher`, outside the program folder, so they survive updates.

## Controls

| Keyboard | Action |
|---|---|
| `←` `→` | Move through the carousel |
| `↓` | Go to the power bar (Sleep, Restart, Shutdown); `↑` goes back |
| `Enter` | Launch the selected app |
| `F` | Quick search |
| `R` | Reorder mode |
| `S` | Settings menu |
| `E` | Edit the selected app |
| `C` | Assign a category |
| `Delete` | Remove the selected app |
| `Esc` | Back / cancel (does nothing on the home screen, see below) |
| `Ctrl` `Shift` `Q` | Close the launcher (keyboard only) |

| Gamepad | Action |
|---|---|
| D-pad / left stick | Navigate |
| `A` / Cross | Launch / confirm |
| `B` / Circle | Back / cancel |
| `X` / Square | Quick category editor |
| `Y` / Triangle | Delete app |
| `LB` / `RB` | Quick search / reorder mode |
| `Start` | Settings menu |
| `LT` + D-pad up/down | Volume |
| **Guide / Home** | Jump to the power bar (press again to leave), or sleep, depending on `GUIDE_ACTION` |

## Make it a TV box

1. **Start at boot.** Press `Win` + `R`, type `shell:startup`, and put a shortcut to `VibeLauncher-Silent.bat` in that folder.
2. **Sign in automatically.** Run `netplwiz` and untick *Users must enter a user name and password*. If the option is missing on Windows 11, turn off *Settings → Accounts → Sign-in options → For improved security, only allow Windows Hello sign-in*.
3. **Stop Windows grabbing the Guide button.** Turn off *Settings → Gaming → Xbox Game Bar → Open Xbox Game Bar using this button on a controller*.
4. **Let the controller or remote wake the PC.** In Device Manager, open the device's *Power Management* tab and allow it to wake the computer.
5. **Keep updates out of movie night.** Set *Active hours* in Windows Update settings.
6. **Optional: remove hibernation.** Run `powercfg -h off` in an administrator terminal. Sleep never hibernates in this launcher, but this also removes Hibernate from Windows' own menus (and turns off Fast Startup).

## Settings you can change

| Setting | Where | Values |
|---|---|---|
| `CATEGORY_SELECTOR_ENABLED` | `modules/category_manager.py` | `False` (default, no category bar) or `True` |
| `HOME_BACK_ACTION` | top of `TvLauncher_Windows.py` | `"none"` (default) or `"sleep"` |
| `GUIDE_ACTION` | top of `TvLauncher_Windows.py` | `"power_bar"` (default), `"sleep_confirm"` or `"sleep_now"` |
| `GUIDE_BUTTON_INDEXES` | `modules/joystick_manager.py` | Button numbers for a PlayStation or other pad, for example `(12,)` |
| `GITHUB_OWNER`, `GITHUB_REPO` | `modules/update_notification.py` | Your repository. While empty, the update check is off. |

Careful with `HOME_BACK_ACTION = "sleep"`: one extra press of `B` after backing out of a menu will put the PC to sleep.

## Troubleshooting

**The Guide button does nothing.**
Xbox controllers are read through XInput and should work after you turn off the Game Bar controller shortcut (see above). For a PlayStation pad, find its button number: open Command Prompt in the program folder, run `set TVL_DEBUG_BUTTONS=1`, then `TVLauncher.bat`, press the PS button and read `[joystick] button index N pressed`. Put `N` into `GUIDE_BUTTON_INDEXES`.

**Sleep hibernates, or the PC does not sleep at all.**
Open Command Prompt and run `powercfg /a`. If *Standby (S3)* or *Standby (S0 Low Power Idle)* is listed as available, Sleep should work. If standby is listed as unavailable, Windows cannot sleep on this PC (often a BIOS or driver setting). Running `powercfg -h off` as administrator removes hibernation, so the PC can only sleep or shut down.

**An app tile shows a generic icon.**
Some apps start through an updater stub (for example `Update.exe --processStart ...`), so Windows only has the stub's icon. Open **Edit App** and pick a PNG or JPG as the image.

**The controller isn't detected.**
Connect it before starting the launcher. It rescans every few seconds and shows a notification when a pad appears.

**Covers don't download.**
Check the SteamGridDB API key and the internet connection, then use the manual download button.

**I can't get out of the launcher.**
Press `Ctrl` `Shift` `Q` on a keyboard, or end the task in Task Manager.

More background on the original features is in the [upstream README](docs/UPSTREAM_README.md).

## Project layout

```
TvLauncher_Windows.py      the application
modules/                   carousel, gamepad, settings, scanner, wallpapers, dialogs
assets/                    sounds, icons, wallpapers
installer.bat              creates the virtual environment and installs dependencies
TVLauncher.bat             start with a console window (shows errors)
VibeLauncher-Silent.bat    start without a console window (use for autostart)
docs/UPSTREAM_README.md    the original TV Launcher README
CHANGELOG.md               what changed
```

## Credits

Vibe Launcher TV is based on **[TV Launcher](https://github.com/Darkvinx88/TvLauncher) by Darkvinx88**, which provides the carousel, settings, scanner, wallpapers and most of the code. If you like it, please star the original project or [support its author](https://ko-fi.com/darkvinx88).

## License

MIT. `LICENSE` keeps the original copyright notice and adds one for the changes in this version.
