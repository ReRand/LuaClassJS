local _, rbx = pcall(function() return not not game end);

local Prototype = require("whereever prototype is");
_G.Protos = {};

local class = require("class.lua")(Prototype);
local new = require("new.lua");


local stuff = { class = class, new = new, extend = extend, getclass = getclass, isa = isa };


local config = {
	coolPrintDebugClassStuff = false,
	disableInnerCoolPrint = false,
	disableCoolPrint = true,
	useObjects = false
};


return (function(...)
	local args = {...};
	for i, v in ipairs(args) do
		args[i] = stuff[v];
	end
	return table.unpack(args);
end)
