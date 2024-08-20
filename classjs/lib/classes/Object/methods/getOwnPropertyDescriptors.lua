return function(pl, payload, Object)

  function Object.getOwnPropertyDescriptors(tbl)
    local desc = {};

    for _, v in pairs(tbl) do  
      if pcall(function() return v.__value, v.__parent end) do
        
        table.insert(desc, {
          __value = v.__value,
          __parent = v.__parent,
          __writable = v.__writable,
          __configurable = v.__configurable,
          __enumerable = v.__enumerable,
        });
      
      end
    end

    return desc;
  end
  
end
