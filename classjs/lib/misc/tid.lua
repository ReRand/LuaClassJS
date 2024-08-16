return function(payload)

  function tid(t)
  	return payload.rawtostring(t):gsub("table: ", "", 1)
  end

  return tid;

end
