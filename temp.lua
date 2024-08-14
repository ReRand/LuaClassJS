local config = {
	coolPrintDebugClassStuff = false,
	disableInnerCoolPrint = false,
	disableCoolPrint = true,
	useObjects = false
}

local _, rbx = pcall(function() return not not game end);


local Prototype = {};
Prototype.__index = Prototype;


local PrototypeItem = {};
PrototypeItem.__index = PrototypeItem;



local original_tostring = tostring;



function Prototype:__tostring()
	return "[class " .. self.__name .. "]";
end


function PrototypeItem.new(parent, value, t)
	
	if not t then t = {}; end;
	
	t.__value = value;
	t.__parent = parent;
	
	if not t.__writable then t.__writable = true; end;
	if not t.__configurable then t.__configurable = true; end;
	if not t.__enumerable then t.__enumerable = true; end;
	
	function t.__iter(tbl)
		print('a');
		return tbl.__value;
	end
	
	return setmetatable(t, PrototypeItem);
end

local p = {};
local baseprint = p.__tostring;


function PrototypeItem.__tostring(tbl)
	if type(tbl.__value) == "table" and not config.disableInnerCoolPrint then
		return dump(tbl.__value);
	elseif type(tbl.__value == "table" and config.disableInnerCoolPrint and baseprint then
			return baseprint(tbl.__value)
	else
		return tostring(tbl.__value);
	end
end


function PrototypeItem.__len(tbl)
	
	local i = 0;
	
	local success = pcall(function()
		i = #tbl.__value;
	end);
	
	if not success then
		for _ in ipairs(tbl.__value) do i = i + 1; end
	end
	
	return i;
end


function PrototypeItem.__iter(tbl)
	return next, tbl.__value
end



function PrototypeItem.__le(tbl, b) return tbl.__value <= b; end
function PrototypeItem.__lt(tbl, b) return tbl.__value < b; end
function PrototypeItem.__ge(tbl, b) return tbl.__value >= b; end
function PrototypeItem.__gt(tbl, b) return tbl.__value > b; end
function PrototypeItem.__eq(tbl, b) return tbl.__value == b; end

function PrototypeItem.__add(tbl, b) return PrototypeItem.new(tbl.__parent, (tbl.__value + b), tbl); end
function PrototypeItem.__sub(tbl, b) return PrototypeItem.new(tbl.__parent, (tbl.__value - b), tbl); end
function PrototypeItem.__mul(tbl, b) return PrototypeItem.new(tbl.__parent, (tbl.__value * b), tbl); end
function PrototypeItem.__div(tbl, b) return PrototypeItem.new(tbl.__parent, (tbl.__value / b), tbl); end
function PrototypeItem.__mod(tbl, b) return PrototypeItem.new(tbl.__parent, (tbl.__value * b), tbl); end
function PrototypeItem.__pow(tbl, b) return PrototypeItem.new(tbl.__parent, (tbl.__value ^ b), tbl); end
function PrototypeItem.__idiv(tbl, b) return PrototypeItem.new(tbl.__parent, (tbl.__value // b), tbl); end

function PrototypeItem.__band(tbl, b) return PrototypeItem.new(tbl.__parent, (tbl.__value .. b), tbl); end
function PrototypeItem.__unm(tbl) return PrototypeItem.new(tbl.__parent, (-tbl.__value), tbl); end;


function PrototypeItem.__index(tbl, key)	
	
	print(tbl);
	
	-- nab from the item itself
	if rawget(tbl, key) then
		return rawget(tbl, key);
		
		
	-- nab from the item's value
	elseif pcall(function() return rawget(tbl.__value, key) end) then
		return rawget(tbl.__value, key);
		
		
	-- weird fix for it calling __metaindex on the parent table
	elseif rawget(tbl, "__value") and type(tbl.__value) == "function" then
		
		local parent = rawget(tbl, "__parent") or tbl;
		return rawget(tbl, "__value")(parent, key);
	end
end



function PrototypeItem.__newindex(tbl, key, value)
	-- nab from the item itself
	if rawget(tbl, key) then
		rawset(tbl, key, value);


	-- nab from the item's value
	elseif pcall(function() return rawget(tbl.__value, key) end) and tbl.__writable then
		rawset(tbl.__value, key, value);
		
		
	elseif pcall(function() return rawget(tbl.__value, key) end) and not tbl.__writable then
		error("Class entry \"" .. key .. "\" not writeable");
	end
end


function PrototypeItem.__call(tbl, ...)
	
	print(tbl);
	
	for k, v in pairs({...}) do
		
		if type(v) == "table" then
			print(v, v.__name, tbl.__parent.__name)
		end
		
		if type(v) == "table" and v.__name and v.__name == tbl.__parent.__name then
			return rawget(tbl, "__value")(...);
		end
	end
	
	return rawget(tbl, "__value")(rawget(tbl, "__parent"), ...);
end


local function shallow(t)
	local nt = {};
	for k, v in pairs(t) do nt[k] = v end
	return nt;
end


local function rawtostring(val)
	local mt = getmetatable(val)
	local __tostring = mt and mt.__tostring
	if __tostring then mt.__tostring = nil end
	local str = original_tostring(val)
	if __tostring then mt.__tostring = __tostring end
	return str
end


local function pad(o, t, l)
	local x = o;
	x = (t):rep(l-x:len())..x;
	return x;
end


local function tid(t)
	return rawtostring(t):gsub("table: ", "", 1)
end


local function fid(f)
	return tostring(f):gsub("function: ", "", 1);
end


local function fname(m)
	for k, v in pairs(_G) do
		if m == v then return k; end
	end
end


local function dump(o, layer)
	if not layer then layer = 1; end

	local t = pad("", "\t", layer);
	local lastt = pad("", "\t", layer-1);

	if type(o) == 'table' and not o.__base then

		o = shallow(o);

		if o.__prototype then
			for k, v in pairs(o.__prototype) do o[k] = v end
		end

		local s = '{';

		local li = 0;
		local i = 0;

		local function dothe(k)
			return (k ~= "__instances" and (not string.match(k, "__") or config.coolPrintDebugClassStuff))
		end

		for k, _ in pairs(o) do

			if dothe(k) then
				li = li + 1;
			end 
		end

		if li > 0 then
			s = s.."\n";
		end

		for k,v in pairs(o) do

			if dothe(k) then
				-- if not string.match(k, "__") then

				i = i + 1;

				local e = "\n";

				if i ~= li then
					e = ","..e;
				end

				if type(k) ~= 'number' and string.match(k, " ") then k = '"'..k..'"' end;
				if type(v) == "string" then v = '"'..v..'"' end;
				if type(v) == "function" then
					local mName = fname(v);

					if mName then
						v = mName .. "() (" .. fid(v) .. ")";
					else
						v = "function() (" .. fid(v) .. ")";
					end
				end

				if v ~= o then
					s = s .. t .. k ..': ' .. dump(v, layer+1) .. e;
				end


				-- print(i, li);

				if i == li then
					break;
				end

			end
		end

		if li > 0 then
			return s .. lastt .. '}'
		else
			return s .. '}'
		end
	else
		return tostring(o)
	end
end


local function __prototostring(tbl)
	local d = dump(tbl);

	if tbl.__name then
		return tbl.__name .. " ("..tid(tbl)..") " .. d
	end

	return d;
end


local function __protonewindex(tbl, key, value)

	local output = nil;

	if key == "constructor" then
		return rawset(tbl, "constructor", nil);
	end

	if key == "__name" then
		local oldName = rawget(tbl, "__name");

		if oldName then
			_G.Protos[oldName] = nil;
		end

		_G.Protos[value] = tbl;

		if config.useObjects then
			return rawset(tbl, "__name", PrototypeItem.new(tbl, value));
		else
			return rawset(tbl, "__name", value);
		end
	end


	if type(value) == "function" and not string.match(key, "__") then

		if config.useObjects then
			tbl.__prototype[key] = PrototypeItem.new(tbl, function(...)
				return value(...);
			end)
		else
				tbl.__prototype[key] = PrototypeItem.new(tbl, function(...)
				return value(...);
			end)
		end

	elseif not string.match(key, "__") then
		local item = PrototypeItem.new(tbl, value);
		return rawset(tbl, key, item);
	
	else
		return rawset(tbl, key, value);
	end
end


local function __protoindex(tbl, key)
	local protoGot = rawget(tbl.__prototype, key);
	
	if protoGot and not rawget(tbl, key) then

		if type(protoGot) == "function" then
			return function(...) 
				return protoGot(tbl, ...);
			end
		else
			return protoGot;
		end

	else
		return rawget(tbl, key);
	end
end


local function __metanewindex(tbl, key, value)

	if key == "constructor" then
		rawset(tbl, "constructor", nil);
	end

	if type(value) == "function" and not string.match(key, "__") then
		tbl[key] = PrototypeItem.new(tbl, function(...)
			return value(...);
		end)

	elseif not string.match(key, "__") then
		local item = PrototypeItem.new(tbl, value);
		return rawset(tbl, key, item);

	else
		return rawset(tbl, key, value);
	end
end


local function __metaindex(tbl, key)
	
	local protoGot = rawget(tbl.__prototype, key);
	local normalGot = rawget(tbl, key);
	local self = rawget(tbl, "__parent") or tbl;
	
	if protoGot and not rawget(tbl, key) then

		if type(protoGot) == "function" then
			return function(...) 
				return protoGot(self, ...);
			end
		else
			return protoGot
		end


	else
		
		if type(normalGot) == "function" then
			return function(...)
				return normalGot(self, ...);
			end
		else
			return normalGot;
		end
	end
end


setmetatable(_G, {

	__newindex = function(t, k, v)

    --[[if rawget(t.Protos, k) then
      rawset(t.Protos, k, v);
    else]]
		rawset(t, k, v);
		-- end
	end,

	__index = function(t, k)

		if rawget(t.Protos, k) then
			return rawget(t.Protos, k);
		else
			return rawget(t, k)
		end
	end,
});


_G.Protos = {};


function Prototype.new(name) return function(p)
		if not p then p = {} end;

		Prototype.__index = Prototype;

		local proto = {};
		
		for k, v in pairs(p) do
			proto[k] = PrototypeItem.new(nil, v);
			p[k] = nil;
		end

		p.__index = __protoindex;
		p.__newindex = __protonewindex;

		if not rbx or not config.disableCoolPrint then
			p.__tostring = dump;
		end

		local self = setmetatable(p, Prototype);
		self.__name = name;
		self.__instances = {};
		self.__prototype = proto;
		
		for k, v in pairs(proto) do
			if type(v) == "table" then
				rawset(v, "__parent", self);
			end
		end


		function self.__prototype.__isa(self, n)
			if type(n) == "table" then
				return n.__name == self.__name;
			else
				return n == self.__name;
			end
		end


		Prototype.__index = __protoindex;
		Prototype.__newindex = __protonewindex;

		self.__index = __protoindex;
		self.__newindex = __protonewindex;

		--[[if not rbx then
			self.__tostring = __prototostring(self);
		end]]


		if not rawget(self, "constructor") and not rawget(self.__prototype, "constructor") then
			self.__prototype.constructor = PrototypeItem.new(self, function() end);


		elseif rawget(self, "constructor") or rawget(self.__prototype, "constructor") then
			local constructor;

			if rawget(self, "constructor") then
				constructor = rawget(self, "constructor");
			else
				constructor = rawget(self.__prototype, "constructor");
			end

			rawset(self, "constructor", nil);
			rawset(self.__prototype, "constructor", nil);

			self.__prototype.constructor = PrototypeItem.new(self, function(...)
				return constructor(...);
			end)
		end


		_G.Protos[self.__name] = self;

		return self;

	end end


function new(name) return (function(...)

		local c = _G.Protos[name];

		-- if it can't find it in _G.Protos
		if not c then
			error("Class \""..name.."\" not found in globals while trying to create a new instance.");
		end


		local exter = {
			__name = c.__name;
			__prototype = c.__prototype;
			__class = c
		};


		local ext = setmetatable(exter, c);
		


		function ext:__index(...)
			return __metaindex(self, ...);
		end

		function ext:__newindex(...)
			return __metanewindex(self, ...);
		end


		if not rbx or not config.disableCoolPrint then

			function ext:__tostring()
				return __prototostring(self);
			end
		end


		local self = setmetatable(exter, ext);

		-- self.__under = ext;


		if c.__instances then
			-- table.insert(c.__instances, self);
		end
		
		for k, v in pairs(self.__prototype) do
			if type(v) == "table" then
				rawset(v, "__parent", self);
			end
		end

		local ret = self.__prototype.constructor(self, ...);
		
		if not ret then
			return self;
		else
			return ret;
		end
	end) end


function class(n)
	return Prototype.new(n);
end


function getclass(n)
	return _G.Protos[n];
end


function isa(t, n)
	return t.__isa(n);
end


function extend(nfrom) return (function(nto) return (function(p)
			local base = _G.Protos[nfrom];
			local proto = shallow(base.__prototype);

			for k, v in pairs(p) do
				proto[k] = v;
			end

			local self = Prototype.new(nto)(proto);

			function self.__prototype.__super(...)
				local constructor = rawget(base, "constructor") and rawget(base, "constructor") or rawget(base.__prototype, "constructor");
				local f = constructor(self);

				print(f);
			end

			for k, v in pairs(self.__prototype) do
				
				if type(v) == "table" and rawget(v, "__parent") then
					rawset(v, "__parent", self);
				end
				
				if type(v) == "function" then

      --[[local f = v(self);
      
      print(f)]]

      --[[v = function(...)
        return f(...);
      end
      
      self.__prototype[k] = v;]]
				end
			end

			self.__extendee = base;

			return self;
		end) end) end

-- function new(name) return __new end



local stuff = { class = class, new = new, extend = extend, getclass = getclass, isa = isa };


return (function(...)
	local args = {...};
	for i, v in ipairs(args) do
		args[i] = stuff[v];
	end
	return table.unpack(args);
end)
