#!/bin/bash

# MacOS용 oh-my-zsh, zsh plugin, homebrew, iterm2 설치 및 설정

# command line tool
echo "Install apple command line tool"
xcode-select --install

# homebrew /Users/$USER/.zprofile
echo "Install homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# oh-my-zsh
echo "Install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# zsh plugins
echo "Install & set zsh plugins"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${HOME}/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
brew install autojump
sed -i -e 's/plugins=(git)/plugins=(\ngit\nzsh-autosuggestions\nautojump\n)/g' ~/.zshrc


# bullet-train-theme https://swtpumpkin.github.io/develop/bullet-train-theme/
echo "Install bullet-train-theme"
curl -fsSl https://raw.githubusercontent.com/caiogondim/bullet-train.zsh/master/bullet-train.zsh-theme > ~/.oh-my-zsh/themes/bullet-train.zsh-theme
sed -i -e 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"bullet-train\"/g' ~/.zshrc

# alias
echo 'alias vi="vim"' >> ~/.zshrc

# JetBrainsMono Font
echo "Install JetBrainsMono Font"
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono

# iterm2
echo "iterm2"
brew install --cask iterm2

## iterm2 폰트설정
echo "https://swtpumpkin.github.io/develop/bullet-train-theme/  참고해서 iterm2 실행하고 폰트 설정 하세요."
echo "JetBrainsMono(자동설치) / d2coding 추천함"
iterm2
