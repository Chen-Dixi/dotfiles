.PHONY: tmux_install
tmux_install:
	cd ./tmux && bash install.sh

.PHONY: zsh_install
zsh_install:
	cd ./zsh && bash zsh_install.sh