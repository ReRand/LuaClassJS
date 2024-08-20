return function(payload)

  function isa(t, n)
  	return t.__isa(n);
  end

  return isa;

end
