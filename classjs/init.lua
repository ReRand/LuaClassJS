local _, rbx = pcall(function() return not not game end);

local Prototype = require("whereever prototype is");
_G.Protos = {};

local Class = require("Class.lua")(Prototype);
local New = require("New.lua");

local config = {
	coolPrintDebugClassStuff = false,
	disableInnerCoolPrint = false,
	disableCoolPrint = true,
	useObjects = false
};

return { Class, New };
