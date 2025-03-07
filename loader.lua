--[[
   ______           __      ___       __          _     
  / ____/________ _/ /_    /   | ____/ /___ ___  (_)___ 
 / /   / ___/ __ `/ __ \  / /| |/ __  / __ `__ \/ / __ \
/ /___/ /  / /_/ / /_/ / / ___ / /_/ / / / / / / / / / /
\____/_/   \__,_/_.___(_)_/  |_\__,_/_/ /_/ /_/_/_/ /_/ 
                                                         
Crab Admin - Loader v1.0.0
--]]

-- Local storage check first
local function loadFromLocal()
    if readfile and isfile and isfile("crabadmin.lua") then
        print("Loading Crab Admin from local storage...")
        return loadstring(readfile("crabadmin.lua"))()
    end
    return false
end

-- Try to load from local, otherwise get from web
local success = loadFromLocal()
if not success then
    print("Local file not found, loading Crab Admin from web...")
    local response = game:HttpGet("https://raw.githubusercontent.com/clonkabacjka/CrabAdmin/main/crabadmin.lua")
    if writefile then
        writefile("crabadmin.lua", response)
        print("Saved Crab Admin to local storage for faster loading next time!")
    end
    loadstring(response)()
end

-- Print success message
print("Crab Admin loaded successfully! Type ;cmds to see available commands.")
print("Default prefix is ; (semicolon)")
print("Enjoy your crab powers! 🦀") 
