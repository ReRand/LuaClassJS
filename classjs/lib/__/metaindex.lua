return function(payload)
  
  function __metaindex(tbl, key)
  	local protoGot = rawget(tbl.__prototype, key);
  	local normalGot = rawget(tbl, key);
  	local self = rawget(tbl, "__parent") or tbl;
  	
  	if protoGot and not rawget(tbl, key) then
  
  		if type(protoGot) == "function" then
  			return function(...) 
  				return protoGot(self, ...);
  			end
  		else
  			return protoGot
  		end
  
  
  	else
  		
  		if type(normalGot) == "function" then
  			return function(...)
  				return normalGot(self, ...);
  			end
  		else
  			return normalGot;
  		end
  	end
  end

  return __metaindex;
  
end
