local lsp_name = "purescriptls"
local config = require("lspmanager.utilities").get_config(lsp_name)
local installers = require("lspmanager.installers")
local os = require("lspmanager.os")

local cmd_exec = "./node_modules/.bin/purescript-language-server"

if os.get_os() == os.OSes.Windows then
    cmd_exec = cmd_exec .. ".cmd"
end

config.cmd = {cmd_exec}

return {
    config = config,

    install_script = function()
        return installers.npm.install_script({ "purescript-language-server" })
    end,

    update_script = function()
        return installers.npm.update_script()
    end,
}
