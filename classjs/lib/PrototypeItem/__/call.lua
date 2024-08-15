return function(p, payload, PrototypeItem)

  function PrototypeItem.__call(tbl, ...)
  	print(tbl);
  	
  	for k, v in pairs({...}) do
  		
  		if type(v) == "table" then
  			print(v, v.__name, tbl.__parent.__name)
  		end
  		
  		if type(v) == "table" and v.__name and v.__name == tbl.__parent.__name then
  			return rawget(tbl, "__value")(...);
  		end
  	end
  	
  	return rawget(tbl, "__value")(rawget(tbl, "__parent"), ...);
  end
  
end
