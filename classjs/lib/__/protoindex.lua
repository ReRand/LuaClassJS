return function(payload)

  return function __protoindex(tbl, key)
  	local protoGot = rawget(tbl.__prototype, key);
  	
  	if protoGot and not rawget(tbl, key) then
  
  		if type(protoGot) == "function" then
  			return function(...) 
  				return protoGot(tbl, ...);
  			end
  		else
  			return protoGot;
  		end
  
  	else
  		return rawget(tbl, key);
  	end
  end

end
