local _, rbx = pcall(function() return not not game end);
local Config = rbx and require(script.Config) or require('Config.lua');


_G.Protos = {};

local payload = {
	Protos = _G.Protos,
	Config = Config,
	rbx = rbx
}


local libs = {
	getclass = rbx and script.lib.getclass or "lib/getclass.lua",
	class = rbx and script.lib.class or "lib/class.lua",
	new = rbx and script.lib.new or "lib/new.lua",
	isa = rbx and script.lib.isa or "lib/isa.lua",
	extend = rbx and script.lib.extend or "lib/extend.lua",
	Prototype = rbx and script.lib.Prototype or "lib/Prototype/init.lua",
	PrototypeItem = rbx and script.lib.PrototypeItem or "lib/PrototypeItem/init.lua"
}


for k, v in pairs(libs) do
	payload[k] = require(v)(payload);
end


return (function(...)
	local args = {...};
	for i, v in ipairs(args) do
		args[i] = payload[v];
	end
	return table.unpack(args);
end)
