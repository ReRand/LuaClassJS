return function New(name) return function(...)
    
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
