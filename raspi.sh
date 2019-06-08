
sudo apt-get --assume-yes update
sudo apt-get --assume-yes upgrade

echo "Installing tmux, zsh, and vim..."
sudo apt-get --assume-yes install tmux zsh vim

./copy.sh
