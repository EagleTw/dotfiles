
nvim_set:
		cp init.vim ~/.config/nvim/init.vim 

update_git:
		git add .
		git commit -m "Add nvim settings"
		git push
