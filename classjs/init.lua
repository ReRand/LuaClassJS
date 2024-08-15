local _, rbx = pcall(function() return not not game end);

local Prototype = require("whereever prototype is");
local Config = require('Config');
_G.Protos = {};

local class = require("class.lua")(Prototype);
local new = require("new.lua");


local stuff = { class = class, new = new, extend = extend, getclass = getclass, isa = isa };


return (function(...)
	local args = {...};
	for i, v in ipairs(args) do
		args[i] = stuff[v];
	end
	return table.unpack(args);
end)
