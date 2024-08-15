return function(payload)

  return function shallow(t)
  	local nt = {};
  	for k, v in pairs(t) do nt[k] = v end
  	return nt;
  end

end
