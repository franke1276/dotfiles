local M={}
M.switch_projects = function() 
    require("telescope.builtin").find_files ({
        prompt_title = "< Switch Project >",
        cwd = "$HOME/workspace/",
    })
end
return M
