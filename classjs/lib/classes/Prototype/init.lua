return function(payload)

  local rbx = payload.rbx;

  local Prototype = {};
  Prototype.__index = Prototype;

  local typePayload = {

    -- methods
    new = "methods/new.lua", 			             -- creates a new Prototype

    
    -- internal metatable functions
    __tostring = "__/tostring.lua", 			     -- controls what the PrototypeItem outputs
    
  }

if rbx then
	for k, v in pairs(libs) do
		v = v:gsub(".lua", "");
		
		local dir = split(v, "/");
		local path = script;

		for i, d in ipairs(dir) do
			path = path:FindFirstChild(d);
		end

		libs[k] = path;
	end
end

  for k, v in pairs(typePayload) do
  	require(v)(payload, typePayload, Prototype);
  end

  return Prototype;
  
end
