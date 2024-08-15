return function(payload)

  local rbx = payload.rbx;

  local PrototypeItem = {};
  PrototypeItem.__index = PrototypeItem;

  local typePayload = {

    -- methods
    new = rbx and script.methods.new or "methods/new.lua", 			             -- creates a new PrototypeItem

    
    -- internal metatable functions
    __tostring = rbx and script.__.tostring or "__/tostring.lua", 			     -- controls what the PrototypeItem outputs
    __len = rbx and script.__.len or "__/len.lua",
    
  }

  return PrototypeItem;
  
end
