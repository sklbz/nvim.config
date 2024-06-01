local buf = vim.lsp.buf

vim.keymap.set("n", "<leader>rn", buf.rename, {})
vim.keymap.set("n", "K", buf.hover, {})
vim.keymap.set("n", "<leader>gd", buf.definition, {})
vim.keymap.set("n", "<leader>gr", buf.references, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", buf.code_action, {})
