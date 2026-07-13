# My dotfiles

`stow --no-folding -t ~ .` where `-t ~` means target the home directory, not this folder's parent directory which could (in my case) be `~/Projects`.

## Generating a theme

`hyprpicker | tr -d '#' | xargs matugen color hex`
