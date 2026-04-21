return {
  settings = {
    yaml = {
      schemaStore = { enable = false },
      schemas = require("schemastore").yaml.schemas(),
    },
  },
}
