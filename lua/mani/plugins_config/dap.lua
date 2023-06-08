local function keymap_description(description)
    return {desc = description, noremap=true, silent=true}
end

vim.keymap.set('n', '<Leader>dc', function() require('dap').continue() end, {desc = "[D]ebug [C]ontinue"})
vim.keymap.set('n', '<Leader>dso', function() require('dap').step_over() end, keymap_description("[D]ebug [S]tep [O]ver"))
vim.keymap.set('n', '<Leader>dsi', function() require('dap').step_into() end, keymap_description("[D]ebug [S]tep [I]nto"))
vim.keymap.set('n', '<Leader>dst', function() require('dap').step_out() end, keymap_description("[D]ebug [S]tep ou[T]"))
vim.keymap.set('n', '<Leader>dtb', function() require('dap').toggle_breakpoint() end, keymap_description("[D]ebug [T]oggle [B]reakpoint"))
vim.keymap.set('n', '<Leader>dsb', function() require('dap').set_breakpoint() end, keymap_description("[D]ebug [S]et [B]reakpoint"))
vim.keymap.set('n', '<Leader>dlp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, keymap_description("[D]ebug [L]og [P]oint"))
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end,keymap_description("[D]ebug [R]eplay"))
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end, keymap_description("[D]ebug [L]ast run"))
vim.keymap.set({'n', 'v'}, '<Leader>dh', function() require('dap.ui.widgets').hover() end, keymap_description("[D]ebug [H]over"))
vim.keymap.set({'n', 'v'}, '<Leader>dp', function() require('dap.ui.widgets').preview() end, keymap_description("[D]ebug [P]review"))
vim.keymap.set('n', '<Leader>df', function() local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.frames) end, keymap_description("[D]ebug [F]rames"))
vim.keymap.set('n', '<Leader>ds', function() local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.scopes) end, keymap_description("[D]ebug [S]copes"))

local dap = require('dap')
dap.configurations.python = {
    {
        type = 'python';
        request = 'launch';
        name = "Launch file";
        program = "${file}";
        pythonPath = function()
            return '/opt/homebrew/bin/python3'
        end;
    },
}
dap.configurations.java = {
    {
        type = 'java';
        requre = 'launch';
        name = "Launch file";
        program = "${file}";
        javaPath = function()
            return '/opt/homebrew/opt/openjdk/bin/javac'
        end;
    }
}
