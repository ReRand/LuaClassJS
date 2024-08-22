local rep = script.Parent:WaitForChild("rep");
local rs = game:GetService("RunService");


rep.OnServerEvent:Connect(function(pl, p, k, v, newindex)
    print('b', k, v);
    
    if not _G.Protos then
        _G.Protos = setmetatable({}, {

            __newindex = newindex

        });
    end

    _G.Protos[k] = v;

    rep:FireAllClients(p, k, v, newindex);
end)