local _, rbx = pcall(function() return not not game end);
local Config = rbx and require(script.Config) or require('Config.lua');


_G.Protos = {};


local payload = {
	Protos = _G.Protos,
	Config = Config,
	rbx = rbx
}


local libs = {
	
	-- built-in functions
	getclass = rbx and script.lib.getclass or "lib/getclass.lua", 			     -- gets class tables
	class = rbx and script.lib.class or "lib/class.lua", 				     -- creates a new class
	new = rbx and script.lib.new or "lib/new.lua", 					     -- initiates a created class
	isa = rbx and script.lib.isa or "lib/isa.lua", 					     -- checks if an instance is a given class
	extend = rbx and script.lib.extend or "lib/extend.lua", 			     -- extends properties and methods onto into a new class

	
	-- misc functions
	dump = rbx and script.lib.misc.dump or "lib/misc/dump.lua", 			     -- dumps tables
	fid = rbx and script.lib.misc.fid or "lib/misc/fid.lua", 			     -- gets function ids
	fname = rbx and script.lib.misc.fname or "lib/misc/fname.lua", 			     -- gets function names
	pad = rbx and script.lib.misc.pad or "lib/misc/pad.lua", 			     -- pads strings
	rawtostring = rbx and script.lib.misc.rawtostring or "lib/misc/rawtostring.lua",     -- gets a default tostring 
	shallow = rbx and script.lib.misc.shallow or "lib/misc/shallow.lua", 		     -- makes shallow copies of tables
	tid = rbx and script.lib.misc.tid or "lib/misc/tid.lua", 			     -- gets table ids


	-- internal metatable functions
	__metaindex = rbx and script.lib.__.metaindex or "lib/__/metaindex.lua",	     -- used in instances to get properties
	__metanewindex = rbx and script.lib.__.metanewindex or "lib/__/metanewindex.lua",    -- used in instances to make properties
	__metatostring = rbx and script.lib.__metatostring or "lib/__/metatostring.lua",     -- used in instances for their cool print stuff
	__protoindex = rbx and script.lib.__.protoindex or "lib/__/protoindex.lua",	     -- used in classes to get properties
	__protonewindex = rbx and script.lib.__.protonewindex or "lib/__/protonewindex.lua", -- used in classes to make properties


	-- types
	Prototype = rbx and script.lib.Prototype or "lib/Prototype/init.lua", 		     -- the class type
	PrototypeItem = rbx and script.lib.PrototypeItem or "lib/PrototypeItem/init.lua"     -- class properties/items
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
