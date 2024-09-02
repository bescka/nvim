local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("tex", {
  s("pagecolor", {
    t({
      "\\usepackage{xcolor} % Required for color management",
      "\\usepackage{pagecolor} % Required for setting the page color",
      "\\definecolor{mygray}{gray}{0.9} % Define a custom gray color (0.9 is light gray)",
      "\\pagecolor{mygray} % Set the page background color to gray",
      "\\color{white} % Set the default text color to black",
    }),
  }),
})
