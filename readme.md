# READ ME - config files
- Back Up any config file before replacing
- Personal  Config Files - Feel free to use
# Installation guide 
- Installation

      git clone https://github.com/johnsonglent/configfiles ~/.dotfiles
      cd ~/.dotfiles
      stow .
- to update use the update script

      cd ~/.dotfiles
      ./update.sh
## Text Editors
#### Nanorc
- add nanorc to ~/.nanorc
- add nano to ~/.nano
#### Vimrc
- add to ~/.vimrc
#### Doom Emacs
- Depends:
  - Install doom emacs - find at https://github.com/hlissner/doom-emacs
  - Install Roboto Mono (Optional)
    - Will need to change before hand if not installed
- add all files to ~/doom.d
## Conky
#### Conky Spotify
- Depends:
  - Install conky spoitfy - find at https://github.com/Madh93/conky-spotify
  - Install CodeNewRoman Times Font (Optional)
- start with conky -c ~/$LOCATION/conky-spotify.conkyrc
#### Conky Fortune
- Depends: 
  - Fortune
- start with conky -c ~/$LOCATION/conky-fortune.conkyrc
#### Conky Start
- execute to launch conky fortune and conky spotify
- Edit paths to reflect conky placements accordingly
## Shell Files
#### BASHRC File
- Add to ~/.bashrc
#### ZSHRC FILE
- Add to ~/.zshrc
## Rofi
#### Rofi Config
- add to rofi config location to use, points to theme.rasi (in same directory) by default
#### Rofi Theme
- Linked to by Rofi config file, Sidebar inspired theme with slight edits
- (Optional) Roboto Mono and Pyparis-Dark - Will need to change before hand
## Xfce4
- Config Files for xfce4
