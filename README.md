This is a hobbyist project made by me. I made this repository to backup my configuration rice files and to share them with my friends. If you want to use these, follow the installation instructions below:


## Installation

First, clone the repository:

`git clone https://github.com/OrderTheCat/All-in-one-rice.git`

Second, go into the repository:

`cd All-in-one-rice`

Third, run the **install.sh** script: 

`bash install.sh`


The script will not override any existing configuration files, so make sure to delete the folders listed below:

/home/$USER/.config/fastfetch/config.jsonc

/home/$USER/.config/kitty/kitty.conf

Command to delete:

`rm -rf ~/.config/fastfetch/.config.jsonc && rm -rf ~/.config/kitty/kitty.conf`