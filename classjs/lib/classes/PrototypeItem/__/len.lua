return function(p, payload, PrototypeItem)

  function PrototypeItem.__len(tbl)
    local i = 0;
    
    local success = pcall(function()
      i = #tbl.__value;
    end);
    
    if not success then
      for _ in ipairs(tbl.__value) do i = i + 1; end
    end
    
    return i;
  end
  
end
