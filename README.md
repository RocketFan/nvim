
## Lacking things to full IDE fealing

- [ ] Refactoring for c++ and python
    - [ ] Rename file affects includes/imports and cmake files
    - [ ] Move code to function [refactoring.nvim](https://github.com/ThePrimeagen/refactoring.nvim)
    - [ ] Quick fix actions (Probably LSP)
    - [ ] Snippets for implement class method from .h in .cpp file
    - [ ] Changing base class function also affects inheritent classes function
- [ ] Info of overloaded functions
- [X] Go to right overloaded function definition (clangd)
- [ ] Simple search and replace [solution](https://github.com/nvim-lua/wishlist/issues/18)
- [ ] Python disable type checking (checkTypesMode set to 'none' also disables import checking), some solution could be disable reportBasicTypes in pyright and enable diagnostic with pylint

## Other worth checking plugins
- [litee.nvim](https://github.com/ldelossa/litee.nvim) - basic ide feeling (CallTree, Bookmarks, Symboltree, Filetree)
- [lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim) - show function signature when you type (probably in cmp-nvim)
