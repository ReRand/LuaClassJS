local config = {
	coolPrintDebugClassStuff = false,
	disableCoolPrint = true
}

local _, rbx = pcall(function() return not not game end);


local Prototype = {};
Prototype.__index = Prototype;



local original_tostring = tostring;



function Prototype:__tostring()
	return "[class " .. self.__name .. "]";
end


local function shallow(t)
	local nt = {};
	for k, v in pairs(t) do nt[k] = v end
	return nt;
end


local rawtostring = function (val)
	local mt = getmetatable(val)
	local __tostring = mt and mt.__tostring
	if __tostring then mt.__tostring = nil end
	local str = original_tostring(val)
	if __tostring then mt.__tostring = __tostring end
	return str
end


function pad(o, t, l)
	local x = o;
	x = (t):rep(l-x:len())..x;
	return x;
end


function tid(t)
	return rawtostring(t):gsub("table: ", "", 1)
end


function fid(f)
	return tostring(f):gsub("function: ", "", 1);
end


function fname(m)
	for k, v in pairs(_G) do
		if m == v then return k; end
	end
end


function dump(o, layer)
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


function __prototostring(table)
	local d = dump(table);

	if table.__name then
		return table.__name .. " ("..tid(table)..") " .. d
	end

	return d;
end


function __protonewindex(table, key, value)

	if key == "constructor" then
		rawset(table, "constructor", nil);
	end

	if key == "__name" then
		local oldName = rawget(table, "__name");

		if oldName then
			_G.Protos[oldName] = nil;
		end

		_G.Protos[value] = table;

		return rawset(table, "__name", value);
	end


	if type(value) == "function" and not string.match(key, "__") then
		table.__prototype[key] = function(...)
			return value(...);
		end

	else
		return rawset(table, key, value);
	end
end


function __protoindex(table, key)
	if rawget(table.__prototype, key)  and not rawget(table, key) then

		if type(rawget(table.__prototype, key)) == "function" then
			return function(...) 
				return rawget(table.__prototype, key)(table, ...);
			end
		else
			return rawget(table.__prototype, key);
		end


	else
		return rawget(table, key);
	end
end


function __metanewindex(table, key, value)

	if key == "constructor" then
		rawset(table, "constructor", nil);
	end

	if type(value) == "function" and not string.match(key, "__") then
		table[key] = function(...)
			return value(...);
		end

	else
		return rawset(table, key, value);
	end
end


function __metaindex(table, key)
	if rawget(table.__prototype, key)  and not rawget(table, key) then

		if type(rawget(table.__prototype, key)) == "function" then
			return function(...) 
				return rawget(table.__prototype, key)(table, ...);
			end
		else
			return rawget(table.__prototype, key);
		end


	else
		return rawget(table, key);
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
			proto[k] = v;
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


		function self.__prototype.__isa(n)
			if type(n) == "table" then
				return n.__name == self.__name;
			else
				return n == self.__name
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
			function self.__prototype.constructor() end


		elseif rawget(self, "constructor") or rawget(self.__prototype, "constructor") then
			local constructor;

			if rawget(self, "constructor") then
				constructor = rawget(self, "constructor");
			else
				constructor = rawget(self.__prototype, "constructor");
			end

			rawset(self, "constructor", nil);
			rawset(self.__prototype, "constructor", nil);

			function self.__prototype.constructor(...)
				return constructor(...);
			end
		end


		_G.Protos[self.__name] = self;

		return self;

	end end


function new(name) return (function(...)

		local c = _G.Protos[name];

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

		local ret = rawget(self.__prototype, "constructor")(self, ...);

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

			for k, v in pairs(self.__prototype) do
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
