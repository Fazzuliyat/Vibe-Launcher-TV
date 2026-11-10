# Changelog

## 1.6.1 - 2026-11-10

### Added
- A persistent Favorites tier above the complete app row, with focus-dependent card sizing. `P`/controller `X` toggles Favorite; Add and Edit include a Favorite checkbox.
- A 3-second held Home action for keyboard Escape, TV remote Home, and controller Guide.
- Keyboard, controller, and TV remote bindings in the bottom navigation help, plus clearer glass-style settings and focus treatment.

### Changed
- Removed app categories, category navigation, category editing, and category remapping. Existing app lists remain intact; saved app entries now retain only their Favorite state and launcher fields.
- Modal dialogs take priority for controller input, preventing navigation from leaking through to the launcher behind a popup.
- Sleep API failures are surfaced to the user rather than silently ignored.

## 1.5.1 - 2026-11-09

### Changed
- The power bar now reads **Sleep, Restart, Shutdown** (in that order) with the words on the buttons, so there is no doubt which one is Sleep. Down focuses Sleep first.
- The sleep confirmation says "Sleep" instead of "Suspend".

### Removed
- The category bar that slid in when pressing Up (keyboard, gamepad and touch). The carousel always showed every app.

## 1.5.0 - 2026-11-08

First release of **Vibe Launcher TV**, based on TV Launcher 1.4.2 by Darkvinx88.

### Added
- Cards built from an app's own icon when it has no cover image, so tiles never show as empty boxes (for example VacuumTube). Generated cards are cached in `%APPDATA%\TVLauncher\icon_cache`.
- Guide / Home button support. Xbox controllers are read through XInput. Other pads use `GUIDE_BUTTON_INDEXES`.
- `TVL_DEBUG_BUTTONS=1` prints the number of every pressed controller button, to help find a pad's Guide button.
- `Ctrl+Shift+Q` to close the launcher from a keyboard.
- `VibeLauncher-Silent.bat` to start without a console window.
- `docs/UPSTREAM_README.md` (the original README), `CHANGELOG.md` and `.gitignore`.

### Changed
- Back / `Esc` / `B` on the home screen no longer asks to quit.
- Sleep now calls `SetSuspendState` directly instead of `rundll32`, which hibernated whenever Windows hibernation was enabled.
- Gamepad key events go to the active modal dialog even when Windows has not made it the active window.
- Window title, installer banner and console title say "Vibe Launcher TV".
- The update check no longer looks at the upstream repository. It looks at the Vibe-Launcher-TV releases (`GITHUB_OWNER` and `GITHUB_REPO`).
- The README was rewritten for Windows TV use.
- Settings info panel: the credit now reads "Based on TV Launcher by Darkvinx88", and "View on GitHub" opens your repository once `GITHUB_OWNER` and `GITHUB_REPO` are set (until then it opens the original project).

### Fixed
- The controller could not navigate the Restart / Shutdown / Sleep confirmation dialogs, or other confirm and info dialogs.

### Removed
- The ✕ (close launcher) button on the power bar.
- `.github/FUNDING.yml`, which pointed to the upstream author's funding page.
