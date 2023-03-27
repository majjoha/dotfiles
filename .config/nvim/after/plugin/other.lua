require("other-nvim").setup({
  mappings = {
    {
      pattern = "lib/(.*)/(.*).rb",
      target = { { target = "spec/lib/%1/%2_spec.rb", context = "test" } },
    }, {
      pattern = "spec/lib/(.*)/(.*)_spec.rb",
      target = { { target = "lib/%1/%2.rb", context = "source" } },
    }, {
      pattern = "src/(.*)/(.*).hs",
      target = { { target = "test/%1/%2Spec.hs", context = "test" } },
    }, {
      pattern = "test/(.*)/(.*)Spec.hs",
      target = { { target = "src/%1/%2.hs", context = "source" } },
    }, {
      pattern = "src/(.*).ts",
      target = { { target = "src/__tests__/%1.ts", context = "test" } },
    }, {
      pattern = "src/__tests__/(.*).ts",
      target = { { target = "src/%1.ts", context = "source" } },
    }, {
      pattern = "src/(.*).ts",
      target = { { target = "src/%1.test.ts", context = "test" } },
    }, {
      pattern = "src/(.*).test.ts",
      target = { { target = "src/%1.ts", context = "source" } },
    },
  },
})
