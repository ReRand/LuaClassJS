return function(payload) 
  
  function __metatostring(tbl)
  	local d = payload.dump(tbl);
  
  	if tbl.__name then
  		return tbl.__name .. " ("..payload.tid(tbl)..") " .. d
  	end
  
  	return d;
  end

  return __metatostring;

end
