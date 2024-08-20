return function(pl, payload, Object)

    function Object.defineProperties(tbl, propdatas)

        for _, propdata in pairs(propdatas) do
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
    
  end
  