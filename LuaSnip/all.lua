-- Place this in ${HOME}/.config/nvim/LuaSnip/all.lua
-- return {
--   -- A snippet that expands the trigger "hi" into the string "Hello, world!".
--   require("luasnip").snippet(
--     { trig = "hi" },
--     { t("Hello, world!") }
--   ),
--
--   -- To return multiple snippets, use one `return` statement per snippet file
--   -- and return a table of Lua snippets.
--   require("luasnip").snippet(
--     { trig = "foo" },
--     { t("Another snippet.") }
--   ),
-- }

local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep


return {
  -- Example: how to set snippet parameters
  s(
    { -- Table 1: snippet parameters
      trig="hi",
      dscr="An autotriggering snippet that expands 'hi' into 'Hello, world!'",
      regTrig=false,
      priority=100,
      snippetType="autosnippet"
    },
    { -- Table 2: snippet nodes (don't worry about this for now---we'll cover nodes shortly)
      t("Hello, world!"), -- A single text node
    }
    -- Table 3, the advanced snippet options, is left blank.
  ),
  -- Examples of Greek letter snippets, autotriggered for efficiency
  s({trig=";a", snippetType="autosnippet"},
    {
      t("\\alpha"),
    }
  ),
  s({trig=";b", snippetType="autosnippet"},
    {
      t("\\beta"),
    }
  ),
  s({trig=";g", snippetType="autosnippet"},
    {
      t("\\gamma"),
    }
  ),
  s({trig = "lines", dscr = "Demo: a text node with three lines."},
    {
      t({"Line 1", "Line 2", "Line 3"})
    }
  ),
  -- Combining text and insert nodes to create basic LaTeX commands
  s({trig="tt", dscr="Expands 'tt' into '\texttt{}'"},
    {
      t("\\texttt{"), -- remember: backslashes need to be escaped
      i(1),
      t("}"),
    }
  ),
  -- Yes, these jumbles of text nodes and insert nodes get messy fast, and yes,
  -- there is a much better, human-readable solution: ls.fmt, described shortly.
  s({trig="ff", dscr="Expands 'ff' into '\frac{}{}'"},
    {
      t("\\frac{"),
      i(1),  -- insert node 1
      t("}{"),
      i(2),  -- insert node 2
      t("}")
    }
  ),
  -- The same equation snippet, using LuaSnip's fmt function.
  -- The snippet is not shorter, but it is more *human-readable*.
  s({trig="eq", dscr="A LaTeX equation environment"},
    fmt( -- The snippet code actually looks like the equation environment it produces.
      [[
        \begin{equation}
            <>
        \end{equation}
      ]],
      -- The insert node is placed in the <> angle brackets
      { i(1) },
      -- This is where I specify that angle brackets are used as node positions.
      { delimiters = "<>" }
    )
  ),
  -- repeated nodes: 
  -- Code for environment snippet in the above GIF
  s({trig="env", snippetType="autosnippet"},
    fmta(
      [[
        \begin{<>}
            <>
        \end{<>}
      ]],
      {
        i(1),
        i(2),
        rep(1),  -- this node repeats insert node i(1)
      }
    )
  ),

}
