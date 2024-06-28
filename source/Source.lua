local function safeCall(func, ...)
    local success, result = pcall(func, ...)
    if not success then
        warn("Erro detectado:", result)
    end
end

local Magic = {}
local configHub = {
  backgroundHub = Color3.fromRGB(255, 255, 255),
  corText = Color3.fromRGB(240, 240, 240),
}

local Configs_HUB = {
  Cor_Hub = Color3.fromRGB(15, 15, 15),
  Cor_Options = Color3.fromRGB(15, 15, 15),
  Cor_Stroke = Color3.fromRGB(60, 60, 60),
  Cor_Text = Color3.fromRGB(240, 240, 240),
  Cor_DarkText = Color3.fromRGB(140, 140, 140),
  Corner_Radius = UDim.new(0, 4),
  Cor_OptionsSelected = Color3.fromRGB(240, 0, 0),
  Cor_Pressed = Color3.fromRGB(140, 190, 233),
  Text_Font = Enum.Font.FredokaOne
}

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local function Create(instance, parent, props)
  local new = Instance.new(instance, parent)
  if props then
    for prop, value in pairs(props) do
      new[prop] = value
    end
  end
  return new
end

local function SetProps(instance, props)
  if instance and props then
    for prop, value in pairs(props) do
      instance[prop] = value
    end
  end
  return instance
end

local function Corner(parent, props)
  local new = Create("UICorner", parent)
  new.CornerRadius = Configs_HUB.Corner_Radius
  if props then
    SetProps(new, props)
  end
  return new
end

local function Stroke(parent, props)
  local new = Create("UIStroke", parent)
  new.Color = Configs_HUB.Cor_Stroke
  new.ApplyStrokeMode = "Border"
  if props then
    SetProps(new, props)
  end
  return new
end

local function CreateTween(instance, prop, value, time, tweenWait)
  local tween = TweenService:Create(instance,
  TweenInfo.new(time, Enum.EasingStyle.Linear),
  {[prop] = value})
  tween:Play()
  if tweenWait then
    tween.Completed:Wait()
  end
end

local ScreenGui = Create("ScreenGui", CoreGui, {
  Name = "Pedrax HUB Library"
})

local Notify = Create("Frame", ScreenGui, {
  Size = UDim2.new(0, 300, 1, 0),
  Position = UDim2.new(1, 0, 0, 0),
  AnchorPoint = Vector2.new(1, 0),
  BackgroundTransparency = 1
})

local Padding = Create("UIPadding", Notify, {
  PaddingLeft = UDim.new(0, 25),
  PaddingTop = UDim.new(0, 25),
  PaddingBottom = UDim.new(0, 50)
})

local ListLayout = Create("UIListLayout", Notify, {
  Padding = UDim.new(0, 15),
  VerticalAlignment = "Bottom"
})

function Magic:MakeNotify(Configs)
  local Title = Configs.Title or "Pedrax HUB"
  local text = Configs.Text or "Notificação"
  local timewait = Configs.Time or 5
  
  local Frame1 = Create("Frame", Notify, {
    Size = UDim2.new(2, 0, 0, 0),
    BackgroundTransparency = 1,
    AutomaticSize = "Y",
    Name = "Title"
  })
  
  local Frame2 = Create("Frame", Frame1, {
    Size = UDim2.new(0, Notify.Size.X.Offset - 50, 0, 0),
    BackgroundColor3 = Configs_HUB.Cor_Hub,
    Position = UDim2.new(0, Notify.Size.X.Offset, 0, 0),
    AutomaticSize = "Y"
  })Corner(Frame2)
  
  local TextLabel = Create("TextLabel", Frame2, {
    Size = UDim2.new(1, 0, 0, 25),
    Font = Configs_HUB.Text_Font,
    BackgroundTransparency = 1,
    Text = Title,
    TextSize = 20,
    Position = UDim2.new(0, 20, 0, 5),
    TextXAlignment = "Left",
    TextColor3 = Configs_HUB.Cor_Text
  })
  
  local TextButton = Create("TextButton", Frame2, {
    Text = "X",
    Font = Configs_HUB.Text_Font,
    TextSize = 20,
    BackgroundTransparency = 1,
    TextColor3 = Color3.fromRGB(200, 200, 200),
    Position = UDim2.new(1, -5, 0, 5),
    AnchorPoint = Vector2.new(1, 0),
    Size = UDim2.new(0, 25, 0, 25)
  })
  
  local TextLabel = Create("TextLabel", Frame2, {
    Size = UDim2.new(1, -30, 0, 0),
    Position = UDim2.new(0, 20, 0, TextButton.Size.Y.Offset + 10),
    TextSize = 15,
    TextColor3 = Configs_HUB.Cor_DarkText,
    TextXAlignment = "Left",
    TextYAlignment = "Top",
    AutomaticSize = "Y",
    Text = text,
    Font = Configs_HUB.Text_Font,
    BackgroundTransparency = 1,
    AutomaticSize = Enum.AutomaticSize.Y,
    TextWrapped = true
  })
  
  local FrameSize = Create("Frame", Frame2, {
    Size = UDim2.new(1, 0, 0, 2),
    BackgroundColor3 = Configs_HUB.Cor_Stroke,
    Position = UDim2.new(0, 2, 0, 30),
    BorderSizePixel = 0
  })Corner(FrameSize)Create("Frame", Frame2, {
    Size = UDim2.new(0, 0, 0, 5),
    Position = UDim2.new(0, 0, 1, 5),
    BackgroundTransparency = 1
  })
  
  task.spawn(function()
    CreateTween(FrameSize, "Size", UDim2.new(0, 0, 0, 2), timewait, true)
  end)
  
  TextButton.MouseButton1Click:Connect(function()
    CreateTween(Frame2, "Position", UDim2.new(0, -20, 0, 0), 0.1, true)
    CreateTween(Frame2, "Position", UDim2.new(0, Notify.Size.X.Offset, 0, 0), 0.5, true)
    Frame1:Destroy()
  end)
  
  task.spawn(function()
    CreateTween(Frame2, "Position", UDim2.new(0, -20, 0, 0), 0.5, true)
    CreateTween(Frame2, "Position", UDim2.new(), 0.1, true)task.wait(timewait)
    if Frame2 then
      CreateTween(Frame2, "Position", UDim2.new(0, -20, 0, 0), 0.1, true)
      CreateTween(Frame2, "Position", UDim2.new(0, Notify.Size.X.Offset, 0, 0), 0.5, true)
      Frame1:Destroy()
    end
  end)
end

function handleError(errorMessage)
    Magic:MakeNotify({
        Title = "Erro",
        Text = errorMessage,
        Time = 5
    })
end

function Magic:CreateWindow(Configs)
    local title = Configs.Title or "Magic Library"
    local Window = {}
    local StartSize = 150
    local TabSize = 30
    local ScreenGui = Create("ScreenGui", CoreGui, { Name = title })

    local Menu = Create("Frame", ScreenGui, {
        BackgroundColor3 = Configs_HUB.Cor_Hub,
        Position = UDim2.new(0.5, -250, 0.5, -135),
        Size = UDim2.new(0, 500, 0, 270),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Active = true,
        Draggable = true,
        ZIndex = 1
    })
    Corner(Menu)

    local TopBar = Create("Frame", Menu, {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 25)
    })

    local ButtonsFrame = Create("Frame", TopBar, {
        Size = UDim2.new(0.2, 0, 0.2, 0),
        Position = UDim2.new(1, 0, 0, 17),
        AnchorPoint = Vector2.new(1, 0),
        BackgroundTransparency = 1
    })

    local Title = Create("TextLabel", TopBar, {
        Size = UDim2.new(1, 0, 1, 0),
        Position = UDim2.new(0, 20, 0, 0),
        TextColor3 = Configs_HUB.Cor_Text,
        Font = Configs_HUB.Text_Font,
        TextXAlignment = "Left",
        Text = title,
        TextSize = 20,
        BackgroundTransparency = 1
    })

    local Minimize_BTN = Create("TextButton", ButtonsFrame, {
        Text = "-",
        TextColor3 = Configs_HUB.Cor_Text,
        Size = UDim2.new(0.5, 0, 1, 0),
        BackgroundTransparency = 1,
        Font = Configs_HUB.Text_Font,
        TextYAlignment = "Bottom",
        TextSize = 25
    })

    local IsMinimized = false
    Minimize_BTN.MouseButton1Click:Connect(function()
        IsMinimized = not IsMinimized
        Minimize_BTN.Text = IsMinimized and "+" or "-"
        CreateTween(Menu, "Size", IsMinimized and UDim2.new(0, 500, 0, 25) or UDim2.new(0, 500, 0, 270), 0.15, true)
    end)

    local line_Containers = Create("Frame", Menu, {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0)
    })

    local Close_Button = Create("TextButton", ButtonsFrame, {
        Text = "×",
        TextYAlignment = "Bottom",
        TextColor3 = Configs_HUB.Cor_Text,
        Size = UDim2.new(0.5, 0, 1, 0),
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, 0, 0, 0),
        BackgroundTransparency = 1,
        Font = Configs_HUB.Text_Font,
        TextSize = 25
    })

    local function CreateClose()
        IsMinimized = false
        CreateTween(Menu, "Size", UDim2.new(0, 500, 0, 270), 0.3, false)
        local CloseGui = Create("TextButton", Menu, {
            BackgroundTransparency = 0.5,
            BackgroundColor3 = Configs_HUB.Cor_Hub,
            Size = UDim2.new(1, 0, 1, 0),
            AutoButtonColor = false,
            Text = "",
            Visible = false
        })
        Corner(CloseGui)

        local CloseMenu = Create("Frame", CloseGui, {
            Size = UDim2.new(),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.new(0.5, 0, 0.5, 0),
            Transparency = 1,
            BackgroundColor3 = Configs_HUB.Cor_Hub
        })
        Corner(CloseMenu)
        Stroke(CloseMenu)

        local Mensage = Create("TextLabel", CloseMenu, {
            Size = UDim2.new(0.8, 0, 0.25, 0),
            Text = "Tem certeza que deseja fechar o Script?",
            Position = UDim2.new(0.1, 0, 0.2),
            TextColor3 = Configs_HUB.Cor_Text,
            Font = Configs_HUB.Text_Font,
            TextScaled = true,
            BackgroundTransparency = 1
        })

        local Confirm = Create("TextButton", CloseMenu, {
            Size = UDim2.new(0.35, 0, 0.3, 0),
            Position = UDim2.new(0.1, 0, 0.5, 0),
            BackgroundColor3 = Configs_HUB.Cor_Hub,
            Text = "Fechar Script",
            Font = Configs_HUB.Text_Font,
            TextColor3 = Color3.fromRGB(240, 0, 0),
            TextSize = 20
        })
        Corner(Confirm)
        Stroke(Confirm)

        local Cancel = Create("TextButton", CloseMenu, {
            Size = UDim2.new(0.35, 0, 0.3, 0),
            Position = UDim2.new(0.9, 0, 0.5, 0),
            AnchorPoint = Vector2.new(1, 0),
            BackgroundColor3 = Configs_HUB.Cor_Hub,
            Text = "Cancelar",
            Font = Configs_HUB.Text_Font,
            TextColor3 = Color3.fromRGB(0, 240, 0),
            TextSize = 20
        })
        Corner(Cancel)
        Stroke(Cancel)

        local function SetVisible()
            CloseGui.Visible = Menu.Size.Y.Offset > 100
        end

        SetVisible()
        Menu:GetPropertyChangedSignal("Size"):Connect(SetVisible)

        CreateTween(CloseMenu, "Transparency", 0, 0.2, false)
        CreateTween(CloseMenu, "Size", UDim2.new(0.7, 0, 0.7, 0), 0.2, false)

        local function DestroyCloseGui()
            CreateTween(CloseMenu, "Transparency", 1, 0.3, false)
            CreateTween(CloseMenu, "Size", UDim2.new(), 0.2, true)
            CloseGui:Destroy()
        end

        Cancel.MouseButton1Click:Connect(DestroyCloseGui)
        Confirm.MouseButton1Click:Connect(function()
            CreateTween(Menu, "Transparency", 1, 0.3, false)
            CreateTween(Menu, "Size", UDim2.new(), 0.2, true)
            Menu:Destroy()
            CloseGui:Destroy()
        end)
        CloseGui.MouseButton1Click:Connect(DestroyCloseGui)
    end

    Close_Button.MouseButton1Click:Connect(CreateClose)

    local ScrollBar = Create("ScrollingFrame", Menu, {
        Size = UDim2.new(0, 140, 1, -tonumber(TopBar.Size.Y.Offset + 2)),
        Position = UDim2.new(0, 0, 1, 0),
        AnchorPoint = Vector2.new(0, 1),
        CanvasSize = UDim2.new(),
        ScrollingDirection = "Y",
        AutomaticCanvasSize = "Y",
        BackgroundTransparency = 1,
        ScrollBarThickness = 2
    })
    Create("UIPadding", ScrollBar, {
        PaddingLeft = UDim.new(0, 10),
        PaddingRight = UDim.new(0, 10),
        PaddingTop = UDim.new(0, 10),
        PaddingBottom = UDim.new(0, 10)
    })
    Create("UIListLayout", ScrollBar, {
        Padding = UDim.new(0, 5)
    })

    local Containers = Create("Frame", Menu, {
        Size = UDim2.new(1, -tonumber(ScrollBar.Size.X.Offset + 2), 1, -tonumber(TopBar.Size.Y.Offset + 2)),
        AnchorPoint = Vector2.new(1, 1),
        Position = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1
    })
    Corner(Containers)

    local function Add_Line(props)
        local line = Create("Frame", line_Containers, props)
        line.BackgroundColor3 = Configs_HUB.Cor_Stroke
        line.BorderSizePixel = 0
    end

    Add_Line({Size = UDim2.new(1, 0, 0, 1), Position = UDim2.new(0, 0, 0, TopBar.Size.Y.Offset)})
    Add_Line({Size = UDim2.new(0, 1, 1, -tonumber(TopBar.Size.Y.Offset + 1)),
        Position = UDim2.new(0, ScrollBar.Size.X.Offset, 0, TopBar.Size.Y.Offset)})

    local firstVisible = false
    local FirstTab = true
    local textsize = 15
    local textcolor = Configs_HUB.Cor_Text

    Menu:GetPropertyChangedSignal("Size"):Connect(function()
        if Menu.Size.Y.Offset > 70 then
            ScrollBar.Visible = true
            Containers.Visible = true
            line_Containers.Visible = true
        else
            ScrollBar.Visible = false
            Containers.Visible = false
            line_Containers.Visible = false
        end
    end)

    function Window:MakeTab(Configs)
        local TabName = Configs.Name or "Tab"
        local TabTitle = Configs.TabTitle or false

        local Frame = Create("Frame", ScrollBar, {
            Size = UDim2.new(1, 0, 0, 25),
            BackgroundTransparency = 1
        })
        Corner(Frame)
        Stroke(Frame)

        local TextButton = Create("TextButton", Frame, {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            Text = ""
        })

        local TextLabel = Create("TextLabel", Frame, {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            Font = Configs_HUB.Text_Font,
            TextColor3 = textcolor,
            TextSize = textsize,
            Text = TabName
        })

        local Container = Create("ScrollingFrame", Containers, {
            Size = UDim2.new(1, 0, 1, 0),
            ScrollingDirection = "Y",
            AutomaticCanvasSize = "Y",
            CanvasSize = UDim2.new(),
            BackgroundTransparency = 1,
            ScrollBarThickness = 2,
            Visible = firstVisible
        })
        Create("UIPadding", Container, {
            PaddingLeft = UDim.new(0, 10),
            PaddingRight = UDim.new(0, 10),
            PaddingTop = UDim.new(0, 10),
            PaddingBottom = UDim.new(0, 10)
        })
        Create("UIListLayout", Container, {
            Padding = UDim.new(0, 5)
        })

        if TabTitle then
            Create("TextLabel", Container, {
                BackgroundTransparency = 1,
                Text = "#" .. string.gsub(TabName, " ", "-"),
                TextSize = 25,
                Font = Configs_HUB.Text_Font,
                TextXAlignment = "Left",
                TextColor3 = Configs_HUB.Cor_Text,
                Size = UDim2.new(1, 0, 0, 30),
                Position = UDim2.new(0, 30, 0, 0),
                Name = "Frame"
            })
        end

        TextButton.MouseButton1Click:Connect(function()
            for _, container in pairs(Containers:GetChildren()) do
                if container:IsA("ScrollingFrame") then
                    container.Visible = false
                end
            end
            for _, frame in pairs(ScrollBar:GetChildren()) do
                if frame:IsA("Frame") and frame:FindFirstChild("TextLabel") and frame.TextLabel ~= TextLabel then
                    CreateTween(frame.TextLabel, "TextColor3", Configs_HUB.Cor_DarkText, 0.3, false)
                    frame.TextLabel.TextSize = 14
                end
            end
            Container.Visible = true
            CreateTween(TextLabel, "TextColor3", Configs_HUB.Cor_Text, 0.3, false)
            TextLabel.TextSize = 15
        end)

        firstVisible = false
        FirstTab = false
        textsize = 14
        textcolor = Configs_HUB.Cor_DarkText

        return Container
    end
    
    function Window:addSection(parent, Configs)
        local SectionName = Configs[1] or Configs.Name or "Section!!"
        local firstVisible = Configs.Visible or true
        
        -- Criação do container da seção
        local ContainerSection = Create("ScrollingFrame", parent, {
            Size = UDim2.new(1, 0, 1, 0),
            ScrollingDirection = Enum.ScrollingDirection.Y,
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            CanvasSize = UDim2.new(),
            BackgroundTransparency = 1,
            ScrollBarThickness = 2,
            Visible = firstVisible
        })
        
        Create("UIPadding", ContainerSection, {
            PaddingLeft = UDim.new(0, 10),
            PaddingRight = UDim.new(0, 10),
            PaddingTop = UDim.new(0, 10),
            PaddingBottom = UDim.new(0, 10)
        })
        
        Create("UIListLayout", ContainerSection, {
            Padding = UDim.new(0, 5),
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    
        -- Criação do frame da seção
        local Frame = Create("Frame", ContainerSection, {
            Size = UDim2.new(1, 0, 0, 25),
            BackgroundColor3 = Configs_HUB.Cor_Hub,
            Name = "Frame",
            Transparency = 1,
            LayoutOrder = 1,
            AutomaticSize = Enum.AutomaticSize.Y
        })
        Corner(Frame)
        
        -- Criação do botão de título da seção
        local TextButton = Create("TextButton", Frame, {
            TextSize = 14,
            TextColor3 = Configs_HUB.Cor_DarkText,
            Text = SectionName,
            Size = UDim2.new(1, 0, 0, 25),
            Position = UDim2.new(0, 0, 0, 0),
            BackgroundTransparency = 1,
            TextXAlignment = Enum.TextXAlignment.Left,
            Font = Configs_HUB.Text_Font
        })
    
        return ContainerSection
    end
    
    function Window:AddButton(parent, Configs)
        local function addButton()
            local ButtonName = Configs.Name or "Button!!"
            local Callback = Configs.Callback or function() end
    
            local TextButton = Create("TextButton", parent, {
                Size = UDim2.new(1, 0, 0, 25),
                BackgroundColor3 = Configs_HUB.Cor_Options,
                Name = "ButtonFrame",
                Text = "",
                AutoButtonColor = false,
                LayoutOrder = #parent:GetChildren() + 1
            })
            Corner(TextButton)
            Stroke(TextButton)
    
            local TextLabel = Create("TextLabel", TextButton, {
                TextSize = 12,
                TextColor3 = Configs_HUB.Cor_Text,
                Text = ButtonName,
                Size = UDim2.new(1, 0, 1, 0),
                Position = UDim2.new(0, 35, 0, 0),
                BackgroundTransparency = 1,
                TextXAlignment = Enum.TextXAlignment.Left,
                Font = Configs_HUB.Text_Font
            })
    
            local ImageLabel = Create("ImageLabel", TextButton, {
                Image = "rbxassetid://15155219405",
                Size = UDim2.new(0, 20, 0, 20),
                Position = UDim2.new(0, 5, 0, 2.5),
                BackgroundTransparency = 1,
                ImageColor3 = Configs_HUB.Cor_Stroke
            })
    
            TextButton.MouseButton1Click:Connect(function()
                Callback("Click!!")
                CreateTween(ImageLabel, "ImageColor3", Color3.fromRGB(30, 140, 200), 0.2, true)
                CreateTween(ImageLabel, "ImageColor3", Configs_HUB.Cor_Stroke, 0.2, false)
            end)
    
            TextSetColor(TextLabel)
            return TextButton
        end
    
        safeCall(addButton)
    end
    
    function Window:AddToggle(parent, Configs)
        local ToggleName = Configs.Name or "Toggle!!"
        local Default = Configs.Default or false
        local Callback = Configs.Callback or function() end
        
        local TextButton = Create("TextButton", parent, {
          Size = UDim2.new(1, 0, 0, 25),
          BackgroundColor3 = Configs_HUB.Cor_Options,
          Name = "Frame",
          Text = "",
          AutoButtonColor = false,
          LayoutOrder = #parent:GetChildren() + 1
        })Corner(TextButton)Stroke(TextButton)
        
        local TextLabel = Create("TextLabel", TextButton, {
          TextSize = 12,
          TextColor3 = Configs_HUB.Cor_Text,
          Text = ToggleName,
          Size = UDim2.new(1, 0, 1, 0),
          Position = UDim2.new(0, 35, 0, 0),
          BackgroundTransparency = 1,
          TextXAlignment = "Left",
          Font = Configs_HUB.Text_Font
        })
        
        local Frame1 = Create("Frame", TextButton, {
          Size = UDim2.new(0, 25, 0, 15),
          Position = UDim2.new(0, 5, 0, 5),
          BackgroundTransparency = 1,
        })Corner(Frame1, {CornerRadius = UDim.new(1, 0)})
        local Stroke = Stroke(Frame1, {Thickness = 2})
        
        local Frame2 = Create("Frame", Frame1, {
          Size = UDim2.new(0, 13, 0, 13),
          Position = UDim2.new(0, 2, 0.5, 0),
          AnchorPoint = Vector2.new(0, 0.5),
          BackgroundColor3 = Configs_HUB.Cor_Stroke
        })Corner(Frame2, {CornerRadius = UDim.new(1, 0)})
        
        local OnOff = false
        if Default then
          OnOff = true
          CreateTween(Frame2, "Position", UDim2.new(0, 10, 0.5, 0), 0.2, false)
          CreateTween(Frame2, "BackgroundColor3", Color3.fromRGB(30, 140, 200), 0.2, false)
          CreateTween(Stroke, "Color", Color3.fromRGB(30, 140, 200), 0.2, false)
          CreateTween(TextLabel, "TextColor3", Color3.fromRGB(30, 140, 200), 0.2, false)
        end
        Callback(OnOff)
        TextButton.MouseButton1Click:Connect(function()
          if Frame2.Position.X.Offset < 5 then
            OnOff = true
            CreateTween(Frame2, "Position", UDim2.new(0, 10, 0.5, 0), 0.2, false)
            CreateTween(Frame2, "BackgroundColor3", Color3.fromRGB(30, 140, 200), 0.2, false)
            CreateTween(Stroke, "Color", Color3.fromRGB(30, 140, 200), 0.2, false)
            CreateTween(TextLabel, "TextColor3", Color3.fromRGB(30, 140, 200), 0.2, false)
            Callback(true)
          else
            OnOff = false
            CreateTween(Frame2, "Position", UDim2.new(0, 2, 0.5, 0), 0.2, false)
            CreateTween(Frame2, "BackgroundColor3", Configs_HUB.Cor_Stroke, 0.2, false)
            CreateTween(Stroke, "Color", Configs_HUB.Cor_Stroke, 0.2, false)
            CreateTween(TextLabel, "TextColor3", Configs_HUB.Cor_Text, 0.2, false)
            Callback(false)
          end
        end)
        return {Frame2, Stroke, OnOff, Callback}
    end
    
    -- Função para criar o botão de slide
    function Window:AddSlider(parent, Configs)
        local SliderName = Configs.Name or "Slider"
        local Min = Configs.Min or 0
        local Max = Configs.Max or 100
        local DefaultValue = Configs.DefaultValue or Min
        local Callback = Configs.Callback or function() end
    
        -- Frame da barra de deslizamento
        local SliderFrame = Create("Frame", parent, {
            Size = UDim2.new(1, 0, 0, 50),
            BackgroundTransparency = 1,
            LayoutOrder = #parent:GetChildren() + 1
        })
        Create("UIListLayout", SliderFrame, {
            Padding = UDim.new(0, 5),
            FillDirection = Enum.FillDirection.Vertical,
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    
        -- Label do slider
        Create("TextLabel", SliderFrame, {
            Text = SliderName,
            TextSize = 14,
            TextColor3 = Configs_HUB.Cor_Text,
            Size = UDim2.new(1, 0, 0, 20),
            BackgroundTransparency = 1,
            TextXAlignment = Enum.TextXAlignment.Left,
            Font = Configs_HUB.Text_Font
        })
    
        -- Barra de fundo do slider
        local BackgroundBar = Create("Frame", SliderFrame, {
            Size = UDim2.new(1, -20, 0, 10),
            Position = UDim2.new(0, 10, 0, 30),
            BackgroundColor3 = Configs_HUB.Cor_Options,
            BorderSizePixel = 0
        })
        Corner(BackgroundBar)
        Stroke(BackgroundBar)
    
        -- Indicador do valor atual do slider
        local SliderIndicator = Create("Frame", BackgroundBar, {
            Size = UDim2.new((DefaultValue - Min) / (Max - Min), 0, 1, 0),
            BackgroundColor3 = Configs_HUB.Cor_Stroke,
            BorderSizePixel = 0
        })
        Corner(SliderIndicator)
        
        -- Função para atualizar o valor do slider
        local function UpdateSlider(input)
            local RelativeX = input.Position.X - BackgroundBar.AbsolutePosition.X
            local Percent = math.clamp(RelativeX / BackgroundBar.AbsoluteSize.X, 0, 1)
            local Value = Min + Percent * (Max - Min)
            SliderIndicator.Size = UDim2.new(Percent, 0, 1, 0)
            Callback(Value)
        end
    
        -- Conectar eventos de input ao slider
        local UserInputService = game:GetService("UserInputService")
        local dragging = false
    
        BackgroundBar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                SliderIndicator.BackgroundColor3 = Configs_HUB.Cor_Pressed -- Cor ao pressionar
                UpdateSlider(input)
            end
        end)
    
        BackgroundBar.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = false
                SliderIndicator.BackgroundColor3 = Configs_HUB.Cor_Stroke -- Cor padrão
            end
        end)
    
        UserInputService.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                UpdateSlider(input)
            end
        end)
        
        return SliderFrame
    end
    
    function Window:AddDropdown(parent, Configs)
        local DropdownName = Configs.Name or "Dropdown"
        local Options = Configs.Options or {}
        local Callback = Configs.Callback or function() end
        local Selected = Configs.Default or Options[1]
        local IsOpen = false
    
        -- Frame do dropdown
        local DropdownFrame = Create("Frame", parent, {
            Size = UDim2.new(1, 0, 0, 25),
            BackgroundColor3 = Configs_HUB.Cor_Options,
            BorderSizePixel = 0,
            ClipsDescendants = true,
            LayoutOrder = #parent:GetChildren() + 1
        })
        Corner(DropdownFrame)
        Stroke(DropdownFrame)
    
        -- Texto do dropdown
        local DropdownText = Create("TextLabel", DropdownFrame, {
            Text = DropdownName .. ": " .. Selected,
            TextSize = 14,
            TextColor3 = Configs_HUB.Cor_Text,
            Size = UDim2.new(1, -20, 1, 0),
            Position = UDim2.new(0, 10, 0, 0),
            BackgroundTransparency = 1,
            TextXAlignment = Enum.TextXAlignment.Left,
            Font = Configs_HUB.Text_Font
        })
    
        -- Botão para abrir/fechar o dropdown
        local DropdownButton = Create("TextButton", DropdownFrame, {
            Text = "",
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            AutoButtonColor = false
        })
    
        -- Frame para conter as opções com barra de rolagem
        local OptionsFrame = Create("ScrollingFrame", parent, {
            Size = UDim2.new(1, 0, 0, math.min(150, #Options * 30)), -- Altura máxima de 150 ou ajusta conforme o número de opções
            Position = UDim2.new(0, 0, 0, 25),
            BackgroundColor3 = Configs_HUB.Cor_Options,
            BorderSizePixel = 0,
            Visible = false,
            ClipsDescendants = true,
            ScrollBarThickness = 6,
            CanvasSize = UDim2.new(0, 0, 0, #Options * 30),
            LayoutOrder = #parent:GetChildren() + 2
        })
        Corner(OptionsFrame)
        Stroke(OptionsFrame)
    
        -- Layout para as opções
        local OptionsLayout = Create("UIListLayout", OptionsFrame, {
            Padding = UDim.new(0, 5),
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    
        -- Adicionar opções ao dropdown
        for i, option in ipairs(Options) do
            local OptionButton = Create("TextButton", OptionsFrame, {
                Text = option,
                TextSize = 14,
                TextColor3 = Configs_HUB.Cor_Text,
                Size = UDim2.new(1, 0, 0, 25),
                BackgroundTransparency = 1,
                AutoButtonColor = false,
                LayoutOrder = i
            })
    
            OptionButton.MouseButton1Click:Connect(function()
                DropdownText.Text = DropdownName .. ": " .. option
                Selected = option
                OptionsFrame.Visible = false
                IsOpen = false
                DropdownFrame.BackgroundColor3 = Configs_HUB.Cor_Options
                Callback(option)
            end)
        end
    
        -- Conectar evento para abrir/fechar o dropdown
        DropdownButton.MouseButton1Click:Connect(function()
            IsOpen = not IsOpen
            OptionsFrame.Visible = IsOpen
            DropdownFrame.BackgroundColor3 = IsOpen and Configs_HUB.Cor_OptionsSelected or Configs_HUB.Cor_Options
        end)
    
        return DropdownFrame
    end
      
    function Window:SetSection(Section, NewName)
            for _, child in ipairs(Section:GetChildren()) do
                if child:IsA("TextButton") then
                    child.Text = NewName
                    break
                end
            end
        end
    
    return Window
end


return Magic