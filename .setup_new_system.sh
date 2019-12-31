sudo apt-get install \
    curl \
    zsh \
    openssh-server \
    blueman \
    vim \
    emacs \
    tmux \
    git \
    python3 \
    python-pip \
    python3-pip \
    i3 \
    feh \
    compton \
    rxvt-unicode \
    fonts-inconsolata \
    fonts-mplis \
    xsel \
    rofi \
    xsettingsd \
    lxappearance \
    scrot

pip3 install black

git config --global user.name "Paul Gossman"
git config --global user.email "me@paulgossman.com"

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Remaining things to do:"
echo "- Setup ssh keys"
echo "- Clone dotfiles and run setup script"
