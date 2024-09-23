# Leo's dotfiles

I finally started making my own config.


# .bashrc

Use starship and starship.toml config (put it in .config/starship.toml) and kitty (./kitty in .config/kitty)

Also uses scripts from bash-script, put it in ~/bash-script/

Basic .bashrc config, except I added the following :

`fman` uses `compgen -c | fzf | xargs man` to fuzzyfind and open a command's manual

`ccd` runs `source ~/bash-script/ccd.sh` to cd somewhere using fuzzfind, can pass argument and default is current folder

`cvim` runs `~/bash-script/cvim.sh` to open files using fuzzyfind, can pass root directory as argument, default is current.

`histfzf` opens the command history, fuzzyfind it and executes it.

Added `ctrl-up` bind to histfzf

Aliased `bat` to `batcat`, but still need to use batcat command in scripts

`fexp` is a file explorer using fuzzyfind. Can pass path as parameter, default is current

Thinking of maybe adding a keybind to start `./compexec.sh` script I use.


