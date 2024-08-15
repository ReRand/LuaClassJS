local _, rbx = pcall(function() return not not game end);
local Config = require('Config.lua');


_G.Protos = {};

local payload = {
	Protos = _G.Protos,
	Config = Config,
	rbx = rbx
}

payload.getclass = require("lib/class.lua")(payload);

payload.class = require("lib/class.lua")(payload);
payload.new = require("lib/new.lua");

payload.isa = require("lib/isa.lua")(payload);
payload.extend = require("lib/extend.lua")(payload);

payload.Prototype = require("lib/Prototype/init.lua")(payload);
payload.PrototypeItem = require("lib/PrototypeItem/init.lua")(payload);


return (function(...)
	local args = {...};
	for i, v in ipairs(args) do
		args[i] = payload[v];
	end
	return table.unpack(args);
end)
