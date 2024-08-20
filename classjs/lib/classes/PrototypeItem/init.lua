return function(payload)

  local rbx = payload.rbx;

  local PrototypeItem = {};
  PrototypeItem.__index = PrototypeItem;

  local typePayload = {

    -- methods
    new = "methods/new.lua", 			             -- creates a new PrototypeItem

    
    -- internal metatable functions
    __tostring = "__/tostring.lua", 			     -- controls what the PrototypeItem outputs
    __len = "__/len.lua",                           -- controls # (table length) outputs 
    __operators = "__/operators.lua",         -- adds all operators
    
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

  for k, v in pairs(typePayload) do
  	require(v)(payload, typePayload, PrototypeItem);
  end

  return PrototypeItem;
  
end
