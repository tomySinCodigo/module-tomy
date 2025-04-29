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


return F