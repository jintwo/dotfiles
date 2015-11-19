install-themes:
	find `pwd`/zsh -name "*.zsh-theme" -type f -exec bash -c 'ln -sf {} ~/.oh-my-zsh/themes/`basename {}`' \;
