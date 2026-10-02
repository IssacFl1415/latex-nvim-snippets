local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node

return {
  s({ trig = "mk", dscr = "Inline math" }, {
    t("\\("), i(1), t("\\)"),
  }),

  s({ trig = "dm", dscr = "Display math" }, {
    t("\\[\n  "), i(1), t("\n\\]"),
  }),

  s({ trig = "beg", dscr = "Generic environment" }, {
    t("\\begin{"), i(1), t("}"),
    t({ "", "  " }), i(2),
    t({ "", "\\end{" }), f(function(args) return args[1] end, { 1 }), t("}"),
  }),

  s({ trig = "sec", dscr = "Section" }, {
    t("\\section{"), i(1), t("}"),
  }),

  s({ trig = "sub", dscr = "Subsection" }, {
    t("\\subsection{"), i(1), t("}"),
  }),

  s({ trig = "subsub", dscr = "Subsubsection" }, {
    t("\\subsubsection{"), i(1), t("}"),
  }),

  s({ trig = "fig", dscr = "Figure environment" }, {
    t({ "\\begin{figure}[htbp]", "  \\centering", "  \\includegraphics[width=0.8\\textwidth]{" }), i(1), t("}", "\\caption{"), i(2), t("}", "\\end{figure}"),
  }),

  s({ trig = "enum", dscr = "Enumerate list" }, {
    t({ "\\begin{enumerate}", "  \\item " }), i(1),
    t({ "", "\\end{enumerate}" }),
  }),

  s({ trig = "item", dscr = "Item in list" }, {
    t("\\item "), i(1),
  }),

  s({ trig = "frac", dscr = "Fraction" }, {
    t("\\frac{"), i(1), t("}{"), i(2), t("}"),
  }),

  s({ trig = "sqrt", dscr = "Square root" }, {
    t("\\sqrt{"), i(1), t("}"),
  }),

  s({ trig = "sum", dscr = "Summation" }, {
    t("\\sum_{"), i(1), t("}^{"), i(2), t("}"),
  }),

  s({ trig = "int", dscr = "Integral" }, {
    t("\\int_{"), i(1), t("}^{"), i(2), t("} "), i(3), t(" \, dx"),
  }),

  s({ trig = "bold", dscr = "Bold text" }, {
    t("\\textbf{"), i(1), t("}"),
  }),

  s({ trig = "italic", dscr = "Italic text" }, {
    t("\\textit{"), i(1), t("}"),
  }),

  s({ trig = "code", dscr = "Code text" }, {
    t("\\texttt{"), i(1), t("}"),
  }),

  s({ trig = "doc", dscr = "Document skeleton" }, {
    t({ "\\documentclass{article}",
        "",
        "\\usepackage[utf8]{inputenc}",
        "\\usepackage{amsmath}",
        "\\usepackage{amssymb}",
        "\\usepackage{graphicx}",
        "",
        "\\title{" }), i(1), t({ "}",
        "\\author{" }), i(2), t({ "}",
        "\\date{\\today}",
        "",
        "\\begin{document}",
        "",
        "\\maketitle",
        "",
        "" }), i(3), t({ "", "",
        "\\end{document}",
    }),
  }),

  s({ trig = "title", dscr = "Title command" }, {
    t("\\title{"), i(1), t("}"),
  }),

  s({ trig = "author", dscr = "Author command" }, {
    t("\\author{"), i(1), t("}"),
  }),

  s({ trig = "date", dscr = "Date command" }, {
    t("\\date{"), i(1), t("}"),
  }),
}
