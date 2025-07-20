task.spawn(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/pinkaroo/Dew/refs/heads/main/Notification.lua'))()('Dew', 'Executed script!', 3)
end)

if not getgenv().dew then
    local dew = {}
    local lp = game.Players.LocalPlayer
    
    dew.teleport = function(pos)
        if lp.Character then
            lp.Character:PivotTo(CFrame.new(pos))
        end
    end
    
    dew.remote_spy = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua'))()
    end
    
    dew.dex = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/infyiff/backup/main/dex.lua'))()
    end
    
    dew.infinite_yield = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end
    
    getgenv().dew = dew
end
