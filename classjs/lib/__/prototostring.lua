return function(payload) 
  
  function __prototostring(tbl)
  	local d = payload.dump(tbl);
  
  	if tbl.__name then
  		return tbl.__name .. " ("..payload.tid(tbl)..") " .. d
  	end
  
  	return d;
  end

  return __prototostring;

end
