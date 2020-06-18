# Neovim Config

## Important plugins

The most important plugins I use are [coc.nvim](https://github.com/neoclide/coc.nvim)
and [vim-clap](https://github.com/liuchengxu/vim-clap).

### General

<C-K> <C-J> <C-H> <C-L> -> Resize pane of the terminal
<space>v -> Open vertical terminal.
<space>x -> Open horizontal terminal.
<space>cc -> Open Coc Config file
<space>y -> paste precedent yanked lines.
<space>f -> move between file inside the project
	* C-V open vertically.
	* C-X open horizontally.
	* C-T open in new tab.

### C/C++ Setup

I usually do `ctags -R .` inside the root of the project. In this way I can move
inside the source code with:

<space>t -> tags specific of the current file.
<space>p -> tags of the whole project.
<space>s -> select current block of code inside brackets.

With coc I recommend the coc-clangd extension, specifically with [Bear](https://github.com/rizsotto/Bear)
to generate the `compile_commands.json`.
In this way is possible to:

1. Rename the variables inside the file with local scope awareness using `<leader>rn`.
2. Intellisense and autocompletion

### Python

The keybindings I have are:

1. <F2> -> Rename a variable.
2. <space>cpe -> Run current file in terminal.
3. <space>cps -> Run current visual selection in terminal.
4. <space>cpl -> Enable/Disable linting.

