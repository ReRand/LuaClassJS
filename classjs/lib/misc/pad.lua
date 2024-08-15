return function(payload) 

  return function pad(o, t, l)
  	local x = o;
  	x = (t):rep(l-x:len())..x;
  	return x;
  end

end
