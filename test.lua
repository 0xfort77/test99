local place_id = 126509999114328

if game.PlaceId == place_id then

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local _Version = "Cyan-99 v1.2"

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

local CREDITS = Window:CreateTab("Credits", "users") -- Title, Image


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

            local includeparams = OverlapParams.new()
            local excludeparams = OverlapParams.new()
            includeparams.FilterType = Enum.RaycastFilterType.Include
            includeparams.FilterDescendantsInstances = {NPC_enemies}
            includeparams.CollisionGroup = "NPCs"
            excludeparams.FilterType = Enum.RaycastFilterType.Exclude
            excludeparams.FilterDescendantsInstances = {items}
            excludeparams.MaxParts = 60
            local worldrootradius = workspace:GetPartBoundsInRadius(HRP.Position, 180, includeparams, excludeparams)

            for _, v in ipairs(worldrootradius) do
                if v:IsA("Part") then --and v.Name == "HumanoidRootPart" then
                    --v.CanQuery = true
                    --print(v.Parent)
                    for _, item in pairs(game:GetService("Players").LocalPlayer.Inventory:GetChildren()) do
    
                        if string.find(item.Name, "Old Axe") then
                
                            local args = {
                                v.Parent,
                                game.Players.LocalPlayer.Inventory:WaitForChild("Old Axe"),
                                damage_hash,
                                v.CFrame * CFrame.new(0,0,0)
                            }
                            game.ReplicatedStorage.RemoteEvents.ToolDamageObject:InvokeServer(unpack(args))
                        elseif string.find(item.Name, "Good Axe") then
                            local args = {
                                v.Parent,
                                game.Players.LocalPlayer.Inventory:WaitForChild("Good Axe"),
                                damage_hash,
                                v.CFrame * CFrame.new(0,0,0)
                            }
                            game.ReplicatedStorage.RemoteEvents.ToolDamageObject:InvokeServer(unpack(args))

                        elseif string.find(item.Name, "Strong Axe") then
                            local args = {
                                v.Parent,
                                game.Players.LocalPlayer.Inventory:WaitForChild("Strong Axe"),
                                damage_hash,
                                v.CFrame * CFrame.new(0,0,0)
                            }
                            game.ReplicatedStorage.RemoteEvents.ToolDamageObject:InvokeServer(unpack(args))

                        elseif string.find(item.Name, "Chainsaw") then
                            local args = {
                                v.Parent,
                                game.Players.LocalPlayer.Inventory:WaitForChild("Chainsaw"),
                                damage_hash,
                                v.CFrame * CFrame.new(0,0,0)
                            }
                            game.ReplicatedStorage.RemoteEvents.ToolDamageObject:InvokeServer(unpack(args))
                        elseif string.find(item.Name, "Spear") then
                            local args = {
                                v.Parent,
                                game.Players.LocalPlayer.Inventory:WaitForChild("Spear"),
                                damage_hash,
                                v.CFrame * CFrame.new(0,0,0)
                        }
                        game.ReplicatedStorage.RemoteEvents.ToolDamageObject:InvokeServer(unpack(args))
                        elseif string.find(item.Name, "Morningstar") then
                            local args = {
                                v.Parent,
                                game.Players.LocalPlayer.Inventory:WaitForChild("Morningstar"),
                                damage_hash,
                                v.CFrame * CFrame.new(0,0,0)
                        }
                        game.ReplicatedStorage.RemoteEvents.ToolDamageObject:InvokeServer(unpack(args))
                        elseif string.find(item.Name, "Poison Claws") then
                            local args = {
                                v.Parent,
                                game.Players.LocalPlayer.Inventory:WaitForChild("Poison Claws"),
                                damage_hash,
                                v.CFrame * CFrame.new(0,0,0)
                        }
                        game.ReplicatedStorage.RemoteEvents.ToolDamageObject:InvokeServer(unpack(args))
                        elseif string.find(item.Name, "Obsidiron Hammer") then
                            local args = {
                                v.Parent,
                                game.Players.LocalPlayer.Inventory:WaitForChild("Obsidiron Hammer"),
                                damage_hash,
                                v.CFrame * CFrame.new(0,0,0)
                        }
                        game.ReplicatedStorage.RemoteEvents.ToolDamageObject:InvokeServer(unpack(args))
                        elseif string.find(item.Name, "Katana") then
                            local args = {
                                v.Parent,
                                game.Players.LocalPlayer.Inventory:WaitForChild("Katana"),
                                damage_hash,
                                v.CFrame * CFrame.new(0,0,0)
                        }
                        game.ReplicatedStorage.RemoteEvents.ToolDamageObject:InvokeServer(unpack(args))
                        elseif string.find(item.Name, "Flamethrower") then
                            local args = {
                                v.Parent,
                                game.Players.LocalPlayer.Inventory:WaitForChild("Flamethrower"),
                                damage_hash,
                                v.CFrame * CFrame.new(0,0,0)
                        }
                        game.ReplicatedStorage.RemoteEvents.ToolDamageObject:InvokeServer(unpack(args))
                        elseif string.find(item.Name, "Trident") then
                            local args = {
                                v.Parent,
                                game.Players.LocalPlayer.Inventory:WaitForChild("Trident"),
                                damage_hash,
                                v.CFrame * CFrame.new(0,0,0)
                        }
                        game.ReplicatedStorage.RemoteEvents.ToolDamageObject:InvokeServer(unpack(args))
                        elseif string.find(item.Name, "Poison Spear") then
                            local args = {
                                v.Parent,
                                game.Players.LocalPlayer.Inventory:WaitForChild("Poison Spear"),
                                damage_hash,
                                v.CFrame * CFrame.new(0,0,0)
                        }
                        game.ReplicatedStorage.RemoteEvents.ToolDamageObject:InvokeServer(unpack(args))
                        elseif string.find(item.Name, "Laser Sword") then
                            local args = {
                                v.Parent,
                                game.Players.LocalPlayer.Inventory:WaitForChild("Laser Sword"),
                                damage_hash,
                                v.CFrame * CFrame.new(0,0,0)
                        }
                        game.ReplicatedStorage.RemoteEvents.ToolDamageObject:InvokeServer(unpack(args))
                        elseif string.find(item.Name, "Vampire Scythe") then
                            local args = {
                                v.Parent,
                                game.Players.LocalPlayer.Inventory:WaitForChild("Vampire Scythe"),
                                damage_hash,
                                v.CFrame * CFrame.new(0,0,0)
                        }
                        game.ReplicatedStorage.RemoteEvents.ToolDamageObject:InvokeServer(unpack(args))
                        elseif string.find(item.Name, "Scythe") then
                            local args = {
                                v.Parent,
                                game.Players.LocalPlayer.Inventory:WaitForChild("Scythe"),
                                damage_hash,
                                v.CFrame * CFrame.new(0,0,0)
                            }
                        game.ReplicatedStorage.RemoteEvents.ToolDamageObject:InvokeServer(unpack(args))
                        elseif string.find(item.Name, "Infernal Sword") then
                            local args = {
                                v.Parent,
                                game.Players.LocalPlayer.Inventory:WaitForChild("Infernal Sword"),
                                damage_hash,
                                v.CFrame * CFrame.new(0,0,0)
                            }
                        game.ReplicatedStorage.RemoteEvents.ToolDamageObject:InvokeServer(unpack(args))
                        elseif string.find(item.Name, "Ice Sword") then
                            local args = {
                                v.Parent,
                                game.Players.LocalPlayer.Inventory:WaitForChild("Ice Sword"),
                                damage_hash,
                                v.CFrame * CFrame.new(0,0,0)
                            }
                        game.ReplicatedStorage.RemoteEvents.ToolDamageObject:InvokeServer(unpack(args))

                        end
                    end

                end

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

                if Chest.Name == "Item Chest" or Chest.Name == "Item Chest2" or Chest.Name == "Item Chest3" or Chest.Name == "Item Chest4" or Chest.Name == "Item Chest5" or Chest.Name == "Item Chest6" or Chest.Name == "Jungle Chest1" or Chest.Name == "Jungle Chest2" or Chest.Name == "Stronghold Diamond Chest" or Chest.Name == "Stone Chest1" or Chest.Name == "Stone Chest2" or Chest.Name == "Mossy Chest" or Chest.Name == "Obsidiron Chest" then

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

local autoSHButton = MainTab:CreateToggle({
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

                    HRP.CFrame = workspace.Map.Landmarks.Stronghold.Functional.EnemyWaves12.Wave1.TriggerZone.CFrame * CFrame.new(0,13,0)
                    task.wait(5)
                    HRP.CFrame = workspace.Map.Landmarks.Stronghold.Functional.EnemyWaves12.Wave1.TriggerZone.CFrame * CFrame.new(0,26,0)
                    task.wait(300)
                    HRP.CFrame = workspace.Items["Stronghold Diamond Chest"].Platform.CFrame * CFrame.new(0,6,0)
                    task.wait()
                    local d_chest_prox = workspace.Items["Stronghold Diamond Chest"].Main.ProximityAttachment.ProximityInteraction
                    task.wait(1)
                    fireproximityprompt(d_chest_prox)
                    task.wait()
                    for _, d in pairs(workspace.Items:GetChildren()) do
                        if d.Name == "Diamond" then
                            local args = {
                                d,
                            }
                            game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestTakeDiamonds"):FireServer(unpack(args))
                        end
                        task.wait()
                    end
                    
                    HRP.CFrame = FIREZONE.CFrame * CFrame.new(0,6,0) 
                    task.wait(300)
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

--local strongholdtablabel1 = MainTab:CreateLabel("Stronghold Time: None", 0)
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
            local worldrootradiustrees = workspace:GetPartBoundsInRadius(HRP.Position, 180, includeparams, excludeparams)

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

                if gear_item.Name == "Broken Fan" or gear_item.Name == "Broken Microwave" or gear_item.Name == "Old Car Engine" or gear_item.Name == "Old Radio" or gear_item.Name == "Sheet Metal" or gear_item.Name == "Washing Machine" then
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

                if gear_item.Name == "Broken Fan" or gear_item.Name == "Broken Microwave" or gear_item.Name == "Old Car Engine" or gear_item.Name == "Old Radio" or gear_item.Name == "Sheet Metal" or gear_item.Name == "Washing Machine" then
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

        while skull_podium_flag do
            --print("flag on")
            for _, skull in pairs(workspace.Items:GetChildren()) do

                if skull:IsA("Model") and skull.Name == "Crystal Skull Key" then

                    if index == 1 then

                        local args = {
                            skull
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestStartDraggingItem"):FireServer(unpack(args))
                        task.wait()

                        local args = {
                            skull
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestStartDraggingItem"):FireServer(unpack(args))
                        task.wait()
                        skull:PivotTo(workspace.Map.Landmarks["Jungle Temple"].Functional.Podiums:GetChildren()[1].TouchZone.CFrame * CFrame.new(0,1,0))
                        print(tostring(index))
                        task.wait(1)
                        index = 2
                    
                    elseif index == 2 then

                        local args = {
                            skull
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestStartDraggingItem"):FireServer(unpack(args))
                        task.wait()

                        local args = {
                            skull
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestStartDraggingItem"):FireServer(unpack(args))
                        task.wait()
                        skull:PivotTo(workspace.Map.Landmarks["Jungle Temple"].Functional.Podiums:GetChildren()[2].TouchZone.CFrame * CFrame.new(0,1,0))
                        print(tostring(index))
                        task.wait(1)
                        index = 3
                    elseif index == 3 then
                        --print("index 3")
                        

                        local args = {
                            skull
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestStartDraggingItem"):FireServer(unpack(args))
                        task.wait()

                        local args = {
                            skull
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestStartDraggingItem"):FireServer(unpack(args))
                        task.wait()
                        skull:PivotTo(workspace.Map.Landmarks["Jungle Temple"].Functional.Podiums:GetChildren()[3].TouchZone.CFrame * CFrame.new(0,1,0))
                        print(tostring(index))
                        task.wait(1)
                        index = 4
                        --task.wait(312)
                        -- 5 minute wait for additional spawns

                    elseif index == 4 then
                        --print("index 4")
                        
                        local args = {
                            skull
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestStartDraggingItem"):FireServer(unpack(args))
                        task.wait()

                        local args = {
                            skull
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestStartDraggingItem"):FireServer(unpack(args))
                        task.wait()
                        skull:PivotTo(workspace.Map.Landmarks["Jungle Temple"].Functional.Podiums:GetChildren()[4].TouchZone.CFrame * CFrame.new(0,1,0))
                        print(tostring(index))
                        task.wait(2)
                        index = 1
                        task.wait(315)
                        
                    end
                    
                end

            end
            task.wait()
            index = 1

        end

    end,
})
local Label = SkullTab:CreateLabel("Opens the Jungle Temple every 5-6 minutes")
local Label2 = SkullTab:CreateLabel(" --- Max Fire Recommended --- ")
local Label3 = SkullTab:CreateLabel(" --- Didn't work? Try teleporting to the temple first --- ")
local Paragraph = SkullTab:CreateParagraph({Title = "Important Notice", Content = "You must have atleast 3-4 skulls on the ground somewhere NOT in your sack. Do not interact with the crystal skulls. If you experience issues turn toggle to OFF and wait 6-7 minutes for the cycle to refresh."})



local creditstablabel1 = CREDITS:CreateLabel("Developer: 4NTHOcyan", 0)
local creditstablabel2 = CREDITS:CreateLabel("Find all my game menus on  Discord.gg/cWhpEDYPUB", 0)
local creditstablabel3 = CREDITS:CreateLabel("or  rscripts.net/@4NTHOcyan", 0)
local creditstablabel4 = CREDITS:CreateLabel("-----", 0)
local creditstablabel5 = CREDITS:CreateLabel("Thanks for using Cyan-99! All of your support is helpful and appreciated.", 0)
local creditstablabel6 = CREDITS:CreateLabel("Salamat sa paggamit ng Cyan-99! Malaking tulong at lubos ang inyong suporta.", 0)
local creditstablabel7 = CREDITS:CreateLabel("Cyan-99를 이용해 주셔서 감사합니다! 여러분의 모든 지원에 진심으로 감사드립니다.", 0)
local creditstablabel8 = CREDITS:CreateLabel("¡Gracias por usar Cyan-99! Agradecemos todo su apoyo.", 0)
local creditstablabel9 = CREDITS:CreateLabel("Спасибо за использование Cyan-99! Ваша поддержка очень полезна и ценна.", 0)

end
