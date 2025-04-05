-- Load Rayfield UI Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Copy the key link to clipboard
local keyLink = "https://workink.net/1YXH/v22tigdw"
setclipboard(keyLink)

-- Create Rayfield UI Window
local Window = Rayfield:CreateWindow({
    Name = "KEY SYSTEM | Shadow X",
    LoadingTitle = "Loading Key System",
    LoadingSubtitle = "Key link has been copied to clipboard",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "ShadowXHub", -- Custom folder name
        FileName = "shadowX"
    },
    Discord = {
        Enabled = true,
        Invite = "", -- Add your Discord invite code here
        RememberJoins = false -- Whether to force Discord join every time
    },
    KeySystem = true, -- Enable key system
    KeySettings = {
        Title = "SYSTEM KEY | Shadow X",
        Subtitle = "Enter your access key",
        Note = "Key link copied to clipboard",
        FileName = "ShadowXKey",
        SaveKey = false, -- Whether the key will be saved for the user
        GrabKeyFromSite = true, -- Whether to fetch the key from the given URL
        Key = {"https://workink.net/_api/v2/token/isValid/{TOKEN}"} -- Replace {TOKEN} with the dynamic key
    }
})

-- Function to validate the key, including expiration check
local function validateKey(key)
    local url = "https://workink.net/_api/v2/token/isValid/" .. key
    local response = game:HttpGet(url)
    
    -- Check the response for expiration or invalid key
    if response == "True" then
        return true  -- Key is valid
    elseif response == "Expired" then
        return "expired"  -- Key has expired
    else
        return false  -- Invalid key
    end
end

-- Function to handle the key entry and validation
local function handleKeyEntry(txt)
    -- Update the UI with the entered key
    local KeyLabel = Window:NewLabel("Key > " .. txt)

    -- Validate the entered key
    local validationResult = validateKey(txt)

    if validationResult == true then
        -- If key is valid, show success message
        KeyLabel:UpdateLabel("Key validated successfully!")
        
        -- Proceed with the script execution after key validation
        task.delay(1, function()
            -- Load your main loader or script
            local success, result = pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ZaRdoOx/Loader/main/PlatiniumLoader"))()
            end)

            -- If loading fails, log the error
            if not success then
                warn("Failed to load main script:", result)
            end
        end)
    elseif validationResult == "expired" then
        -- If the key is expired, notify the user
        KeyLabel:UpdateLabel("Key has expired! Please obtain a new key.")
    else
        -- If the key is invalid, notify the user
        KeyLabel:UpdateLabel("Invalid key! Please check and try again.")
    end
end

-- Allow the user to input their key
local KeyInput = Window:NewTextBox("Key", "Enter your key", function(txt)
    handleKeyEntry(txt) -- Handle key validation when the user submits the key
end)

-- Optionally, you can destroy the Rayfield UI after the script loads
Rayfield:Destroy()
