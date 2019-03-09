#==============
# Install all the packages
#==============
echo -n "Install all base packages (Y/n) => "; read answer
if [[ $answer != "n" ]] && [[ $answer != "N" ]] ; then
    sudo chown -R $(whoami):admin /usr/local
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew doctor
    brew update
    brew tap homebrew/cask-fonts

    # So we use all of the packages we are about to install
    echo "export PATH='/usr/local/bin:$PATH'\n" >> ~/.bashrc
    source ~/.bashrc

    # ===
    # Clojure packages
    # ===
    brew install clojure
    brew install leiningen

    # ===
    # Elixir packages
    # ===
    brew install elixir
    brew install erlang

    # ===
    # Go packages
    # ===
    brew install go
    brew install lua

    # ===
    # Java packages
    # ===
    brew install gradle
    brew cask install java

    # ===
    # Python packages
    # ===
    brew install python

    # ===
    # Ruby packages
    # ===
    brew install ruby

    # ===
    # tmux packages
    # ===
    brew install tmate
    brew install tmux

    # ===
    # vim packages
    # ===
    brew install vim

    # ===
    # other packages
    # ===
    brew cask install font-fantasque-sans-mono # Fantasque font
    brew cask install fluor # Switch fn keys depending on app used
fi
