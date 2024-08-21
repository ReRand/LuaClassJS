return function(payload)

  local rbx = payload.rbx;

  local Object = {};
  Object.__index = Object;

  local typePayload = {

  }

local function split(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t = {}
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		table.insert(t, str)
	end
	return t
end

if rbx then
	for k, v in pairs(typePayload) do
		v = v:gsub(".lua", "");
		
		local dir = split(v, "/");
		local path = script;

		for i, d in ipairs(dir) do
			path = path:FindFirstChild(d);
		end

		typePayload[k] = path;
	end
end

  for k, v in pairs(typePayload) do
  	require(v)(payload, typePayload, Object);
  end

  return Object;
  
end
