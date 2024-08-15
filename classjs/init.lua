local _, rbx = pcall(function() return not not game end);

local Prototype = require("lib/Prototype/init.lua");
local Config = require('Config.lua');
_G.Protos = {};

local class = require("lib/class.lua")(Prototype);
local new = require("lib/new.lua");


local stuff = { class = class, new = new, extend = extend, getclass = getclass, isa = isa };


return (function(...)
	local args = {...};
	for i, v in ipairs(args) do
		args[i] = stuff[v];
	end
	return table.unpack(args);
end)
