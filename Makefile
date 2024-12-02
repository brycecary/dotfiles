.PHONY: neovim
neovim:
	stow -t $(HOME) neovim
	mkdir -p $(HOME)/.fonts && cd $(HOME)/.fonts && wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/JetBrainsMono.zip && \
	unzip JetBrainsMono.zip && fc-cache -f -v && cd -
