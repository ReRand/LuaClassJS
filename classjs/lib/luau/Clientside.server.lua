local prep = script.Parent:WaitForChild("clientprep");
local rep = script.Parent:WaitForChild("rep");
local rs = game:GetService("RunService");


prep.OnClientEvent:Connect(function() return true end)


rep.OnClientEvent:Connect(function(p, k, v, newindex)
	
	if type(p) ~= "string" and p ~= game.Players.LocalPlayer then
	
		print('a', k, v);
		
		if not _G.Protos then
			_G.Protos = setmetatable({}, {

				__newindex = newindex

			});
		end

		_G.Protos[k] = v;
	end
end)