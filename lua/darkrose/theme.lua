local colors = require("darkrose.colors")
local utils = require("darkrose.utils")

local M = {}

M.generate = function()
  local c = colors.get()
  local u = utils

  local theme = {}

  theme.highlights = {
    ColorColumn = { bg = c.bg_visual }, -- used for the columns set with 'colorcolumn'
    Conceal = { fg = c.fg_gutter }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor = { fg = c.bg, bg = c.fg }, -- character under the cursor
    lCursor = { link = "Cursor" }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM = { link = "Cursor" }, -- like Cursor, but used when in IME mode |CursorIM|
    CursorLine = { bg = u.shade(c.bg_visual, -10) }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    CursorColumn = { link = "CursorColumn" }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    TermCursor = { fg = c.fg, bg = c.cursor }, -- cursor in a focused terminal
    TermCursorNC = { fg = c.fg, bg = u.shade(c.cursor, -50) }, -- cursor in an unfocused terminal
    Directory = { fg = c.dark_pink }, -- directory names (and other special names in listings)
    DiffAdd = { fg = u.shade(c.diff.add, 50), bg = c.diff.add },
    DiffChange = { fg = u.shade(c.diff.change, 50), bg = c.diff.change },
    DiffDelete = { fg = u.shade(c.diff.delete, 50), bg = c.diff.delete },
    diffAdded = { fg = c.diff.add },
    diffChanged = { fg = c.diff.change },
    diffRemoved = { fg = c.diff.delete },
    DiffText = { fg = c.fg_gutter }, -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer = { fg = c.fg_dark }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    ErrorMsg = { fg = c.error }, -- error messages on the command line
    VertSplit = { fg = c.border, bg = c.bg }, -- the column separating vertically split windows
    Folded = { fg = c.fg, bg = c.bg_visual }, -- line used for closed folds
    FoldColumn = { link = "Folded" }, -- 'foldcolumn'
    SignColumn = { fg = c.fg_gutter, bg = c.bg }, -- column where |signs| are displayed
    SignColumnSB = { fg = c.fg_gutter, bg = c.bg }, -- column where |signs| are displayed
    Search = { fg = c.none, bg = c.bg_visual }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    IncSearch = { fg = c.bg, bg = c.orange }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute = { fg = c.gray, bg = c.red }, -- |:substitute| replacement text highlighting
    LineNr = { fg = c.fg_dark }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr = { fg = u.shade(c.fg_dark, 50) }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen = { fg = c.fg, bg = c.fg_dark }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg = { fg = c.fg, style = "bold" }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea = { fg = c.fg, style = "NONE" }, -- Area for messages and cmdline
    MoreMsg = { fg = c.fg_dark }, -- |more-prompt|
    Question = { fg = c.red, style = "bold" },
    NonText = { fg = c.fg_dark }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal = { fg = c.fg, bg = c.bg }, -- normal text
    NormalNC = { fg = c.fg, bg = c.bg }, -- normal text in non-current windows
    NormalSB = { fg = c.fg, bg = c.bg_float }, -- normal text in non-current windows
    SpecialKey = { fg = c.fg_gutter }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    NormalFloat = { fg = c.fg, bg = c.bg_float }, -- Normal text in floating windows.
    FloatBorder = { fg = c.border },
    Pmenu = { fg = c.fg, bg = c.bg_float }, -- Popup menu: normal item.
    PmenuSel = { fg = c.fg, bg = u.shade(c.bg_float, 15) }, -- Popup menu: selected item.
    PmenuSbar = { bg = c.fg_gutter }, -- Popup menu: scrollbar.
    PmenuThumb = { bg = c.fg_gutter }, -- Popup menu: Thumb of the scrollbar.
    QuickFixLine = { bg = c.markup.link, style = "bold" }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    qfLineNr = { fg = c.red },
    qfFileName = { fg = c.markup.link },
    SpellBad = { sp = c.error, style = "undercurl" }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap = { sp = c.warning, style = "undercurl" }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal = { sp = c.info, style = "undercurl" }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare = { sp = c.hint, style = "undercurl" }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine = { fg = c.bg, bg = c.fg_dark }, -- status line of current window
    StatusLineNC = { fg = c.fg, bg = c.bg }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine = { fg = c.fg, bg = c.bg }, -- tab pages line, not active tab page label
    TabLineFill = { bg = c.bg_float }, -- tab pages line, where there are no labels
    TabLineSel = { link = "PmenuSel" }, -- tab pages line, active tab page label
    Title = { fg = c.magenta, style = "bold" }, -- titles for output from ":set all", ":autocmd" etc.
    Visual = { bg = c.bg_visual }, -- Visual mode selection
    VisualNOS = { link = "Visual" }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg = { fg = c.warning }, -- warning messages
    Whitespace = { fg = c.gray }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu = { bg = u.shade(c.bg_float, 15) }, -- current match in 'wildmenu' completion
    healthError = { fg = c.error },
    healthSuccess = { fg = c.info },
    healthWarning = { fg = c.warning },

    -- Builtin Syntax Highlighting
    Comment = { fg = c.syntax.comment }, -- any comment
    Constant = { fg = c.syntax.literal }, -- (preferred) any constant
    String = { fg = c.syntax.string }, --   a string constant: "this is a string"
    Character = { fg = c.syntax.string }, --  a character constant: 'c', '\n'
    Number = { fg = c.syntax.literal }, --   a number constant: 234, 0xff
    Float = { fg = c.syntax.literal }, --    a floating point constant: 2.3e10
    Boolean = { fg = c.syntax.literal, style = "italic" }, --  a boolean constant: TRUE, false
    Identifier = { fg = c.syntax.variable, style = "NONE" }, -- (preferred) any variable name
    Function = { fg = c.syntax.func, style = "NONE" }, -- function name (also: methods for classes)
    Statement = { fg = c.syntax.keyword }, -- (preferred) any statement
    Conditional = { link = "Keyword" }, --  if, then, else, endif, switch, etc.
    Repeat = { link = "Keyword" }, --   for, do, while, etc.
    Label = { link = "Keyword" }, --    case, default, etc.
    Operator = { fg = c.syntax.func }, -- "sizeof", "+", "*", etc.
    Keyword = { fg = c.syntax.keyword, style = "italic" }, --  any other keyword
    Exception = { link = "Keyword" }, --  try, catch, throw
    PreProc = { fg = c.syntax.keyword, style = "italic" }, -- (preferred) generic Preprocessor
    Include = { link = "PreProc" }, --  preprocessor #include
    Define = { link = "PreProc" }, --   preprocessor #define
    Macro = { link = "PreProc" }, --    same as Define
    PreCondit = { link = "PreProc" }, --  preprocessor #if, #else, #endif, etc.
    Type = { fg = c.syntax.type }, -- (preferred) int, long, char, etc.
    StorageClass = { link = "Type" }, -- static, register, volatile, etc.
    Structure = { link = "Type" }, --  struct, union, enum, etc.
    Typedef = { link = "Type" }, --  A typedef
    Special = { fg = c.syntax.comment }, -- (preferred) any special symbol
    SpecialChar = { link = "Special" }, --  special character in a constant
    Tag = { link = "Special" }, --    you can use CTRL-] on this
    Delimiter = { link = "Special" }, --  character that needs attention
    Debug = { link = "Special" }, --    debugging statements
    Underlined = { style = "underline" }, -- (preferred) text that stands out, HTML links
    Bold = { style = "bold" },
    Italic = { style = "italic" },
    -- ("Ignore", below, may be invisible...)
    -- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|
    Error = { fg = c.error }, -- (preferred) any erroneous construct
    Todo = { fg = c.fg, bg = c.red }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- Language-specific Syntax Highlighting

    -- LSP Groups
    LspReferenceText = { bg = c.bg_visual }, -- used for highlighting "text" references
    LspReferenceRead = { link = "LspReferenceText" }, -- used for highlighting "read" references
    LspReferenceWrite = { link = "LspReferenceText" }, -- used for highlighting "write" references

    LspDiagnosticsDefaultError = { fg = c.error }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultWarning = { fg = c.warning }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultInformation = { fg = c.info }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultHint = { fg = c.hint }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsVirtualTextError = { fg = u.shade(c.error, 50), bg = c.error }, -- Used for "Error" diagnostic virtual text
    LspDiagnosticsVirtualTextWarning = { fg = u.shade(c.warning, 50), bg = c.warning }, -- Used for "Warning" diagnostic virtual text
    LspDiagnosticsVirtualTextInformation = { fg = u.shade(c.info, 50), bg = c.info }, -- Used for "Information" diagnostic virtual text
    LspDiagnosticsVirtualTextHint = { fg = u.shade(c.hint, 50), bg = c.hint }, -- Used for "Hint" diagnostic virtual text
    LspDiagnosticsUnderlineError = { style = "undercurl", sp = c.error }, -- Used to underline "Error" diagnostics
    LspDiagnosticsUnderlineWarning = { style = "undercurl", sp = c.warning }, -- Used to underline "Warning" diagnostics
    LspDiagnosticsUnderlineInformation = { style = "undercurl", sp = c.info }, -- Used to underline "Information" diagnostics
    LspDiagnosticsUnderlineHint = { style = "undercurl", sp = c.hint }, -- Used to underline "Hint" diagnostics
    LspDiagnosticsError = { fg = c.error },
    LspDiagnosticsWarning = { fg = c.warning },
    LspDiagnosticsInformation = { fg = c.info },
    LspDiagnosticsHint = { fg = c.hint },
    DiagnosticError = { link = "LspDiagnosticsDefaultError" }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    DiagnosticWarn = { link = "LspDiagnosticsDefaultWarning" }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    DiagnosticInfo = { link = "LspDiagnosticsDefaultInformation" }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    DiagnosticHint = { link = "LspDiagnosticsDefaultHint" }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    DiagnosticUnderlineError = { link = "LspDiagnosticsUnderlineError" }, -- Used to underline "Error" diagnostics
    DiagnosticUnderlineWarn = { link = "LspDiagnosticsUnderlineWarning" }, -- Used to underline "Warning" diagnostics
    DiagnosticUnderlineInfo = { link = "LspDiagnosticsUnderlineInformation" }, -- Used to underline "Information" diagnostics
    DiagnosticUnderlineHint = { link = "LspDiagnosticsVirtualTextHint" }, -- Used to underline "Hint" diagnostics

    -- LSP Semantic Highlights
    ["@lsp.type.class"] = { link = "Class" },
    ["@lsp.type.decorator"] = { link = "Function" },
    ["@lsp.type.enum"] = { link = "Type" },
    ["@lsp.type.enumMember"] = { link = "Constant" },
    ["@lsp.type.function"] = { link = "Function" },
    ["@lsp.type.interface"] = { link = "Type" },
    ["@lsp.type.macro"] = { link = "Macro" },
    ["@lsp.type.method"] = { link = "Function" },
    ["@lsp.type.namespace"] = { fg = c.syntax.field },
    ["@lsp.type.parameter"] = { fg = c.syntax.param },
    ["@lsp.type.property"] = { fg = c.syntax.field },
    ["@lsp.type.struct"] = { link = "Type" },
    ["@lsp.type.type"] = { link = "Type" },
    ["@lsp.type.typeParameter"] = { link = "Type" },
    ["@lsp.type.variable"] = { link = "Identifier" },

    -- nvim-treesitter
    ["@annotation"] = { link = "PreProc" },
    ["@attribute"] = { fg = c.syntax.keyword },
    ["@include"] = { link = "PreProc" },
    ["@boolean"] = { link = "Boolean" },
    ["@constant"] = { link = "Constant" },
    ["@constant.builtin"] = { link = "Boolean" },
    ["@field"] = { fg = c.syntax.field },
    ["@constructor"] = { link = "Function" },
    ["@function"] = { link = "Function" },
    ["@function.builtin"] = { fg = c.syntax.func, style = "italic" },
    ["@error"] = { link = "Error" },
    ["@keyword"] = { link = "Keyword" },
    ["@keyword.operator"] = { link = "Keyword" },
    ["@keyword.function"] = { link = "Keyword" },
    ["@namespace"] = { fg = c.syntax.field },
    ["@number"] = { link = "Number" },
    ["@operator"] = { link = "Operator" },
    ["@parameter"] = { fg = c.syntax.param },
    ["@property"] = { fg = c.syntax.field },
    ["@punctuation.bracket"] = { fg = c.fg },
    ["@punctuation.delimiter"] = { fg = c.fg },
    ["@punctuation.special"] = { fg = c.fg },
    ["@string"] = { fg = c.syntax.string },
    ["@string.escape"] = { fg = c.syntax.string, style = "bold" },
    ["@string.regex"] = { fg = c.syntax.variable },
    ["@string.special"] = { link = "@string" },
    ["@label"] = { fg = c.syntax.field },
    ["@symbol"] = { fg = c.syntax.variable },
    ["@tag"] = { fg = c.syntax.keyword },
    ["@tag.attribute"] = { link = "@property" },
    ["@tag.delimiter"] = { fg = c.fg },
    ["@text"] = { fg = c.fg },
    ["@text.strong"] = { link = "Bold" },
    ["@text.emphasis"] = { link = "Italic" },
    ["@text.underline"] = { link = "Underlined" },
    ["@text.strike"] = { style = "strikethrough" },
    ["@text.math"] = { link = "Special" },
    ["@text.environment"] = { link = "Macro" },
    ["@text.environment.name"] = { link = "Type" },
    ["@text.title"] = { link = "Title" },
    ["@text.uri"] = { fg = c.markup.link },
    ["@text.note"] = { link = "SpecialComment" },
    ["@text.warning"] = { link = "Todo" },
    ["@text.danger"] = { link = "WarningMsg" },
    ["@todo"] = { link = "Todo" },
    ["@type"] = { link = "Type" },
    ["@type.qualifier"] = { link = "Keyword" },
    ["@variable"] = { fg = c.syntax.variable },
    ["@variable.builtin"] = { fg = c.syntax.variable, style = "italic" },

    -- nvim-treesitter playground
    nodeType = { fg = c.syntax.string },
    nodeNumber = { link = "Number" },
    nodeOp = { link = "Operator" },
    nodeTag = { fg = c.syntax.field },
    nodeAnonymous = { fg = c.syntax.variable },

    -- telescope.nvim
    TelescopeTitle = { link = "Title" },
    TelescopeBorder = { link = "FloatBorder" },
    TelescopeNormal = { fg = c.fg },
    TelescopeSelection = { link = "Visual" },
    TelescopeSelectionCaret = { fg = c.red, bg = c.bg_visual },
    TelescopeMultiSelection = { link = "Type" },
    TelescopeMultiIcon = { fg = c.light_pink },
    TelescopeMatching = { fg = c.red },
    TelescopePromptNormal = { fg = c.fg, bg = c.bg },
    TelescopePromptPrefix = { fg = c.red },

    -- nvim-cmp
    CmpItemAbbr = { fg = c.fg },
    CmpItemAbbrDeprecated = { fg = c.fg, style = "strikethrough" },
    CmpItemAbbrMatch = { fg = c.orange },
    CmpItemAbbrMatchFuzzy = { fg = u.shade(c.orange, -20) },
    CmpItemKind = { fg = c.red },
    CmpItemMenu = { fg = c.fg },
    CmpItemKindText = { fg = c.red },
    CmpItemKindMethod = { fg = c.syntax.func },
    CmpItemKindFunction = { fg = c.syntax.func },
    CmpItemKindConstructor = { fg = c.syntax.func },
    CmpItemKindField = { fg = c.syntax.field },
    CmpItemKindVariable = { fg = c.syntax.variable },
    CmpItemKindClass = { fg = c.syntax.type },
    CmpItemKindInterface = { fg = c.syntax.type },
    CmpItemKindModule = { fg = c.syntax.type },
    CmpItemKindProperty = { fg = c.syntax.field },
    CmpItemKindUnit = { fg = c.syntax.literal },
    CmpItemKindValue = { fg = c.syntax.literal },
    CmpItemKindEnum = { fg = c.syntax.type },
    CmpItemKindKeyword = { fg = c.syntax.red },
    CmpItemKindSnippet = { fg = c.red },
    CmpItemKindColor = { fg = c.syntax.literal },
    CmpItemKindFile = { fg = c.syntax.literal },
    CmpItemKindReference = { fg = c.syntax.variable },
    CmpItemKindFolder = { link = "Directory" },
    CmpItemKindEnumMember = { fg = c.syntax.type },
    CmpItemKindConstant = { fg = c.syntax.literal },
    CmpItemKindStruct = { fg = c.syntax.type },
    CmpItemKindEvent = { fg = c.syntax.type },
    CmpItemKindOperator = { fg = c.syntax.red },
    CmpItemKindTypeParameter = { fg = c.syntax.type },

    -- gitsigns.nvim
    GitSignsAdd = { fg = c.diff.add },
    GitSignsChange = { fg = c.diff.change },
    GitSignsDelete = { fg = c.diff.delete },
    SignAdd = { link = "GitSignsAdd" },
    SignChange = { link = "GitSignsChange" },
    SignDelete = { link = "GitSignsDelete" },

    -- indent-blankline.nvim
    IndentBlanklineChar = { fg = c.fg_dark },
    IndentBlanklineSpaceChar = { fg = c.fg_dark },
    IndentBlanklineSpaceCharBlankline = { fg = c.fg_dark },
    IndentBlanklineContextStart = { sp = c.light_pink, style = "underline" },
    IndentBlanklineContextChar = { fg = c.light_pink },
    IndentBlanklineContextSpaceChar = { fg = c.fg_dark },
    IndentBlanklineIndent1 = { fg = c.fg_dark },
    IndentBlanklineIndent2 = { fg = u.shade(c.fg_dark, 10) },
    IndentBlanklineIndent3 = { fg = u.shade(c.fg_dark, 20) },
    IndentBlanklineIndent4 = { fg = u.shade(c.fg_dark, 30) },
    IndentBlanklineIndent5 = { fg = u.shade(c.fg_dark, 40) },
    IndentBlanklineIndent6 = { fg = u.shade(c.fg_dark, 50) },

    -- lazy.nvim
    LazyButton = { bg = c.bg_visual },
    LazyButtonActive = { bg = c.orange },
    LazyComment = { link = "Comment" },
    LazyCommit = { fg = c.red },
    LazyCommitIssue = { fg = c.markup.link },
    LazyCommitScope = { fg = c.fg, style = "Italic" },
    LazyCommitType = { fg = c.magenta },
    LazyDir = { link = "Directory" },
    LazyH1 = { bg = c.orange },
    LazyH2 = { bg = c.bg_float },
    LazyNoCond = { link = "DiagnosticWarn" },
    LazyNormal = { bg = c.bg_float_bright },
    LazyProgressDone = { fg = c.pink },
    LazyProgressTodo = { fg = c.gray },
    LazyProp = { link = "Conceal" },
    LazyReasonCmd = { fg = c.red },
    LazyReasonEvent = { fg = c.red },
    LazyReasonFt = { fg = c.dark_pink },
    LazyReasonImport = { fg = c.magenta },
    LazyReasonKeys = { fg = c.red },
    LazyReasonPlugin = { fg = c.magenta },
    LazyReasonRuntime = { fg = c.red },
    LazyReasonSource = { fg = c.orange },
    LazyReasonStart = { fg = c.light_pink },
    LazySpecial = { fg = c.fg },
    LazyTaskError = { fg = c.error },
    LazyTaskOutput = { fg = c.fg },
    LazyUrl = { fg = c.markup.link },
    LazyValue = { fg = c.orange },

    -- noice.nvim
    NoiceCmdlineIcon = { fg = c.red },
    NoiceCmdlineIconSearch = { fg = c.red },
    NoiceCmdlinePopup = { fg = c.fg_gutter },
    NoiceCmdlinePopupBorder = { fg = c.dark_pink },
    NoiceCmdlinePopupBorderSearch = { fg = c.magenta },
    NoiceCmdlinePrompt = { link = "Question" },
    NoiceCompletionItemKindDefault = { fg = c.red },
    NoiceCompletionItemKindKeyword = { fg = c.red },
    NoiceCompletionItemKindVariable = { fg = c.syntax.variable },
    NoiceCompletionItemKindConstant = { fg = c.syntax.literal },
    NoiceCompletionItemKindReference = { fg = c.syntax.variable },
    NoiceCompletionItemKindValue = { fg = c.syntax.literal },
    NoiceCompletionItemKindFunction = { fg = c.syntax.func },
    NoiceCompletionItemKindMethod = { fg = c.syntax.func },
    NoiceCompletionItemKindConstructor = { fg = c.syntax.func },
    NoiceCompletionItemKindClass = { fg = c.syntax.type },
    NoiceCompletionItemKindInterface = { fg = c.syntax.type },
    NoiceCompletionItemKindStruct = { fg = c.syntax.type },
    NoiceCompletionItemKindEvent = { fg = c.syntax.type },
    NoiceCompletionItemKindEnum = { fg = c.syntax.type },
    NoiceCompletionItemKindUnit = { fg = c.syntax.type },
    NoiceCompletionItemKindModule = { fg = c.syntax.type },
    NoiceCompletionItemKindProperty = { fg = c.syntax.field },
    NoiceCompletionItemKindField = { fg = c.syntax.field },
    NoiceCompletionItemKindTypeParameter = { fg = c.syntax.type },
    NoiceCompletionItemKindEnumMember = { fg = c.syntax.field },
    NoiceCompletionItemKindOperator = { fg = c.red },
    NoiceCompletionItemKindSnippet = { fg = c.red },
    NoiceConfirm = { fg = c.red, style = "bold" },
    NoiceConfirmBorder = { fg = c.dark_pink },

    -- which-key.nvim
    WhichKey = { fg = c.dark_pink },
    WhichKeyGroup = { fg = c.magenta },
    WhichKeySeparator = { fg = c.gray },
    WhichKeyDesc = { fg = c.red },
    WhichKeyFloat = { bg = c.bg_float },
    WhichKeyBorder = { fg = c.border },

    -- nvim-tree.lua
    NvimTreeNormal = { bg = c.bg_float },
    NvimTreeEmptyFolderName = { fg = c.dark_pink },
    NvimTreeFolderIcon = { fg = c.dark_pink },
    NvimTreeFolderName = { fg = c.dark_pink },
    NvimTreeGitDeleted = { fg = c.diff.delete },
    NvimTreeGitDirty = { fg = c.orange },
    NvimTreeGitNew = { fg = c.diff.add },
    NvimTreeImageFile = { fg = c.fg },
    NvimTreeOpenedFile = { fg = c.light_pink },
    NvimTreeOpenedFolderName = { fg = c.red, style = "bold" },
    NvimTreeRootFolder = { fg = c.magenta, style = "bold" },
    NvimTreeSpecialFile = { fg = c.orange },
    NvimTreeStatuslineNc = { fg = c.orange, bg = c.light_orange },
    NvimTreeSymlink = { fg = c.pink },
    NvimTreeWinSeparator = { fg = c.border },

    -- diffview.nvim
    DiffviewNormal = { bg = c.bg_float_bright },
    DiffviewFilePanelTitle = { fg = c.magenta },
    DiffviewFilePanelSelected = { fg = c.red },
    DiffviewFilePanelFileName = { fg = c.fg },
    DiffviewFolderName = { fg = c.dark_pink },
    DiffviewFolderSign = { fg = c.dark_pink },

    -- nvim-dap-ui
    debugPC = { bg = c.bg_visual },
    DapUIVariable = { fg = c.magenta },
    DapUIScope = { fg = c.red },
    DapUIType = { fg = c.red },
    DapUIValue = { fg = c.orange },
    DapUIModifiedValue = { fg = c.orange, style = "bold" },
    DapUIDecoration = { fg = c.gray },
    DapUIThread = { fg = c.red },
    DapUIStoppedThread = { fg = c.red, style = "italic" },
    DapUIFrameName = { fg = c.magenta },
    DapUISource = { fg = c.red },
    DapUILineNumber = { link = "LineNr" },
    DapUIFloatBorder = { fg = c.border },
    DapUIWatchesEmpty = { fg = c.gray },
    DapUIWatchesValue = { fg = c.magenta },
    DapUIWatchesError = { fg = c.error },
    DapUIBreakpointsPath = { fg = c.red },
    DapUIBreakpointsInfo = { fg = c.red },
    DapUIBreakpointsCurrentLine = { fg = c.magenta },
    DapUIBreakpointsLine = { fg = c.gray },
    DapUIBreakpointsDisabledLine = { fg = c.gray },

    -- vimtex
    texBeginEnd = { fg = c.syntax.keyword },
    texBeginEndName = { link = "Title" },
    texDelimiter = { fg = c.gray },
    texGreek = { fg = c.orange },
    texMath = { fg = c.orange },
    texMathSymbol = { fg = c.orange },
    texSection = { fg = c.red },
    texStatement = { fg = c.red },
    texSubscript = { fg = c.orange },
    texSuperscript = { fg = c.orange },
    texTitle = { link = "Title" },
    texType = {},
  }

  theme.terminal = {
    terminal_color_0 = c.bg_float,
    terminal_color_1 = c.dark_red,
    terminal_color_2 = c.red,
    terminal_color_3 = c.orange,
    terminal_color_4 = c.dark_pink,
    terminal_color_5 = c.magenta,
    terminal_color_6 = c.fg_dark,
    terminal_color_7 = c.gray,
    terminal_color_8 = c.dark_purple,
    terminal_color_9 = c.light_red,
    terminal_color_10 = c.light_pink,
    terminal_color_11 = c.light_orange,
    terminal_color_12 = c.pink,
    terminal_color_13 = c.pink,
    terminal_color_14 = c.fg_gutter,
    terminal_color_15 = c.fg,
  }

  return theme
end

return M
