local plugins = {
  require "custom.configs.override",
  require "custom.configs.lspconfig",

  require "custom.configs.dap",

  require "custom.configs.rust",
  require "custom.configs.python",
  require "custom.configs.markdown",

  require "custom.configs.editor",
  require "custom.configs.motion",
  require "custom.configs.others",
}
return plugins
