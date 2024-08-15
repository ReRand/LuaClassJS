return function(payload)

  return function(f)
  	return tostring(f):gsub("function: ", "", 1);
  end

end
