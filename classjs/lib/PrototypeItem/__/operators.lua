return function(p, payload, PrototypeItem)

  function PrototypeItem.__le(tbl, b) return tbl.__value <= b; end
  function PrototypeItem.__lt(tbl, b) return tbl.__value < b; end
  function PrototypeItem.__ge(tbl, b) return tbl.__value >= b; end
  function PrototypeItem.__gt(tbl, b) return tbl.__value > b; end
  function PrototypeItem.__eq(tbl, b) return tbl.__value == b; end
  
  function PrototypeItem.__add(tbl, b) return PrototypeItem.new(tbl.__parent, (tbl.__value + b), tbl); end
  function PrototypeItem.__sub(tbl, b) return PrototypeItem.new(tbl.__parent, (tbl.__value - b), tbl); end
  function PrototypeItem.__mul(tbl, b) return PrototypeItem.new(tbl.__parent, (tbl.__value * b), tbl); end
  function PrototypeItem.__div(tbl, b) return PrototypeItem.new(tbl.__parent, (tbl.__value / b), tbl); end
  function PrototypeItem.__mod(tbl, b) return PrototypeItem.new(tbl.__parent, (tbl.__value * b), tbl); end
  function PrototypeItem.__pow(tbl, b) return PrototypeItem.new(tbl.__parent, (tbl.__value ^ b), tbl); end
  function PrototypeItem.__idiv(tbl, b) return PrototypeItem.new(tbl.__parent, (tbl.__value // b), tbl); end
  
  function PrototypeItem.__band(tbl, b) return PrototypeItem.new(tbl.__parent, (tbl.__value .. b), tbl); end
  function PrototypeItem.__unm(tbl) return PrototypeItem.new(tbl.__parent, (-tbl.__value), tbl); end;
  
end
