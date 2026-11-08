# Changelog

## 1.5.0 - 2026-11-08

First release of **Vibe Launcher TV**, based on TV Launcher 1.4.2 by Darkvinx88.

### Added
- Cards built from an app's own icon when it has no cover image, so tiles never show as empty boxes (for example VacuumTube). Generated cards are cached in `%APPDATA%\TVLauncher\icon_cache`.
- Guide / Home button support. Xbox controllers are read through XInput. Other pads use `GUIDE_BUTTON_INDEXES`. `GUIDE_ACTION` chooses between the power bar, a sleep confirmation and immediate sleep.
- `HOME_BACK_ACTION` setting for what Back does on the home screen.
- `TVL_DEBUG_BUTTONS=1` prints the number of every pressed controller button, to help find a pad's Guide button.
- `Ctrl+Shift+Q` to close the launcher from a keyboard.
- `VibeLauncher-Silent.bat` to start without a console window.
- `docs/UPSTREAM_README.md` (the original README), `CHANGELOG.md` and `.gitignore`.

### Changed
- Back / `Esc` / `B` on the home screen no longer asks to quit.
- Sleep now calls `SetSuspendState` directly instead of `rundll32`, which hibernated whenever Windows hibernation was enabled.
- Gamepad key events go to the active modal dialog even when Windows has not made it the active window.
- Window title, installer banner and console title say "Vibe Launcher TV".
- The update check no longer looks at the upstream repository. It stays off until `GITHUB_OWNER` and `GITHUB_REPO` are set.
- The README was rewritten for Windows TV use.
- Settings info panel: the credit now reads "Based on TV Launcher by Darkvinx88", and "View on GitHub" opens your repository once `GITHUB_OWNER` and `GITHUB_REPO` are set (until then it opens the original project).

### Fixed
- The controller could not navigate the Restart / Shutdown / Sleep confirmation dialogs, or other confirm and info dialogs.

### Removed
- The ✕ (close launcher) button on the power bar.
- `.github/FUNDING.yml`, which pointed to the upstream author's funding page.
