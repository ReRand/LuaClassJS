local Prototype = {};
Prototype.__index = Prototype;


function pad(o, t, l)
  local x = o;
  x = (t):rep(l-x:len())..x;
  return x;
end


function dump(o, layer)
  
  if not layer then layer = 1; end
  
  local t = pad("", "\t", layer);
  local lastt = pad("", "\t", layer-1);
  
   if type(o) == 'table' then
      local s = '{ '
      
      local li = 0;
      
      for _ in pairs(o) do li = li + 1 end
      
      local i = 0;
      for k,v in pairs(o) do
        
        if not string.match(k, "__") then
        
           i = i + 1;
           
           local e = "\n";
           
           if i ~= li then
             e = ","..e;
           end
          
           if type(k) ~= 'number' then k = '"'..k..'"' end
           s = s .. '\n'..t..k..': ' .. dump(v, layer+1) .. e
          end
      end
      return s .. lastt .. '}'
   else
      return tostring(o)
   end
end


function __prototostring(table)
  if table.__name then
    return dump(table);
  end
end


function __protonewindex(table, key, value)
  if key == "__name" then
    local oldName = rawget(table, "__name");
    
    if oldName then
      _G.Protos[oldName] = nil;
    end
    
    _G.Protos[value] = table;
    
    return rawset(table, "__name", value);
  end
  
  
  if type(value) == "function" then
    table.__prototype[key] = function(...)
      return value(table, ...);
    end
  
  else
    return rawset(table, key, value);
  end
end


function __protoindex(table, key)
  
  if key == "constructor" then
    rawset(table.__prototype, "constructor", nil);
    rawset(table, "constructor", nil);
  
    function table.__prototype:constructor(...)
      return constructor(...);
    end
    
  
  elseif rawget(table.__prototype, key)  and not rawget(table, key) then
    
    if type(rawget(table.__prototype, key)) == "function" then
      return function(...) 
        return rawget(table.__prototype, key)(...);
      end
    else
      return rawget(table.__prototype, key);
    end
  
  
  else
    return rawget(table, key);
  end
end


function __metanewindex(table, key, value)
  if type(value) == "function" then
    table[key] = function(...)
      return value(table, ...);
    end
  
  else
    return rawset(table, key, value);
  end
end


function __metaindex(table, key)
  
  if key == "constructor" then
    rawset(table, "constructor", nil);
  
    function table:constructor(...)
      return constructor(...);
    end
    
  
  elseif rawget(table.__prototype, key)  and not rawget(table, key) then
    
    if type(rawget(table.__prototype, key)) == "function" then
      return function(...) 
        return rawget(table.__prototype, key)(...);
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
})


_G.Protos = {};


function class(n)
  return Prototype.new(n);
end


function get(n)
end


function new(name) return function(...)
  
  local c = _G.Protos[name];
  
  if not c then
    error("Class \""..name.."\" not found in globals while trying to create a new instance.");
  end
  
  local self = setmetatable({}, c);
  
  self.__name = c.__name;
  self.__prototype = c.__prototype;
  
  self.__index = __metaindex;
  self.__newindex = __metanewindex;
  self.__tostring = dump;
  
  if c.__instances then
    -- table.insert(c.__instances, self);
  end
  
  local ret = rawget(self.__prototype, "constructor")(self, ...);
  
  if not ret then
    return self;
  else
    return ret;
  end
end end


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
  
  local self = setmetatable(p, Prototype);
  self.__name = name;
  self.__instances = {};
  self.__prototype = proto;
  
  Prototype.__index = __protoindex;
  Prototype.__newindex = __protonewindex;
  
  self.__index = __protoindex;
  self.__newindex = __protonewindex;
  self.__tostring = __prototostring(self);
  
  
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


class "User" {
  constructor = function(self, name)
    self.Username = name;
    
    print('class '..tostring(self));
    print('inst'..tostring(User));
  end
};


local user1 = new "User"("dave");

