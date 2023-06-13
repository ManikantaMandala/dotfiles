local codeium_en_var = vim.g.codeium_enabled
function toggle_codeium()
    if codeium_en_var then
        vim.g.codeium_enabled = false
        codeium_en_var = not codeium_en_var
    end
    if not codeium_en_var then
        vim.cmd('CodeiumEnable')
        codeium_en_var = not codeium_en_var
    end
end
