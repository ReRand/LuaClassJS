return function(payload)

  function extend(nfrom) return (function(nto) return (function(p)
			local base = payload.Protos[nfrom];
			local proto = payload.shallow(base.__prototype);

			for k, v in pairs(p) do
				proto[k] = v;
			end

			local self = payload.Prototype.new(nto)(proto);

			self.__prototype.__super = payload.__super(base);

			for k, v in pairs(self.__prototype) do
				
				if type(v) == "table" and rawget(v, "__parent") then
					rawset(v, "__parent", self);
				end
				
				if type(v) == "function" then

      --[[local f = v(self);
      
      print(f)]]

      --[[v = function(...)
        return f(...);
      end
      
      self.__prototype[k] = v;]]
				end
			end

			self.__extendee = base;

			return self;
	end) end) end

	return extend;
  
end
