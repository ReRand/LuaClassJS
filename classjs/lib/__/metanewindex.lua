return function(payload)
  
  function __metanewindex(tbl, key, value)
  	if key == "constructor" then
  		rawset(tbl, "constructor", nil);
  	end
  
  	if type(value) == "function" and not string.match(key, "__") then
  		if payload.Config.useObjects then
  			rawset(tbl, key, payload.PrototypeItem.new(tbl, function(...)
  				return value(...);
  			end))
  		else
  			rawset(tbl, key, function(...)
  				return value(...);
  			end)
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

  return __metanewindex;
  
end
