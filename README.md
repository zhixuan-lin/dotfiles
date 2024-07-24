# Dotfiles

## Install

Run `install.sh`. After that, if you are not using `zsh`, you may want to restart your session. 
Also, you may need to do `source reload.sh` to reload settings.

Note we create symlinks instead of hard copies. If one configuration file already exists, it will be backed up.
The backup file will be saved in `~/.dotfiles_backup`.

All configurations are light so that they work on new machines. 
However, if you don't have some basic programs like `zsh`, `git`, `python` `curl` installed, 
you may need root privilege to install these programs.

## Recommended tools

* `tldr`: quickly figure out the usage of most commands
* `autojump`: jump to recently visited locations
* `nnn`: interactive terminal navigator. Supports cd on quit with `<ctrl+g>`
* `htop`: interactive top
* `fzf`: fuzzy file finder, and improves command line reverse search.
* `gpustat`: monitor gpu usage. Way better than `nvidia-smi`
* `ripgrep`: best `grep` tool
* `rclone`: command line tool for managing cloud files
* `psync`: `rsync` project files with a configuration file
* `git difftool --tool=vimdiff`

## Colors

* vim: [molokai](https://github.com/tomasr/molokai)
* iterm2: default

## Language servers, Linting Tools, ...

### Choices

The final solution is 

* `ale` + `[flake8, pylint]` + `yapf` for linting and fixing. I didn't use `vim-lsp` because `ale` provides more fine-grained error highlighting while `vim-lsp` imply highlights the whole line. `flake8` with plugins is very complete, but limited because it checks each file individually. `pylint` is for errors like invalid imports, invalid members and invalid arguments.
* `vim-lsp` for the language server protocal client. It is the only one that supports popup for signature help. Otherwise `vim-lsc` is also good.
* `jedi-language-server` for the language server protocal server. It is the only one that (currently) supports workspace symbol search. And it is lightweight.

### Installation


You need to install `jedi-language-server` to support `vim-lsp`. With `vim-lsp-settings`, you only need this:

```bash
LspInstallServer jedi-language-server
```

The server will be installed in `$HOME/.local/share/servers`. Note that `jedi-language-server` is aware of your virtual environment, and handles system paths correctly.

`vim-lsp-settings` allows per-project configuration. See `:LspSettingsLocalEdit`. I guess it can find the settings because of the automatic root guess. This allows sending project specific configurations to the servers, by changing the registered information.

To enable linting and fixing in vim, install `flake8`, `yapf` and `pylint`

```bash
pip install flake8
pip install pylint
pip install yapf
```

Note, you should install `pylint` under the virtual environment you want to get correct behavior. **It is not aware of the virtual environment.** It checks the imported module files. In contrast `flake8` checks files individually. It doesn't care about whether the imported module exists or a member exists so it is fine to install it globally.

Recommended flake8 plugins:

```bash
pip install flake8-unused-arguments
pip install flake8-todo
pip install flake8-multiline-containers
```

### Project Root, Import Paths...

#### `flake8`

`pyflakes` checks each file individually. So there's no need to worry about paths.

#### `pylint`

`pylint`: we only consider the case where a path to a python file is given. Eventually, it is translated into a source root, and a set of fully qualified module names. Example

```
a
├── b
│   ├── __init__.py
│   └── c
│       ├── __init__.py
│       └── hihi.py
└── haha.py

```

And assume `pylint hihi.py`.

The translation is done as follows:

1. Expand the path given into absolute path. Yes, the current working directory is not used at all.
2. Determine the source root: starting from bottom, the first directory that does *NOT* contain `__init__.py` is seen as the project root. In the above, `a` is the source root.
3. The source root is added to the "virtual" `sys.path` for checking imports.
4. The fully qualified module name is from the source root. I.e. `b.c.hihi`.

Besides, `pylint` is not aware of virtual environment. So, you have to install it in the virtual environment you want.

#### Language servers

At startup, LSP clients send a request to LSP servers for connection. The request contains a `rootUri` attributes that states the workspace root. This root is used for workspace symbol search etc.

So, the LSP client determines the root. `vim-lsp` provides a registration function that takes a lambda for the root. `vim-lsp-settings` call that function provides the actual lambda that computes the root. The root is the nearest directory that contains one of the "markers" (e.g., `.git/`). If no such markers exist, the root seems to be set to be the cwd or the directory containing the current file (not sure).

`jedi-language-server` uses the root to give suggestions on imports. It seems it adds **some of** the intermediate paths from the project root to the virtual `sys.path`, instead only adding the root. The actual rule is still unclear. Seems to be due to `smart_sys_path` [here](https://jedi.readthedocs.io/en/latest/docs/api.html#jedi.Project). The actual rule seems to be defined [here](https://github.com/davidhalter/jedi/blob/44d77523b387e008a6d228c9641df95cb08233dc/jedi/api/project.py#L202). Relative imports behave normally though.

It is aware of the virtual environment. So it doesn't matter which `jedi-language-server` you can calling.
