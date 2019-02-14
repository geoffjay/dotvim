# Personal Vim Setup

Deoplete appears to work better with `nvim` than with `vim8` so there's errors
when using this repo with the `vim8`.

## Setup

```sh
# install cmake gcc-c++ python3-dev(el) ctags/etags
```

```sh
git clone http://github.com/geoffjay/dotvim.git ~/.vim
cd ~/.vim
mkdir -p ~/.vim/bundle
```

After that open `nvim` and execute `:PlugInstall` and `:UpdateRemotePlugins`.

### Grip

In order for `:GripStart` to work grip needs to be installed.

```sh
python3 -m pip install --user grip
```
