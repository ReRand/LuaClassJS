--[[

LuaClassJS == https://github.com/shysolocup/LuaClassJs
created by shysolocup

--=={ Libs }==--

- class( name<String> ) Data<Table> : Prototype
> creates a new class
> ex: class "Example" { ... }


- extend( from<String>, to<String> ) Data<Table> : Prototype
> creates a class from another one
> ex: extend "Base" "Example" { ... }


- new( Name<String> ) : ClassInstance
> creates a new instance of a class
> ex: new "Example"(...);


- isa( A<ClassInstance>, B<String> ) : Boolean
> checks if a class instance matches with a given Prototype
> there's also one called __isa() in class instances
> ex: isa(ex, "Example")
> ex: ex.__isa("Example");


- getclass( Name<String> ) : Prototype
> gets a class Prototype
> ex: getclass("Example");


- Prototype( Name<String> ) Data<Table> : Metatable
> returns a new class
>
> -=={ Methods }==-
>> Prototype.new( ... ): ClassInstance
>> creates a new Prototype


- ClassInstance() : Metatable
> type for class instances, extends off of the class's Prototype
>
> -=={ Methods }==-
>> ClassInstance.__isa( Name<String> ): Boolean
>> checks if the class instance matches a given prototype
>> ex: ex.__isa("Example");
>
>
>> ClassInstance.__super( ... ): Any
>> runs the constructor of the class extended from (only available using extend)
>> ex: ex.__super("a", "b");


]]



local _, rbx = pcall(function() return not not game end);
local Config = rbx and require(script.Config) or require('Config.lua');


if Config.forceRbx ~= nil then
	rbx = Config.forceRbx;
end


_G.Protos = {};


local payload = {
	Protos = _G.Protos,
	Config = Config,
	rbx = rbx
}


local p = {};
payload.baseprint = p.__tostring;


local function split(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    table.insert(t, str)
  end
  return t
end


local libs = {
	
	-- built-in functions
	getclass = "lib/methods/getclass.lua", 			     -- gets class tables
	class = "lib/methods/class.lua", 				     -- creates a new class
	new = "lib/methods/new.lua", 					     -- initiates a created class
	isa = "lib/methods/isa.lua", 					     -- checks if an instance is a given class
	extend = "lib/methods/extend.lua", 			     -- extends properties and methods onto into a new class

	
	-- misc functions
	dump = "lib/misc/dump.lua", 			     -- dumps tables
	fid = "lib/misc/fid.lua", 			     -- gets function ids
	fname = "lib/misc/fname.lua", 			     -- gets function names
	pad = "lib/misc/pad.lua", 			     -- pads strings
	rawtostring = "lib/misc/rawtostring.lua",     -- gets a default tostring 
	shallow = "lib/misc/shallow.lua", 		     -- makes shallow copies of tables
	tid = "lib/misc/tid.lua", 			     -- gets table ids


	-- internal metatable functions
	__metaindex = "lib/__/metaindex.lua",	     -- used in instances to get properties
	__metanewindex = "lib/__/metanewindex.lua",    -- used in instances to make properties
	__metatostring = "lib/__/metatostring.lua",     -- used in instances for their cool print stuff
	__protoindex = "lib/__/protoindex.lua",	     -- used in classes to get properties
	__protonewindex = "lib/__/protonewindex.lua", -- used in classes to make properties


	-- types
	Prototype = "lib/classes/Prototype/init.lua", 		     -- the class type
	PrototypeItem = "lib/classes/PrototypeItem/init.lua",     -- class properties/items
	Object = "lib/classes/Object", 				  -- type mostly for getting and setting descriptors
}


if rbx then
	for k, v in pairs(libs) do
		v = v:gsub("init.lua", ""):gsub(".lua", "");
		
		local dir = split(v, "/");
		local path = script;

		for i, d in ipairs(dir) do
			path = path:FindFirstChild(d);
		end

		libs[k] = path;
	end
end


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
