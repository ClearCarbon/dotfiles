## Install
Ensure you have zsh installed.

1. git clone into home directory
2. cd dotfiles
3. Install FiraCode Nerd Font from - https://github.com/ryanoasis/nerd-fonts/releases
3. sh install.sh and walk through the wizard
4. restart your shell
5. add `source ~/dotfiles/clearcarbonrc` to your `.zshrc` or `.bashrc`
6. `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
6. Install neovim
7. Install minpac - `git clone https://github.com/k-takata/minpac.git ~/.config/nvim/pack/minpac/opt/minpac`
8. Run `ln -s ~/dotfiles/vim/vimrc ~/.config/vim/vim.init`

Designed to be installed in a zsh shell with:

    * https://github.com/ohmyzsh/ohmyzsh
    * https://github.com/romkatv/powerlevel10k
    * https://github.com/wting/autojump
