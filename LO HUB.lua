Theme = "Light"

--------------------------------------------------------------------------
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingyan777/roblox/refs/heads/main/main.lua"))()


WindUI:Notify({
    Title = "LO HUBscript",
    Content = "执行成功",
    Duration = 4
})

function gradient(text, startColor, endColor)
    local result = ""
    local length = #text

    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r = math.floor((startColor.R + (endColor.R - startColor.R) * t) * 255)
        local g = math.floor((startColor.G + (endColor.G - startColor.G) * t) * 255)
        local b = math.floor((startColor.B + (endColor.B - startColor.B) * t) * 255)

        local char = text:sub(i, i)
        result = result .. "<font color=\"rgb(" .. r ..", " .. g .. ", " .. b .. ")\">" .. char .. "</font>"
    end

    return result
end

local Confirmed = false

WindUI:Popup({
    Title = "LOHUB",
    IconThemed = true,
    Content = "永久免费 ",
    Theme = "Light",
    Buttons = {
        {
            Title = "退出",
            Callback = function() end,
            Variant = "Secondary",
        },
        {
            Title = "进入",
            Icon = "arrow-right",
            Callback = function() Confirmed = true end,
            Variant = "Primary",
        }
    }
})

repeat wait() until Confirmed

local Window = WindUI:CreateWindow({
    Title = "LO HUB",
    Icon = "rbxassetid://4483362748",
    IconThemed = true,
    Folder = "LOScript",
    Size = UDim2.fromOffset(580, 340),
    Transparent = true,
    Theme = "Light",
    User = { Enabled = true },
    SideBarWidth = 200,
    ScrollBarEnabled = true
    -- 已删除 KeySystem 配置项，彻底取消卡密验证
})


Window:Tag({
    Title = "by Ljo | 当前版本=V1", -- 合并标题为1个，避免重复；用“|”分隔更清晰
    Color = Color3.fromHex("#ff0000") -- 红色（#ff0000），若需半透明用Color4，示例见下方说明
})


Window:EditOpenButton({
    Title = "LO HUB",
    Icon = "rbxassetid://6026568198",
    CornerRadius = UDim.new(0,16),
    Size = UDim2.fromOffset(2000, 2000),
    StrokeThickness = 2,
    Theme = "Light",
    
    Draggable = true,
})

local Tabs = {}

Tabs.ElementsSection = Window:Section({
    Title = "脚本",
    Icon = "rbxassetid://6026568198",
    Opened = true,
})

Tabs.ZhuanmenSection = Window:Section({
    Title = "专门脚本",
    Opened = true,
})

Tabs.WindowSection = Window:Section({
    Title = "窗口管理",
    Icon = "app-window-mac",
    Opened = true,
})

Tabs.ParagraphTab = Tabs.ElementsSection:Tab({ Title = "首页", Icon = "type" })
Tabs.ButtonTab = Tabs.ElementsSection:Tab({ Title = "脚本", Icon = "mouse-pointer-2" })
Tabs.FE1Tab = Tabs.ElementsSection:Tab({ Title = "FE脚本", Icon = "paintbrush" })
Tabs.ESPTab = Tabs.ElementsSection:Tab({ Title = "透视", Icon = "mouse-pointer-2" })
Tabs.ActionTab = Tabs.ElementsSection:Tab({ Title = "动作", Icon = "paintbrush" })
Tabs.otherTab = Tabs.ElementsSection:Tab({ Title = "其它脚本中心", Icon = "toggle-left" })
Tabs.PictureTab = Tabs.ElementsSection:Tab({ Title = "画面", Icon = "toggle-left" })
Tabs.MusicTab = Tabs.ElementsSection:Tab({ Title = "音乐", Icon = "paintbrush" })
Tabs.DevelopmentTab = Tabs.ElementsSection:Tab({ Title = "开发", Icon = "toggle-left" })
Tabs.BeiyiqiTab = Tabs.ZhuanmenSection:Tab({ Title = "被遗弃", Icon = "type" })
Tabs.N99NightTab = Tabs.ZhuanmenSection:Tab({ Title = "99夜", Icon = "type" })
Tabs.Kongbudianti = Tabs.ZhuanmenSection:Tab({ Title = "疯狂电梯", Icon = "type" })
Tabs.Smallgames = Tabs.ZhuanmenSection:Tab({ Title = "史诗小游戏", Icon = "type" })
Tabs.Shangu = Tabs.ZhuanmenSection:Tab({ Title = "山谷监狱", Icon = "type" })
Tabs.doorsTab = Tabs.ZhuanmenSection:Tab({ Title = "DOORS", Icon = "type" })
Tabs.famudahengTab = Tabs.ZhuanmenSection:Tab({ Title = "伐木大亨", Icon = "type" })



Tabs.WindowTab = Tabs.WindowSection:Tab({ 
    Title = "窗口和文件配置", 
    Icon = "settings", 
    ShowTabTitle = true 
})
Tabs.CreateThemeTab = Tabs.WindowSection:Tab({ Title = "创建主题", Icon = "palette" })

Window:SelectTab(1)

Tabs.ParagraphTab:Paragraph({
    Title = "LO HUB脚本",
    Desc = "万物合一",
    Image = "https://imgse.com/content/images/users/pGe6Fx/av_1757738704.jpg?use_xbridge3=true&loader_name=forest&need_sec_link=1&sec_link_scene=im&theme=light&theme=light",
    ImageSize = 42,
    Thumbnail = "https://imgse.com/content/images/users/pGe6Fx/av_1757738704.jpg?use_xbridge3=true&loader_name=forest&need_sec_link=1&sec_link_scene=im&theme=light&theme=light",
    ThumbnailSize = 200
})


Tabs.ParagraphTab:Paragraph({
    Title = "您的注入器: " .. identifyexecutor(),
})

Tabs.ParagraphTab:Paragraph({
    Title = "您的用户名: " .. game.Players.LocalPlayer.Name
})

Tabs.ParagraphTab:Paragraph({
    Title = "您当前服务器ID: " .. tostring(game.GameId),
    Callback = function()
        setclipboard(tostring(game.GameId))
    end
})

local TimeTag = Window:Tag({
    Title = "00:00", 
    Color = Color3.fromRGB(255, 255, 255) 
})

local hue = 0
task.spawn(function()
    while true do
        local now = os.date("*t")
        local hours = string.format("%02d", now.hour)
        local minutes = string.format("%02d", now.min)
        local timeString = hours .. ":" .. minutes
        TimeTag:SetTitle(timeString)
        task.wait(0.06)
    end
end)


    

-------------------------------------通用-------------------------------------
Tabs.ParagraphTab:Slider({
    Title = "跳跃",
    Value = {
        Min = 50,
        Max = 200,
        Default = 50,
    },
    Increment = 1,
    Callback = function(value)
        if game.Players.LocalPlayer.Character then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
        end
    end
})

Tabs.ParagraphTab:Slider({
    Title = "移速",
    Value = {
        Min = -10,
        Max = 200,
        Default = 16,
    },
    Increment = 1,
    Callback = function(value)
        if game.Players.LocalPlayer.Character then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
            
        end
    end
})

Tabs.ParagraphTab:Slider({
    Title = "重力",
    Value = {
        Min = 0.1,
        Max = 500.0,
        Default = 196.2,
    },
    Step = 0.1,
    Callback = function(value)
        game.Workspace.Gravity = value
        
    end
})

local Lighting = game:GetService("Lighting")
local NightVisionEnabled = false

local NightVisionToggle = Tabs.ParagraphTab:Toggle({
    Title = "夜视模式",
    Description = "增强环境光照",
    Value = false,
    Callback = function(state)
        NightVisionEnabled = state
        Lighting.Ambient = state and Color3.new(1, 1, 1) or Color3.new(0, 0, 0)
        
        if state then
            task.spawn(function()
                while NightVisionEnabled do
                    Lighting.Ambient = Color3.new(1, 1, 1)
                    task.wait(0.5)
                end
            end)
        end
    end
})

local AutoDigState = false
local AutoDig = Tabs.ParagraphTab:Toggle({
    Title = "自动刷资源",
    Value = false,
    Callback = function(state)
        AutoDigState = state
        if state then
            task.spawn(function()
                local digEvent = game:GetService("ReplicatedStorage"):WaitForChild("ClientEffects"):WaitForChild("Dig")
                local player = game:GetService("Players").LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()

                while AutoDigState do
                    local rootPart = character:FindFirstChild("HumanoidRootPart")
                    if not rootPart then
                        task.wait(0.1)
                        continue
                    end

                    local offset = Vector3.new(
                        math.random(-5, 5),
                        0,
                        math.random(-5, 5)
                    )
                    local digPosition = rootPart.Position + offset

                    digEvent:FireServer(digPosition, Enum.Material.Grass)
                    task.wait(0.5)
                end
            end)
        end
    end
})

local YinyingState = false
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")

local Yinying = Tabs.ParagraphTab:Toggle({
    Title = "关闭阴影",
    Value = false,
    Callback = function(state)
        YinyingState = state
        
        local function ApplySettings()
            Lighting.GlobalShadows = not state
            Lighting.ShadowSoftness = state and 0 or 1
            Lighting.FogEnd = state and 9e9 or 1000
        end

        if state then
            task.spawn(function()
                while YinyingState do
                    ApplySettings()
                    task.wait(0.3)
                end
                ApplySettings()
            end)
        else
            ApplySettings()
        end
    end
})

RunService.Heartbeat:Connect(function()
    if YinyingState then
        Lighting.GlobalShadows = false
    end
end)


local Noclip = false
local NoclipConnection
local Player = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")

Tabs.ParagraphTab:Toggle({
    Title = "穿墙",
    Value = false,
    Callback = function(state)
        Noclip = state
        
        if NoclipConnection then
            NoclipConnection:Disconnect()
            NoclipConnection = nil
        end

        if state then
            NoclipConnection = RunService.Stepped:Connect(function()
                local character = Player.Character
                if not character then return end
                
                for _, part in pairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end)
        else
            local character = Player.Character
            if character then
                for _, part in pairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
            end
        end
    end
})

Tabs.ParagraphTab:Button({
    Title = "旋转",
    Callback = function()
        local speed = ZhuansuInput

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
    end
})

Tabs.ParagraphTab:Button({
    Title = "停止旋转",
    Callback = function()
        local speed = 0

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"

    end
})

Tabs.ParagraphTab:Button({
    Title = "娱乐旋转",
    Callback = function()
        loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/JsYb666/TUIXUI_qun-809771141/refs/heads/TUIXUI/fling"))()
    end
})



---------------------------------------------------------------------------------------------------------------

Tabs.ButtonTab:Button({
    Title = "视角锁定",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ccacca444/scripts1/main/locking.lua"))()
    end
})

Tabs.ButtonTab:Button({
    Title = "无限跳",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0", true))()
        
    end
})

Tabs.ButtonTab:Button({
    Title = "飞行",
    Callback = function()
        loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/Xingtaiduan/Script/main/Content/FlyGuiV3"))()
        
    end
})

Tabs.ButtonTab:Button({
    Title = "飞车",
    Callback = function()
        loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/Xingtaiduan/Script/main/Content/VehicleFly"))()
        
    end
})

Tabs.ButtonTab:Button({
    Title = "飞车2",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingyan777/roblox/refs/heads/main/%E9%A3%9E%E8%BD%A62.lua"))()
        
    end
})

Tabs.ButtonTab:Button({
    Title = "玩家加入/退出消息",
    Callback = function()
        loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))()
        
    end
})

Tabs.ButtonTab:Button({
    Title = "踏空UI",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
        
    end
})



Tabs.ButtonTab:Button({
    Title = "反挂机",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/9fFu43FF"))()
        
    end
})

Tabs.ButtonTab:Button({
    Title = "键盘",
    Callback = function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/RedZenXYZ/4d80bfd70ee27000660e4bfa7509c667/raw/da903c570249ab3c0c1a74f3467260972c3d87e6/KeyBoard%2520From%2520Ohio%2520Fr%2520Fr"))()
        
    end
})

Tabs.ButtonTab:Button({
    Title = "聊天框画画",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ocfi/_/refs/heads/main/a"))()
        
    end
})

Tabs.ButtonTab:Button({
    Title = "中文IY",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Wangzhehaoh/fly-away/main/%E5%90%AF%E5%8A%A8%E5%BA%93.lua"))()
        
    end
})

Tabs.ButtonTab:Button({
    Title = "点击传送工具",
    Callback = function()
        mouse = game.Players.LocalPlayer:GetMouse() tool = Instance.new("Tool") tool.RequiresHandle = false tool.Name = "点击传送" tool.Activated:connect(function() local pos = mouse.Hit+Vector3.new(0,2.5,0) pos = CFrame.new(pos.X,pos.Y,pos.Z) game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos end) tool.Parent = game.Players.LocalPlayer.Backpack
        
    end
})


Tabs.ButtonTab:Button({
    Title = "肘击",
    Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/0Ben1/fe/main/obf_5wpM7bBcOPspmX7lQ3m75SrYNWqxZ858ai3tJdEAId6jSI05IOUB224FQ0VSAswH.lua.txt'),true))()
        
    end
})

Tabs.ButtonTab:Button({
    Title = "玩家实时数据",
    Callback = function()
        loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/%E5%AE%9E%E6%97%B6%E6%95%B0%E6%8D%AE.txt"))()
        
    end
})

Tabs.ButtonTab:Button({
    Title = "免费通行证",
    Callback = function()
        for _,v in pairs(game:GetDescendants()) do
    if v.ClassName == "RemoteEvent" then
    if v.Parent.Name == "WeaponsRemotes" or v.Parent.Name == "VipRemotes" or v.Parent.Name == "Remotes" then
    v:FireServer()
    end
    end
    end
    
    end
})

Tabs.ButtonTab:Button({
    Title = "vapev4",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
    
    end
})

Tabs.ButtonTab:Button({
    Title = "阿尔宙斯v3 UI",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20X%20V3"))()
        
    end
})

Tabs.ButtonTab:Button({
    Title = "查看别人物品栏",
    Callback = function()
        loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/%E7%9C%8B%E7%89%A9%E5%93%81%E6%A0%8F.txt"))()
        
    end
})

Tabs.ButtonTab:Button({
    Title = "死亡笔记",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/1_1.txt_2024-08-08_153358.OTed.lua"))()
        
    end
})


-------------------------------------FE-------------------------------------
Tabs.FE1Tab:Button({
    Title = "别人可见音效",
    Callback = function()
        loadstring(game.HttpGet(game, "https://rawscripts.net/raw/Brookhaven-RP-Audio-Player-Script-Brookhaven-RP-33531"))()
        
    end
})

Tabs.FE1Tab:Button({
    Title = "强行装备丢弃",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingyan777/roblox/refs/heads/main/%E5%BC%BA%E8%A1%8C%E8%A3%85%E5%A4%87%E6%88%96%E4%B8%A2%E5%BC%83%E7%89%A9%E5%93%81.txt"))()
        
    end
})

Tabs.FE1Tab:Button({
    Title = "心灵牵引",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/%E7%BF%BB%E8%AF%91.txt"))()
        
    end
})

Tabs.FE1Tab:Button({
    Title = "AC6放音乐",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-Ac6-Music-Vulnerability-25536"))()
        
    end
})

Tabs.FE1Tab:Button({
    Title = "VR",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/Qwerty/refs/heads/main/qwerty45.lua"))()
        
    end
})

Tabs.FE1Tab:Button({
    Title = "假延迟",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RENZXW/RENZXW-SCRIPTS/main/fakeLAGRENZXW.txt"))()
        
    end
})

Tabs.FE1Tab:Button({
    Title = "燃尽脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DROID-cell-sys/ANTI-UTTP-SCRIPTT/refs/heads/main/EGOR%20SCRIPT%20BY%20ANTI-UTTP"))()
        
    end
})

Tabs.FE1Tab:Button({
    Title = "头部宠物",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/Qwerty/refs/heads/main/qwerty40.lua"))()
        
    end
})

Tabs.FE1Tab:Button({
    Title = "车",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-SILLY-CAR-V1-48227"))()
        
    end
})

Tabs.FE1Tab:Button({
    Title = "蜘蛛侠",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingyan777/roblox/refs/heads/main/%E8%9C%98%E8%9B%9B%E4%BE%A0.txt"))()
        
    end
})

Tabs.FE1Tab:Button({
    Title = "拥抱",
    Callback = function()
        loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/ExploitFin/Animations/refs/heads/main/Front%20and%20Back%20Hug%20Tool"))()
        
    end
})

Tabs.FE1Tab:Button({
    Title = "隐身",
    Callback = function()
        loadstring(game.HttpGet(game, "https://pastebin.com/raw/vP6CrQJj"))()
        
    end
})

Tabs.FE1Tab:Button({
    Title = "隐身2",
    Callback = function()
        loadstring(game.HttpGet(game, "https://pastebin.com/raw/3Rnd9rHf"))()
        
    end
})

Tabs.FE1Tab:Button({
    Title = "自然灾害",
    Callback = function()
        local game_id = 189707
        local game_url = "https://www.roblox.com/games/"..tostring(game_id)
        
        local TeleportService = game:GetService("TeleportService")
        TeleportService:Teleport(game_id, game.Players.LocalPlayer)
    end
})



Tabs.FE1Tab:Button({
    Title = "失重",
    Callback = function()
        loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/Rawbr10/Roblox-Scripts/refs/heads/main/0%20Graviy%20Trip%20Universal"))()
        
    end
})

Tabs.FE1Tab:Button({
    Title = "跳墙",
    Callback = function()
        loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/ScpGuest666/Random-Roblox-script/refs/heads/main/Roblox%20WallHop%20V4%20script"))()
        
    end
})

Tabs.FE1Tab:Button({
    Title = "蜘蛛侠",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingyan777/roblox/refs/heads/main/%E8%9C%98%E8%9B%9B%E4%BE%A0.txt"))()
        
    end
})

Tabs.FE1Tab:Button({
    Title = "前后空翻",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingyan777/roblox/refs/heads/main/%E6%97%8B%E8%BD%AC.txt"))()
        
    end
})
-------------------------------------透视-------------------------------------




Tabs.ESPTab:Button({
    Title = "无限跳",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0", true))()
        
    end
})





-------------------------------------其它脚本-------------------------------------
Tabs.otherTab:Button({
    Title = "DHJB脚本卡密",
    Callback = function()
        setclipboard("看看腿")
        
    end
})

Tabs.otherTab:Button({
    Title = "DHJB脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/1.4.txt"))()
    end
})

Tabs.otherTab:Button({
    Title = "XK脚本",
    Callback = function()
        loadstring(game:HttpGet(('https://github.com/devslopo/DVES/raw/main/XK%20Hub')))()
    end
})

Tabs.otherTab:Button({
    Title = "小月脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Syndromehsh/bypass-Script/refs/heads/main/xiaoyue/Main%20Script.lua"))()
    end
})

Tabs.otherTab:Button({
    Title = "XA Hub",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/h8nC0fLb", true))()
    end
})

Tabs.otherTab:Button({
    Title = "退休v2",
    Callback = function()
        TX = "脚本群:160369111"
        Script = "Free永久免费"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JsYb666/TX-Free-YYDS/refs/heads/main/FREE-TX-TEAM"))()
    end
})

Tabs.otherTab:Button({
    Title = "禁漫中心",
    Callback = function()
        getgenv().LS="禁漫中心" 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/ng/main/jmlllllllIIIIlllllII.lua"))()
    end
})

Tabs.otherTab:Button({
    Title = "落叶中心",
    Callback = function()
        getgenv().LS="落叶中心" 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/krlpl/Deciduous-center-LS/main/%E8%90%BD%E5%8F%B6%E4%B8%AD%E5%BF%83%E6%B7%B7%E6%B7%86.txt"))()
    end
})

Tabs.otherTab:Button({
    Title = "皮脚本",
    Callback = function()
        getgenv().XiaoPi="皮脚本QQ群1002100032" 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/QQ1002100032-Roblox-Pi-script.lua"))()
    end
})

Tabs.otherTab:Button({
    Title = "殺脚本",
    Callback = function()
        FengYu_HUB = "殺脚本"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FengYu-3/FengYu/refs/heads/main/QQ1926190957.lua"))()
    end
})

Tabs.otherTab:Button({
    Title = "情云脚本",
    Callback = function()
        loadstring(utf8.char((function() return table.unpack({108,111,97,100,115,116,114,105,110,103,40,103,97,109,101,58,72,116,116,112,71,101,116,40,34,104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,67,104,105,110,97,81,89,47,45,47,109,97,105,110,47,37,69,54,37,56,51,37,56,53,37,69,52,37,66,65,37,57,49,34,41,41,40,41})end)()))()
    end
})

Tabs.otherTab:Button({
    Title = "天空脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/hdjsjjdgrhj/script-hub/refs/heads/main/skyhub"))()
    end
})

-------------------------------------窗口配置-------------------------------------
local HttpService = game:GetService("HttpService")

local folderPath = "WindUI"
if not isfolder(folderPath) then
    makefolder(folderPath)
end

local function SaveFile(fileName, data)
    local filePath = folderPath .. "/" .. fileName .. ".json"
    local jsonData = HttpService:JSONEncode(data)
    writefile(filePath, jsonData)
end

local function LoadFile(fileName)
    local filePath = folderPath .. "/" .. fileName .. ".json"
    if isfile(filePath) then
        local jsonData = readfile(filePath)
        return HttpService:JSONDecode(jsonData)
    end
    return nil
end

local function ListFiles()
    local files = {}
    for _, file in ipairs(listfiles(folderPath)) do
        local fileName = file:match("([^/]+)%.json$")
        if fileName then
            table.insert(files, fileName)
        end
    end
    return files
end

Tabs.WindowTab:Section({ Title = "窗口", Icon = "app-window-mac" })

local themeValues = {}
for name, _ in pairs(WindUI:GetThemes()) do
    table.insert(themeValues, name)
end

local themeDropdown = Tabs.WindowTab:Dropdown({
    Title = "选择主题",
    Multi = false,
    AllowNone = false,
    Value = nil,
    Values = themeValues,
    Callback = function(theme)
        WindUI:SetTheme(theme)
    end
})
themeDropdown:Select(WindUI:GetCurrentTheme())

local ToggleTransparency = Tabs.WindowTab:Toggle({
    Title = "切换窗口透明度",
    Callback = function(e)
        Window:ToggleTransparency(e)
    end,
    Value = WindUI:GetTransparency()
})

Tabs.WindowTab:Section({ Title = "保存" })

local fileNameInput = ""
Tabs.WindowTab:Input({
    Title = "写入文件名",
    PlaceholderText = "Enter file name",
    Callback = function(text)
        fileNameInput = text
    end
})

Tabs.WindowTab:Button({
    Title = "保存文件",
    Callback = function()
        if fileNameInput ~= "" then
            SaveFile(fileNameInput, { Transparent = WindUI:GetTransparency(), Theme = WindUI:GetCurrentTheme() })
        end
    end
})

Tabs.WindowTab:Section({ Title = "加载" })

local filesDropdown
local files = ListFiles()

filesDropdown = Tabs.WindowTab:Dropdown({
    Title = "选择文件",
    Multi = false,
    AllowNone = true,
    Values = files,
    Callback = function(selectedFile)
        fileNameInput = selectedFile
    end
})

Tabs.WindowTab:Button({
    Title = "加载文件",
    Callback = function()
        if fileNameInput ~= "" then
            local data = LoadFile(fileNameInput)
            if data then
                WindUI:Notify({
                    Title = "文件已加载",
                    Content = "Loaded data: "..HttpService:JSONEncode(data),
                    Duration = 5,
                })
                if data.Transparent then 
                    Window:ToggleTransparency(data.Transparent)
                    ToggleTransparency:SetValue(data.Transparent)
                end
                if data.Theme then 
                    WindUI:SetTheme(data.Theme)
                    themeDropdown:Select(data.Theme)
                end
            end
        end
    end
})

Tabs.WindowTab:Button({
    Title = "覆盖文件",
    Callback = function()
        if fileNameInput ~= "" then
            SaveFile(fileNameInput, { Transparent = WindUI:GetTransparency(), Theme = WindUI:GetCurrentTheme() })
        end
    end
})

Tabs.WindowTab:Button({
    Title = "刷新列表",
    Callback = function()
        filesDropdown:Refresh(ListFiles())
    end
})

local currentThemeName = WindUI:GetCurrentTheme()
local themes = WindUI:GetThemes()

local ThemeAccent = themes[currentThemeName].Accent
local ThemeOutline = themes[currentThemeName].Outline
local ThemeText = themes[currentThemeName].Text
local ThemePlaceholderText = themes[currentThemeName].Placeholder

function updateTheme()
    WindUI:AddTheme({
        Name = currentThemeName,
        Accent = ThemeAccent,
        Outline = ThemeOutline,
        Text = ThemeText,
        Placeholder = ThemePlaceholderText
    })
    WindUI:SetTheme(currentThemeName)
end

local CreateInput = Tabs.CreateThemeTab:Input({
    Title = "主题名称",
    Value = currentThemeName,
    Callback = function(name)
        currentThemeName = name
    end
})

Tabs.CreateThemeTab:Colorpicker({
    Title = "背景颜色",
    Default = Color3.fromHex(ThemeAccent),
    Callback = function(color)
        ThemeAccent = color:ToHex()
    end
})

Tabs.CreateThemeTab:Colorpicker({
    Title = "轮廓颜色",
    Default = Color3.fromHex(ThemeOutline),
    Callback = function(color)
        ThemeOutline = color:ToHex()
    end
})

Tabs.CreateThemeTab:Colorpicker({
    Title = "文本颜色",
    Default = Color3.fromHex(ThemeText),
    Callback = function(color)
        ThemeText = color:ToHex()
    end
})

Tabs.CreateThemeTab:Colorpicker({
    Title = "占位符文本颜色",
    Default = Color3.fromHex(ThemePlaceholderText),
    Callback = function(color)
        ThemePlaceholderText = color:ToHex()
    end
})

Tabs.CreateThemeTab:Button({
    Title = "更新主题",
    Callback = function()
        updateTheme()
    end
})

-------------------------------------开发-------------------------------------
Tabs.DevelopmentTab:Button({
    Title = "http spy",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Best-HTTP-SPY-38448"))()
    end
})

Tabs.DevelopmentTab:Button({
    Title = "汉化dex",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingyan777/roblox/refs/heads/main/bex.lua"))()
    end
})

Tabs.DevelopmentTab:Button({
    Title = "simple say",
    Callback = function()
        loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/Xingtaiduan/Script/refs/heads/main/Tools/SimpleSpy.lua"))()
    end
})

Tabs.DevelopmentTab:Button({
    Title = "Sigma-Spy",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/depthso/Sigma-Spy/refs/heads/main/Main.lua"))()
    end
})

Tabs.DevelopmentTab:Button({
    Title = "skid spy",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Http-Spy-46159"))()
    end
})

Tabs.DevelopmentTab:Button({
    Title = "坐标仪",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingyan777/roblox/refs/heads/main/%E5%9D%90%E6%A0%87"))()
    end
})

Tabs.DevelopmentTab:Button({
    Title = "重进服务器",
    Callback = function()
        local TeleportService = game:GetService("TeleportService")
            local currentPlaceId = game.PlaceId
            TeleportService:Teleport(currentPlaceId, game.Players.LocalPlayer)
    end
})

-------------------------------------画面-------------------------------------
Tabs.PictureTab:Button({
    Title = "光影",
    Callback = function()
        loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
    end
})

Tabs.PictureTab:Button({
    Title = "提高画质",
    Callback = function()
        loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/Xingtaiduan/Script/main/Content/HighQuality"))()
    end
})

Tabs.PictureTab:Button({
    Title = "场景着色器",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/%E5%9C%BA%E6%99%AF%E6%9B%B4%E6%94%B9%E5%99%A8.lua"))()
    end
})
-------------------------------------音乐-------------------------------------

local MusicInput = ""
Tabs.MusicTab:Input({
    Title = "输入音乐ID",
    PlaceholderText = "Enter music ID",
    Callback = function(Music)
        MusicInput = Music
    end
})

Tabs.MusicTab:Button({
    Title = "播放",
    Callback = function()
        local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://"..MusicInput
    sound.Parent = game.Workspace
    sound:Play()
    end
})

Tabs.MusicTab:Button({
    Title = "彩虹瀑布",
    Callback = function()
        local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://1837879082"
    sound.Parent = game.Workspace
    sound:Play()
    end
})

Tabs.MusicTab:Button({
    Title = "防空警报",
    Callback = function()
        local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://792323017"
    sound.Parent = game.Workspace
    sound:Play()
    end
})

Tabs.MusicTab:Button({
    Title = "hakari",
    Callback = function()
        local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://109474987384441"
    sound.Parent = game.Workspace
    sound:Play()
    end
})

Tabs.MusicTab:Button({
    Title = "义勇军进行曲",
    Callback = function()
        local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://1845918434"
    sound.Parent = game.Workspace
    sound:Play()
    end
})

Tabs.MusicTab:Paragraph({
    Title = "以下皆为复制ID"
})

Tabs.MusicTab:Button({
    Title = "饿～",
    Callback = function()
    setclipboard("116175711187716")
    end
})

Tabs.MusicTab:Button({
    Title = "饿～变调",
    Callback = function()
    setclipboard("89273067271701")
    end
})

Tabs.MusicTab:Button({
    Title = "钢管落地",
    Callback = function()
    setclipboard("8324338507")
    end
})

Tabs.MusicTab:Button({
    Title = "Coolkid",
    Callback = function()
    setclipboard("1839246711")
    end
})

Tabs.MusicTab:Button({
    Title = "Night Dancer",
    Callback = function()
    setclipboard("113900088691832")
    end
})

Tabs.MusicTab:Button({
    Title = "可爱的歌",
    Callback = function()
    setclipboard("106853685872121")
    end
})

Tabs.MusicTab:Button({
    Title = "哈基米山歌",
    Callback = function()
    setclipboard("71090232224338")
    end
})

Tabs.MusicTab:Button({
    Title = "开！！！",
    Callback = function()
    setclipboard("133701137571082")
    end
})

Tabs.MusicTab:Button({
    Title = "飞起来",
    Callback = function()
    setclipboard("104492649688505")
    end
})

Tabs.MusicTab:Button({
    Title = "野人叫声",
    Callback = function()
    setclipboard("18980082432")
    end
})

Tabs.MusicTab:Button({
    Title = "暗区突围",
    Callback = function()
    setclipboard("115517104364000")
    end
})

-------------------------------------动作-------------------------------------
Tabs.ActionTab:Button({
    Title = "芦管r6",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()
    end
})

Tabs.ActionTab:Button({
    Title = "r15变r6",
    Callback = function()
        loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/Yungengxin/roblox/refs/heads/main/R15toR6"))()
    end
})

Tabs.ActionTab:Button({
    Title = "芦管r15",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
    end
})

Tabs.ActionTab:Button({
    Title = "TSB动作脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NotEnoughJack/socializehub/refs/heads/main/script.lua"))()
    end
})

Tabs.ActionTab:Button({
    Title = "新动作脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingyan777/roblox/refs/heads/main/%E5%8A%A8%E4%BD%9C.lua"))()
    end
})

Tabs.ActionTab:Button({
    Title = "UGC表情",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/1nJD7PkH",true))()
    end
})

Tabs.ActionTab:Button({
    Title = "R6动作",
    Callback = function()
        loadstring(game.HttpGet(game, "https://rawscripts.net/raw/Universal-Script-R6-Animations-Menu-By-Me-19427"))()
    end
})

-------------------------------------专门-------------------------------------
Tabs.BeiyiqiTab:Button({
    Title = "情云中心",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ChinaQY/Scripts/Main/Forsaken"))()
    end
})

Tabs.BeiyiqiTab:Button({
    Title = "XK脚本",
    Callback = function()
        loadstring(game:HttpGet("https://github.com/DevSloPo/Main/raw/main/Forsaken"))()
    end
})

Tabs.BeiyiqiTab:Button({
    Title = "WTB",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JackUltraman/fish/refs/heads/main/%E8%A2%AB%E9%81%97%E5%BC%83"))()
    end
})

Tabs.BeiyiqiTab:Button({
    Title = "XA中心",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingtaiduan/Script/refs/heads/main/Games/被遗弃.lua"))()
    end
})

Tabs.N99NightTab:Button({
    Title = "退休99夜",
    Callback = function()
        TX = "TX退休脚本"
Scripts = "森林中的99夜"
QUN = "Q群:160369111"
loadstring(game:HttpGet("https://raw.githubusercontent.com/JsYb666/Item/refs/heads/main/99-Nights-TX-XIAN-MIAN______-_-_--_-_-_-_--_-_-_-_--_-_-_-_-_--_-_-_-__------_-_-_-_.lua"))()
    end
})

Tabs.Kongbudianti:Button({
    Title = "传送到疯狂电梯",
    Callback = function()
        local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local LocalPlayer = Players.LocalPlayer

local targetPlaceId = 1358133289

local success, errorMessage = pcall(function()
    TeleportService:Teleport(targetPlaceId, LocalPlayer)
end)

if not success then
    warn("传送失败:", errorMessage)
end
    end
})

Tabs.Kongbudianti:Button({
    Title = "传送到VIP房",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1881.45361328125, -396.8499755859375, 911.4960327148438)
    end
})

Tabs.Kongbudianti:Button({
    Title = "传送到VIP房外",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1899.78,-396.90,914.69)
    end
})

Tabs.Kongbudianti:Button({
    Title = "传送到出生点",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1922.29,-396.55,945.15)
    end
})

Tabs.Kongbudianti:Button({
    Title = "传送到电梯里",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-0.96,4.80,-6.52)
    end
})

Tabs.Kongbudianti:Button({
    Title = "传送到电梯上面",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-0.32,20.20,-2.11)
    end
})

Tabs.Smallgames:Button({
    Title = "传送到出生点",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(116.05,822.65,-48.39)
    end
})

Tabs.Smallgames:Button({
    Title = "传送到钱洞",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-358.60,815.61,15.02)
    end
})


Tabs.Shangu:Button({
    Title = "传送到惩教官员出生点",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(137.87,23.10,-168.71)
    end
})

Tabs.Shangu:Button({
    Title = "传送到加油站",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(276.02,6.21,-608.21)
    end
})

Tabs.Shangu:Button({
    Title = "传送到逃生者基地",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(747.82,-0.97,-474.38)
    end
})

Tabs.Shangu:Button({
    Title = "传送到钥匙卡1",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(37.27,-8.50,34.91)
    end
})

Tabs.Shangu:Button({
    Title = "回菜单",
    Callback = function()
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("MenuHelper"):WaitForChild("ToMenu"):FireServer()

    end
})

Window:OnClose(function()
    print("UI closed.")
    if NoclipConnection then
        NoclipConnection:Disconnect()
    end
end)

Tabs.famudaheng:Button({
    Title = "传送到钥匙卡1",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(247.55,3.00,57.64)
    end
})
