[![Install Dots](https://github.com/mariusmagureanu/dots/actions/workflows/main.yaml/badge.svg)](https://github.com/mariusmagureanu/dots/actions/workflows/main.yaml)
[![Arch Linux](https://img.shields.io/badge/Arch_Linux-1793D1?logo=arch-linux&logoColor=fff)](https://archlinux.org/)
[![i3wm](https://img.shields.io/badge/i3wm-2e2e2e?logo=i3&logoColor=fff)](https://i3wm.org/)
[![Neovim](https://img.shields.io/badge/Neovim-%3E%3D0.11-57A143?logo=neovim&logoColor=fff)](https://neovim.io/)

---

### 🏠 dotfiles

One Ansible playbook to go from a bare Arch install to a fully configured dev machine. No manual steps, no surprises.

---

### 🧰 What you get

| Layer       | Tool                                                                                                                                                        |
| ----------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| WM          | [i3](https://i3wm.org/) with gaps, no titlebars, clean bar                                                                                                  |
| Terminal    | [kitty](https://sw.kovidgoyal.net/kitty/) + JetBrains Mono Nerd Font                                                                                        |
| Editor      | [Neovim](https://neovim.io) via [hecker-vim](https://github.com/mariusmagureanu/hecker-vim)                                                                 |
| Shell       | bash + [starship](https://starship.rs/) prompt + [fzf](https://github.com/junegunn/fzf) + [zoxide](https://github.com/ajeetdsouza/zoxide)                   |
| Files       | [yazi](https://yazi-rs.github.io/) + [eza](https://eza.rocks/) + [bat](https://github.com/sharkdp/bat) + [ripgrep](https://github.com/BurntSushi/ripgrep)   |
| Containers  | Docker + [kubectl](https://kubernetes.io/docs/reference/kubectl/) + [kubecolor](https://github.com/kubecolor/kubecolor) + [krew](https://krew.sigs.k8s.io/) |
| Cloud       | AWS CLI v2 + Terraform (tfenv)                                                                                                                              |
| Screenshots | [maim](https://github.com/naelstrof/maim) → file + clipboard                                                                                                |

---

### ⚡ Install

Requires [Ansible](https://docs.ansible.com/):

```sh
sudo pacman -S ansible
ansible-playbook hecker.yml --ask-become-pass
```

That's it. Open a terminal and start working.

---

### 📁 Structure

```
hecker.yml          → main playbook
.bashrc             → shell config (starship, aliases, fzf)
i3config            → window manager
kitty.conf          → terminal
starship.toml       → prompt
.Xresources         → DPI & font rendering
conky-i3bar.sh      → status bar
rofi.config         → app launcher
```

Neovim lives in its own repo: [hecker-vim](https://github.com/mariusmagureanu/hecker-vim)
