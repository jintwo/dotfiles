disable-font-antialiasing:
    defaults -currentHost write -g AppleFontSmoothing 0
install-themes:
	mkdir -p ~/.oh-my-zsh/themes/
    find `pwd`/zsh -name "*.zsh-theme" -type f -exec bash -c 'ln -sf {} ~/.oh-my-zsh/themes/`basename {}`' \;
install-zsh-plugins:
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
