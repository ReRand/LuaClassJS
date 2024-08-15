return function(payload)

  return function tid(t)
  	return rawtostring(t):gsub("table: ", "", 1)
  end

end
