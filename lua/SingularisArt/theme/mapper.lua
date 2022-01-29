local colors = require('SingularisArt.theme.colors')
local cnf = require('SingularisArt.theme.config')

local function base()
  local cp = colors
  cp.none = 'NONE'

  return {
    Comment = { fg = cp.gray0, style = cnf.styles.comments },
    ColorColumn = { bg = cp.gray2 },
    Conceal = { fg = cp.black },
    Cursor = { fg = cp.black2, bg = cp.white },
    lCursor = { fg = cp.black2, bg = cp.white },
    CursorIM = { fg = cp.black2, bg = cp.white },
    CursorColumn = { bg = cp.black1 },
    CursorLine = { bg = cp.black2 },
    Directory = { fg = cp.blue },
    EndOfBuffer = { fg = cp.black2 },
    ErrorMsg = { fg = cp.red, style = 'bold,italic' },
    VertSplit = { fg = cp.black0 },
    Folded = { fg = cp.blue, bg = cp.black4 },
    FoldColumn = { bg = cp.black2, fg = cp.gray0 },
    SignColumn = { bg = cp.black2, fg = cp.black4 },
    SignColumnSB = { bg = cp.black0, fg = cp.black4 },
    Substitute = { bg = cp.black4, fg = cp.pink },
    LineNr = { fg = cp.black4, bg = cp.black2 },
    CursorLineNr = { fg = cp.white },
    MatchParen = { fg = cp.peach, style = 'bold' },
    ModeMsg = { fg = cp.white, style = 'bold' },
    MsgArea = { fg = cp.white },
    MsgSeparator = {},
    MoreMsg = { fg = cp.blue },
    NonText = { fg = cp.gray0 },
    Normal = { fg = cp.white, bg = cp.black2 },
    NormalNC = { fg = cp.white, bg = cp.black2 },
    NormalSB = { fg = cp.white, bg = cp.black0 },
    NormalFloat = { fg = cp.white, bg = cp.black3 },
    FloatBorder = { fg = cp.black3, bg = cp.black3 },
    Pmenu = { bg = cp.black3, fg = cp.gray2 },
    PmenuSel = { fg = cp.white, bg = cp.black4, style = 'bold' },
    PmenuSbar = { bg = cp.black4 },
    PmenuThumb = { bg = cp.gray0 },
    Question = { fg = cp.blue },
    QuickFixLine = { bg = cp.black4, style = 'bold' },
    Search = { bg = cp.black4, fg = cp.pink, style = 'bold' },
    IncSearch = { bg = cp.pink, fg = cp.black4 },
    SpecialKey = { fg = cp.white },
    SpellBad = { sp = cp.red, style = 'undercurl' },
    SpellCap = { sp = cp.yellow, style = 'undercurl' },
    SpellLocal = { sp = cp.blue, style = 'undercurl' },
    SpellRare = { sp = cp.green, style = 'undercurl' },
    StatusLine = { fg = cp.white, bg = cp.black2 },
    StatusLineNC = { fg = cp.black4, bg = cp.black2 },
    TabLine = { bg = cp.black1, fg = cp.black4 },
    TabLineFill = { bg = cp.black },
    TabLineSel = { fg = cp.green, bg = cp.black4 },
    Title = { fg = cp.blue, style = 'bold' },
    Visual = { bg = cp.black4, style = 'bold' },
    VisualNOS = { bg = cp.black4, style = 'bold' },
    WarningMsg = { fg = cp.yellow },
    Whitespace = { fg = cp.black4 },
    WildMenu = { bg = cp.gray0 },
    Constant = { fg = cp.peach },
    String = { fg = cp.green, style = cnf.styles.strings },
    Character = { fg = cp.teal },
    Number = { fg = cp.peach },
    Float = { fg = cp.peach },
    Boolean = { fg = cp.peach },
    Identifier = { fg = cp.flamingo, style = cnf.styles.variables },
    Function = { fg = cp.blue, style = cnf.styles.functions },
    Statement = { fg = cp.mauve },
    Conditional = { fg = cp.red },
    Repeat = { fg = cp.red },
      Label = { fg = cp.peach },
      Operator = { fg = cp.sky },
      Keyword = { fg = cp.pink, style = cnf.styles.keywords },
      PreProc = { fg = cp.pink },
      Include = { fg = cp.pink },
      StorageClass = { fg = cp.yellow },
      Structure = { fg = cp.yellow },
      Typedef = { fg = cp.yellow },
      Special = { fg = cp.pink },
      Type = { fg = cp.blue },
      Underlined = { style = 'underline' },
      Bold = { style = 'bold' },
      Italic = { style = 'italic' },
      Error = { fg = cp.red },
      Todo = { bg = cp.yellow, fg = cp.black2, style = 'bold' },
      qfLineNr = { fg = cp.yellow },
      qfFileName = { fg = cp.blue },
      htmlH1 = { fg = cp.pink, style = 'bold' },
      htmlH2 = { fg = cp.blue, style = 'bold' },
      mkdCodeDelimiter = { bg = cp.black2, fg = cp.white },
      mkdCodeStart = { fg = cp.flamingo, style = 'bold' },
      mkdCodeEnd = { fg = cp.flamingo, style = 'bold' },
      debugPC = { bg = cp.black0 },
      debugBreakpoint = { bg = cp.black2, fg = cp.gray0 },
      illuminatedWord = { bg = cp.black4 },
      illuminatedCurWord = { bg = cp.black4 },
      diffAdded = { fg = cp.green },
      diffRemoved = { fg = cp.red },
      diffChanged = { fg = cp.yellow },
      diffOldFile = { fg = cp.yellow },
      diffNewFile = { fg = cp.peach },
      diffFile = { fg = cp.blue },
      diffLine = { fg = cp.gray0 },
      diffIndexLine = { fg = cp.pink },
      DiffAdd = { fg = cp.green, bg = cp.black2 },
      DiffChange = { fg = cp.yellow, bg = cp.black2 },
      DiffDelete = { fg = cp.red, bg = cp.black2 },
      DiffText = { fg = cp.blue, bg = cp.black2 },
      healthError = { fg = cp.red },
      healthSuccess = { fg = cp.teal },
      healthWarning = { fg = cp.yellow },
      GlyphPalette1 = { fg = cp.red },
      GlyphPalette2 = { fg = cp.teal },
      GlyphPalette3 = { fg = cp.yellow },
      GlyphPalette4 = { fg = cp.blue },
      GlyphPalette6 = { fg = cp.teal },
      GlyphPalette7 = { fg = cp.white },
      GlyphPalette9 = { fg = cp.red },
      NotifyInfo = { fg = cp.sky, style = 'italic' },
      NotifyError = { fg = cp.red, style = 'italic' },
      NotifySuccess = { fg = cp.green, style = 'italic' },
    }
  end

  local function integrations()
    local config = cnf['integrations']
    local mappings = {}

    for integration in pairs(config) do
      if config[integration] == true then
        mappings = vim.tbl_deep_extend(
        'force',
        mappings,
        require('SingularisArt.theme.integrations.'..integration).get(colors)
        )
      end
    end

    return mappings
  end

  local function terminal()
    return colors
  end

  return {
    base = base(),
    terminal = terminal(),
    integrations = integrations(),
  }

