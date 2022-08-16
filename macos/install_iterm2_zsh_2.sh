#!/bin/bash
# zsh plugins
echo "# Install & set zsh plugins"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${HOME}/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
brew install autojump
sed -i -e 's/plugins=(git)/plugins=(\n\tgit\n\tzsh-autosuggestions\n\tautojump\n)/g' ~/.zshrc


# bullet-train-theme https://swtpumpkin.github.io/develop/bullet-train-theme/
echo "# Install bullet-train-theme"
curl -fsSl https://raw.githubusercontent.com/caiogondim/bullet-train.zsh/master/bullet-train.zsh-theme > ~/.oh-my-zsh/themes/bullet-train.zsh-theme
sed -i -e 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"bullet-train\"/g' ~/.zshrc

# zshrc 설정
echo "# zshrc 설정"
echo 'alias vi="vim"' >> ~/.zshrc
echo -e 'prompt_context() {\n\tif [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then\n\t\tprompt_segment black default "%(!.%{%F{yellow}%}.)$USER"\n\tfi\n}' >> ~/.zshrc

# JetBrainsMono Font
echo "# Install JetBrainsMono Font"
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono

# iterm2
echo "iterm2"
brew install --cask iterm2

## iterm2 폰트설정
echo "https://swtpumpkin.github.io/develop/bullet-train-theme/  참고해서 iterm2 실행하고 폰트 설정 하세요."
echo "JetBrainsMono(자동설치) / d2coding / KB금융 본문체 추천함"
iterm2
