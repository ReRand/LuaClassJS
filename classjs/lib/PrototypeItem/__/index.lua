return function(p, payload, PrototypeItem)

  function PrototypeItem.__index(tbl, key)	
	
  	print(tbl);
  	
  	-- nab from the item itself
  	if rawget(tbl, key) then
  		return rawget(tbl, key);
  		
  		
  	-- nab from the item's value
  	elseif pcall(function() return rawget(tbl.__value, key) end) then
  		return rawget(tbl.__value, key);
  		
  		
  	-- weird fix for it calling __metaindex on the parent table
  	elseif rawget(tbl, "__value") and type(tbl.__value) == "function" then
  		
  		local parent = rawget(tbl, "__parent") or tbl;
  		return rawget(tbl, "__value")(parent, key);
  	end
  end
  
end
