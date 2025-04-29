local F = {}


function F.clip_path()
    -- get path from the current file
    ui.clipboard_text = buffer.filename
end

-- UI OPTIONS
-- toggle tabs
local visibleTabs = false
function F.toggle_tabs()
    if not visibleTabs then
        ui.tabs = false
    else
        ui.tabs = true
    end
    visibleTabs = not visibleTabs
end
-- toggle menu bar
local visibleMenubar = true
local menubar = textadept.menu.menubar
function F.toggle_menubar()
    if visibleMenubar then
        textadept.menu.menubar = nil
    else
        textadept.menu.menubar = menubar
    end
    visibleMenubar = not visibleMenubar
end
-- toggle menubar and tabs
function F.toggle_menubar_and_tabs()
    F.toggle_menubar()
    F.toggle_tabs()
end

-- EDITOR TOOLS
-- duplicate line
function F.duplicate_line()
    if not buffer.selection_empty and buffer.line_from_position(buffer.selection_start) ~= buffer.line_from_position(buffer.selection_end) then
        local select_text = buffer.get_sel_text()
        buffer.set_empty_selection(buffer.current_pos)
        buffer.new_line()
        buffer.insert_text(buffer.current_pos, select_text)
        buffer.goto_pos(buffer.current_pos + #select_text)
        buffer.set_selection(buffer.current_pos, buffer_current_pos - string.len(select_text))
    else
        buffer.line_duplicate()
    end
end

-- add options to menubar
function F.add_menubar_options()
    -- local menu = textadept.menu.menubar
    local help = menubar['Help']
    help[#help + 1] = {'reset configuration', reset}
    help[#help + 1] = {'toggle menubar, tabs', F.toggle_menubar_and_tabs}
    
end


return F