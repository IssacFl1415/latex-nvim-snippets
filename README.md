# LaTeX Snippets for Neovim

A small repository of reusable LaTeX snippets for Neovim, designed for `luasnip` and other snippet managers.

## Included snippets

This repo contains common LaTeX snippets for:

- inline math: `mk`, `dm`
- environments: `beg`, `enum`, `item`, `figure`, `table`
- sectioning: `sec`, `sub`, `subsub`
- common commands: `bold`, `italic`, `code`, `frac`, `sqrt`, `sum`, `int`
- document structure: `doc`, `title`, `author`, `date`

## Quick setup with `luasnip`

Add this to your Neovim config:

```lua
-- ~/.config/nvim/lua/plugins/luasnip.lua
return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  config = function()
    local ls = require("luasnip")
    require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/snippets" })

    -- Optional: use friendly snippets
    ls.config.setup({
      history = true,
      updateevents = "TextChanged,TextChangedI",
      enable_autosnippets = true,
    })
  end,
}
```

Then create a `~/.config/nvim/snippets/tex.lua` file and copy the contents from `snippets/tex.lua` in this repository.

## Example usage

Typing:

```tex
mk
```

expands to:

```tex
\(  \)
```

with the cursor placed between the parentheses.

## Repository structure

```text
.
├── README.md
├── snippets/
│   └── tex.lua
└── LICENSE
```

## License

MIT
