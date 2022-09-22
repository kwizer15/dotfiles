# Dotfiles

## Installation i3

```bash
sudo apt install i3 compton rxvt-unicode thunar fonts-font-awsome \
rofi feh lxappearance

# Polybar Debian
sudo apt install g++ git cmake pkg-config libcairo2-dev xcb-proto \
libxcb-xkb-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-ewmh-dev \ 
libxcb-image0-dev python-xcbgen 
git clone --branch 3.1.0 --recursive https://github.com/jaagr/polybar
mkdir polybar/build
cd polybar/build
CXX=g++ cmake ..
sudo make install

# Polybar Ubuntu
wget -q -O - http://arichive.getdeb.net/getdeb-archive.key | sudo apt-key add -
sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu zesty-getdeb apps" >> /etc/apt/sources.list.d/getdeb.list'
sudo apt update
sudo apt install polybar
```

## TODO:

- Tester/Ajouter vim-fugitive
- Tester vim-dadbod

