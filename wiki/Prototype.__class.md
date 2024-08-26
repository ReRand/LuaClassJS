<table>
<tr><td>

class prototype for an instance<br>
only available in instances<br>

to learn about classes see keyword [class](https://github.com/ReRand/LuaClassJS/wiki/class)

<table>

<tr><td> Lua </td></tr>
<tr><td>

```lua
local class, new = require("classjs")("class", "new");


class "Example" {
    constructor = function(self, name)
        self.Name = name;
    end
}


local pim = new "Example"("pim");


print(pim.__class); -- [class Example]
```

</td></tr>
</table>

</td><td> 

<b>Type:</b><br>
- [`Prototype`](https://github.com/ReRand/LuaClassJS/wiki/Prototype)

</td><td>

<b>Sources:</b><br>
- [classjs / lib / keywords / new](https://github.com/ReRand/LuaClassJS/tree/master/classjs/lib/keywords/new.lua)

</td></tr>

</table>

<br> <h1> [🢀 Back](https://github.com/ReRand/LuaClassJS/wiki/Prototype) </h1>