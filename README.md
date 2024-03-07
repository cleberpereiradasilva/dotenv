## Cleber's Dotenvs

# Install brew

https://brew.sh/

# Install zsh

- Mac OS
  `brew install zsh`
- Linux
  `apt install zsh`

# Install oh-my-zsh

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

# Install powerlevel10k

- Max OS
  ```
      brew install powerlevel10k
      echo "source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc
  ```
- Linux
  ```
      git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
      echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
  ```
- Move config file do home directory
  `cp .p10k.zsh ~/.p10k.zsh`

# Install zsh-suggestions

`git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`

- Add plugin in `~/.zshrc`

  ```
      plugins=(
          git
          zsh-autosuggestions
      )
  ```

- Tip: Use **Ctrl+e** to complete instead keyboard arrow

# Install ITerm2

- Downlaod from `https://iterm2.com/`
- Go to settings:
  - Font Size 20
  - Theme Snoooooth
  - Font Bold

# Install `colorls`

- Install using `ruby`

  - `gem install colorls`

- Create alias
  - `alias ls='colorls -lA --sd'`

# Install **lua**

    ```
    curl -L -R -O https://www.lua.org/ftp/lua-5.4.6.tar.gz
    tar zxf lua-5.4.6.tar.gz
    cd lua-5.4.6
    make all test
    sudo mv lua /usr/bin/lua
    ```

# Install **LazzyGit**

- Mac Os
  ```
      brew install lazygit
  ```
- Linux

  ```
      LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
      curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
      tar xf lazygit.tar.gz lazygit
      sudo install lazygit /usr/local/bin
  ```

# Install `rg` to **telescope** works

    `brew install rg`

# Install **nvim**

- Mac Os
  - `brew install neovim`
- Linux
  ```
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
  sudo rm -rf /opt/nvim
  sudo tar -C /opt -xzf nvim-linux64.tar.gz
  echo "export PATH=\"$PATH:/opt/nvim-linux64/bin\"" >> ~/.zshrc
  ```

# Install **Packer** plugin manager for nvim

- Copy or move `dotenvs/.config/nvim` to `~/.config/nvim`
- Open nvim and install all plugins
  - `nvim -c "PackerInstall"`

# Window Manager

- Mac Os

  - `brew install koekeishiya/formulae/yabai`
  - `brew install koekeishiya/formulae/skhd`
  - `brew services start yabai`
  - `brew services restart skhd`
    You can check configs in **dotenv/yabai** and **dotenv/skhd**

- Linux
  - TODO

# Keybinds

- **space + e**: open/close tree
- **space + se**: set focus on opened tree
- **space + ff**: search files
- **space + lg**: open Lazzy Git
- **space + Tab**: go to next tab
- **Ctrl+s**: Save current document
