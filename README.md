# Neovim Config

## Important plugins

The most important plugins I use are [coc.nvim](https://github.com/neoclide/coc.nvim)
and [vim-clap](https://github.com/liuchengxu/vim-clap).

### General Shortcuts

```
<C-K> <C-J> <C-H> <C-L> -> Resize pane of the terminal
<space>cc -> Open Coc Config file
<space>v -> Open vertical terminal.
<space>x -> Open horizontal terminal.
<space>y -> Paste precedent yanked lines.
<space>f -> Move between file inside the project and use:
	C-V open file vertically.
	C-X open file horizontally.
	C-T open file in new tab.
```

### C/C++ Setup

I usually do `ctags -R .` inside the root of the project. In this way I can move
inside the source code with:

```
<space>t -> Show tags specific of the current file.
<space>p -> Show tags of the whole project.
<space>s -> Select with visual line of the code's current block inside brackets.
<C-]> -> Open new buffer with the tag under the cursor.
<C-T> -> Go back from the tag opened.
```

With coc I recommend the coc-clangd extension, specifically with [Bear](https://github.com/rizsotto/Bear)
to generate the `compile_commands.json`.
In this way is possible to:

1. `<leader>rn` -> rename the variables inside the file with local scope awareness.
2. Intellisense and autocompletion

### Python

The keybindings I have are:

```
1. <F2> -> Rename a variable.
2. <space>cpe -> Run current file in terminal.
3. <space>cps -> Run current visual selection in terminal.
4. <space>cpl -> Enable/Disable linting.
```
