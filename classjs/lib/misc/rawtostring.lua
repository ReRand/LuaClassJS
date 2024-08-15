local original_tostring = tostring;

return function(payload)
  
  return function rawtostring(val)
  	local mt = getmetatable(val)
  	local __tostring = mt and mt.__tostring
  	if __tostring then mt.__tostring = nil end
  	local str = original_tostring(val)
  	if __tostring then mt.__tostring = __tostring end
  	return str
  end

end
