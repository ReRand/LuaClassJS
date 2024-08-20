return function(pl, payload, Object)

  
    function Object.entries(tbl)
      local t = {};
  
      for k, v in pairs(tbl) do
        table.insert(t, { [1] = k, [2] = v });
      end
  
      return t;  
    end
  
    
  end