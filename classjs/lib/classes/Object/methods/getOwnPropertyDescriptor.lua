return function(pl, payload, Object)

  function Object.getOwnPropertyDescriptors(tbl, name)
    local desc = nil;

    for k, v in pairs(tbl) do  
      if pcall(function() return v.__value, v.__parent end) and k == name then
        
        desc = {
          __value = v.__value,
          __parent = v.__parent,
          __writable = v.__writable,
          __configurable = v.__configurable,
          __enumerable = v.__enumerable,
        };

          return desc;
      
      end
    end

    return desc;
  end
  
end
