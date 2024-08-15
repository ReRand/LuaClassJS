return function(payload)
  
  function class(n)
    return payload.Prototype.new(n);
  end

  return class;
  
end
