return function(payload)

  function fid(f)
  	return tostring(f):gsub("function: ", "", 1);
  end


  return fid;

end
