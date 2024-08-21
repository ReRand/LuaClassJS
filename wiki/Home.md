# classjs docs
place where you can learn about all the stuff in classjs

```lua
local class, new = require("classjs")("class", "new");


local Example = class "Example" {
    constructor = function(self, name)
        self.Name = name;
    end,

    Test = function(self)
        return string.lower(self.Name)                            
    end,

    Type = 1

};


print(Example); -- [class Example]


local pim = new "Example"("pim");


print(pim.Name); -- "pim"

print(pim.Type); -- 1
```