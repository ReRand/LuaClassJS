return function(p, payload, PrototypeItem)

  function PrototypeItem.__newindex(tbl, key, value)
  	-- nab from the item itself
  	if rawget(tbl, key) then
  		rawset(tbl, key, value);
  
  
  	-- nab from the item's value
  	elseif pcall(function() return rawget(tbl.__value, key) end) and tbl.__writable then
  		rawset(tbl.__value, key, value);
  		
  		
  	elseif pcall(function() return rawget(tbl.__value, key) end) and not tbl.__writable then
  		error("Class entry \"" .. key .. "\" not writeable");
  	end
  end
  
end
