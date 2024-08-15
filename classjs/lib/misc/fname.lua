return function(payload)

  function fname(m)
  	for k, v in pairs(_G) do
  		if m == v then return k; end
  	end
  end


  return fname;

end
