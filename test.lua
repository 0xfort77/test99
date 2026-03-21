local place_id = 126509999114328

if game.PlaceId == place_id then

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local _Version = "Cyan-99 v1.t"

local Window = Rayfield:CreateWindow({
   Name = _Version,
   Icon = "shell", -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Cyan Hubs",
   LoadingSubtitle = "by 4NTHOcyan",
   ShowText = "Rayfield", -- for mobile users to unhide Rayfield, change if you'd like
   Theme = "DarkBlue", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = true,
   DisableBuildWarnings = false, -- Prevents Rayfield from emitting warnings when the script has a version mismatch with the interface.

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "9vxK5cdGy4", -- The Discord invite code, do not include Discord.gg/. E.g. Discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the Discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique, as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that the system will accept, can be RAW file links (pastebin, github, etc.) or simple strings ("hello", "key22")
   }
})

--// Local VARs
local items = workspace.Items

local player = game.Players.LocalPlayer
local charr = player.Character or player.CharacterAdded:Wait()
local HRP = charr:FindFirstChild("HumanoidRootPart")
local my_humanoid = charr:FindFirstChild("Humanoid")
local my_head = game.Players.LocalPlayer.Character.Head
local MyUserID = game.Players.LocalPlayer.UserId
local my_name = player.Name

local skull_podium_flag = false
local run_toggle_flag = false
local run_speed_flag = false
local jump_toggle_flag = false
local jump_power_flag = false
local auto_cgem_flag = false
local health_flag = false
local kill_flag = false
local chop_trees_flag = false
local always_day_flag = false
local insta_chest_flag = false
local temporal_flag = false
local diamonds_flag = false
local cultist_S_flag = false
local auto_SH_flag = false
local interface_flag = false
local fishing_flag = false

--workspace.Map.Landmarks["Jungle Temple"].Functional.Podiums:GetChildren()[4].TouchZone
--local jungle_key1 = workspace.Map.Landmarks["Jungle Temple"].Functional.Podiums:GetChildren()[1].TouchZone
--local jungle_key2 = workspace.Map.Landmarks["Jungle Temple"].Functional.Podiums:GetChildren()[2].TouchZone
--local jungle_key3 = workspace.Map.Landmarks["Jungle Temple"].Functional.Podiums:GetChildren()[3].TouchZone
--local jungle_key4 = workspace.Map.Landmarks["Jungle Temple"].Functional.Podiums:GetChildren()[4].TouchZone

local LIGHT = game:GetService("Lighting")

local workbench_loc = workspace.Map.Campground.CraftingBench.TouchZone -- .CFrame
local FIREZONE = workspace.Map.Campground.MainFire.InnerTouchZone
local stronghold_loc = workspace.Map.Landmarks
local anvil_loc = workspace.Map.Landmarks
local upg_hut = workspace.Map.Landmarks

local missing_kids_folder_loc = workspace.Map:WaitForChild("MissingKids"):GetAttributes()

--local jung_temp_stair = workspace.Map.Landmarks["Jungle Temple"].Functional.Stairwell.Moving["0"]
--local jung_fight_pit = workspace.Map.Landmarks:FindFirstChild("Jungle Fight Pit").Functional.ArenaLootZones:FindFirstChild("LootZone").Zone

local NPC_enemies = workspace.Characters

local damage_hash = "1_"..tostring(MyUserID)

local function queryBears()
    for _, b in ipairs(NPC_enemies:GetChildren()) do
        if b:IsA("Model") and b.Name == "Bear" then
            for _, h in pairs(b:GetChildren()) do
                if h:IsA("Part") and string.find(h.Name, "HumanoidRootPart") then
                    h.CanQuery = true
                end
                task.wait()
            end
        end
    end

end  

Rayfield:Notify({
    Title = "Infrastructure:",
    Content = "Querying models and detecting NPCs, please wait...",
    Duration = 10,
    Image = 4483362458,
}) 

----------------------------------------
Rayfield:Notify({
    Title = "Welcome!",
    Content = "Thanks for using CyanHub by 4NTHOcyan",
    Duration = 6.5,
    Image = "file-heart",
})

local MainTab = Window:CreateTab("Main", "blend") -- Title, Image
local BringTab = Window:CreateTab("Bring", "briefcase") -- Title, Image
local MoveTab = Window:CreateTab("Teleport", "move") -- Title, Image
local TreeTab = Window:CreateTab("Trees", "trees")
local ChestTab = Window:CreateTab("Chests", "package") -- Title, Image
local SkullTab = Window:CreateTab("Skulls", "skull") -- Title, Image
local BaseTab = Window:CreateTab("Skybase", "baseline")
local ExtrasTab = Window:CreateTab("Extras", "star")
local CREDITS = Window:CreateTab("Credits", "users") -- Title, Image

--init hidden menus

local scr_bench_init_ = workspace.Map.Campground.CraftingBench.TouchZone.ProximityAttachment.ProximityInteraction
scr_bench_init_.HoldDuration = 0
scr_bench_init_.RequiresLineOfSight = false
task.wait()
fireproximityprompt(scr_bench_init_)
task.wait()

--// create main tab 

local mainsection1 = MainTab:CreateSection("Player:")

local speed_index

local SpeedSlider = MainTab:CreateSlider({
        Name = "Speed",
        Range = {16, 200},
        Increment = 2,
        Suffix = "🏃‍♂️",
        CurrentValue = 16,
        Flag = "SpeedSlider1", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Value)

            --charr.Humanoid.WalkSpeed = Value
            speed_index = Value

        end,
})

local runToggle = MainTab:CreateToggle({
    Name = "Enable Speed",
    CurrentValue = false,
    Flag = "runToggle1", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        run_toggle_flag = Value

        if run_toggle_flag then

            Rayfield:Notify({
                Title = "Notification",
                Content = "Run Speed enabled",
                Duration = 6,
                Image = 4483362458,
            })

        end

        while run_toggle_flag do

            charr.Humanoid.WalkSpeed = speed_index
            task.wait(0.01)

            if run_toggle_flag == false then

                charr.Humanoid.WalkSpeed = 16

                Rayfield:Notify({
                    Title = "Notification",
                    Content = "Run Speed disabled",
                    Duration = 6,
                    Image = 4483362458,
                })

            end

        end

    end,
})

local jump_index

local JumpSlider = MainTab:CreateSlider({
    Name = "Jump",
    Range = {7, 200},
    Increment = 4,
    Suffix = "",
    CurrentValue = 7,
    Flag = "JumpSlider1", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
    
        jump_index = Value

    end,
})

local jumpToggle = MainTab:CreateToggle({
    Name = "Enable Jump",
    CurrentValue = false,
    Flag = "jumpToggle1", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        jump_toggle_flag = Value

        if jump_toggle_flag then

            Rayfield:Notify({
                Title = "Notification",
                Content = "Jump enabled",
                Duration = 6,
                Image = 4483362458,
            })

        end

        while jump_toggle_flag do

            charr.Humanoid.JumpHeight = jump_index
            charr.Humanoid.JumpPower = jump_index
            task.wait(0.01)

            if jump_toggle_flag == false then

                charr.Humanoid.JumpHeight = 6.5

                Rayfield:Notify({
                    Title = "Notification",
                    Content = "Jump disabled",
                    Duration = 6,
                    Image = 4483362458,
                })

            end

        end

    end,
})

local HealthToggle = MainTab:CreateToggle({
    Name = "Invincible",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        health_flag = Value

        while health_flag do
            local args = {
	            -1/0
            }
            game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("DamagePlayer"):FireServer(unpack(args))

            task.wait(1.1)
        end
    end,
})

local mainsection22 = MainTab:CreateSection("World:")

local acceptable_weapons_table = {
    "Good Axe",
    "Old Axe",
    "Strong Axe",
    "Spear",
    "Chainsaw",
    "Infernal Sword",
    "Ice Sword",
    "Morningstar",
    "Flamethrower",
    "Poison Spear",
    "Poison Claws",
    "Obsidiron Hammer",
    "Scythe",
    "Vampire Scythe",
    "Katana",
    "Trident",
    "Laser Sword",
}

local KILLToggle = MainTab:CreateToggle({
    Name = "Kill Aura",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        kill_flag = Value

        if kill_flag then
            Rayfield:Notify({
                Title = "Notification",
                Content = "Kill Aura enabled, please wait...",
                Duration = 12.5,
                Image = 4483362458,
            })

            task.wait()
            pcall(queryBears)

            Rayfield:Notify({
                Title = "Notification",
                Content = "EQUIP A TOOL TO KILL (AXE, MORNINGSTAR, ETC.)",
                Duration = 12.5,
                Image = 4483362458,
            })

        end

        while kill_flag do
            local weap_name_ = workspace[my_name]:WaitForChild("ToolHandle"):WaitForChild("OriginalItem").Value
            print("equipped "..tostring(weap_name_))
            if table.find(acceptable_weapons_table, tostring(weap_name_)) then
                local includeparams = OverlapParams.new()
                local excludeparams = OverlapParams.new()
                includeparams.FilterType = Enum.RaycastFilterType.Include
                includeparams.FilterDescendantsInstances = {NPC_enemies}
                --includeparams.CollisionGroup = "NPCs"
                excludeparams.FilterType = Enum.RaycastFilterType.Exclude
                excludeparams.FilterDescendantsInstances = {}
                excludeparams.MaxParts = 220 -- changed
                local worldrootradius = workspace:GetPartBoundsInBox(HRP.CFrame, Vector3.new(180,60,180), includeparams, excludeparams)

                for _, v in pairs(worldrootradius) do
                    if v:IsA("Part") and v.Name == "HumanoidRootPart" or v.Name == "Head" then
                        --v.CanQuery = true
                        --print(v.Parent)
                        task.wait()

                        local args = {
                            v.Parent,
                            game.Players.LocalPlayer.Inventory:WaitForChild(tostring(weap_name_)),
                            damage_hash,
                            v.CFrame * CFrame.new(0,0,0)
                        }
                        game.ReplicatedStorage.RemoteEvents.ToolDamageObject:InvokeServer(unpack(args))

                    end

                end
            else
                task.wait(0.01)
                continue
            end
            --print(worldrootradius)

            task.wait()
        end
    end,
})
local Label = MainTab:CreateLabel("Kill Aura uses your held weapon", "swords")
local createdatmos = false
local DaylightToggle = MainTab:CreateToggle({
    Name = "Night Vision",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value) 
    
        always_day_flag = Value

        if always_day_flag then
            Rayfield:Notify({
                Title = "Notification",
                Content = "Night Vision enabled",
                Duration = 10,
                Image = 4483362458,
            })

            for _, v in pairs(LIGHT:GetChildren()) do
                if v.ClassName == "Atmosphere" and string.find(v.Name, "Atmosphere") then
                    createdatmos = true
                end
            end

            if createdatmos == false then 
                local new_AS = Instance.new("Atmosphere")
                new_AS.Parent = game.Lighting
                new_AS.Density = 0
                new_AS.Color = Color3.new(255,255,255)
                new_AS.Decay = Color3.new(255,255,255)
            end


        end


        while always_day_flag do

            LIGHT.ClockTime = 14.5
            LIGHT.FogColor = Color3.new(139,139,139)
            LIGHT.FogEnd = 10000
            LIGHT.FogStart = 5000
            task.wait()

        end
    
    end,

})

local instaChestButton = MainTab:CreateToggle({
    Name = "Instant-Open Chests",
    CurrentValue = false,
    Callback = function(Value)

        insta_chest_flag = Value
        if insta_chest_flag then

            Rayfield:Notify({
                Title = "Notification",
                Content = "Instant-Open Chests enabled",
                Duration = 10,
                Image = 4483362458,
            })

        end

        while insta_chest_flag do
            for _, Chest in pairs(workspace.Items:GetChildren()) do

                if Chest.Name == "Item Chest" or Chest.Name == "Item Chest2" or Chest.Name == "Item Chest3" or Chest.Name == "Item Chest4" or Chest.Name == "Item Chest5" or Chest.Name == "Item Chest6" or Chest.Name == "Jungle Chest1" or Chest.Name == "Jungle Chest2" or Chest.Name == "Stronghold Diamond Chest" or Chest.Name == "Stone Chest1" or Chest.Name == "Stone Chest2" or Chest.Name == "Mossy Chest" or Chest.Name == "Obsidiron Chest" or Chest.Name == "Small Present" or Chest.Name == "Giant Present" then

                    for _, m in pairs(Chest:GetChildren()) do

                        if m:IsA("Part") and m.Name == "Main" then

                            if m:FindFirstChild("ProximityAttachment") then
                                local inner_prox = m.ProximityAttachment.ProximityInteraction
                                inner_prox.HoldDuration = 0
                            else
                                continue
                            end
                        else
                            continue
                        end

                    end

                end

            end
            task.wait(2.899)
        end
    end,
})

local temporal_activ = game:GetService("Players").LocalPlayer.PlayerGui.Interface.GemActivateMenu.Amount.Frame.BuyButton
local day_timer = game:GetService("Players").LocalPlayer.PlayerGui.Interface.TopRight.Frame.SunDial.RealTimer
local sun_pic = game:GetService("Players").LocalPlayer.PlayerGui.Interface.TopRight.Frame.SunDial.RainLabel.Image
local day_tell = game:GetService("Lighting").Brightness -- 2.5 for night, 1 for day

local autoskipnightButton = MainTab:CreateToggle({
    Name = "Auto-Skip Nights",
    CurrentValue = false,
    Callback = function(Value) 
    
        temporal_flag = Value

        if temporal_flag then

            Rayfield:Notify({
                Title = "Notification",
                Content = "Auto-Skip Nights enabled",
                Duration = 10,
                Image = 4483362458,
            })

        end

        while temporal_flag do
            task.wait(0.25)
            if day_timer.Text == "1:30" then
                print("con met")
                if game:GetService("Players").LocalPlayer.PlayerGui.Interface.TopRight.Frame.SunDial.RainLabel.Image == "rbxassetid://71043129916600" then

                    local args = {
	                    workspace.Structures:FindFirstChild("Temporal Accelerometer")
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestActivateNightSkipMachine"):FireServer(unpack(args))
                end
            else
                continue
            end
            task.wait(0.25)
        end
    
    end,

})

local cultVolcanoToggle = MainTab:CreateToggle({
    Name = "Auto Sacrifice 🌋",
    CurrentValue = false,
    Flag = "cultToggle1", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        cultist_S_flag = Value

        if cultist_S_flag then
            Rayfield:Notify({
                Title = "Notification",
                Content = "Auto Sacrifice enabled",
                Duration = 10,
                Image = 4483362458,
            })

        end

        while cultist_S_flag do

            task.wait(0.15)
            if workspace.Map.Landmarks.Volcano.Functional:FindFirstChild("Lava") then


                for _, cult in pairs(workspace.Items:GetChildren()) do
                    if cult.Name == "Cultist" or cult.Name == "Crossbow Cultist" then
                        local args = {
	                        cult,
	                        workspace:WaitForChild("Map"):WaitForChild("Landmarks"):WaitForChild("Volcano"):WaitForChild("Functional"):WaitForChild("Lava")
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestLavaBurnItem"):InvokeServer(unpack(args))

                    end

                end

            else
                Rayfield:Notify({
                    Title = "Notification",
                    Content = "No Lava detected!",
                    Duration = 10,
                    Image = 4483362458,
                })
                task.wait(4.5)
            end
            task.wait(0.25)

        end
    end,
})

-- workspace.Map.Landmarks.Stronghold.Functional.Sign.SurfaceGui.Frame.Body.Text

local autodiamondsButton = MainTab:CreateToggle({
    Name = "Auto Pick up Diamonds",
    CurrentValue = false,
    Callback = function(Value) 
        diamonds_flag = Value

        if diamonds_flag then
            Rayfield:Notify({
                Title = "Notification",
                Content = "Auto Pick up Diamonds enabled",
                Duration = 10,
                Image = 4483362458,
            })
        end

        while diamonds_flag do
            task.wait(0.5)

            for _, d in pairs(workspace.Items:GetChildren()) do
                if d.Name == "Diamond" then
                    local args = {
                        d,
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestTakeDiamonds"):FireServer(unpack(args))
                end
                task.wait()
            end
            task.wait()
        end
    end,

})

local coinsButton = MainTab:CreateButton({
    Name = "Collect All Coins",
    Callback = function()
        Rayfield:Notify({
            Title = "Notification",
            Content = "Collecting all Coins",
            Duration = 10,
            Image = 4483362458,
        })
        task.wait()
        for _, coins in pairs(workspace.Items:GetChildren()) do
            if coins.Name == "Coin Stack" then
                local args = {
                    coins
                    }
                game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestCollectCoints"):InvokeServer(unpack(args))
            end
            task.wait()
        end
        task.wait()


    end,
})

local autoSHButton = MainTab:CreateToggle({ -- workspace.Map.Landmarks.Stronghold.Functional.FinalGate.Main CFrame Y changes when done **
    Name = "Auto Stronghold",
    CurrentValue = false,
    Callback = function(Value) 
        auto_SH_flag = Value

        if auto_SH_flag then
            Rayfield:Notify({
                Title = "Notification",
                Content = "Auto Stronghold enabled",
                Duration = 10,
                Image = 4483362458,
            })
        end

        while auto_SH_flag do
            task.wait()
            if stronghold_loc:FindFirstChild("Stronghold") then

                local internal_time = workspace.Map.Landmarks.Stronghold.Functional.Sign.SurfaceGui.Frame.Body.Text

                if internal_time == "00s" then
                    local init_sh = false
                    local done_sh = false
                    for i=1, 5 do
                        HRP.CFrame = workspace.Map.Landmarks.Stronghold.Functional.EnemyWaves12.Wave1.TriggerZone.CFrame * CFrame.new(0,13,0)
                        task.wait(6.5)
                        --task.wait()
                        HRP.CFrame = workspace.Map.Landmarks.Stronghold.Functional.EnemyWaves12.Wave1.TriggerZone.CFrame * CFrame.new(0,26,0)
                        task.wait(4)
                    end
                    repeat
                        --task.wait(6.5)
                        --HRP.CFrame = workspace.Map.Landmarks.Stronghold.Functional.EnemyWaves12.Wave1.TriggerZone.CFrame * CFrame.new(0,13,0)
                        task.wait(4)
                        --HRP.CFrame = workspace.Map.Landmarks.Stronghold.Functional.EnemyWaves12.Wave1.TriggerZone.CFrame * CFrame.new(0,26,0)
                        if workspace.Map.Landmarks.Stronghold.Functional.Braziers.Brazier.Main.FireAttach.Fire.Enabled == false then

                            local temporary_camera_obj = workspace.Camera
                            temporary_camera_obj.CameraType = Enum.CameraType.Scriptable
                            task.wait()
                            temporary_camera_obj.CFrame = CFrame.new(562.174438, 62.9329605, -435.395081, -0.999985576, 0.00528905867, -0.000932605646, 0, 0.173648536, 0.98480773, 0.00537065091, 0.984793544, -0.173646033)

                            HRP.CFrame = workspace.Items["Stronghold Diamond Chest"].Platform.CFrame * CFrame.new(0,6,0)
                            task.wait()
                            local d_chest_prox = workspace.Items["Stronghold Diamond Chest"].Main.ProximityAttachment.ProximityInteraction
                            task.wait()
                            d_chest_prox.RequiresLineOfSight = false
                            task.wait(1)
                            fireproximityprompt(d_chest_prox)
                            task.wait(1)

                            for _, d in pairs(workspace.Items:GetChildren()) do
                                if d.Name == "Diamond" then
                                    local args = {
                                        d,
                                    }
                                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestTakeDiamonds"):FireServer(unpack(args))
                                end
                            end
                            task.wait(1)
                            temporary_camera_obj.CameraType = Enum.CameraType.Custom
                            task.wait()
                            HRP.CFrame = FIREZONE.CFrame * CFrame.new(0,6,0)
                            task.wait()
                            done_sh = true
                        end
                        task.wait()
                    until done_sh
                    
                    if done_sh then
                         
                        task.wait(600)
                        done_sh = false
                        --doing_sh = false
                    end
                    task.wait(1)

                end
                task.wait()

            else
                Rayfield:Notify({
                    Title = "Notification",
                    Content = "No Stronghold Detected!",
                    Duration = 10,
                    Image = 4483362458,
                })
            end
            task.wait()
            
        end

    end,
})

local strongholdtablabel1 = MainTab:CreateLabel("Player will teleport around to ensure initiation", "rss")

local fishSuccessArea = game:GetService("Players").LocalPlayer.PlayerGui.Interface.FishingCatchFrame.TimingBar.SuccessArea

local UICorner_F = Instance.new("UICorner",fishSuccessArea)
UICorner_F.CornerRadius = UDim.new(0, 20)

local Toggle = MainTab:CreateToggle({
    Name = "Easy Fishing",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        fishing_flag = Value

        if fishing_flag then
            Rayfield:Notify({
                Title = "Notification",
                Content = "Easy Fishing enabled",
                Duration = 10,
                Image = 4483362458,
            })
        end

        while fishing_flag do

            task.wait()
            fishSuccessArea.Position = UDim2.new(0.5, 0, 1.19999996e-07, 0)
            fishSuccessArea.Size = UDim2.new(1, 0, 1, 0)
            task.wait()

        end

    end,
})


--
--task.spawn(function()
--    while true do
--        if stronghold_loc:FindFirstChild("Stronghold") then
--
--            task.wait(1)
--            local sh_display_time = workspace.Map.Landmarks.Stronghold.Functional.Sign.SurfaceGui.Frame.Body.Text
--            print(sh_display_time)
--            local formattedTime = string.format("Stronghold Time: %q", sh_display_time)
--            if not sh_display_time then
--                break
--            end
--        end
--        task.wait()
--        strongholdtablabel1:Set(tostring(formattedTime))
--    end
--end)

--pcall(sHtimer)

--// Create Move teleport Tab

local movesection1 = MoveTab:CreateSection("Teleport to:")

local CampButton = MoveTab:CreateButton({
    Name = "Camp",
    Callback = function()

        HRP.CFrame = FIREZONE.CFrame * CFrame.new(0,6,0)   

    end,
})

local volcanobutton = MoveTab:CreateButton({
    Name = "Volcano Sacrifice",
    Callback = function()
        if workspace.Map.Landmarks:FindFirstChild("Volcano") then
            HRP.CFrame = workspace.Map.Landmarks.Volcano.Functional.Sacrifice.Altar.Platform.CFrame * CFrame.new(0,10,0)
        else
            Rayfield:Notify({
                Title = "Notification",
                Content = "No Volcano detected!",
                Duration = 10,
                Image = 4483362458,
            })
        end

    end,
})

local TempleButton = MoveTab:CreateButton({
    Name = "Jungle Temple",
    Callback = function()
        if workspace.Map.Landmarks:FindFirstChild("Jungle Temple") then

            HRP.CFrame = workspace.Map.Landmarks["Jungle Temple"].Functional.Stairwell.Moving["0"].CFrame * CFrame.new(0,6,0)   
        else
            Rayfield:Notify({
                Title = "Notification",
                Content = "No Jungle Temple detected!",
                Duration = 10,
                Image = 4483362458,
            })
        end
    end,
})

local fightpitButton = MoveTab:CreateButton({
    Name = "Jungle Fight Pit",
    Callback = function()
        if workspace.Map.Landmarks:FindFirstChild("Jungle Fight Pit") then

            HRP.CFrame = workspace.Map.Landmarks:FindFirstChild("Jungle Fight Pit").Functional.ArenaLootZones:FindFirstChild("LootZone").Zone.CFrame * CFrame.new(0,16,0)
        else
            Rayfield:Notify({
                Title = "Notification",
                Content = "No Fight Pit detected!",
                Duration = 10,
                Image = 4483362458,
            })
        end
    end,
})

local SHButton = MoveTab:CreateButton({
    Name = "Stronghold",
    Callback = function()
        if stronghold_loc:FindFirstChild("Stronghold") then
            if stronghold_loc.Stronghold.Building.Exterior:GetChildren()[12]:FindFirstChild("Model") then
                HRP.CFrame = stronghold_loc.Stronghold.Building.Exterior:GetChildren()[12].Model:GetChildren()[2].CFrame * CFrame.new(0,6,0)
            else
                Rayfield:Notify({
                Title = "Notification",
                Content = "No Stronghold detected!",
                Duration = 10,
                Image = 4483362458,
            })
            end
        else
            Rayfield:Notify({
                Title = "Notification",
                Content = "No Stronghold detected!",
                Duration = 10,
                Image = 4483362458,
            })
        end
    end,
})

local SHDCButton = MoveTab:CreateButton({
    Name = "Stronghold - Diamond Chest",
    Callback = function()
        if workspace.Items:FindFirstChild("Stronghold Diamond Chest") then
            if workspace.Items["Stronghold Diamond Chest"]:FindFirstChild("Platform") then
                HRP.CFrame = workspace.Items["Stronghold Diamond Chest"].Platform.CFrame * CFrame.new(0,6,0)
            
            else
                Rayfield:Notify({
                    Title = "Notification",
                    Content = "No Diamond Chest detected!",
                    Duration = 10,
                    Image = 4483362458,
                })
            end
        else
            Rayfield:Notify({
                Title = "Notification",
                Content = "No Diamond Chest detected!",
                Duration = 10,
                Image = 4483362458,
            })
        end
    end,
})

local function anv_func()

    if workspace.Map.Landmarks:FindFirstChild("ToolWorkshopMeteorShower") then
        HRP.CFrame = CFrame.new(anvil_loc.ToolWorkshopMeteorShower.Functional.ToolBench.Main.CFrame.Position + Vector3.new(-8,8,0)) 
    elseif workspace.Map.Landmarks:FindFirstChild("ToolWorkshop") then
        HRP.CFrame = anvil_loc.ToolWorkshop.Functional.ToolBench.Main.CFrame * CFrame.new(-8,8,0)
    end


end

local AnvButton = MoveTab:CreateButton({
    Name = "Anvil",
    Callback = function()

        local success, error = pcall(anv_func)

        if not success then
            Rayfield:Notify({
                Title = "Notification",
                Content = "No Anvil Type detected!",
                Duration = 10,
                Image = 4483362458,
            })

            print(error)
        end

    end,
})

local FairyButton = MoveTab:CreateButton({
    Name = "Fairy House",
    Callback = function()
        if workspace.Map.Landmarks:FindFirstChild("Fairy House") then
            local qFpart = workspace.Map.Landmarks["Fairy House"].Main
            qFpart.CanQuery = true
            HRP.CFrame = CFrame.new(qFpart.CFrame.Position + Vector3.new(-10,28,-10))
        else
            Rayfield:Notify({
                Title = "Notification",
                Content = "No Fairy House detected!",
                Duration = 10,
                Image = 4483362458,
            })
        end
    end,
})

local CaravanButton = MoveTab:CreateButton({
    Name = "Furniture Caravan",
    Callback = function()
        if workspace.Characters:FindFirstChild("HorseAndCaravan") then
            HRP.CFrame = CFrame.new(workspace.Characters.HorseAndCaravan.Torso.TorsoMain.CFrame.Position + Vector3.new(0,28,0))
        else
            Rayfield:Notify({
                Title = "Notification",
                Content = "No Furniture Caravan detected!",
                Duration = 10,
                Image = 4483362458,
            })
        end
    end,
})

local function upgHut_func()

    if workspace.Map.Landmarks:FindFirstChild("ToolSmith") then
        HRP.CFrame = CFrame.new(upg_hut.ToolSmith["Tool Trader"].Head.CFrame.Position + Vector3.new(0,8,0)) 
    elseif workspace.Map.Landmarks:FindFirstChild("ToolWorkshop") then
        HRP.CFrame = upg_hut.ToolSmith["Tool Trader"].Head.CFrame * CFrame.new(0,8,0)
    end


end

local UpgButton = MoveTab:CreateButton({
    Name = "Upgrades",
    Callback = function()

        local success, error = pcall(upgHut_func)

        if not success then
            Rayfield:Notify({
                Title = "Notification",
                Content = "No Toolsmith detected!",
                Duration = 10,
                Image = 4483362458,
            })

            print(error)
        end
    end,
})

local function cave1_func()

    if workspace.Map.Landmarks:FindFirstChild("Cave Entrance1") then
        HRP.CFrame = CFrame.new(workspace.Map.Landmarks["Cave Entrance1"].Main.CFrame.Position + Vector3.new(0,20,0)) 
    elseif workspace.Map.Landmarks:FindFirstChild("ToolWorkshop") then
        HRP.CFrame = workspace.Map.Landmarks["Cave Entrance1"].Main.CFrame * CFrame.new(0,20,0)
    end


end

local Cave1Button = MoveTab:CreateButton({
    Name = "Cave Entrance",
    Callback = function()

        local success, error = pcall(cave1_func)

        if not success then
            Rayfield:Notify({
                Title = "Notification",
                Content = "No Cave Entrance detected!",
                Duration = 10,
                Image = 4483362458,
            })

            print(error)
        end
    end,
})

local movesection2 = MoveTab:CreateSection("Lost Children:") --// CHILDREN

local function kid1_loc()
    local kid_1_found = false
    if workspace.Characters:FindFirstChild("Lost Child") then
            
        --local distance1kid = (workspace.Characters["Lost Child"].Head.CFrame.Position - workspace.Map.Campground.Scrapper:GetChildren()[8].Position).Magnitude

        HRP.CFrame = CFrame.new(workspace.Characters["Lost Child"].Head.CFrame.Position + Vector3.new(0,4,0))

    else

        for _, v in pairs(missing_kids_folder_loc) do

            if _ == "DinoKid" then
                HRP.CFrame = CFrame.new(v) * CFrame.new(0,-14,0)
            end

        end
    end
end

local Kid1Button = MoveTab:CreateButton({
    Name = "Dino Kid",
    Callback = function()
        local success, error = pcall(kid1_loc)

        if not success then
            Rayfield:Notify({
                Title = "Notification",
                Content = "Child not located",
                Duration = 10,
                Image = 4483362458,
            })

            print(error)
        end
    end,
})

local function kid2_loc()
    local kid_2_found = false
    if workspace.Characters:FindFirstChild("Lost Child2") then
            
        --local distance1kid = (workspace.Characters["Lost Child2"].Head.CFrame.Position - workspace.Map.Campground.Scrapper:GetChildren()[8].Position).Magnitude

        HRP.CFrame = CFrame.new(workspace.Characters["Lost Child2"].Head.CFrame.Position + Vector3.new(0,4,0))

    else

        for _, v in pairs(missing_kids_folder_loc) do

            if _ == "SquidKid" then
                HRP.CFrame = CFrame.new(v) * CFrame.new(0,-14,0)
            end

        end
    end
end

local Kid2Button = MoveTab:CreateButton({
    Name = "Squid Kid",
    Callback = function()
        local success, error = pcall(kid2_loc)

        if not success then
            Rayfield:Notify({
                Title = "Notification",
                Content = "Child not located, explore the map more",
                Duration = 10,
                Image = 4483362458,
            })

            print(error)
        end
    end,
})

local function kid3_loc()
    local kid_3_found = false
    if workspace.Characters:FindFirstChild("Lost Child3") then
            
        --local distance1kid = (workspace.Characters["Lost Child3"].Head.CFrame.Position - workspace.Map.Campground.Scrapper:GetChildren()[8].Position).Magnitude
        HRP.CFrame = CFrame.new(workspace.Characters["Lost Child3"].Head.CFrame.Position + Vector3.new(0,4,0))

    else

        for _, v in pairs(missing_kids_folder_loc) do

            if _ == "KrakenKid" then
                HRP.CFrame = CFrame.new(v) * CFrame.new(0,-16,0)
            end

        end
    end
end

local Kid3Button = MoveTab:CreateButton({
    Name = "Kraken Kid",
    Callback = function()
        local success, error = pcall(kid3_loc)

        if not success then
            Rayfield:Notify({
                Title = "Notification",
                Content = "Child not located, explore the map more",
                Duration = 10,
                Image = 4483362458,
            })
        end 
    end,
})

local function kid4_loc()
    local kid_4_found = false
    if workspace.Characters:FindFirstChild("Lost Child4") then
            
        --local distance1kid = (workspace.Characters["Lost Child4"].Head.CFrame.Position - workspace.Map.Campground.Scrapper:GetChildren()[8].Position).Magnitude
        HRP.CFrame = CFrame.new(workspace.Characters["Lost Child4"].Head.CFrame.Position + Vector3.new(0,4,0))

    else

        for _, v in pairs(missing_kids_folder_loc) do

            if _ == "KoalaKid" then
                HRP.CFrame = CFrame.new(v) * CFrame.new(0,-15,0)
            end

        end
    end
end

local Kid4Button = MoveTab:CreateButton({
    Name = "Koala Kid",
    Callback = function()
        local success, error = pcall(kid4_loc)

        if not success then
            Rayfield:Notify({
                Title = "Notification",
                Content = "Child not located, explore the map more",
                Duration = 10,
                Image = 4483362458,
            })
        end    

    end,
})


--// Trees tab create

local chopToggle = TreeTab:CreateToggle({
    Name = "Tree Chop Aura",
    CurrentValue = false,
    Flag = "treeToggle1", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        chop_trees_flag = Value

        if chop_trees_flag then
            Rayfield:Notify({
                Title = "Notification",
                Content = "Tree Chop Aura enabled",
                Duration = 8,
                Image = 4483362458,
            })
        end

        while chop_trees_flag do
            local includeparams = OverlapParams.new()
            local excludeparams = OverlapParams.new()
            includeparams.FilterType = Enum.RaycastFilterType.Include
            includeparams.FilterDescendantsInstances = {workspace.Map.Foliage}
            excludeparams.FilterType = Enum.RaycastFilterType.Exclude
            excludeparams.FilterDescendantsInstances = {NPC_enemies}
            local worldrootradiustrees = workspace:GetPartBoundsInBox(HRP.CFrame, Vector3.new(200,60,200), includeparams, excludeparams)

            for _, foliage in pairs(worldrootradiustrees) do
                --print(foliage)
                if foliage.Name == "Trunk" then
                    --print(foliage.Name)
                    
                    if not foliage.Parent then break end

                        for _, tool in pairs(game:GetService("Players").LocalPlayer.Inventory:GetChildren()) do

                            if string.find(tool.Name, "Old Axe") then

                                local args = {
                                    foliage.Parent,
                                    game.Players.LocalPlayer.Inventory:WaitForChild("Old Axe"),
                                    damage_hash,
                                    CFrame.new(foliage.Parent:GetPivot().Position + Vector3.new(-5,-3,-6))
                                }
                                game.ReplicatedStorage.RemoteEvents.ToolDamageObject:InvokeServer(unpack(args))

                            elseif string.find(tool.Name, "Good Axe") then


                                local args = {
                                    foliage.Parent,
                                    game.Players.LocalPlayer.Inventory:WaitForChild("Good Axe"),
                                    damage_hash,
                                    CFrame.new(foliage.Parent:GetPivot().Position + Vector3.new(-5,-3,-6))
                                }
                                game.ReplicatedStorage.RemoteEvents.ToolDamageObject:InvokeServer(unpack(args))    

                            elseif string.find(tool.Name, "Strong Axe") then


                                local args = {
                                    foliage.Parent,
                                    game.Players.LocalPlayer.Inventory:WaitForChild("Strong Axe"),
                                    damage_hash,
                                    CFrame.new(foliage.Parent:GetPivot().Position + Vector3.new(-5,-3,-6))
                                }
                                game.ReplicatedStorage.RemoteEvents.ToolDamageObject:InvokeServer(unpack(args))

                            elseif string.find(tool.Name, "Chainsaw") then


                                local args = {
                                    foliage.Parent,
                                    game.Players.LocalPlayer.Inventory:WaitForChild("Chainsaw"),
                                    damage_hash,
                                    CFrame.new(foliage.Parent:GetPivot().Position + Vector3.new(-5,-3,-6))
                                }
                                game.ReplicatedStorage.RemoteEvents.ToolDamageObject:InvokeServer(unpack(args))
                            else
                                continue
                            end
                        end
                end

                

            end
            task.wait()

        end

    end,
})
local cuttingLabel = TreeTab:CreateLabel("Hold Strong Axe / Chainsaw for quicker results", "axe")

local saplingsection = TreeTab:CreateSection("Plant Saplings:")
local saplingindex
local treeplaceDropdown = TreeTab:CreateDropdown({
    Name = "Plant Location:",
    Options = {"Surround Base", "At Feet"},
    CurrentOption = Options,
    MultipleOptions = false,
    Flag = "Dropdown1", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Options)
        saplingindex = Options[1]
    end,
})

local UNIVERSAL_VECTOR = Vector3.new(0, 0.5, 0)
local radius = 130

local test_number = 0

local function plantSappscircle()
    for i = 0, 300, 1 do

        local angle = i * (math.pi * 2) / 300
        local x = UNIVERSAL_VECTOR.X + radius * math.cos(angle)
        local z = UNIVERSAL_VECTOR.Z + radius * math.sin(angle)

        local args = {
            workspace.Items:FindFirstChild("Sapling") or workspace.Items:FindFirstChild("Brightwood Sapling"),
            vector.create(x, UNIVERSAL_VECTOR.Y, z)
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestPlantItem"):InvokeServer(unpack(args))
        --print("planted")
        test_number = test_number + 1
        --print("test num: "..tostring(test_number))
    end
    task.wait(0.133)
    print("done / 300")
end

-- local plant_feet_cord = Vector3.new(HRP.CFrame.Position.X, 0.45, HRP.CFrame.Position.Z)

local function plantSappsFeet()

    for i = 0, 300, 1 do

        local args = {
            workspace.Items:FindFirstChild("Sapling") or workspace.Items:FindFirstChild("Brightwood Sapling"),
            vector.create(HRP.CFrame.Position.X, 0.45, HRP.CFrame.Position.Z)
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestPlantItem"):InvokeServer(unpack(args))

    end
    task.wait(0.133)
    print("done / 300")
end

local plantSurroundButton = TreeTab:CreateButton({
    Name = "Plant Saplings",
    Callback = function()
        if saplingindex == "Surround Base" then
            local success, error = pcall(plantSappscircle)

            if error then
                Rayfield:Notify({
                    Title = "Notification",
                    Content = "No Saplings detected",
                    Duration = 8,
                    Image = 4483362458,
                })
            print(error)
            end

        elseif saplingindex == "At Feet" then
            local success, error = pcall(plantSappsFeet)

            if error then
                Rayfield:Notify({
                    Title = "Notification",
                    Content = "No Saplings detected",
                    Duration = 8,
                    Image = 4483362458,
                })
            print(error)
            end


        end
    end,
})

local saplingsLabel = TreeTab:CreateLabel("Plants all Saplings - up to 300", "sprout")


--// Bring Items Tab create
local selectbringsection = BringTab:CreateSection("Choose Location:")

local bring_to_loc_table = {"Player", "Scrapper", "Fire"}
local bring_index
local locationDropdown = BringTab:CreateDropdown({
    Name = "Bring to:",
    Options = bring_to_loc_table,
    CurrentOption = Options,
    MultipleOptions = false,
    Flag = "Dropdown1", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Options)
        
        bring_index = Options[1]

    end,
})

local describe2section = BringTab:CreateSection("Resources:")

local fuel_100_Button = BringTab:CreateButton({
    Name = "Bring 100 Fuel",
    Callback = function()
        if bring_index == "Player" then
            for _, fuel_item in pairs(workspace.Items:GetChildren()) do
                for i=1, 101, 1 do
                    if fuel_item.Name == "Coal" or fuel_item.Name == "Fuel Canister" or fuel_item.Name == "Oil Barrel" or fuel_item.Name == "Biofuel" then
                        local args = {
	                        fuel_item
                        }
                        game:GetService("ReplicatedStorage").RemoteEvents.RequestStartDraggingItem:FireServer(unpack(args))

                        local args = {
	                        fuel_item
                        }
                        game:GetService("ReplicatedStorage").RemoteEvents.StopDraggingItem:FireServer(unpack(args))

                        fuel_item:PivotTo(my_head.CFrame * CFrame.new(0, 10, 0))
                    end
                    
                end
            end
            task.wait()

        elseif bring_index == "Scrapper" then
            for _, fuel_item in pairs(workspace.Items:GetChildren()) do
                for i=1, 101, 1 do
                    if fuel_item.Name == "Coal" or fuel_item.Name == "Fuel Canister" or fuel_item.Name == "Oil Barrel" or fuel_item.Name == "Biofuel" then
                        local args = {
	                        fuel_item
                        }
                        game:GetService("ReplicatedStorage").RemoteEvents.RequestStartDraggingItem:FireServer(unpack(args))

                        local args = {
	                        fuel_item
                        }
                        game:GetService("ReplicatedStorage").RemoteEvents.StopDraggingItem:FireServer(unpack(args))

                        fuel_item:PivotTo(workbench_loc.CFrame * CFrame.new(0, 20, 0))
                    end
                    
                end
            end
            task.wait()
        
        elseif bring_index == "Fire" then
            for _, fuel_item in pairs(workspace.Items:GetChildren()) do
                for i=1, 101, 1 do
                    if fuel_item.Name == "Coal" or fuel_item.Name == "Fuel Canister" or fuel_item.Name == "Oil Barrel" or fuel_item.Name == "Biofuel" then
                        local args = {
	                        fuel_item
                        }
                        game:GetService("ReplicatedStorage").RemoteEvents.RequestStartDraggingItem:FireServer(unpack(args))

                        local args = {
	                        fuel_item
                        }
                        game:GetService("ReplicatedStorage").RemoteEvents.StopDraggingItem:FireServer(unpack(args))

                        fuel_item:PivotTo(FIREZONE.CFrame * CFrame.new(0, 20, 0))
                    end
                end
            end
            task.wait()
        end
    end,
})

local allLogsButton = BringTab:CreateButton({   --// CRASH AREA BELOW
    Name = "Bring All Logs",
    Callback = function()
        if bring_index == "Player" then
            for _, fuel_item in pairs(workspace.Items:GetChildren()) do
                for i=1, 101, 1 do
                    if fuel_item.Name == "Log" or fuel_item.Name == "Chair" then
                        local args = {
	                        fuel_item
                        }
                        game:GetService("ReplicatedStorage").RemoteEvents.RequestStartDraggingItem:FireServer(unpack(args))

                        local args = {
	                        fuel_item
                        }
                        game:GetService("ReplicatedStorage").RemoteEvents.StopDraggingItem:FireServer(unpack(args))

                        fuel_item:PivotTo(my_head.CFrame * CFrame.new(0, 10, 0))
                    end
                    
                end
            end
            task.wait()
        elseif bring_index == "Scrapper" then
            for _, logg in pairs(workspace.Items:GetChildren()) do

                if logg.Name == "Log" or logg.Name == "Chair" then
                    local args = {
                        logg
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestStartDraggingItem"):FireServer(unpack(args))

                    local args = {
                        logg
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("StopDraggingItem"):FireServer(unpack(args))

                    logg:PivotTo(workbench_loc.CFrame * CFrame.new(0, 20, 0))
                end 
            end
            task.wait()
        elseif bring_index == "Fire" then
            for _, logg in pairs(workspace.Items:GetChildren()) do

                if logg.Name == "Log" or logg.Name == "Chair" then
                    local args = {
                        logg
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestStartDraggingItem"):FireServer(unpack(args))

                    local args = {
                        logg
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("StopDraggingItem"):FireServer(unpack(args))

                    logg:PivotTo(FIREZONE.CFrame * CFrame.new(0, 20, 0))
                end 
            end
            task.wait()
        end
    end,
})

local allGearsButton = BringTab:CreateButton({
    Name = "Bring All Scrap",
    Callback = function()
        if bring_index == "Player" then
            for _, gear_item in pairs(workspace.Items:GetChildren()) do

                if gear_item.Name == "Broken Fan" or gear_item.Name == "Broken Microwave" or gear_item.Name == "Old Car Engine" or gear_item.Name == "Old Radio" or gear_item.Name == "Tyre" or gear_item.Name == "Sheet Metal" or gear_item.Name == "Washing Machine" then
                    local args = {
                        gear_item
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestStartDraggingItem"):FireServer(unpack(args))

                    local args = {
                        gear_item
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("StopDraggingItem"):FireServer(unpack(args))

                    gear_item:PivotTo(my_head.CFrame * CFrame.new(0, 10, 0))
                end   
            end
            task.wait()

        elseif bring_index == "Scrapper" then
            for _, gear_item in pairs(workspace.Items:GetChildren()) do

                if gear_item.Name == "Broken Fan" or gear_item.Name == "Broken Microwave" or gear_item.Name == "Old Car Engine" or gear_item.Name == "Old Radio" or gear_item.Name == "Sheet Metal" or gear_item.Name == "Tyre" or gear_item.Name == "Washing Machine" then
                    local args = {
                        gear_item
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestStartDraggingItem"):FireServer(unpack(args))

                    local args = {
                        gear_item
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("StopDraggingItem"):FireServer(unpack(args))

                    gear_item:PivotTo(workbench_loc.CFrame * CFrame.new(0, 20, 0))
                end 
            end
            task.wait()
        elseif bring_index == "Fire" then
            for _, gear_item in pairs(workspace.Items:GetChildren()) do

                if gear_item.Name == "Broken Fan" or gear_item.Name == "Broken Microwave" or gear_item.Name == "Old Car Engine" or gear_item.Name == "Old Radio" or gear_item.Name == "Sheet Metal" or gear_item.Name == "Tyre" or gear_item.Name == "Washing Machine" then
                    local args = {
                        gear_item
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestStartDraggingItem"):FireServer(unpack(args))

                    local args = {
                        gear_item
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("StopDraggingItem"):FireServer(unpack(args))

                    gear_item:PivotTo(FIREZONE.CFrame * CFrame.new(0, 20, 0))
                end  
            end
            task.wait()
        end
    end,
})

local mainsectionheal = BringTab:CreateSection("Healing:")

local healButton = BringTab:CreateButton({
    Name = "Bring ALL Meds",
    Callback = function()
        if bring_index == "Player" then
            for _, med_item in pairs(workspace.Items:GetChildren()) do

                if med_item.Name == "Bandage" or med_item.Name == "MedKit" then
                    local args = {
                        med_item
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestStartDraggingItem"):FireServer(unpack(args))

                    local args = {
                        med_item
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("StopDraggingItem"):FireServer(unpack(args))

                    med_item:PivotTo(my_head.CFrame * CFrame.new(0, 10, 0))
                end   
            end
            task.wait()

        elseif bring_index == "Scrapper" then
            for _, med_item in pairs(workspace.Items:GetChildren()) do

                if med_item.Name == "Bandage" or med_item.Name == "MedKit" then
                    local args = {
                        med_item
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestStartDraggingItem"):FireServer(unpack(args))

                    local args = {
                        med_item
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("StopDraggingItem"):FireServer(unpack(args))

                    med_item:PivotTo(workbench_loc.CFrame * CFrame.new(0, 10, 0))
                end   
            end
            task.wait()
        elseif bring_index == "Fire" then
            for _, med_item in pairs(workspace.Items:GetChildren()) do

                if med_item.Name == "Bandage" or med_item.Name == "MedKit" then
                    local args = {
                        med_item
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestStartDraggingItem"):FireServer(unpack(args))

                    local args = {
                        med_item
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("StopDraggingItem"):FireServer(unpack(args))

                    med_item:PivotTo(FIREZONE.CFrame * CFrame.new(0, 10, 0))
                end   
            end
            task.wait()
        end
    end,
})

local mainsection2 = BringTab:CreateSection("Cultist Gems:")

local CGButton = BringTab:CreateButton({
    Name = "Bring All Cultist Gems to Workbench",
    Callback = function() 
    
        for _, c_gem in pairs(workspace.Items:GetChildren()) do

            if c_gem:IsA("Model") and string.find(c_gem.Name, "Cultist Gem") then

                local args = {
	                c_gem
                }
                game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestStartDraggingItem"):FireServer(unpack(args))

                local args = {
	                c_gem
                }
                game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("StopDraggingItem"):FireServer(unpack(args))

                c_gem:PivotTo(workbench_loc.CFrame * CFrame.new(0, 5, -2))

                task.wait(0.255)

            end

        end
    
    end,
})

local c_gemToggle = BringTab:CreateToggle({
    Name = "[Auto] Bring Cultist Gems",
    CurrentValue = false,
    Flag = "cgemToggle1", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        auto_cgem_flag = Value
        if auto_cgem_flag then
            Rayfield:Notify({
                Title = "Notification",
                Content = "[Auto] Bring Cultist Gems enabled",
                Duration = 6.5,
                Image = 4483362458,
            })
        end


        while auto_cgem_flag do

            for _, c_gem in pairs(workspace.Items:GetChildren()) do

                if c_gem:IsA("Model") and string.find(c_gem.Name, "Cultist Gem") then

                    local args = {
	                    c_gem
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestStartDraggingItem"):FireServer(unpack(args))

                    local args = {
	                    c_gem
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("StopDraggingItem"):FireServer(unpack(args))

                    c_gem:PivotTo(workbench_loc.CFrame * CFrame.new(0, 5, -2))
                    task.wait()
                    task.wait(0.255)
                
                end

            end
            task.wait(2.011)

        end


    end,
})

local Label = BringTab:CreateLabel("Produce Cultist Gems automatically to the Workbench")
local Label = BringTab:CreateLabel("every 2 seconds")

local mainsection3 = BringTab:CreateSection("Gem of the Forest Fragments:")

local FFButton = BringTab:CreateButton({
    Name = "Bring All Forest Fragments",
    Callback = function() 
        if bring_index == "Player" then
    
            for _, FF_gem in pairs(workspace.Items:GetChildren()) do

                if FF_gem:IsA("Model") and string.find(FF_gem.Name, "Gem of the Forest Fragment") then

                    local args = {
	                    FF_gem
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestStartDraggingItem"):FireServer(unpack(args))

                    local args = {
	                    FF_gem
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("StopDraggingItem"):FireServer(unpack(args))

                    FF_gem:PivotTo(my_head.CFrame * CFrame.new(0, 6, -2))

                    task.wait(0.2)

                end

            end
        elseif bring_index == "Scrapper" then
            for _, FF_gem in pairs(workspace.Items:GetChildren()) do

                if FF_gem:IsA("Model") and string.find(FF_gem.Name, "Gem of the Forest Fragment") then

                    local args = {
	                    FF_gem
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestStartDraggingItem"):FireServer(unpack(args))

                    local args = {
	                    FF_gem
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("StopDraggingItem"):FireServer(unpack(args))

                    FF_gem:PivotTo(workbench_loc.CFrame * CFrame.new(0, 6, -2))

                    task.wait(0.2)

                end

            end
        elseif bring_index == "Fire" then
            for _, FF_gem in pairs(workspace.Items:GetChildren()) do

                if FF_gem:IsA("Model") and string.find(FF_gem.Name, "Gem of the Forest Fragment") then

                    local args = {
	                    FF_gem
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestStartDraggingItem"):FireServer(unpack(args))

                    local args = {
	                    FF_gem
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("StopDraggingItem"):FireServer(unpack(args))

                    FF_gem:PivotTo(FIREZONE.CFrame * CFrame.new(0, 6, -2))

                    task.wait(0.2)

                end

            end
        end
    end,
})

local mainsectionweapontools = BringTab:CreateSection("Weapons/Tools:")

local highendweaponsButton = BringTab:CreateButton({
    Name = "Bring Weapons/Tools",
    Callback = function()
        if bring_index == "Player" then
            for _, w_tool in pairs(workspace.Items:GetChildren()) do

                if w_tool.Name == "Giant Sack" or w_tool.Name == "Strong Axe" or w_tool.Name == "Rifle" or w_tool.Name == "Revolver" or w_tool.Name == "Strong Flashlight" or w_tool.Name == "Old Rod" or w_tool.Name == "Spear" or w_tool.Name == "Tactical Shotgun" or w_tool.Name == "Morningstar" then
                    local args = {
                        w_tool
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestStartDraggingItem"):FireServer(unpack(args))

                    local args = {
                        w_tool
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("StopDraggingItem"):FireServer(unpack(args))

                    w_tool:PivotTo(my_head.CFrame * CFrame.new(0, 10, 0))
                end
            end
            task.wait()
        elseif bring_index == "Scrapper" then
            for _, w_tool in pairs(workspace.Items:GetChildren()) do

                if w_tool.Name == "Giant Sack" or w_tool.Name == "Strong Axe" or w_tool.Name == "Rifle" or w_tool.Name == "Revolver" or w_tool.Name == "Strong Flashlight" or w_tool.Name == "Old Rod" or w_tool.Name == "Spear" or w_tool.Name == "Tactical Shotgun" or w_tool.Name == "Morningstar" then
                    local args = {
                        w_tool
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestStartDraggingItem"):FireServer(unpack(args))

                    local args = {
                        w_tool
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("StopDraggingItem"):FireServer(unpack(args))

                    w_tool:PivotTo(workbench_loc.CFrame * CFrame.new(0, 10, 0))
                end
            end
            task.wait() 
        elseif bring_index == "Fire" then
            for _, w_tool in pairs(workspace.Items:GetChildren()) do

                if w_tool.Name == "Giant Sack" or w_tool.Name == "Strong Axe" or w_tool.Name == "Rifle" or w_tool.Name == "Revolver" or w_tool.Name == "Strong Flashlight" or w_tool.Name == "Old Rod" or w_tool.Name == "Spear" or w_tool.Name == "Tactical Shotgun" or w_tool.Name == "Morningstar" then
                    local args = {
                        w_tool
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestStartDraggingItem"):FireServer(unpack(args))

                    local args = {
                        w_tool
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("StopDraggingItem"):FireServer(unpack(args))

                    w_tool:PivotTo(FIREZONE.CFrame * CFrame.new(0, 10, 0))
                end
            end
            task.wait()  
        end  
    end,
})

local mainsectionAMMO = BringTab:CreateSection("Ammo:")

local highendammoButton = BringTab:CreateButton({
    Name = "Bring Ammo",
    Callback = function()
        if bring_index == "Player" then
            for _, w_ammo in pairs(workspace.Items:GetChildren()) do

                if w_ammo.Name == "Rifle Ammo" or w_ammo.Name == "Revolver Ammo" then
                    local args = {
                        w_ammo
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestStartDraggingItem"):FireServer(unpack(args))

                    local args = {
                        w_ammo
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("StopDraggingItem"):FireServer(unpack(args))

                    w_ammo:PivotTo(my_head.CFrame * CFrame.new(0, 10, 0))
                end
            end
            task.wait()
        elseif bring_index == "Scrapper" then
            for _, w_ammo in pairs(workspace.Items:GetChildren()) do

                if w_ammo.Name == "Rifle Ammo" or w_ammo.Name == "Revolver Ammo" then
                    local args = {
                        w_ammo
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestStartDraggingItem"):FireServer(unpack(args))

                    local args = {
                        w_ammo
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("StopDraggingItem"):FireServer(unpack(args))

                    w_ammo:PivotTo(workbench_loc.CFrame * CFrame.new(0, 10, 0))
                end
            end
            task.wait()
        elseif bring_index == "Fire" then
            for _, w_ammo in pairs(workspace.Items:GetChildren()) do

                if w_ammo.Name == "Rifle Ammo" or w_ammo.Name == "Revolver Ammo" then
                    local args = {
                        w_ammo
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestStartDraggingItem"):FireServer(unpack(args))

                    local args = {
                        w_ammo
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("StopDraggingItem"):FireServer(unpack(args))

                    w_ammo:PivotTo(FIREZONE.CFrame * CFrame.new(0, 10, 0))
                end
            end
            task.wait()
        end
    end,
})

local mainsectionfood = BringTab:CreateSection("Pelts:")

local highendammoButton = BringTab:CreateButton({
    Name = "Bring Animal Pelts",
    Callback = function()
        if bring_index == "Player" then
            for _, pelt1 in pairs(workspace.Items:GetChildren()) do

                if pelt1.Name == "Bunny Foot" or pelt1.Name == "Wolf Pelt" or pelt1.Name == "Alpha Wolf Pelt" or pelt1.Name == "Bear Pelt" then
                    local args = {
                        pelt1
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestStartDraggingItem"):FireServer(unpack(args))

                    local args = {
                        pelt1
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("StopDraggingItem"):FireServer(unpack(args))

                    pelt1:PivotTo(my_head.CFrame * CFrame.new(0, 10, 0))
                end
            end
            task.wait()
        elseif bring_index == "Scrapper" then
            for _, pelt1 in pairs(workspace.Items:GetChildren()) do

                if pelt1.Name == "Bunny Foot" or pelt1.Name == "Wolf Pelt" or pelt1.Name == "Alpha Wolf Pelt" or pelt1.Name == "Bear Pelt" then
                    local args = {
                        pelt1
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestStartDraggingItem"):FireServer(unpack(args))

                    local args = {
                        pelt1
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("StopDraggingItem"):FireServer(unpack(args))

                    pelt1:PivotTo(workbench_loc.CFrame * CFrame.new(0, 10, 0))
                end
            end
            task.wait()
        elseif bring_index == "Fire" then
            for _, pelt1 in pairs(workspace.Items:GetChildren()) do

                if pelt1.Name == "Bunny Foot" or pelt1.Name == "Wolf Pelt" or pelt1.Name == "Alpha Wolf Pelt" or pelt1.Name == "Bear Pelt" then
                    local args = {
                        pelt1
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestStartDraggingItem"):FireServer(unpack(args))

                    local args = {
                        pelt1
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("StopDraggingItem"):FireServer(unpack(args))

                    pelt1:PivotTo(FIREZONE.CFrame * CFrame.new(0, 10, 0))
                end
            end
            task.wait()
        end
    end,
})

local mainsectionfood = BringTab:CreateSection("Food:")

local meatsncakeButton = BringTab:CreateButton({
    Name = "Bring Meats & Cake",
    Callback = function()
        if bring_index == "Player" then
            for _, food_item in pairs(workspace.Items:GetChildren()) do

                if food_item.Name == "Steak" or food_item.Name == "Morsel" or food_item.Name == "Cake" then
                    local args = {
                        food_item
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestStartDraggingItem"):FireServer(unpack(args))

                    local args = {
                        food_item
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("StopDraggingItem"):FireServer(unpack(args))

                    food_item:PivotTo(my_head.CFrame * CFrame.new(0, 10, 0))
                end   
            end
            task.wait()

        elseif bring_index == "Scrapper" then
            for _, food_item in pairs(workspace.Items:GetChildren()) do

                if food_item.Name == "Steak" or food_item.Name == "Morsel" or food_item.Name == "Cake" then
                    local args = {
                        food_item
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestStartDraggingItem"):FireServer(unpack(args))

                    local args = {
                        food_item
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("StopDraggingItem"):FireServer(unpack(args))

                    food_item:PivotTo(workbench_loc.CFrame * CFrame.new(0, 10, 0))
                end   
            end
            task.wait()
        elseif bring_index == "Fire" then
            for _, food_item in pairs(workspace.Items:GetChildren()) do

                if food_item.Name == "Steak" or food_item.Name == "Morsel" or food_item.Name == "Cake" then
                    local args = {
                        food_item
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestStartDraggingItem"):FireServer(unpack(args))

                    local args = {
                        food_item
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("StopDraggingItem"):FireServer(unpack(args))

                    food_item:PivotTo(FIREZONE.CFrame * CFrame.new(0, 10, 0))
                end   
            end
            task.wait()
        end
    end,
})

--// Chest Tab create

local Section1chests = ChestTab:CreateSection("Chest Type / Location:")

local function returnItemChest1()
    local chest1s = {}
    for _, Chest in pairs(workspace.Items:GetChildren()) do

        if Chest.Name == "Item Chest" then

            for _, m in pairs(Chest:GetChildren()) do

                if m:IsA("Part") and m.Name == "Main" then
                    local chest1loc = m.CFrame.Position
                    print("found ch1")
                    if not table.find(chest1s, tostring(chest1loc)) then
                        table.insert(chest1s, tostring(chest1loc))
                    end
                else
                    continue
                end

            end

        end

    end
    return chest1s
end
local chest1selected = nil
local chest1Dropdown = ChestTab:CreateDropdown({
    Name = "Chest 1 - Common",
    Options = returnItemChest1(),
    CurrentOption = Options,
    MultipleOptions = false,
    Flag = "Dropdown1", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Options)

        chest1selected = Options[1]


    end,
})

local function chest1cframe(split)
    local split = string.split(chest1selected, ",")
    return Vector3.new(split[1],split[2],split[3])
end

local gochest1Button = ChestTab:CreateButton({
    Name = "[1] Go",
    Callback = function()
        
        HRP.CFrame = CFrame.new(chest1cframe(chest1selected) + Vector3.new(0,5,0))
    end,
})
-- 
local function returnItemChest2()
    local chest2s = {}
    for _, Chest in pairs(workspace.Items:GetChildren()) do

        if Chest.Name == "Item Chest2" then

            for _, m in pairs(Chest:GetChildren()) do

                if m:IsA("Part") and m.Name == "Main" then
                    local chest2loc = m.CFrame.Position
                    print("found ch2")
                    if not table.find(chest2s, tostring(chest2loc)) then
                        table.insert(chest2s, tostring(chest2loc))
                    end
                else
                    continue
                end

            end

        end

    end
    return chest2s
end
local chest2selected = nil
local chest2Dropdown = ChestTab:CreateDropdown({
    Name = "Chest 2 - Uncommon",
    Options = returnItemChest2(),
    CurrentOption = Options,
    MultipleOptions = false,
    Flag = "Dropdown2", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Options)

        chest2selected = Options[1]


    end,
})

local function chest2cframe(split)
    local split = string.split(chest2selected, ",")
    return Vector3.new(split[1],split[2],split[3])
end

local gochest2Button = ChestTab:CreateButton({
    Name = "[2] Go",
    Callback = function()
        
        HRP.CFrame = CFrame.new(chest2cframe(chest2selected) + Vector3.new(0,5,0))
    end,
})
-- 
local function returnItemChest3()
    local chest3s = {}
    for _, Chest in pairs(workspace.Items:GetChildren()) do

        if Chest.Name == "Item Chest3" then

            for _, m in pairs(Chest:GetChildren()) do

                if m:IsA("Part") and m.Name == "Main" then
                    local chest3loc = m.CFrame.Position
                    print("found ch3")
                    if not table.find(chest3s, tostring(chest3loc)) then
                        table.insert(chest3s, tostring(chest3loc))
                    end
                else
                    continue
                end

            end

        end

    end
    return chest3s
end
local chest3selected = nil
local chest3Dropdown = ChestTab:CreateDropdown({
    Name = "Chest 3 - Rare",
    Options = returnItemChest3(),
    CurrentOption = Options,
    MultipleOptions = false,
    Flag = "Dropdown2", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Options)

        chest3selected = Options[1]


    end,
})

local function chest3cframe(split)
    local split = string.split(chest3selected, ",")
    return Vector3.new(split[1],split[2],split[3])
end

local gochest3Button = ChestTab:CreateButton({
    Name = "[3] Go",
    Callback = function()
        
        HRP.CFrame = CFrame.new(chest3cframe(chest3selected) + Vector3.new(0,5,0))
    end,
})
-- 
local function returnItemChest4()
    local chest4s = {}
    for _, Chest in pairs(workspace.Items:GetChildren()) do

        if Chest.Name == "Item Chest4" then

            for _, m in pairs(Chest:GetChildren()) do

                if m:IsA("Part") and m.Name == "Main" then
                    local chest4loc = m.CFrame.Position
                    print("found ch4")
                    if not table.find(chest4s, tostring(chest4loc)) then
                        table.insert(chest4s, tostring(chest4loc))
                    end
                else
                    continue
                end

            end

        end

    end
    return chest4s
end
local chest4selected = nil
local chest4Dropdown = ChestTab:CreateDropdown({
    Name = "Chest 4 - Gold I",
    Options = returnItemChest4(),
    CurrentOption = Options,
    MultipleOptions = false,
    Flag = "Dropdown2", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Options)

        chest4selected = Options[1]


    end,
})

local function chest4cframe(split)
    local split = string.split(chest4selected, ",")
    return Vector3.new(split[1],split[2],split[3])
end

local gochest4Button = ChestTab:CreateButton({
    Name = "[4] Go",
    Callback = function()
        
        HRP.CFrame = CFrame.new(chest4cframe(chest4selected) + Vector3.new(0,5,0))
    end,
})
-- 
local function returnItemChest5()
    local chest5s = {}
    for _, Chest in pairs(workspace.Items:GetChildren()) do

        if Chest.Name == "Item Chest5" then

            for _, m in pairs(Chest:GetChildren()) do

                if m:IsA("Part") and m.Name == "Main" then
                    local chest5loc = m.CFrame.Position
                    print("found ch5")
                    if not table.find(chest5s, tostring(chest5loc)) then
                        table.insert(chest5s, tostring(chest5loc))
                    end
                else
                    continue
                end

            end

        end

    end
    return chest5s
end
local chest5selected = nil
local chest5Dropdown = ChestTab:CreateDropdown({
    Name = "Chest 5 - Gold II",
    Options = returnItemChest5(),
    CurrentOption = Options,
    MultipleOptions = false,
    Flag = "Dropdown2", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Options)

        chest5selected = Options[1]


    end,
})

local function chest5cframe(split)
    local split = string.split(chest5selected, ",")
    return Vector3.new(split[1],split[2],split[3])
end

local gochest5Button = ChestTab:CreateButton({
    Name = "[5] Go",
    Callback = function()
        
        HRP.CFrame = CFrame.new(chest5cframe(chest5selected) + Vector3.new(0,5,0))
    end,
})
-- 
local function returnItemChest6()
    local chest6s = {}
    for _, Chest in pairs(workspace.Items:GetChildren()) do

        if Chest.Name == "Item Chest6" then

            for _, m in pairs(Chest:GetChildren()) do

                if m:IsA("Part") and m.Name == "Main" then
                    local chest6loc = m.CFrame.Position
                    print("found ch6")
                    if not table.find(chest6s, tostring(chest6loc)) then
                        table.insert(chest6s, tostring(chest6loc))
                    end
                else
                    continue
                end

            end

        end

    end
    return chest6s
end
local chest6selected = nil
local chest6Dropdown = ChestTab:CreateDropdown({
    Name = "Chest 6 - RUBY RED",
    Options = returnItemChest6(),
    CurrentOption = Options,
    MultipleOptions = false,
    Flag = "Dropdown2", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Options)

        chest6selected = Options[1]


    end,
})

local function chest6cframe(split)
    local split = string.split(chest6selected, ",")
    return Vector3.new(split[1],split[2],split[3])
end

local gochest6Button = ChestTab:CreateButton({
    Name = "[6] Go",
    Callback = function()
        
        HRP.CFrame = CFrame.new(chest6cframe(chest6selected) + Vector3.new(0,5,0))
    end,
})


local bottomchestsDivider = ChestTab:CreateDivider()
local refreshChestsButton = ChestTab:CreateButton({
    Name = "Refresh Chests",
    Callback = function()
        local chest1s = {}
        for _, Chest in pairs(workspace.Items:GetChildren()) do

            if Chest.Name == "Item Chest" then

                for _, m in pairs(Chest:GetChildren()) do

                    if m:IsA("Part") and m.Name == "Main" then
                        local chest1loc = m.CFrame.Position
                        print("found ch1")
                        if not table.find(chest1s, tostring(chest1loc)) then
                            table.insert(chest1s, tostring(chest1loc))
                        end
                    else
                        continue
                    end

                end

            end

        end
        local chest2s = {}
        for _, Chest in pairs(workspace.Items:GetChildren()) do

            if Chest.Name == "Item Chest2" then

                for _, m in pairs(Chest:GetChildren()) do

                    if m:IsA("Part") and m.Name == "Main" then
                        local chest2loc = m.CFrame.Position
                        print("found ch2")
                        if not table.find(chest2s, tostring(chest2loc)) then
                            table.insert(chest2s, tostring(chest2loc))
                        end
                    else
                        continue
                    end

                end

            end

        end
        local chest3s = {}
        for _, Chest in pairs(workspace.Items:GetChildren()) do

            if Chest.Name == "Item Chest3" then

                for _, m in pairs(Chest:GetChildren()) do

                    if m:IsA("Part") and m.Name == "Main" then
                        local chest3loc = m.CFrame.Position
                        print("found ch3")
                        if not table.find(chest3s, tostring(chest3loc)) then
                            table.insert(chest3s, tostring(chest3loc))
                        end
                    else
                        continue
                    end

                end

            end

        end
        local chest4s = {}
        for _, Chest in pairs(workspace.Items:GetChildren()) do

            if Chest.Name == "Item Chest4" then

                for _, m in pairs(Chest:GetChildren()) do

                    if m:IsA("Part") and m.Name == "Main" then
                        local chest4loc = m.CFrame.Position
                        print("found ch4")
                        if not table.find(chest4s, tostring(chest4loc)) then
                            table.insert(chest4s, tostring(chest4loc))
                        end
                    else
                        continue
                    end

                end

            end

        end
        local chest5s = {}
        for _, Chest in pairs(workspace.Items:GetChildren()) do

            if Chest.Name == "Item Chest5" then

                for _, m in pairs(Chest:GetChildren()) do

                    if m:IsA("Part") and m.Name == "Main" then
                        local chest5loc = m.CFrame.Position
                        print("found ch5")
                        if not table.find(chest5s, tostring(chest5loc)) then
                            table.insert(chest5s, tostring(chest5loc))
                        end
                    else
                        continue
                    end

                end

            end

        end
        local chest6s = {}
        for _, Chest in pairs(workspace.Items:GetChildren()) do

            if Chest.Name == "Item Chest6" then

                for _, m in pairs(Chest:GetChildren()) do

                    if m:IsA("Part") and m.Name == "Main" then
                        local chest6loc = m.CFrame.Position
                        print("found ch6")
                        if not table.find(chest6s, tostring(chest6loc)) then
                            table.insert(chest6s, tostring(chest6loc))
                        end
                    else
                        continue
                    end

                end

            end

        end
        chest1Dropdown:Refresh(chest1s)
        chest2Dropdown:Refresh(chest2s)
        chest3Dropdown:Refresh(chest3s)
        chest4Dropdown:Refresh(chest4s)
        chest5Dropdown:Refresh(chest5s)
        chest6Dropdown:Refresh(chest6s)

        task.wait()
        return chest1s, chest2s, chest3s, chest4s, chest5s, chest6s
    end,
})

--// Create Skulls auto Tab

local Section1 = SkullTab:CreateSection("Produce Crystal Skull Keys:")

local SkullPodiumToggle = SkullTab:CreateToggle({
    Name = "[Auto] Skulls > Podium",
    CurrentValue = false,
    Flag = "SkullToggle1", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        skull_podium_flag = Value
        if skull_podium_flag then
            Rayfield:Notify({
                Title = "Notification",
                Content = "Skull > Podium enabled",
                Duration = 6.5,
                Image = 4483362458,
            })
        end

        local index = 1
        local p_index = 1

        while skull_podium_flag do
            --print("flag on")
            for s = 1, 4 do
            --for _, skull in pairs(workspace.Items:GetChildren()) do
                if workspace.Items:FindFirstChild("Crystal Skull Key") then
                --if skull:IsA("Model") and skull.Name == "Crystal Skull Key" then

                    --if index == 1 then
                    task.wait()
                    local args = {
                        workspace.Items:FindFirstChild("Crystal Skull Key")
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestStartDraggingItem"):FireServer(unpack(args))
                    task.wait()

                    local args = {
                        workspace.Items:FindFirstChild("Crystal Skull Key")
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestStartDraggingItem"):FireServer(unpack(args))
                    task.wait()
                    workspace.Items:FindFirstChild("Crystal Skull Key"):PivotTo(workspace.Map.Landmarks["Jungle Temple"].Functional.Podiums:GetChildren()[p_index].TouchZone.CFrame * CFrame.new(0,1,0))
                    print("times moved: "..tostring(index))
                    task.wait(1)
                    index = index + 1
                    p_index = p_index + 1
                    
                end

            end
            task.wait()
            p_index = 1
            index = 1
            print("Final indx: "..tostring(index))
            task.wait(315)

        end

    end,
})
local Label = SkullTab:CreateLabel("Opens the Jungle Temple every 5-6 minutes")
local Label2 = SkullTab:CreateLabel(" --- Max Fire Recommended --- ")
local Label3 = SkullTab:CreateLabel(" --- Didn't work? Try teleporting to the temple first --- ")
local Paragraph = SkullTab:CreateParagraph({Title = "Important Notice", Content = "You must have atleast 3-4 skulls on the ground somewhere NOT in your sack. Do not interact with the crystal skulls. If you experience issues turn toggle to OFF and wait 6-7 minutes for the cycle to refresh."})

local function create_exp_UI()

    --20.03.2026 - 01:55 : 33

local Interface_i = Instance.new("ScreenGui") do
	Interface_i.Name = "Interface_i"
	Interface_i.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    Interface_i.Parent = game.Players.LocalPlayer.PlayerGui
end

local HolderFrame = Instance.new("Frame",Interface_i) do
	HolderFrame.Name = "HolderFrame"
	HolderFrame.BackgroundColor3 = Color3.new(0.58,0.58,0.58)
	HolderFrame.BorderColor3 = Color3.new(0,0,0)
	HolderFrame.BorderSizePixel = 0
	HolderFrame.Position = UDim2.new(0.746,0,0.44,0)
	HolderFrame.Size = UDim2.new(0.155,0,0.255,0)
end

local UICorner = Instance.new("UICorner",HolderFrame)
local UIGradient = Instance.new("UIGradient",HolderFrame) do
	UIGradient.Color = ColorSequence.new(Color3.new(0.839,0.839,0.839))
	UIGradient.Transparency = NumberSequence.new(0.12)
end
local TopbarFrame = Instance.new("Frame",HolderFrame) do
	TopbarFrame.Name = "TopbarFrame"
	TopbarFrame.BackgroundColor3 = Color3.new(0.118,0.118,0.118)
	TopbarFrame.BorderColor3 = Color3.new(0,0,0)
	TopbarFrame.BorderSizePixel = 0
	TopbarFrame.Position = UDim2.new(0,0,0,1)
	TopbarFrame.Selectable = true
	TopbarFrame.Size = UDim2.new(1,0,0.154,0)
end

local UICorner_1 = Instance.new("UICorner",TopbarFrame)
local UIGradient_1 = Instance.new("UIGradient",TopbarFrame) do
	UIGradient_1.Color = ColorSequence.new(Color3.new(0.839,0.839,0.839))
	UIGradient_1.Transparency = NumberSequence.new(0.12)
end
local TextLabeltopbinfo = Instance.new("TextLabel",TopbarFrame) do
	TextLabeltopbinfo.Name = "TextLabeltopbinfo"
	TextLabeltopbinfo.BackgroundColor3 = Color3.new(1,1,1)
	TextLabeltopbinfo.BackgroundTransparency = 1
	TextLabeltopbinfo.BorderColor3 = Color3.new(0,0,0)
	TextLabeltopbinfo.BorderSizePixel = 0
	TextLabeltopbinfo.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json",Enum.FontWeight.Bold,Enum.FontStyle.Normal)
	TextLabeltopbinfo.Position = UDim2.new(0,1,0,1)
	TextLabeltopbinfo.Size = UDim2.new(0.996,0,0.97,0)
	TextLabeltopbinfo.Text = " 4NTHOSkybase v2"
	TextLabeltopbinfo.TextColor3 = Color3.new(1,1,1)
	TextLabeltopbinfo.TextScaled = true
	TextLabeltopbinfo.TextSize = 14
	TextLabeltopbinfo.TextWrapped = true
	TextLabeltopbinfo.TextXAlignment = Enum.TextXAlignment.Left
end
local maininnerFrame = Instance.new("Frame",HolderFrame) do
	maininnerFrame.Name = "maininnerFrame"
	maininnerFrame.BackgroundColor3 = Color3.new(0.118,0.118,0.118)
	maininnerFrame.BackgroundTransparency = 0.55
	maininnerFrame.BorderColor3 = Color3.new(0,0,0)
	maininnerFrame.BorderSizePixel = 0
	maininnerFrame.Position = UDim2.new(0,0,0,34)
	maininnerFrame.Size = UDim2.new(1,0,0.841,0)
end

local UICorner_2 = Instance.new("UICorner",maininnerFrame)
local UIGradient_2 = Instance.new("UIGradient",maininnerFrame) do
	UIGradient_2.Color = ColorSequence.new(Color3.new(0.839,0.839,0.839))
	UIGradient_2.Transparency = NumberSequence.new(0.12)
end
local TextBoxLength = Instance.new("TextBox",maininnerFrame) do
	TextBoxLength.Name = "TextBoxLength"
	TextBoxLength.BackgroundColor3 = Color3.new(1,1,1)
	TextBoxLength.BorderColor3 = Color3.new(0,0,0)
	TextBoxLength.BorderSizePixel = 0
	TextBoxLength.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json",Enum.FontWeight.Regular,Enum.FontStyle.Normal)
	TextBoxLength.Position = UDim2.new(0.52,0,0.056,0)
	TextBoxLength.Size = UDim2.new(0.419,0,0.278,0)
	TextBoxLength.Text = ""
	TextBoxLength.TextColor3 = Color3.new(0,0,0)
	TextBoxLength.TextSize = 14
end

local UICorner_3 = Instance.new("UICorner",TextBoxLength)
local TextBoxWidth = Instance.new("TextBox",maininnerFrame) do
	TextBoxWidth.Name = "TextBoxWidth"
	TextBoxWidth.BackgroundColor3 = Color3.new(1,1,1)
	TextBoxWidth.BorderColor3 = Color3.new(0,0,0)
	TextBoxWidth.BorderSizePixel = 0
	TextBoxWidth.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json",Enum.FontWeight.Regular,Enum.FontStyle.Normal)
	TextBoxWidth.Position = UDim2.new(0.52,0,0.361,0)
	TextBoxWidth.Size = UDim2.new(0.419,0,0.278,0)
	TextBoxWidth.Text = ""
	TextBoxWidth.TextColor3 = Color3.new(0,0,0)
	TextBoxWidth.TextSize = 14
end

local UICorner_4 = Instance.new("UICorner",TextBoxWidth)
local lengthID = Instance.new("TextLabel",maininnerFrame) do
	lengthID.Name = "lengthID"
	lengthID.BackgroundColor3 = Color3.new(1,1,1)
	lengthID.BackgroundTransparency = 1
	lengthID.BorderColor3 = Color3.new(0,0,0)
	lengthID.BorderSizePixel = 0
	lengthID.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json",Enum.FontWeight.Bold,Enum.FontStyle.Normal)
	lengthID.Position = UDim2.new(0.057,0,0.056,0)
	lengthID.Size = UDim2.new(0.458,0,0.278,0)
	lengthID.Text = "L: "
	lengthID.TextColor3 = Color3.new(0,0,0)
	lengthID.TextScaled = true
	lengthID.TextSize = 14
	lengthID.TextWrapped = true
end

local UICorner_5 = Instance.new("UICorner",lengthID)
local widthID = Instance.new("TextLabel",maininnerFrame) do
	widthID.Name = "widthID"
	widthID.BackgroundColor3 = Color3.new(1,1,1)
	widthID.BackgroundTransparency = 1
	widthID.BorderColor3 = Color3.new(0,0,0)
	widthID.BorderSizePixel = 0
	widthID.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json",Enum.FontWeight.Bold,Enum.FontStyle.Normal)
	widthID.Position = UDim2.new(0.057,0,0.361,0)
	widthID.Size = UDim2.new(0.458,0,0.278,0)
	widthID.Text = "W: "
	widthID.TextColor3 = Color3.new(0,0,0)
	widthID.TextScaled = true
	widthID.TextSize = 14
	widthID.TextWrapped = true
end

local UICorner_6 = Instance.new("UICorner",widthID)
local TextButtoncreate = Instance.new("TextButton",maininnerFrame) do
	TextButtoncreate.Name = "TextButtoncreate"
	TextButtoncreate.BackgroundColor3 = Color3.new(0.2,0.675,0.176)
	TextButtoncreate.BorderColor3 = Color3.new(0,0,0)
	TextButtoncreate.BorderSizePixel = 0
	TextButtoncreate.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json",Enum.FontWeight.Bold,Enum.FontStyle.Normal)
	TextButtoncreate.Position = UDim2.new(0.057,0,0.672,0)
	TextButtoncreate.Size = UDim2.new(0.881,0,0.292,0)
	TextButtoncreate.Text = "create"
	TextButtoncreate.TextColor3 = Color3.new(0,0,0)
	TextButtoncreate.TextScaled = true
	TextButtoncreate.TextSize = 14
	TextButtoncreate.TextWrapped = true
end

local UICorner_7 = Instance.new("UICorner",TextButtoncreate)
local TextButtondelete = Instance.new("TextButton",maininnerFrame) do
	TextButtondelete.Name = "TextButtondelete"
	TextButtondelete.BackgroundColor3 = Color3.new(0.8,0.584,0.078)
	TextButtondelete.BorderColor3 = Color3.new(0,0,0)
	TextButtondelete.BorderSizePixel = 0
	TextButtondelete.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json",Enum.FontWeight.Bold,Enum.FontStyle.Normal)
	TextButtondelete.Position = UDim2.new(0.286,0,0.715,0)
	TextButtondelete.Size = UDim2.new(0.432,0,0.205,0)
	TextButtondelete.Text = "DEL ❌"
	TextButtondelete.TextColor3 = Color3.new(0,0,0)
	TextButtondelete.TextScaled = true
	TextButtondelete.TextSize = 14
	TextButtondelete.TextWrapped = true
	TextButtondelete.Visible = false
end

local UICorner_8 = Instance.new("UICorner",TextButtondelete)
local colorsFrame = Instance.new("Frame",HolderFrame) do
	colorsFrame.Name = "colorsFrame"
	colorsFrame.BackgroundColor3 = Color3.new(1,1,1)
	colorsFrame.BackgroundTransparency = 1
	colorsFrame.BorderColor3 = Color3.new(0,0,0)
	colorsFrame.BorderSizePixel = 0
	colorsFrame.Position = UDim2.new(1,0,0.005,0)
	colorsFrame.Size = UDim2.new(0.534,0,0.995,0)
end

local UICorner_9 = Instance.new("UICorner",colorsFrame)
local coloractivButton = Instance.new("TextButton",colorsFrame) do
	coloractivButton.Name = "coloractivButton"
	coloractivButton.BackgroundColor3 = Color3.new(0.78,0.259,0.392)
	coloractivButton.BorderColor3 = Color3.new(0,0,0)
	coloractivButton.BorderSizePixel = 0
	coloractivButton.FontFace = Font.new("rbxasset://fonts/families/PermanentMarker.json",Enum.FontWeight.Bold,Enum.FontStyle.Normal)
	coloractivButton.Position = UDim2.new(-0.479,0,0.347,0)
	coloractivButton.Rotation = -90
	coloractivButton.Size = UDim2.new(1.68,0,0.292,0)
	coloractivButton.Text = "COLORS"
	coloractivButton.TextColor3 = Color3.new(1,1,1)
	coloractivButton.TextScaled = true
	coloractivButton.TextSize = 14
	coloractivButton.TextStrokeColor3 = Color3.new(0.8,0.8,0.8)
	coloractivButton.TextWrapped = true
	coloractivButton.Visible = false
end

local UICorner_10 = Instance.new("UICorner",coloractivButton)
local COLORSELECTwhite = Instance.new("TextButton",colorsFrame) do
	COLORSELECTwhite.Name = "COLORSELECTwhite"
	COLORSELECTwhite.BackgroundColor3 = Color3.new(1,1,1)
	COLORSELECTwhite.BorderColor3 = Color3.new(0,0,0)
	COLORSELECTwhite.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json",Enum.FontWeight.Bold,Enum.FontStyle.Normal)
	COLORSELECTwhite.Position = UDim2.new(0.083,0,0.07,0)
	COLORSELECTwhite.Size = UDim2.new(0.897,0,0.192,0)
	COLORSELECTwhite.Text = "White"
	COLORSELECTwhite.TextColor3 = Color3.new(0,0,0)
	COLORSELECTwhite.TextScaled = true
	COLORSELECTwhite.TextSize = 14
	COLORSELECTwhite.TextWrapped = true
end
local COLORSELECTpink = Instance.new("TextButton",colorsFrame) do
	COLORSELECTpink.Name = "COLORSELECTpink"
	COLORSELECTpink.BackgroundColor3 = Color3.new(1,0.294,0.565)
	COLORSELECTpink.BorderColor3 = Color3.new(0,0,0)
	COLORSELECTpink.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json",Enum.FontWeight.Bold,Enum.FontStyle.Normal)
	COLORSELECTpink.Position = UDim2.new(0.083,0,0.324,0)
	COLORSELECTpink.Size = UDim2.new(0.897,0,0.192,0)
	COLORSELECTpink.Text = "Pink"
	COLORSELECTpink.TextColor3 = Color3.new(0,0,0)
	COLORSELECTpink.TextScaled = true
	COLORSELECTpink.TextSize = 14
	COLORSELECTpink.TextWrapped = true
end
local COLORSELECTyellow = Instance.new("TextButton",colorsFrame) do
	COLORSELECTyellow.Name = "COLORSELECTyellow"
	COLORSELECTyellow.BackgroundColor3 = Color3.new(1,1,0)
	COLORSELECTyellow.BorderColor3 = Color3.new(0,0,0)
	COLORSELECTyellow.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json",Enum.FontWeight.Bold,Enum.FontStyle.Normal)
	COLORSELECTyellow.Position = UDim2.new(0.083,0,0.577,0)
	COLORSELECTyellow.Size = UDim2.new(0.897,0,0.192,0)
	COLORSELECTyellow.Text = "Yellow"
	COLORSELECTyellow.TextColor3 = Color3.new(0,0,0)
	COLORSELECTyellow.TextScaled = true
	COLORSELECTyellow.TextSize = 14
	COLORSELECTyellow.TextWrapped = true
end
local COLORSELECTdefault = Instance.new("TextButton",colorsFrame) do
	COLORSELECTdefault.Name = "COLORSELECTdefault"
	COLORSELECTdefault.BackgroundColor3 = Color3.new(0.235,0.745,0.122)
	COLORSELECTdefault.BorderColor3 = Color3.new(0,0,0)
	COLORSELECTdefault.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json",Enum.FontWeight.Bold,Enum.FontStyle.Normal)
	COLORSELECTdefault.Position = UDim2.new(0.083,0,0.826,0)
	COLORSELECTdefault.Size = UDim2.new(0.897,0,0.192,0)
	COLORSELECTdefault.Text = "Default (Green)"
	COLORSELECTdefault.TextColor3 = Color3.new(0,0,0)
	COLORSELECTdefault.TextScaled = true
	COLORSELECTdefault.TextSize = 14
	COLORSELECTdefault.TextWrapped = true
end
local COLORexit = Instance.new("TextButton",colorsFrame) do
	COLORexit.Name = "COLORexit"
	COLORexit.BackgroundColor3 = Color3.new(0.745,0,0)
	COLORexit.BorderColor3 = Color3.new(0,0,0)
	COLORexit.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json",Enum.FontWeight.Bold,Enum.FontStyle.Normal)
	COLORexit.Position = UDim2.new(0.33,0,1.126,0)
	COLORexit.Size = UDim2.new(0.393,0,0.192,0)
	COLORexit.Text = "X"
	COLORexit.TextColor3 = Color3.new(1,1,1)
	COLORexit.TextScaled = true
	COLORexit.TextSize = 14
	COLORexit.TextWrapped = true
end
local circledirectional = Instance.new("Frame",HolderFrame) do
	circledirectional.Name = "circledirectional"
	circledirectional.BackgroundColor3 = Color3.new(0.263,0.757,0.208)
	circledirectional.BorderColor3 = Color3.new(0,0,0)
	circledirectional.BorderSizePixel = 0
	circledirectional.Position = UDim2.new(-0.687,0,0.173,0)
	circledirectional.Size = UDim2.new(0.654,0,0.654,0)
end

local UICorner_11 = Instance.new("UICorner",circledirectional) do
	UICorner_11.CornerRadius = UDim.new(0,99)
end
local innercircledir = Instance.new("Frame",circledirectional) do
	innercircledir.Name = "innercircledir"
	innercircledir.BackgroundColor3 = Color3.new(0.169,0.796,0.122)
	innercircledir.BorderColor3 = Color3.new(0,0,0)
	innercircledir.BorderSizePixel = 0
	innercircledir.Position = UDim2.new(0.161,0,0.143,0)
	innercircledir.Size = UDim2.new(0,100,0,100)
end

local UICorner_12 = Instance.new("UICorner",innercircledir) do
	UICorner_12.CornerRadius = UDim.new(0,99)
end
local UIGradient_3 = Instance.new("UIGradient",innercircledir) do
	UIGradient_3.Color = ColorSequence.new(Color3.new(0.839,0.839,0.839))
	UIGradient_3.Transparency = NumberSequence.new(0.5)
end
local TextButtonUP = Instance.new("TextButton",circledirectional) do
	TextButtonUP.Name = "TextButtonUP"
	TextButtonUP.BackgroundColor3 = Color3.new(1,0,0)
	TextButtonUP.BorderColor3 = Color3.new(0,0,0)
	TextButtonUP.BorderSizePixel = 0
	TextButtonUP.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json",Enum.FontWeight.Bold,Enum.FontStyle.Normal)
	TextButtonUP.Position = UDim2.new(0.296,0,-0,0)
	TextButtonUP.Size = UDim2.new(0.407,0,0.157,0)
	TextButtonUP.Text = "UP"
	TextButtonUP.TextColor3 = Color3.new(0,0,0)
	TextButtonUP.TextScaled = true
	TextButtonUP.TextSize = 14
	TextButtonUP.TextWrapped = true
end

local UICorner_13 = Instance.new("UICorner",TextButtonUP)
local TextButtonDOWN = Instance.new("TextButton",circledirectional) do
	TextButtonDOWN.Name = "TextButtonDOWN"
	TextButtonDOWN.BackgroundColor3 = Color3.new(1,0.969,0)
	TextButtonDOWN.BorderColor3 = Color3.new(0,0,0)
	TextButtonDOWN.BorderSizePixel = 0
	TextButtonDOWN.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json",Enum.FontWeight.Bold,Enum.FontStyle.Normal)
	TextButtonDOWN.Position = UDim2.new(0.291,0,0.85,0)
	TextButtonDOWN.Size = UDim2.new(0.407,0,0.157,0)
	TextButtonDOWN.Text = "DOWN"
	TextButtonDOWN.TextColor3 = Color3.new(0,0,0)
	TextButtonDOWN.TextScaled = true
	TextButtonDOWN.TextSize = 14
	TextButtonDOWN.TextWrapped = true
end

local UICorner_14 = Instance.new("UICorner",TextButtonDOWN)
local TextButtonLEFT = Instance.new("TextButton",circledirectional) do
	TextButtonLEFT.Name = "TextButtonLEFT"
	TextButtonLEFT.BackgroundColor3 = Color3.new(0.047,0.792,0.741)
	TextButtonLEFT.BorderColor3 = Color3.new(0,0,0)
	TextButtonLEFT.BorderSizePixel = 0
	TextButtonLEFT.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json",Enum.FontWeight.Bold,Enum.FontStyle.Normal)
	TextButtonLEFT.Position = UDim2.new(-0.194,0,0.42,0)
	TextButtonLEFT.Size = UDim2.new(0.407,0,0.157,0)
	TextButtonLEFT.Text = "LEFT"
	TextButtonLEFT.TextColor3 = Color3.new(0,0,0)
	TextButtonLEFT.TextScaled = true
	TextButtonLEFT.TextSize = 14
	TextButtonLEFT.TextWrapped = true
end

local UICorner_15 = Instance.new("UICorner",TextButtonLEFT)
local TextButtonRIGHT = Instance.new("TextButton",circledirectional) do
	TextButtonRIGHT.Name = "TextButtonRIGHT"
	TextButtonRIGHT.BackgroundColor3 = Color3.new(0.843,0.055,1)
	TextButtonRIGHT.BorderColor3 = Color3.new(0,0,0)
	TextButtonRIGHT.BorderSizePixel = 0
	TextButtonRIGHT.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json",Enum.FontWeight.Bold,Enum.FontStyle.Normal)
	TextButtonRIGHT.Position = UDim2.new(0.782,0,0.421,0)
	TextButtonRIGHT.Size = UDim2.new(0.407,0,0.157,0)
	TextButtonRIGHT.Text = "RIGHT"
	TextButtonRIGHT.TextColor3 = Color3.new(0,0,0)
	TextButtonRIGHT.TextScaled = true
	TextButtonRIGHT.TextSize = 14
	TextButtonRIGHT.TextWrapped = true
end

local UICorner_16 = Instance.new("UICorner",TextButtonRIGHT)
local TextButtonFORWARD = Instance.new("TextButton",circledirectional) do
	TextButtonFORWARD.Name = "TextButtonFORWARD"
	TextButtonFORWARD.BackgroundColor3 = Color3.new(1,0.322,0.204)
	TextButtonFORWARD.BorderColor3 = Color3.new(0,0,0)
	TextButtonFORWARD.BorderSizePixel = 0
	TextButtonFORWARD.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json",Enum.FontWeight.Bold,Enum.FontStyle.Normal)
	TextButtonFORWARD.Position = UDim2.new(0.291,0,0.285,0)
	TextButtonFORWARD.Size = UDim2.new(0.407,0,0.207,0)
	TextButtonFORWARD.Text = "FORWARD"
	TextButtonFORWARD.TextColor3 = Color3.new(0,0,0)
	TextButtonFORWARD.TextScaled = true
	TextButtonFORWARD.TextSize = 14
	TextButtonFORWARD.TextWrapped = true
end

local UICorner_17 = Instance.new("UICorner",TextButtonFORWARD)
local TextButtonBACK = Instance.new("TextButton",circledirectional) do
	TextButtonBACK.Name = "TextButtonBACK"
	TextButtonBACK.BackgroundColor3 = Color3.new(0.22,0.22,1)
	TextButtonBACK.BorderColor3 = Color3.new(0,0,0)
	TextButtonBACK.BorderSizePixel = 0
	TextButtonBACK.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json",Enum.FontWeight.Bold,Enum.FontStyle.Normal)
	TextButtonBACK.Position = UDim2.new(0.291,0,0.516,0)
	TextButtonBACK.Size = UDim2.new(0.407,0,0.207,0)
	TextButtonBACK.Text = "BACK"
	TextButtonBACK.TextColor3 = Color3.new(0,0,0)
	TextButtonBACK.TextScaled = true
	TextButtonBACK.TextSize = 14
	TextButtonBACK.TextWrapped = true
end

local UICorner_18 = Instance.new("UICorner",TextButtonBACK)
end

create_exp_UI()
task.wait()
local _interface = game.Players.LocalPlayer.PlayerGui.Interface_i
_interface.Enabled = false
task.wait(1)
-- exp UI toggle
local skybaseToggle = BaseTab:CreateToggle({
    Name = "Enable Interface Interaction",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        interface_flag = Value
        if interface_flag then
            Rayfield:Notify({
                Title = "Notification",
                Content = "Skybase Interface enabled",
                Duration = 7,
                Image = 4483362458,
            })
   
            task.wait(2)

            --_interface.Enabled = true

            --local _interface = game.Players.LocalPlayer.PlayerGui.Interface_i

            local UIS = game:GetService("UserInputService")
            local frame = _interface.HolderFrame
            local dragToggle = nil
            local dragSpeed = 20
            local dragStart = nil
            local startPos = nil

            --// DRAG SERVICE

            local function updateInput(input)
                local delta = input.Position - dragStart
                local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
                game:GetService("TweenService"):Create(frame, TweenInfo.new(0.30), {Position = position}):Play()
            end

            frame.InputBegan:Connect(function(input)
                if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
                    dragToggle = true
                    dragStart = input.Position
                    startPos = frame.Position
                    input.Changed:Connect(function()
                        if (input.UserInputState == Enum.UserInputState.End) then
                            dragToggle = false
                        end
                    end)
                end
            end)

            UIS.InputChanged:Connect(function(input)
                if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and dragToggle then
                    updateInput(input)
                end
            end)

            --// MAIN CREATE FUNCTION(S) & local vars

            local create_plat_button = frame.maininnerFrame:FindFirstChild("TextButtoncreate")
            local delete_plat_button = frame.maininnerFrame:FindFirstChild("TextButtondelete")
            local move_plat_up = frame.circledirectional:FindFirstChild("TextButtonUP")
            local move_plat_down = frame.circledirectional:FindFirstChild("TextButtonDOWN")
            local move_plat_left = frame.circledirectional:FindFirstChild("TextButtonLEFT")
            local move_plat_right = frame.circledirectional:FindFirstChild("TextButtonRIGHT")
            local move_plat_forward = frame.circledirectional:FindFirstChild("TextButtonFORWARD")
            local move_plat_back = frame.circledirectional:FindFirstChild("TextButtonBACK")
            local length_index = frame.maininnerFrame:FindFirstChild("TextBoxLength")
            local width_index = frame.maininnerFrame:FindFirstChild("TextBoxWidth")

            local colorsframe = frame:FindFirstChild("colorsFrame")
            local color1 = colorsframe:FindFirstChild("COLORSELECTwhite")
            local color2 = colorsframe:FindFirstChild("COLORSELECTpink")
            local color3 = colorsframe:FindFirstChild("COLORSELECTyellow")
            local color_def = colorsframe:FindFirstChild("COLORSELECTdefault")

            local color_activate = colorsframe:FindFirstChild("coloractivButton")
            local color_exit = colorsframe:FindFirstChild("COLORexit")

            delete_plat_button.Visible = false
            color1.Visible = false
            color2.Visible = false
            color3.Visible = false
            color_def.Visible = false
            color_exit.Visible = false
            color_activate.Visible = true

            -- inputs

            local lengthtextBox = frame.maininnerFrame:FindFirstChild("TextBoxLength")

            local function allowOnlyNumbers()
                lengthtextBox.Text = string.gsub(lengthtextBox.Text, "%D", "")
            end

            lengthtextBox:GetPropertyChangedSignal("Text"):Connect(allowOnlyNumbers)

            local widthtextBox = frame.maininnerFrame:FindFirstChild("TextBoxWidth")

            local function allowOnlyNumbers2()
                widthtextBox.Text = string.gsub(widthtextBox.Text, "%D", "")
            end	

            widthtextBox:GetPropertyChangedSignal("Text"):Connect(allowOnlyNumbers2)

            -- Creating general platform

            local function createPlatform()
                print("attempt")
            
                local my_current_pos = HRP.CFrame
                local length_input = length_index.Text
                local width_input = width_index.Text
            
                if length_input == "" then
                    length_input = 10
                end
            
                if width_input == "" then
                    width_input = 10
                end
            
                local platPart = Instance.new("Part") do
                    platPart.Name = "Grass"
                    platPart.BrickColor = BrickColor.new("Parsley green")
                    platPart.brickColor = BrickColor.new("Parsley green")
                    platPart.Parent = workspace.Map.Ground
                    platPart.CanCollide = true
                    platPart.CanQuery = true
                    platPart.CanTouch = true
                    platPart.Anchored = true
                    platPart.Transparency = 0.5
                    platPart.BottomSurface = Enum.SurfaceType.Inlet
                    platPart.Material = Enum.Material.Grass
                    platPart.Position = vector.create(my_current_pos.Position.X, 2, my_current_pos.Position.Z)
                    platPart.Size = vector.create(tonumber(length_input),0.6,tonumber(width_input))
                    platPart.TopSurface = Enum.SurfaceType.Smooth
                end
            
            end


            create_plat_button.MouseButton1Click:Connect(function()
                createPlatform()
                print("platform created")
                task.wait()
                create_plat_button.Selectable = false
                create_plat_button.Active = false
                create_plat_button.Interactable = false
                create_plat_button.Visible = false
                delete_plat_button.Visible = true
            end)

            -- deleting and replacing platform button

            local function deletePlatform()
                for _, ground in pairs(workspace.Map.Ground:GetChildren()) do

                    if ground.Transparency == 0.5 then
                        ground:Destroy()
                        print("deleted")
                        
                    end
                end
            
            end

            delete_plat_button.MouseButton1Click:Connect(function()
                deletePlatform()
                create_plat_button.Selectable = true
                create_plat_button.Active = true
                create_plat_button.Interactable = true
                create_plat_button.Visible = true
                delete_plat_button.Visible = false
                task.wait()
            end)

            -- move plat UP

            local function movePlatUp()
            
                for _, ground in pairs(workspace.Map.Ground:GetChildren()) do

                    if ground.Transparency == 0.5 then
                    
                    local prev_pos = ground.Position
                    local new_pos = vector.create(prev_pos.X, prev_pos.Y + 0.5, prev_pos.Z)
                    ground.Position = new_pos
                    print("moved up")
                    end
                
                end
            
            end

            move_plat_up.MouseButton1Click:Connect(function()
                movePlatUp()
                task.wait()
            end)

            -- move plat DOWN

            local function movePlatDown()
            
                for _, ground in pairs(workspace.Map.Ground:GetChildren()) do

                    if ground.Transparency == 0.5 then
                    
                    local prev_pos = ground.Position
                    local new_pos = vector.create(prev_pos.X, prev_pos.Y - 0.5, prev_pos.Z)
                    ground.Position = new_pos
                    print("moved down")
                    end
                
                end
            
            end

            move_plat_down.MouseButton1Click:Connect(function()
                movePlatDown()
                task.wait()
            end)

            -- move plat LEFT

            local function movePlatLeft()
            
                for _, ground in pairs(workspace.Map.Ground:GetChildren()) do

                    if ground.Transparency == 0.5 then
                    
                    local prev_pos = ground.Position
                    local new_pos = vector.create(prev_pos.X - 0.5, prev_pos.Y, prev_pos.Z)
                    ground.Position = new_pos
                    print("moved left")
                    end
                
                end
            
            end	

            move_plat_left.MouseButton1Click:Connect(function()
                movePlatLeft()
                task.wait()
            end)

            -- move plat RIGHT

            local function movePlatRight()
                for _, ground in pairs(workspace.Map.Ground:GetChildren()) do

                    if ground.Transparency == 0.5 then
                    
                    local prev_pos = ground.Position
                    local new_pos = vector.create(prev_pos.X + 0.5, prev_pos.Y, prev_pos.Z)
                    ground.Position = new_pos
                    print("moved right")
                    end
                
                end
            
            end

            move_plat_right.MouseButton1Click:Connect(function()
                movePlatRight()
                task.wait()
            end)

            -- move plat FORWARD

            local function movePlatForward()
            
                for _, ground in pairs(workspace.Map.Ground:GetChildren()) do

                    if ground.Transparency == 0.5 then
                    
                    local prev_pos = ground.Position
                    local new_pos = vector.create(prev_pos.X, prev_pos.Y, prev_pos.Z + 0.5)
                    ground.Position = new_pos
                    print("moved forward")
                    end
                
                end
            
            end	

            move_plat_forward.MouseButton1Click:Connect(function()
                movePlatForward()
                task.wait()
            end)

            -- move plat BACKWARD

            local function movePlatBackward()
            
                for _, ground in pairs(workspace.Map.Ground:GetChildren()) do

                    if ground.Transparency == 0.5 then
                    
                    local prev_pos = ground.Position
                    local new_pos = vector.create(prev_pos.X, prev_pos.Y, prev_pos.Z - 0.5)
                    ground.Position = new_pos
                    print("moved backward")
                    end
                
                end
            
            end	

            move_plat_back.MouseButton1Click:Connect(function()
                movePlatBackward()
                task.wait()
            end)
            task.wait()

            local function changeColorWhite()
	
	            for _, ground in pairs(workspace.Map.Ground:GetChildren()) do

                    if ground.Transparency == 0.5 then
                
	            	    ground.BrickColor = BrickColor.new("White")
                    end
                
	            end
	
            end

            color1.MouseButton1Click:Connect(function()
            	changeColorWhite()
            	task.wait()
            end)

            local function changeColorPink()
            
            	for _, ground in pairs(workspace.Map.Ground:GetChildren()) do

                    if ground.Transparency == 0.5 then
                
            		    ground.BrickColor = BrickColor.new("Light pink")
                    end
                
            	end
            end

            color2.MouseButton1Click:Connect(function()
            	changeColorPink()
            	task.wait()
            end)

            local function changeColorYellow()
            	for _, ground in pairs(workspace.Map.Ground:GetChildren()) do

                    if ground.Transparency == 0.5 then
                
            		    ground.BrickColor = BrickColor.new("Cool yellow")
                    end
                
            	end
            end

            color3.MouseButton1Click:Connect(function()
            	changeColorYellow()
            	task.wait()
            end)

            local function changeColorDefault()
            	for _, ground in pairs(workspace.Map.Ground:GetChildren()) do

                    if ground.Transparency == 0.5 then
                
            		    ground.BrickColor = BrickColor.new("Parsley green")
                    end
                
            	end
            end

            color_def.MouseButton1Click:Connect(function()
            	changeColorDefault()
            	task.wait()
            end)

            local function colorsExit()
            	color1.Visible = false
            	color2.Visible = false
            	color3.Visible = false
            	color_def.Visible = false
            	color_exit.Visible = false
            	color_activate.Visible = true
            end

            color_exit.MouseButton1Click:Connect(function()
            	colorsExit()
            	task.wait()
            end)

            local function colorsActivate()
            	color1.Visible = true
            	color2.Visible = true
            	color3.Visible = true
            	color_def.Visible = true
            	color_exit.Visible = true
            	color_activate.Visible = false
            end

            color_activate.MouseButton1Click:Connect(function()
            	colorsActivate()
            	task.wait()
            end)
   
        end 
            
        if interface_flag == false then
            Rayfield:Notify({
                Title = "- WARNING -",
                Content = "Skybase Interface disabled - Multiple Platforms Possible!",
                Duration = 12,
                Image = 4483362458,
            })

            task.wait()
            --_interface.Enabled = false
        end
        task.wait()
   
    end,
})

local warnlabel1 = BaseTab:CreateLabel("**ONLY ENABLE THIS TOGGLE ONCE**", 0)
local warnlabel4 = BaseTab:CreateLabel("Then, select between Show or Hide Interface below", 0)
local warnlabel2 = BaseTab:CreateLabel("**YOU WILL CREATE MULTIPLE PLATFORMS AND LAG**", 0)
local warnlabel2 = BaseTab:CreateLabel("**work in progress :) thanks**", 0)

local showskybaseButton = BaseTab:CreateButton({
    Name = "Show Interface",
    Callback = function()
        _interface.Enabled = true
        task.wait()
    end,
})

local removeskybaseButton = BaseTab:CreateButton({
    Name = "Hide Interface",
    Callback = function()
        _interface.Enabled = false
        task.wait()
    end,
})

-- Extras tab create 
local warnlabel1ex = ExtrasTab:CreateLabel("NOTE: ", 0)
local warnlabel2ex = ExtrasTab:CreateLabel("Before you enable any menus, you MUST open the Crafting Table menu manually atleast once :)", 0)

local mainextrasSection = ExtrasTab:CreateSection("Main/Crafting:")

local craftingmenuButton = ExtrasTab:CreateButton({
    Name = "Show Crafting Table",
    Callback = function()
        local crafting_menu_path = game:GetService("Players").LocalPlayer.PlayerGui.Interface.CraftingTable

        crafting_menu_path.Visible = true
        crafting_menu_path.Active = true
    end,
})

local fairyflowersmenuButton = ExtrasTab:CreateButton({
    Name = "Show Flower Menu (Fairy)",
    Callback = function()
        local flowerfairy_menu_path = game:GetService("Players").LocalPlayer.PlayerGui.Interface.Flower

        flowerfairy_menu_path.Visible = true
        flowerfairy_menu_path.Active = true
    end,
})

local skilltoolsmenuButton = ExtrasTab:CreateButton({
    Name = "Show Buy Skill Tools",
    Callback = function()
        local skilltool_menu_path = game:GetService("Players").LocalPlayer.PlayerGui.Interface.ToolSmith

        skilltool_menu_path.Visible = true
        skilltool_menu_path.Active = true
    end,
})

local decoSection = ExtrasTab:CreateSection("Deco:")

local furnituremenuButton = ExtrasTab:CreateButton({
    Name = "Show Furniture Menu",
    Callback = function()
        local furn_menu_path = game:GetService("Players").LocalPlayer.PlayerGui.Interface.Furniture

        furn_menu_path.Visible = true
        furn_menu_path.Active = true
    end,
})

local hallSection = ExtrasTab:CreateSection("Halloween:")

local haloweencostumesmenuButton = ExtrasTab:CreateButton({
    Name = "Halloween Costumes Menu",
    Callback = function()
        local halloweencostume_path = game:GetService("Players").LocalPlayer.PlayerGui.Interface.HalloweenCostumesFrame

        halloweencostume_path.Visible = true
        halloweencostume_path.Active = true
    end,
})

local chrisSection = ExtrasTab:CreateSection("Christmas:")

local santamenuButton = ExtrasTab:CreateButton({
    Name = "Santa Sack Menu",
    Callback = function()
        local santasack_path = game:GetService("Players").LocalPlayer.PlayerGui.Interface.SantaSack

        santasack_path.Visible = true
        santasack_path.Active = true
    end,
})
local creditstablabel1 = CREDITS:CreateLabel("Developer: 4NTHOcyan", 0)
local creditstablabel2 = CREDITS:CreateLabel("Find all my game menus on  Discord.gg/cWhpEDYPUB", 0)
local creditstablabel3 = CREDITS:CreateLabel("or  rscripts.net/@4NTHOcyan", 0)
local creditstablabel4 = CREDITS:CreateLabel("-----", 0)
local creditstablabel5 = CREDITS:CreateLabel("Thanks for using Cyan-99! All of your support is helpful and appreciated.", 0)
end
