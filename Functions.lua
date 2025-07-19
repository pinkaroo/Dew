task.spawn(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/pinkaroo/Dew/refs/heads/main/Notification.lua'))()('Lynra', 'Executed script!', 3)
    if getgenv().lynra then return end

    local lynra = {}
    local lp = game.Players.LocalPlayer

    lynra.teleport = function(pos)
        if lp.Character then
            lp.Character:PivotTo(CFrame.new(pos))
        end
    end

    lynra.remote_spy = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua'))()
    end

    lynra.dex = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/infyiff/backup/main/dex.lua'))()
    end

    lynra.infinite_yield = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end

    getgenv().lynra = lynra
end)
