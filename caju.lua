local UILib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/srpedrax/PedraxLib/main/Source.lua')))()

-- Função para adicionar um botão com tratamento de erros usando MakeNotify
local function addButtonSafe(window, parent, Configs)
    local success, result = pcall(function()
        return window:AddButton(parent, Configs)
    end)
    if not success then
        UILib:MakeNotify({
            Title = "Erro ao adicionar botão",
            Text = tostring(result), -- Converte o erro para string para exibição
            Time = 3
        })
    end
end

-- Cria a UI UILib com tratamento de erros
local success, window = pcall(function()
    return UILib:CreateWindow("Minha Janela")
end)
if not success then
    UILib:MakeNotify({
        Title = "Erro ao criar janela UI",
        Text = tostring(window), -- Converte o erro para string para exibição
        Time = 3
    })
    return
end

-- Cria uma aba na janela com tratamento de erros
local success, tab1 = pcall(function()
    return window:MakeTab({
        Name = "Tab One Text",
        TabTitle = true
    })
end)
if not success then
    UILib:MakeNotify({
        Title = "Erro ao criar aba na janela",
        Text = tostring(tab1), -- Converte o erro para string para exibição
        Time = 3
    })
    return
end

-- Adiciona uma seção à aba Tab1 com tratamento de erros
local success, section = pcall(function()
    return window:addSection(tab1, {
        Name = "Seção 1"
    })
end)
if not success then
    UILib:MakeNotify({
        Title = "Erro ao adicionar seção",
        Text = tostring(section), -- Converte o erro para string para exibição
        Time = 3
    })
    return
end

-- Adiciona um botão à seção criada com tratamento de erros
addButtonSafe(window, section, {
    Name = "Segundo Botão",
    Callback = function()
        UILib:MakeNotify({
            Title = "Clicado!",
            Text = "Botão 'Segundo Botão' foi clicado.",
            Time = 2
        })
    end
})

-- Adiciona o segundo botão à seção criada com tratamento de erros
addButtonSafe(window, section, {
    Name = "Btn 1",
    Callback = function()
        print("Clicked")
    end
})

local UILib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/srpedrax/PedraxLib/main/Source.lua')))()

-- Cria a janela UI usando UILib
local window = UILib:CreateWindow("Minha Janela")

-- Cria uma aba na janela
local tab1 = window:MakeTab({
    Name = "Tab One Text",
    TabTitle = true
})

-- Adiciona uma seção à aba Tab1
local section = window:addSection(tab1, {
    Name = "Seção 1"
})

window:AddSlider(section, {
    Name = "Volume",
    Min = 0,
    Max = 100,
    DefaultValue = 50,
    Callback = function(value)
        UILib:MakeNotify({
            Title = "Slider Atualizado",
            Text = "Novo valor: " .. tostring(value),
            Time = 2
        })
    end
})

window:AddToggle(section, {
  Name = "Toogle Test",
  Default = false,
  Callback = function()
    UILib:MakeNotify({
              Title = "Clicado!",
              Text = "Botão foi clicado.",
              Time = 2
          })
    end
})

-- Adiciona um botão à seção criada
window:AddButton(section, {
    Name = "Segundo Botão",
    Callback = function()
        UILib:MakeNotify({
            Title = "Clicado!",
            Text = "Botão 'Segundo Botão' foi clicado.",
            Time = 2
        })
    end
})

-- Adiciona o segundo botão à seção criada
window:AddButton(section, {
    Name = "Btn 1",
    Callback = function()
        print("Clicked")
    end
})

window:AddDropdown(section, {
    Name = "Escolha uma opção",
    Options = {"Opção 1", "Opção 2", "Opção 3", "Opção 1", "Opção 2", "Opção 3", "Opção 1", "Opção 2", "Opção 3", "Opção 1", "Opção 2", "Opção 3", "Opção 1", "Opção 2", "Opção 3", "Opção 1", "Opção 2", "Opção 3", },
    Default = "Opção 2",
    Callback = function(selectedOption)
        UILib:MakeNotify({
            Title = "Opção Selecionada",
            Text = "Você escolheu: " .. selectedOption,
            Time = 2
        })
    end
})