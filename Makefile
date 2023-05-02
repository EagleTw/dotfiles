
nvim_set:
		cp init.vim ~/.config/nvim/init.vim 

nvim_upload:
		cp ~/.config/nvim/init.vim init.vim
		git add .
		git commit -m "Update nvim config"
		git push

bashrc_set:
		cp ubuntu_bashrc ~/.bashrc

bashrc_upload:
		cp ~/.bashrc ubuntu_bashrc
		git add .
		git commit -m "Update bashrc settings"
		git push
