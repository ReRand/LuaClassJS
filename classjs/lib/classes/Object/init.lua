return function(payload)

  local rbx = payload.rbx;

  local Object = {};
  Object.__index = Object;

  local typePayload = {

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
  	require(v)(payload, typePayload, Object);
  end

  return Object;
  
end
