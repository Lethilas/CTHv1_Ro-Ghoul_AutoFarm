local function get_executor()
    local ok, name = pcall(function()
        return (identifyexecutor or getexecutorname)()
    end)
    if ok and type(name) == "string" then
        return name:lower()
    end
    return "unknown"
end

local SPECIAL_URL = "https://raw.githubusercontent.com/Lethilas/CTHv1_Ro-Ghoul_AutoFarm/refs/heads/main/CTHv1.4%20Xeno.lua"
local DEFAULT_URL = "https://raw.githubusercontent.com/Lethilas/CTHv1_Ro-Ghoul_AutoFarm/refs/heads/main/CTHv1.4.lua"

local special_executors = {
    xeno   = true,
    solara = true,
}

local target_url = special_executors[get_executor()] and SPECIAL_URL or DEFAULT_URL

loadstring(game:HttpGet(target_url))()