# Magic Library

![Magic Library Logo](https://i.imgur.com/lC3HQDo.png)

Bem-vindo à **Magic Library** UI Roblox!

## Modo de Uso
Aprenda a usar a Magic Library

### Importar a Magic
```lua
local Magic = loadstring(game:HttpGet(('https://raw.githubusercontent.com/srpedrax/Magic-Library/main/source/Source.lua')))()
```

### Notificação
Criar uma notificação
```lua
Magic:MakeNotify({
  Title = "Magic Library",
  Text = "Obrigado por usar a Magic",
  Time = 5
})
```

- **Title** [\<string\>](https://www.lua.org/pil/2.4.html): Título da notificação
- **Text** [\<string\>](https://www.lua.org/pil/2.4.html): Texto da notificação
- **Time** [\<number\>](https://www.lua.org/pil/2.3.html): Tempo em segundos que a notificação ficará visível

### Criar a Janela Inicial
```lua
local Window = Magic:CreateWindow({
  Title = "Magic Library"
})
```
- **Title** [\<string\>](https://www.lua.org/pil/2.4.html): Título do seu Script

### Tab
Criar uma Guia
```lua
local tab = Window:MakeTab({
    Name = "Main",
    TabTitle = true
})
```
- **Name** [\<string\>](https://www.lua.org/pil/2.4.html): Nome do Guia
- **TabTitle** [\<boolean\>](https://www.lua.org/pil/2.2.html): Título de conteúdo (opcional)

### Sessão
Cria uma sessão
```lua
local section = Window:addSection(tab, {
  Name = "Home"
})
```
- **tab**: Guia onde sua sessão será adicionada
- **Name** [\<string\>](https://www.lua.org/pil/2.4.html): Nome da sessão

### Botão
Cria um botão
```lua
Window:AddButton(section, {
  Name = "Botão",
  Callback = function()
    Magic:MakeNotify({
      Title = "Magic Logs",
      Text = "Botão Clicado!",
      Time = 3
    })
  end
})
```
- **Name** [\<string\>](https://www.lua.org/pil/2.4.html): Nome do seu botão
- **Callback**: Função que será executada após o clique do botão

### Alternar (Toggle)
Cria uma caixa de seleção onde você pode alternar entre true/false
```lua
Window:AddToggle(section, {
  Name = "Toggle",
  Default = false,
  Callback = function()
    Magic:MakeNotify({
      Title = "Magic Logs",
      Text = "Botão 'toggle' clicado!",
      Time = 3
    })
  end
})
```
- **Name** [\<string\>](https://www.lua.org/pil/2.4.html): Nome do botão
- **Default** [\<boolean\>](https://www.lua.org/pil/2.2.html): true define que começa ativado e false define que começará desativado
- **Callback**: Função que será executada após o clique do botão

### Controle deslizante
Cria um controle deslizante
```lua
Window:AddSlider(section, {
    Name = "Slide",
    Min = 0,
    Max = 100,
    DefaultValue = 50,
    Callback = function(value)
      Magic:MakeNotify({
        Title = "Slider Atualizado",
        Text = "Novo valor: " .. tostring(value),
        Time = 2
      })
    end
})
```
- **Name** [\<string\>](https://www.lua.org/pil/2.4.html): Nome do slide
- **Min** [\<number\>](https://www.lua.org/pil/2.3.html): Valor mínimo do slide (aconselhável 0)
- **Max** [\<number\>](https://www.lua.org/pil/2.3.html): Valor máximo do slide
- **DefaultValue** [\<number\>](https://www.lua.org/pil/2.3.html): Valor inicial do slide
- **Callback**: Função que será executada ao deslizar o slide (nota: `value` é o valor que será retornado)

