return function(p, payload, Prototype)

  function Prototype:__tostring()
  	return "[class " .. self.__name .. "]";
  end
  
end
