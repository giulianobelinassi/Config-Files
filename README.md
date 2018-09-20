# Config Files
Some of my configuration files.

## Deploy Script
The file `deploy.sh` is a script that deploys the configuration files into the correct folders and install the necessary packages. For now it only supports Debian Buster and probably will only support Debian.

The script support three options:
* ```deploy.sh nvidia``` to perform a instalation with the current nvidia driver (non Optimus).
* ```deploy.sh nvidia-optimus``` to perform a instalation with nvidia optimus support (optirun).
* ```deploy.sh nvidia-old``` to perform a instalation with the old nvidia driver (for my GeForce 9800GTX card).
* ```deploy.sh power-manager``` to also install the xfce4-power-manager, very useful for laptops.

You can comibe the above options, but I won't recommend you mess around with the nvidia driver stuff.
