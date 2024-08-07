local Prototype = {};
Prototype.__index = Prototype;


function __realnewindex(table, key, value)
  if key == "name" then
    
    local oldName = rawget(table, "name");
    
    if oldName then
      _G.Protos[oldName] = nil;
    end
    
    _G.Protos[value] = table;
    
    return rawset(table, "name", value);
  end
  
  
  if type(value) == "function" then
    table.prototype[key] = function(...)
      value(...);
    end
  
  else
    return rawset(table, key, value);
  end
end


function __realindex(table, key)
  
  if key == "constructor" then
    rawset(table.prototype, "constructor", nil);
    rawset(table, "constructor", nil);
  
    function table.prototype:constructor(...)
      return constructor(table, ...);
    end
    
  
  elseif rawget(table.prototype, key)  and not rawget(table, key) then
    
    if type(rawget(table.prototype, key)) == "function" then
      return function(...) 
        return rawget(table.prototype, key)(table, ...);
      end
    else
      return rawget(table.prototype, key);
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
  
  local self = setmetatable({}, c);
  
  self.name = c.name;
  self.prototype = c.prototype;
  
  self.__index = __realindex;
  self.__newindex = __realnewindex;
  
  table.insert(c.instances, self);
  
  local ret = rawget(self.prototype, "constructor")(self, ...);
  
  if not ret then
    return self;
  else
    return ret;
  end
end end


function Prototype.new(name) return function(p)
  Prototype.__index = Prototype;
  
  local proto = {};
  
  for k, v in pairs(p) do
    proto[k] = v;
    p[k] = nil;
  end
  
  p.__index = __realindex;
  p.__newindex = __realnewindex;
  
  local self = setmetatable(p, Prototype);
  self.name = name;
  self.instances = {};
  self.prototype = proto;
  
  Prototype.__index = __realindex;
  Prototype.__newindex = __realnewindex;
  
  self.__index = __realindex;
  self.__newindex = __realnewindex;
  
  
  if not rawget(self, "constructor") and not rawget(self.prototype, "constructor") then
    function self.prototype.constructor() end
    
    
  elseif rawget(self, "constructor") or rawget(self.prototype, "constructor") then
    local constructor;
    
    if rawget(self, "constructor") then
      constructor = rawget(self, "constructor");
    else
      constructor = rawget(self.prototype, "constructor");
    end
    
    rawset(self, "constructor", nil);
    rawset(self.prototype, "constructor", nil);
    
    function self.prototype.constructor(...)
      return constructor(...);
    end
  end
  
  
  _G.Protos[self.name] = self;
  
  return self;

end end


class "User" {
  constructor = function(self, name)
    self.Username = name;
  end,
  
  Test = function(self, ...)
    return ...;
  end,
  
  a = "b"
};


local user = new "User"("dave");


print(user.Test("a", "b"));

print(user.a);




