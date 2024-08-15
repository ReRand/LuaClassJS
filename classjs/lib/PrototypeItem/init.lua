return function(payload)

  local rbx = payload.rbx;

  local PrototypeItem = {};
  PrototypeItem.__index = PrototypeItem;

  local typePayload = {

    -- methods
    new = rbx and script.methods.new or "methods/new.lua", 			             -- creates a new PrototypeItem
    __tostring = rbx and script.__.tostring or "__/tostring.lua", 			     -- creates a new PrototypeItem
    
  }

  return PrototypeItem;
  
end
