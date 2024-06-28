# Magic Library

![Magic Library Logo](https://i.imgur.com/lC3HQDo.png)

Welcome to **Magic Library** UI for Roblox!

## How to Use
Learn how to use Magic Library

### Import Magic Library
```lua
local Magic = loadstring(game:HttpGet(('https://raw.githubusercontent.com/srpedrax/Magic-Library/main/source/Source.lua')))()
```

### Notification
Create a notification
```lua
Magic:MakeNotify({
  Title = "Magic Library",
  Text = "Thank you for using Magic",
  Time = 5
})
```

- **Title** [\<string\>](https://www.lua.org/pil/2.4.html): Notification title
- **Text** [\<string\>](https://www.lua.org/pil/2.4.html): Notification text
- **Time** [\<number\>](https://www.lua.org/pil/2.3.html): Time in seconds the notification will be visible

### Create Initial Window
```lua
local Window = Magic:CreateWindow({
  Title = "Magic Library"
})
```
- **Title** [\<string\>](https://www.lua.org/pil/2.4.html): Your script's title

### Tab
Create a Tab
```lua
local tab = Window:MakeTab({
    Name = "Main",
    TabTitle = true
})
```
- **Name** [\<string\>](https://www.lua.org/pil/2.4.html): Tab name
- **TabTitle** [\<boolean\>](https://www.lua.org/pil/2.2.html): Content title (optional)

### Section
Create a Section
```lua
local section = Window:addSection(tab, {
  Name = "Home"
})
```
- **tab**: Tab where your section will be added
- **Name** [\<string\>](https://www.lua.org/pil/2.4.html): Section name

### Button
Create a Button
```lua
Window:AddButton(section, {
  Name = "Button",
  Callback = function()
    Magic:MakeNotify({
      Title = "Magic Logs",
      Text = "Button Clicked!",
      Time = 3
    })
  end
})
```
- **Name** [\<string\>](https://www.lua.org/pil/2.4.html): Button name
- **Callback**: Function to execute after button click

### Toggle
Create a toggle switch where you can switch between true/false
```lua
Window:AddToggle(section, {
  Name = "Toggle",
  Default = false,
  Callback = function()
    Magic:MakeNotify({
      Title = "Magic Logs",
      Text = "Toggle Button Clicked!",
      Time = 3
    })
  end
})
```
- **Name** [\<string\>](https://www.lua.org/pil/2.4.html): Toggle button name
- **Default** [\<boolean\>](https://www.lua.org/pil/2.2.html): true starts activated, false starts deactivated
- **Callback**: Function to execute after toggle button click

### Slider
Create a slider control
```lua
Window:AddSlider(section, {
    Name = "Slider",
    Min = 0,
    Max = 100,
    DefaultValue = 50,
    Callback = function(value)
      Magic:MakeNotify({
        Title = "Slider Updated",
        Text = "New value: " .. tostring(value),
        Time = 2
      })
    end
})
```
- **Name** [\<string\>](https://www.lua.org/pil/2.4.html): Slider name
- **Min** [\<number\>](https://www.lua.org/pil/2.3.html): Minimum value of the slider (recommended 0)
- **Max** [\<number\>](https://www.lua.org/pil/2.3.html): Maximum value of the slider
- **DefaultValue** [\<number\>](https://www.lua.org/pil/2.3.html): Initial value of the slider
- **Callback**: Function to execute when sliding the slider (note: `value` is the returned value)

### Dropdown Menu
```lua
window:AddDropdown(section, {
    Name = "Choose an Option",
    Options = {"Option 1", "Option 2", "Option 3"},
    Default = "Option 2",
    Callback = function(selectedOption)
        Magic:MakeNotify({
            Title = "Selected Option",
            Text = "You chose: " .. selectedOption,
            Time = 2
        })
    end
})
```
- **Name** [\<string\>](https://www.lua.org/pil/2.4.html): Menu name
- **Options** [\<object\>](https://www.lua.org/pil/2.5.html): Menu options list
- **Default** [\<string\>](https://www.lua.org/pil/2.4.html): Initially selected option
- **Callback**: Function to execute when selecting an option

## Information
Current Version: [BETA] v0.0.1  
Created on: 24/06/2024  
Published on: 28/06/2024  
Creator: **srpedrax**  
Last Updated: 28/06/2024

# Magic Library - Make Magic