return function(payload)

  return function fid(f)
  	return tostring(f):gsub("function: ", "", 1);
  end

end
