local Prototype = {};
Prototype.__index = Prototype;


function __realnewindex(table, key, value)
  if key == "Name" then
    
    local oldName = rawget(table, "Name");
    
    if oldName then
      _G.Protos[oldName] = nil;
    end
    
    _G.Protos[value] = table;
    
    return rawset(table, "Name", value);
  end
  
  
  if type(value) == "function" then
    table.Prototype[key] = function(...)
      value(...);
    end
  
  else
    return rawset(table, key, value);
  end
end


function __realindex(table, key)
  
  if key == "Constructor" then
    rawset(table.Prototype, "Constructor", nil);
    rawset(table, "Constructor", nil);
  
    function table.Prototype:Constructor(...)
      return constructor(table, ...);
    end
    
  
  elseif rawget(table.Prototype, key)  and not rawget(table, key) then
    
    if type(rawget(table.Prototype, key)) == "function" then
      return function(...) 
        return rawget(table.Prototype, key)(table, ...);
      end
    else
      return rawget(table.Prototype, key);
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


function Class(n)
  return Prototype.new(n);
end


function Get(n)
end


function New(name) return function(...)
  
  local c = _G.Protos[name];
  
  local self = setmetatable({}, c);
  
  self.Name = c.Name;
  self.Prototype = c.Prototype;
  
  self.__index = __realindex;
  self.__newindex = __realnewindex;
  
  table.insert(c.Instances, self);
  
  local ret = rawget(self.Prototype, "Constructor")(self, ...);
  
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
  self.Name = name;
  self.Instances = {};
  self.Prototype = proto;
  
  Prototype.__index = __realindex;
  Prototype.__newindex = __realnewindex;
  
  self.__index = __realindex;
  self.__newindex = __realnewindex;
  
  
  if not rawget(self, "Constructor") and not rawget(self.Prototype, "Constructor") then
    function self.Prototype.Constructor() end
    
    
  elseif rawget(self, "Constructor") or rawget(self.Prototype, "Constructor") then
    local constructor;
    
    if rawget(self, "Constructor") then
      constructor = rawget(self, "Constructor");
    else
      constructor = rawget(self.Prototype, "Constructor");
    end
    
    rawset(self, "Constructor", nil);
    rawset(self.Prototype, "Constructor", nil);
    
    function self.Prototype.Constructor(...)
      return constructor(...);
    end
  end
  
  
  _G.Protos[self.Name] = self;
  
  return self;

end end


Class "User" {
  Constructor = function(self, name)
    self.Username = name;
  end,
  
  Test = function(self, ...)
    return ...;
  end,
  
  a = "b"
};


local user = New "User"("dave");


print(user.Test("a", "b"));

print(user.a);




