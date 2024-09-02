local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Define the snippet for HTML
ls.add_snippets("html", {
    s("mathil", {
        t('<span class="math inline">\\('),
        i(1),
        t('\\)</span>'),
        i(0),
    }),
    s("mathdisp", {
        t('<span class=math display">\\['),
        i(1),
        t('\\]</span>'),
        i(0),
    }),
    s("code-javascript", {
        t('<pre><code class="language-javascript">'),
        i(1),
        t('</code></pre>'),
        i(0),
    }),
    s("code-inline", {
        t('<code class="code-inline">'),
        i(1),
        t('</code>'),
        i(0),
    }),
    s("code-block", {
        t('<code class="code-block">'),
        i(1),
        t('</code>'),
        i(0),
    }),
})



