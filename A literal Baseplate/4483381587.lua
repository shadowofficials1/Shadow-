  local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

    -- **Basic Information**
    local CurrentName = "🌑 Shadow 🌑"
    local CurrentGame = "a literal Baseplate 🌐"
    local DefaultVersion = "v1.0"

    -- **Persistent Version Storage**
    local VersionFile = "Shadow_Version.txt"

    local function LoadVersion()
        if isfile(VersionFile) then
            return readfile(VersionFile):match("^%s*(.-)%s*$") or DefaultVersion
        else
            return DefaultVersion
        end
    end

    local function SaveVersion(version)
        writefile(VersionFile, version)
    end

    local CurrentVersion = LoadVersion()

    -- **Create UI Window**
    local Window = Rayfield:CreateWindow({
        Name = string.format("%s | %s | %s", CurrentName, CurrentGame, CurrentVersion),
        Icon = 0,
        Theme = "Dark"
    })

    -- **Home Tab**
    local HomeTab = Window:CreateTab("🏠 Home")
    HomeTab:CreateSection("📌 Support")

    HomeTab:CreateButton({
        Name = "ℹ️ About Us",
        Callback = function()
            Rayfield:Notify({
                Title = "📢 About Us",
                Content = "Shadow is designed for testing purposes.",
                Duration = 5
            })
        end
    })

    HomeTab:CreateSection("⚠️ Disclaimer")
    HomeTab:CreateParagraph({
        Title = "🚨 Warning!",
        Content = "If you get kicked or banned, it's **your responsibility**, not ours."
    })

    -- **Function to Check for Updates**
    local function CheckForUpdate()
        local success, response = pcall(function()
            return game:HttpGet("https://raw.githubusercontent.com/shadowofficials1/Shadow-/refs/heads/main/A%20literal%20Baseplate/Version.lua")
        end)

        if success and response then
            local LatestVersion = response:match("^%s*(.-)%s*$") -- Trim spaces/newlines

            if LatestVersion and LatestVersion ~= CurrentVersion then
                -- **Show Update Notification**
                Rayfield:Notify({
                    Title = "⚠️ UPDATE DETECTED!",
                    Content = "New version available: " .. LatestVersion .. ". Please rejoin.",
                    Duration = 10
                })

                -- **Update UI Title & Save Version**
                SaveVersion(LatestVersion)
                CurrentVersion = LatestVersion
                Window:SetName(string.format("%s | %s | %s", CurrentName, CurrentGame, CurrentVersion))
            end
        else
            warn("⚠️ Failed to check for updates! Possible network issue.")
        end
    end
    
    -- **Check for Updates
    task.spawn(function()
        while true do
            CheckForUpdate()
            task.wait(30)
            end
          kicked()
          task.wait(5)
    end)

    -- **Check for Updates Immediately When Loaded**
    CheckForUpdate()

-- Auto Load & Save Configurations
    pcall(function() Rayfield:LoadConfiguration() end)
    local function AutoSave() pcall(function() Rayfield:SaveConfiguration() end) end
