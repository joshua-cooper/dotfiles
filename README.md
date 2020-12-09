# Joshua Cooper's dotfiles

Configuration for the software I use day to day.

This has only been tested on (Arch) Linux but most of it (configs for CLI/TUI
programs) should work on other Unix like operating systems too.

## Installation

```sh
git clone https://github.com/joshua-cooper/dotfiles ~/.config
```

After installation, change your login shell to fish.

Installing this won't scatter loads of files around your system. Everything is
contained within `~/.config` so uninstalling is as simple as deleting that
directory.

## Dependencies

There are no hard dependencies to use these configs but there are implicit
dependencies to use some functionality.  For example, aliases for git commands
in the shell config will not work without git.

That being said, here's a list of everything needed to get full functionality.

Terminal:

- git
- tmux
- neovim
- bat
- exa
- fd
- fzf
- pass
- sudo
- mpd
- pulseaudio
- ssh-agent

GUI:

- sway
- swaylock
- swayidle
- i3status
- termite
- mako
- bemenu
- firefox

Fonts:

- cascadia code

The configuration for GUI software can be safely ignored on systems where it
won't or can't be used, e.g. MacOS and headless servers.

### Shell - Fish

The fish config sets various variables and aliases which reference these
programs:

- git (aliases)
- tmux (alias)
- neovim ($EDITOR)
- firefox ($BROWSER)
- bat (alias for cat)
- exa (alias for ls)

Optionally:

- ssh-agent (started if installed)
- sway (started on tty1 if installed)

### Editor - NeoVim

Some of the functionality in my neovim config requires plugins to work.  I have
a vendored copy of [vim-plug](https://github.com/junegunn/vim-plug) in this
repo so neovim will automatically install missing plugins when it starts
without you having to do anything.

Some external programs are also used:

- fzf (fuzzy finding)
- fd (backs fzf file and directory search)
- git (vim-fugitive)

There is no attempt to do feature detection in [`init.vim`](nvim/init.vim).
I'm always running the latest releases of neovim so older versions are untested
and may not work.

### Window manager - Sway

My sway config launches some programs at startup and on keypresses.  There are
also keys bound to scripts which are included in [`bin`](bin) and will be in
your `$PATH` when using my fish config.

To get the best experience you'll need:

- mako (notifications)
- termite (terminal emulator)
- swayidle (idle detection)
- swaylock (screen locker)
- i3status (status line)
- bemenu (menu)
- pulseaudio (sound)
- mpd (music)

### Scripts

Inside [`bin`](bin) are some helper scripts with dependencies:

- [`config-edit`](bin/config-edit): git, fzf, `$EDITOR`
- [`otp-menu`](bin/otp-menu): pass, pass-otp, bemenu
- [`pass-menu`](bin/pass-menu): pass, bemenu
- [`package`](bin/package): sudo, pacman, fzf
- [`search-menu`](bin/search-menu): bemenu, `$BROWSER`
