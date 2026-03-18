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
local move_plat_up = frame.movebuttFrame:FindFirstChild("TextButtonUP")
local move_plat_down = frame.movebuttFrame:FindFirstChild("TextButtonDOWN")
local move_plat_left = frame.movebuttFrame:FindFirstChild("TextButtonLEFT")
local move_plat_right = frame.movebuttFrame:FindFirstChild("TextButtonRIGHT")
local move_plat_forward = frame.movebuttFrame:FindFirstChild("TextButtonFORWARD")
local move_plat_back = frame.movebuttFrame:FindFirstChild("TextButtonBACK")
local length_index = frame.maininnerFrame:FindFirstChild("TextBoxLength")
local width_index = frame.maininnerFrame:FindFirstChild("TextBoxWidth")

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
end)

-- deleting and replacing platform button

local function deletePlatform()
    for _, ground in pairs(workspace.Map.Ground:GetChildren()) do
        
        if ground.Transparency == 0.5 then
            ground:Destroy()
            print("deleted")
            create_plat_button.Selectable = true
            create_plat_button.Active = true
            create_plat_button.Interactable = true
            create_plat_button.Visible = true
        end
    end

end

delete_plat_button.MouseButton1Click:Connect(function()
    deletePlatform()
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
