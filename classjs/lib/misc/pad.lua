return function(payload) 

  function pad(o, t, l)
  	local x = o;
  	x = (t):rep(l-x:len())..x;
  	return x;
  end

  return pad;
  
end
