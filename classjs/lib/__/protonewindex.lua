return function(payload)

  function __protonewindex(tbl, key, value)
  
  	local output = nil;
  
  	if key == "constructor" then
  		return rawset(tbl, "constructor", nil);
  	end
  
  	if key == "__name" then
  		local oldName = rawget(tbl, "__name");
  
  		if oldName then
  			payload.Protos[oldName] = nil;
  		end
  
  		payload.Protos[value] = tbl;
  
  		if payload.Config.useObjects then
  			return rawset(tbl, "__name", payload.PrototypeItem.new(tbl, value));
  		else
  			return rawset(tbl, "__name", value);
  		end
  	end
  
  
  	if type(value) == "function" and not string.match(key, "__") then
  
  		if payload.Config.useObjects then
  			tbl.__prototype[key] = payload.PrototypeItem.new(tbl, function(...)
  				return value(...);
  			end)
  		else
  			tbl.__prototype[key] = function(...)
  				return value(...);
  			end
  		end
  
  	elseif not string.match(key, "__") then
  		local item;
  		if payload.Config.useObjects then
  			item = payload.PrototypeItem.new(tbl, value);
  		else
  			item = value;
  		end
  			
  		return rawset(tbl, key, item);
  	
  	else
  		return rawset(tbl, key, value);
  	end
  end

  return __protonewindex;

end
