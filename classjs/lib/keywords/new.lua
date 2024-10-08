return function(payload)

    function new(name) return (function(...)

		local c = payload.Protos[name];

		-- if it can't find it in _G.Protos
		if not c then
			error("Class \""..name.."\" not found in globals while trying to create a new instance.");
		end


		local exter = {
			__name = c.__name;
			__prototype = c.__prototype;
			__class = c
		};


		local ext = setmetatable(exter, c);
		


		function ext.__index(tbl, ...)
			return payload.__metaindex(tbl, ...);
		end

		function ext.__newindex(tbl, ...)
			return payload.__metanewindex(tbl, ...);
		end


		if not payload.rbx or not payload.Config.disableCoolPrint then

			function ext.__tostring(tbl)
				return payload.__metatostring(tbl);
			end
		end


		local self = setmetatable(exter, ext);

		-- self.__under = ext;


		if c.__instances then
			-- table.insert(c.__instances, self);
		end
		
		if payload.Config.useObjects then
  		for k, v in pairs(self.__prototype) do
  			if type(v) == "table" then
  				rawset(v, "__parent", self);
  			end
  		end
  	end

		local ret = self.__prototype.constructor(self, ...);
		
		if not ret then
			return self;
		else
			return ret;
		end
	end) end


	return new;
    
end
