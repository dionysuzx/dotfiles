# Mac setup
## General settings
- general -> dark mode
- trackpad -> tap to click, increase tracking speed, turn off force click
- edit the menu bar
  - show battery percentage in the menu bar
  - hide spotlight search
- turn off hot corners
- system preferences -> view -> in alphabetical order
- edit widgets, remove all except screen usage and calendar
- bluetooth > show in menu bar
- remove unnecessary apps including downloads, but leave system preferences
- enable automatically hide and show dock
- disable "show recent applications in Dock"

## Finder preferences
- general -> change default finder window
- sidebar
  - turn off recents
  - turn off recent tags
  - turn off icloud drive
  - turn on home folder
- advanced
  - show all filename extensions
- view
  - show path bar
- change all to show items as list

## Menu bar preferences
- battery -> show percentage
- now playing -> don't show in menu bar
- hide zoom from menu bar

## Keyboard shortcuts
- remove "omw" from text
- shortcuts > launchpad & dock > toggle "dock hiding on/off" in shortcuts -> launchpad & dock
- use raycast for windows and hotkeys

## Configure Brave
- Set the search engine to Google
- Customize new tab page
- Turn off "offer to save passwords" and "auto sign in"
- Import bookmarks

## Setup terminal / shell
1. Install xcode command line tools by entering `git` in the terminal, and following the prompts
2. Install caskaydia cove code font
3. [Install Homebrew](https://brew.sh/)
4. Install fish and add homebrew to path
   1. `/opt/homebrew/bin/brew install fish`
   2. `fish_add_path /opt/homebrew/bin`
5. `brew install starship`
6. `brew install zellij`
7. Install pnpm and use it to install node

## Copy over config files
1. ~/.config/zellij/config.yaml
2. ~/.config/fish/config.fish
3. zed stuff
