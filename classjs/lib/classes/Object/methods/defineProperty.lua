return function(pl, payload, Object)

    function Object.defineProperty(tbl, name, propdata)
        local item = nil;
        
        if pl.rbx then
            local PrototypeItem = pl.PayloadItem;
            item = PrototypeItem.new(tbl, propdata.__value, propdata);
        else
            item = propdata.__value;
        end

        tbl[name] = item;
    end
    
  end
  