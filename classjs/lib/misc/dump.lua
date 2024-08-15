return function(p)

  function dump(o, layer)
  	if not layer then layer = 1; end
  
  	local t = p.pad("", "\t", layer);
  	local lastt = p.pad("", "\t", layer-1);
  
  	if type(o) == 'table' and not o.__base then
  
  		o = p.shallow(o);
  
  		if o.__prototype then
  			for k, v in pairs(o.__prototype) do o[k] = v end
  		end
  
  		local s = '{';
  
  		local li = 0;
  		local i = 0;
  
  		local function dothe(k)
  			return (k ~= "__instances" and (not string.match(k, "__") or p.Config.coolPrintDebugClassStuff))
  		end
  
  		for k, _ in pairs(o) do
  
  			if dothe(k) then
  				li = li + 1;
  			end 
  		end
  
  		if li > 0 then
  			s = s.."\n";
  		end
  
  		for k,v in pairs(o) do
  
  			if dothe(k) then
  				-- if not string.match(k, "__") then
  
  				i = i + 1;
  
  				local e = "\n";
  
  				if i ~= li then
  					e = ","..e;
  				end
  
  				if type(k) ~= 'number' and string.match(k, " ") then k = '"'..k..'"' end;
  				if type(v) == "string" then v = '"'..v..'"' end;
  				if type(v) == "function" then
  					local mName = p.fname(v);
  
  					if mName then
  						v = mName .. "() (" .. p.fid(v) .. ")";
  					else
  						v = "function() (" .. p.fid(v) .. ")";
  					end
  				end
  
  				if v ~= o then
  					s = s .. t .. k ..': ' .. dump(v, layer+1) .. e;
  				end
  
  
  				-- print(i, li);
  
  				if i == li then
  					break;
  				end
  
  			end
  		end
  
  		if li > 0 then
  			return s .. lastt .. '}'
  		else
  			return s .. '}'
  		end
  	else
  		return tostring(o)
  	end
  end

  return dump;
end
