# Stime - Simple Table Input Method Engine for Vim

This plugin was developed when the author (me) didn't notice the existent of
Vim's `keymap`. However, Stime might still be useful as it uses `noremap!`
instead. As a result, Stime alow more flexible mappings than `keymap`.

## Installation

Install it like other plugins.

In vimrc add the following line, with the input method file name in the place of
`foo`.

    let g:stime_table = "foo"

Input methods might be put in `{runtimepath}/tables/`. To create another input
method, start from `tables/template`, which has similar format with Ibus Table's
input method table.

## Usage

Use `<Leader><Space>` to toggle the plugin on/off. `<Leader>s<Space>` to reload
input table and toggle the plugin. Further usage or customization, please read
the plugin's source code.
