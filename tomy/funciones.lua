local F = {}


function F.clip_path()
    -- get path from the current file
    ui.clipboard_text = buffer.filename
end

return F