return function(payload)

  local rbx = payload.rbx;

  local Prototype = {};
  Prototype.__index = Prototype;

  local typePayload = {

    -- methods
    new = rbx and script.methods.new or "methods/new.lua", 			             -- creates a new Prototype

    
    -- internal metatable functions
    __tostring = rbx and script.__.tostring or "__/tostring.lua", 			     -- controls what the PrototypeItem outputs
    
  }

  for k, v in pairs(typePayload) do
  	require(v)(payload, typePayload, Prototype);
  end

  return Prototype;
  
end
