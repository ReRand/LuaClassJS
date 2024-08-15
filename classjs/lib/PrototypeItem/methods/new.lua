return function(p, payload, PrototypeItem)

  function PrototypeItem.new(parent, value, t)
  	if not t then t = {}; end;
  	
  	t.__value = value;
  	t.__parent = parent;
  	
  	if not t.__writable then t.__writable = true; end;
  	if not t.__configurable then t.__configurable = true; end;
  	if not t.__enumerable then t.__enumerable = true; end;
  	
  	function t.__iter(tbl)
  		print('a');
  		return tbl.__value;
  	end
  	
  	return setmetatable(t, PrototypeItem);
  end
  
end
