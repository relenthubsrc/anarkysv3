if not game:IsLoaded() then game.Loaded:Wait() end
local c = 'rbxassetid://3570695787'
function instance(a,a2,a3) local d = Instance.new(a,a2) if a3 then for a,v in next, a3 do d[a] = v end end if a == 'ImageLabel' then if d.Image == 'rbxassetid://3570695787' then d.ScaleType = Enum.ScaleType.Slice d.SliceCenter = Rect.new(100,100,100,100) d.BackgroundTransparency = 1 end end return d end
function ts(obj,tinfo,p) tinfo[2] = Enum.EasingStyle[tinfo[2]] game:GetService('TweenService'):create(obj,TweenInfo.new(unpack(tinfo)),p):Play() end
function rgb(a,b,c) return Color3.fromRGB(a,b,c) end
function cnew(a,b,c) return Color3.new(a,b,c) end
function hsv(a,b,c) return Color3.fromHSV(a,b,c) end
function udim2(a,b,c,d) return UDim2.new(tonumber(a),tonumber(b),tonumber(c),tonumber(d)) end 
function clone(a,b,c) local d = a:Clone() d.Parent = b for e,f in next, c do d[e] = f end return d end
function getudim(udim) local g = tostring(udim) local g2 = {' ','{','}'} for a,v in next, g2 do g = string.gsub(g,v,'') end local g3 = g:split(',') return {x=g3[1],x2=g3[2],y=g3[3],y2=g3[4]} end
function makeborder(obj,size,color,additional) local d2 = getudim(obj.Size) local d = clone(obj,obj,{ImageColor3 = color,Size = udim2(d2.x,d2.x2-size,d2.y,d2.y2-size),Position = udim2(0.5,(-d2.x2/2)+(size/2),0.5,(-d2.y2/2)+(size/2))}) if additional then for a,v in next, additional do d[a] = v end end return d end
getgenv().themes = {
    dark = {
            cmdBar = rgb(13,13,13),
            cmdFont = Enum.Font.Code,
            cmdTextColor = rgb(255,255,255),
            cmdTextSize = 22,
            infoFrame1 = rgb(25,25,25),
            colorSequence =  ColorSequence.new({
                ColorSequenceKeypoint.new(0,rgb(171,171,171)),
                ColorSequenceKeypoint.new(1,rgb(255,255,255))
            }),
            infoFrame2 = rgb(13,13,13),
            infoText1Color = rgb(255,255,255),
            infoText1Font = Enum.Font.Gotham,
            infoText1TSize = 14,
            infoText2Color = rgb(255,255,255),
            infoText2TSize = 15,
            infoText2Font = Enum.Font.SourceSans,
            inputAwaitingImage = 'rbxassetid://2122740641',
            suggestionBackFrameColor = rgb(25,25,25),
            correctionFrame = rgb(25,25,25),
            suggestionTextColor = rgb(13,13,13),
            suggestionTextFont = Enum.Font.Gotham,
            suggestionTextXAlignment = Enum.TextXAlignment.Left,
            suggestionTextTSize = 16,
            scrollBackImageColor = rgb(13,13,13),
            suggestionFont = Enum.Font.Gotham,
            suggestionTextColor = rgb(255,255,255),
            suggestionXAlignment = Enum.TextXAlignment.Left
    },
    light = {
        cmdBar = rgb(200,222,218),
        cmdFont = Enum.Font.Code,
        cmdTextColor = rgb(44,75,89),
        cmdTextSize = 22,
        infoFrame1 = rgb(207,240,255),
        colorSequence =  ColorSequence.new({
            ColorSequenceKeypoint.new(0,rgb(171,171,171)),
            ColorSequenceKeypoint.new(1,rgb(255,255,255))
        }),
        infoFrame2 = rgb(200,222,218),
        infoText1Color = rgb(14,26,64),
        infoText1Font = Enum.Font.Gotham,
        infoText1TSize = 14,
        infoText2Color = rgb(14,26,64),
        infoText2TSize = 15,
        infoText2Font = Enum.Font.SourceSans,
        inputAwaitingImage = 'rbxassetid://2122740641',
        suggestionBackFrameColor = rgb(207,240,255),
        correctionFrame = rgb(207,240,255),
        suggestionTextColor = rgb(14,26,64),
        suggestionTextFont = Enum.Font.Gotham,
        suggestionTextXAlignment = Enum.TextXAlignment.Left,
        suggestionTextTSize = 16,
        scrollBackImageColor = rgb(200,222,218),
        suggestionFont = Enum.Font.Gotham,
        suggestionTextColor = rgb(14,26,64),
        suggestionXAlignment = Enum.TextXAlignment.Left
    }
}
local gadmin = {}
getgenv().prefix3 = "'"
gadmin.load = function(thm,title,btcmds)
    if not thm then 
        thm = getgenv().themes.dark
    end
    if not title then
        title = 'Anarky#5844 | .gg/HKwEQ74cJr'
    end
    if not btcmds then 
        btcmds = true
    end
    local sgui = instance('ScreenGui',game:service('CoreGui'),{Name = 'admin'})
    local frameopened = false
    local frame = instance('ImageLabel',sgui,{
        Image = c,
        SliceScale = 1,
        Size = udim2(0,100,0,50),
        Position = udim2(0.5,-50,1,0),
        ImageColor3 = thm.cmdBar
    })
    local uig2 = instance('UIGradient',frame,{
        Color = thm.colorSequence
    })
    local infoframe = instance('ImageLabel',sgui,{
        Image = c,
        SliceScale = 0.035,
        Size = udim2(0,0,0,100),
        Position = udim2(0,0,0,0),
        ImageColor3 = thm.infoFrame1,
        ClipsDescendants = true
    })
    spawn(function()
        while true do 
            wait(0.1)
            if not frameopened then
                ts(infoframe,{0.3,'Sine'},{
                    Size = udim2(0,0,0,100)
                })
            end
        end
    end)
    local uig = instance('UIGradient',infoframe,{
        Color = thm.colorSequence,
        Rotation = 30
    })
    local infoframe2 = instance('ImageLabel',infoframe,{
        Position = udim2(0.5,-112,1,-77),
        Size = udim2(0,224,0,74),
        SliceScale = 0.035,
        Image = c,
        ImageColor3 = thm.infoFrame2
    })
    clone(uig,infoframe2,{Color = thm.colorSequence})
    local infotext1 = instance('TextLabel',infoframe,{
        Size = udim2(1,0,0,23),
        BackgroundTransparency = 1,
        Font = thm.infoText1Font,
        TextColor3 = thm.infoText1Color,
        TextSize = thm.infoText1TSize,
        Text = 'N/A'
    })
    local infotext2 = instance('TextLabel',infoframe2,{
        Text = 'N/A',
        Size = udim2(0.973,0,0.919,0),
        Position = udim2(0.027,0,0.081,0),
        BackgroundTransparency = 1,
        TextColor3 = thm.infoText2Color,
        TextSize = thm.infoText2TSize,
        TextYAlignment = Enum.TextYAlignment.Top,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = thm.infoText2Font
    })
    local player = game:service('Players').LocalPlayer
    local mouse = player:GetMouse() 
    mouse.Move:connect(function()
        ts(infoframe,{0.15,'Sine'},{
            Position = udim2(0,mouse.X+7,0,mouse.Y+17)
        })
    end)
    if not getgenv().prefix2 then 
        getgenv().prefix2 = 'Quote'
    end
    local text = instance('TextBox',frame,{
        Text = title,
        Font = Enum.Font.GothamSemibold,
        TextColor3 = thm.cmdBar,
        TextSize = 22,
        BackgroundTransparency = 1,
        Size = udim2(1,0,1,0),
        TextEditable = false,
        ClipsDescendants = true
    })
    ts(text,{0.6,'Sine'},{
        TextColor3 = thm.cmdTextColor
    })
    ts(frame,{0.6,'Sine'},{
        Size = udim2(0,1400,0,50),
        Position = udim2(0.5,-1400/2,0.9,-50),
        SliceScale = 0.035,
    })
    wait(2.5)
    ts(text,{0.6,'Sine'},{
        TextColor3 = thm.cmdBar,
        TextTransparency = 1
    })
    ts(frame,{0.3,'Sine'},{
        Size = udim2(0,50,0,50),
        Position = udim2(0.5,-25,0.9,-50),
        SliceScale = 1,
        ImageTransparency = 0.6
    })
    spawn(function()
        wait(0.6)
        text.Font = Enum.Font.Code
        text.TextEditable = true
        local uis = game:service('UserInputService')
        uis.InputBegan:connect(function(k,t)
            pcall(function()
                if t then return end
                if k.KeyCode == Enum.KeyCode[getgenv().prefix2] then
                    text:CaptureFocus()
                    wait()
                    text.Text = ''
                end
            end)
        end)
    end)
    local waiting = instance('ImageLabel',frame,{
        Size = udim2(0,50,0,50),
        Position = udim2(0,0,0,0),
        BackgroundTransparency = 1,
        Image = thm.inputAwaitingImage
    })
    ts(waiting,{0.6,'Sine'},{
        ImageTransparency = 0.6
    })
    local uis
    spawn(function()
        while true do 
            ts(waiting,{4,'Linear'},{
                Rotation = (waiting.Rotation + 100)
            })
            wait(4)
        end
    end)
    function getplayers(val)
        local players = {}
        val = tostring(val)
        val = val:lower()
        local plrs = game:service('Players')
        if val == 'me' then
            table.insert(players,plrs.LocalPlayer)
        elseif val == 'all' then
            for a,v in pairs(plrs:GetChildren()) do
                table.insert(players,v)
            end
        elseif val == 'others' then
            for a,v in pairs(plrs:GetChildren()) do
                if v.Name ~= plrs.LocalPlayer.Name then
                    table.insert(players,v)
                end
            end
        else
            for a,v in pairs(plrs:GetChildren()) do
                if v.Name:lower():find(val) then
                    table.insert(players,v)
                end
            end
        end
        return players
    end
    local commands = {}
    function convert(str)
        if str == ';' then
            return 'SemiColon'
        elseif str == "'" then
            return 'Quote'
        elseif str == '[' then 
            return 'LeftBracket'
        elseif str == ']' then 
            return 'RightBracket'
        elseif str == [[\]] then
            return 'BackSlash'
        elseif str == '-' then
            return 'Minus'
        elseif str == '1' then
            return 'One'
        elseif str == '2' then 
            return 'Two'
        elseif str == '3' then 
            return 'Three'
        elseif str == '4' then 
            return 'Four'
        elseif str == '5' then 
            return 'Five' 
        elseif str == '6' then 
            return 'Six'
        elseif str == '7' then 
            return 'Seven'
        elseif str == '8' then
            return 'Eight'
        elseif str == '9' then
            return 'Nine'
        elseif str == '0' then
            return 'Zero'
        elseif str == '`' then 
            return 'Backquote'
        elseif str == '.' then
            return 'Period'
        elseif str == ',' then 
            return 'Comma'
        elseif str == '/' then 
            return 'Slash'
        elseif str == '=' then
            return 'Equals'
        end
        return str:len() == 1 and str:upper() or str
    end
    local connections = {}
    local admin = {
        ['setPrefix'] = function(n)
            getgenv().prefix2 = convert(n)
            getgenv().prefix3 = n
        end,
        ['hide'] = function()
            ts(frame,{0.6,'Sine'},{
                Size = udim2(0,50,0,50),
                Position = udim2(0.5,-25,1,0)
            })
        end,
        ['destroy'] = function()
            pcall(function()
                game:service('CoreGui')['admin']:Destroy()
            end)
            for a,v in next, connections do
                pcall(function()
                    v:Disconnect()
                end)
            end
        end,
        ['show'] = function()
            ts(frame,{0.6,'Sine'},{
                Size = udim2(0,50,0,50),
                Position = udim2(0.5,-25,0.9,-50)
            })
        end,
        ['addCommand'] = function(info)
            if not info.name then
                info.name = 'nil name'
            end 
            if not info.desc then
                info.desc = '' 
            end
            if not info.callback then 
                info.callback = function()
                    print('nil callback')
                end
            end
            if info.desc then
                table.insert(commands,('%s | %s'):format(info.name,info.desc))
            else
                table.insert(commands,info.name)
            end
            text.FocusLost:connect(function()
                if text.Text:lower():split(' ')[1]:lower() == info.name:lower() then
                    local d = text.Text:split(' ')
                    table.remove(d,1)
                    info.callback(unpack(d))
                end
            end)
            local con
            con = game:service('Players').LocalPlayer.Chatted:connect(function(m)
                if m:lower():split(' ')[1]:lower() == getgenv().prefix3:lower()..info.name:lower() then
                    local d = m:split(' ')
                    table.remove(d,1)
                    info.callback(unpack(d))
                end
            end)
            table.insert(connections,con)
        end,
        ['getplayers'] = function(val)
            local players = {}
            val = tostring(val)
            val = val:lower()
            local plrs = game:service('Players')
            if val == 'me' then
                table.insert(players,plrs.LocalPlayer)
            elseif val == 'all' then
                for a,v in pairs(plrs:GetChildren()) do
                    table.insert(players,v)
                end
            elseif val == 'others' then
                for a,v in pairs(plrs:GetChildren()) do
                    if v.Name ~= plrs.LocalPlayer.Name then
                        table.insert(players,v)
                    end
                end
            else
                for a,v in pairs(plrs:GetChildren()) do
                    if v.Name:lower():find(val) then
                        table.insert(players,v)
                    end
                end
            end
            return players
        end
    }
    local suggestions = instance('ImageLabel',frame,{
        Image = c,
        Position = udim2(0,0.5,0,0),
        Size = udim2(0,0,0,0),
        ImageColor3 = thm.suggestionBackFrameColor,
        SliceScale = 0.035,
        ClipsDescendants = true
    })
    local uig = instance('UIGradient',suggestions,{
        Color = thm.colorSequence,
        Rotation = 30
    })
    local correct = instance('Frame',suggestions,{
        Size = udim2(1,0,0,5),
        Position = udim2(0,0,1,-5),
        BorderSizePixel = 0,
        BackgroundColor3 = thm.correctionFrame
    })
    local suggestionstext = instance('TextLabel',suggestions,{
        Position = udim2(0.037,0,0,0),
        Size = udim2(0,187,0,29),
        BackgroundTransparency = 1,
        TextColor3 = thm.suggestionTextColor,
        Font = thm.suggestionTextFont,
        TextSize = thm.suggestionTextTSize,
        TextXAlignment = Enum.TextXAlignment.Left,
        Text = 'Suggestions'
    })
    local scrollframe = instance('ImageLabel',suggestions,{
        Image = c,
        Size = udim2(0,340,0,179),
        Position = udim2(0.5,-340/2,0.851,-150),
        ImageColor3 = thm.scrollBackImageColor,
        SliceScale = 0.035,
    })
    local scroll = instance('ScrollingFrame',scrollframe,{
        Size = udim2(1,0,1,0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 0,
        Position = udim2(0.026,0,0,0)
    })
    local sugsinstances = {}
    local ison = false
    function addsug(text2)
        local txt = instance('TextButton',scroll,{
            Text = text2:split('|')[1],
            BackgroundTransparency = 1,
            Size = udim2(1,0,0,23),
            TextColor3 = thm.suggestionTextColor,
            TextXAlignment = Enum.TextXAlignment.Left,
            ClipsDescendants = true
        })
        txt.MouseEnter:connect(function()
            ison = true
            ts(infotext1,{0.15,'Sine'},{
                TextTransparency = 1
            })
            ts(infotext2,{0.15,'Sine'},{
                TextTransparency = 1
            })
            infotext1.Text = string.gsub(text2:split('|')[1],' ','')
            infotext2.Text = string.gsub(string.gsub(text2,text2:split('|')[1],''),'|','')
            ts(infoframe,{0.3,'Sine'},{
                Size = udim2(0,230,0,100)
            })
            ts(infotext1,{0.15,'Sine'},{
                TextTransparency = 0
            })
            ts(infotext2,{0.15,'Sine'},{
                TextTransparency = 0
            })
        end)
        txt.MouseLeave:connect(function()
            wait(0.01)
            if not ison then
                ts(infoframe,{0.3,'Sine'},{
                    Size = udim2(0,0,0,100)
                })
            end
            ison = false
        end)
        txt.MouseButton1Down:connect(function()
            text.Text = string.gsub(text2:split('|')[1],' ','')..' '
            text.ClearTextOnFocus = false
            wait()
            text:CaptureFocus()
            text.ClearTextOnFocus = true
        end)
        table.insert(sugsinstances,txt)
    end
    local disturbed = false
    function toggle(f)
        if not disturbed then
            if f then
                frameopened = true
                ts(frame,{0.3,'Sine'},{
                    Size = udim2(0,1400,0,50),
                    Position = udim2(0.5,-1400/2,0.9,-50),
                    ImageTransparency = 0,
                    SliceScale = 0.035
                })
                ts(waiting,{0.3,'Sine'},{
                    ImageTransparency = 1
                })
                ts(text,{0.3,'Sine'},{
                    TextColor3 = thm.cmdTextColor,
                    TextTransparency = 0
                })
                ts(suggestions,{0.3,'Sine'},{
                    Size = udim2(0,348,0,211),
                    Position = udim2(0,10,0,-211)
                })
            else
                frameopened = false
                ts(frame,{0.3,'Sine'},{
                    Size = udim2(0,50,0,50),
                    Position = udim2(0.5,-25,0.9,-50),
                    SliceScale = 1,
                    ImageTransparency = 0.6
                })
                ts(waiting,{0.3,'Sine'},{
                    ImageTransparency = 0.6
                })
                ts(text,{0.3,'Sine'},{
                    TextColor3 = thm.cmdBar,
                    TextTransparency = 1
                })
                ts(suggestions,{0.3,'Sine'},{
                    Size = udim2(0,0,0,0),
                    Position = udim2(0.5,0,0,0)
                })
            end
        end
    end
    spawn(function()
        while true do 
            wait()
            for a,v in next, commands do
                addsug(v)
                table.remove(commands,a)
            end
            for a,v in next, sugsinstances do
                if not v.Text:lower():find(text.Text:split(' ')[1]:lower()) then
                    ts(v,{0.15,'Sine'},{Size = udim2(1,0,0,0)})
                    ts(v,{0.15,'Sine'},{TextTransparency = 1})
                else
                    ts(v,{0.15,'Sine'},{Size = udim2(1,0,0,23)})
                    ts(v,{0.15,'Sine'},{TextTransparency = 0})
                end
            end
            local function getchat()
                local d2
                local d = pcall(function() 
                    d2 = game:service('Players').LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
                end)
                return d2 or false
            end
            if not getchat() then
                for a,v in next, sugsinstances do
                    local txt = text.Text:split(' ')[1]
                    if not v.Text:lower():find(txt) then
                        ts(v,{0.15,'Sine'},{Size = udim2(1,0,0,0)})
                        ts(v,{0.15,'Sine'},{TextTransparency = 1})
                    else
                        ts(v,{0.15,'Sine'},{Size = udim2(1,0,0,23)})
                        ts(v,{0.15,'Sine'},{TextTransparency = 0})
                    end
                end
            else
                local chat = getchat()
                if string.gsub(chat.Text,' ','') ~= '' and chat.Text:sub(1,#getgenv().prefix3) == getgenv().prefix3 then
                    if not disturbed then
                        text.Text = chat.Text
                        toggle(true)
                        for a,v in next, sugsinstances do
                            if chat.Text:lower():find(getgenv().prefix3) then
                                local g = chat.Text
                                g = string.gsub(g,getgenv().prefix3,'')
                                if not v.Text:lower():find(g:split(' ')[1]) then
                                    ts(v,{0.15,'Sine'},{Size = udim2(1,0,0,0)})
                                    ts(v,{0.15,'Sine'},{TextTransparency = 1})
                                else
                                    ts(v,{0.15,'Sine'},{Size = udim2(1,0,0,23)})
                                    ts(v,{0.15,'Sine'},{TextTransparency = 0})
                                end
                            end
                        end
                    end
                else
                    if not disturbed then
                        toggle()
                        for a,v in next, sugsinstances do
                            if not v.Text:lower():find(text.Text:split(' ')[1]:lower()) then
                                ts(v,{0.15,'Sine'},{Size = udim2(1,0,0,0)})
                                ts(v,{0.15,'Sine'},{TextTransparency = 1})
                            else
                                ts(v,{0.15,'Sine'},{Size = udim2(1,0,0,23)})
                                ts(v,{0.15,'Sine'},{TextTransparency = 0})
                            end
                        end
                    end
                end
            end
        end
    end)
    instance('UIListLayout',scroll,{})
    clone(uig,scrollframe,{Color = thm.colorSequence})
    clone(uig,correct,{Rotation = 0,Color = thm.colorSequence})
    local onsug = false
    frame.MouseEnter:connect(function()
        toggle(true)
        disturbed = true
    end)
    frame.MouseLeave:connect(function()
        wait(0.05)
        if not onsug then
            if not text:IsFocused() then
                disturbed = false
                toggle()
            end
        end
    end)
    text.Focused:connect(function()
        toggle(true)
        disturbed = true
    end)
    text.FocusLost:connect(function()
        disturbed = false
        toggle()
        ts(infoframe,{0.3,'Sine'},{
            Size = udim2(0,0,0,100)
        })
    end)
    suggestions.MouseEnter:connect(function()
        onsug = true
        toggle(true)
        disturbed = true
    end)
    suggestions.MouseLeave:connect(function()
        onsug = false
        if not text:IsFocused() then
            disturbed = false
            toggle()
        end
    end)
    if btcmds then
        admin.addCommand({name = 'close',desc = 'Destroys the admin GUI',callback = function()
            admin.destroy()
        end})
        admin.addCommand({name = 'prefix',desc = 'Set prefix',callback = function(n)
            admin.setPrefix(n)
        end})
    end
    admin.addCommand({name = 'credits',desc = 'Anarky#5844 | .gg/HKwEQ74cJr',callback = function()
        setclipboard('https://discord.gg/HKwEQ74cJr')
        local m = instance('Message',workspace)
        m.Text = 'Copied invite to clipboard!'
        wait(1)
        m:Destroy()
    end})
    return admin
end
return gadmin
