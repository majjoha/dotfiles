require("headlines").setup({
  markdown = {
    query = vim.treesitter.query.parse(
        "markdown",
        [[
            (atx_heading [
                (atx_h1_marker)
                (atx_h2_marker)
                (atx_h3_marker)
                (atx_h4_marker)
                (atx_h5_marker)
                (atx_h6_marker)
            ] @headline)

            (thematic_break) @dash

            (fenced_code_block) @codeblock

            (block_quote_marker) @quote
            (block_quote (paragraph (inline (block_continuation) @quote)))
        ]]
    ),
    headline_highlights = { "Headline1", "Headline2", "Headline3" },
    fat_headlines = true,
    fat_headline_upper_string = "▃",
    fat_headline_lower_string = "🬂",
    dash_highlight = "Dash",
    dash_string = "━",
  },
})
