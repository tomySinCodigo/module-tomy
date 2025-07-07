local fun = require('tomy.funciones')


if not OSX and not CURSES then
    keys['f9'] = reset -- RESET EDITOR
    keys['f4'] = fun.clip_path -- CLIPBOARD PATH
    keys['ctrl+f12'] = fun.toggle_tabs -- TOGGLE TABS
    keys['ctrl+f11'] = fun.toggle_menubar -- TOGGLE MENUBAR
    keys['ctrl+f10'] = fun.toggle_menubar_and_tabs -- TOGGLE MENUBAR AND TABS
    keys['ctrl+d'] = fun.duplicate_line -- DUPLICATE LINE
end
fun.add_menubar_options()

-- view:set_theme('dark')
-- textadept.run.run_in_background = true
--textadept.run.run_without_prompt = true
textadept.run.run_command = 'python3 -u "%f" %a' -- RUN PYTHON 3

-- EDITOR
--buffer.use_tabs = false
--buffer.tab_width = 4

if not CURSES then
	 --view:set_theme{font = 'PragmataProLiga Nerd Font', size = 10}
	 view:set_theme('uno', {font = 'FiraCode Nerd Font Med', size = 9})
end
-- EDITOR

local indent_settings = {
  yaml = {tab_width=2, use_tabs=false},
  python = {tab_width=4, use_tabs=false},
  javascript = {tab_width=4, use_tabs=false},
  c = {tab_width=4, use_tabs = true},
}

events.connect(events.LEXER_LOADED, function(lexer)
  local settings = indent_settings[lexer]
  if settings then
    buffer.tab_width = settings.tab_width
    buffer.use_tabs = settings.use_tabs
  end
end)
--view.view_ws = buffer.WS_VISIBLEALWAYS
--styles[lexer.WHITESPACE] = {fore=colors.green}