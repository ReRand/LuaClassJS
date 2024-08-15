return function(p, payload, PrototypeItem)
  
  function PrototypeItem.__tostring(tbl)
  	if type(tbl.__value) == "table" and not p.Config.disableInnerCoolPrint then
  		return p.dump(tbl.__value);
  	elseif type(tbl.__value) == "table" and p.Config.disableInnerCoolPrint and baseprint then
  			return baseprint(tbl.__value)
  	else
  		return tostring(tbl.__value);
  	end
  end

end
