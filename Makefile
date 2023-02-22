
nvim_set:
		cp init.vim ~/.config/nvim/init.vim 

copy_dotfiles_here_and_push:
		cp ~/.config/nvim/init.vim init.vim
		git add .
		git commit -m "Add nvim settings"
		git push
