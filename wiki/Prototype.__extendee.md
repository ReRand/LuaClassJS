<table>
<tr><td>

class extended from<br>
only available in extensions<br>

to learn about extentions see keyword [extend](https://github.com/ReRand/LuaClassJS/wiki/extend)

<table>

<tr><td> Lua </td></tr>
<tr><td>

```lua
local class, extend = require("classjs")("class", "extend");


class "Base" {
    constructor = function(self, name)
        self.Name = name;
    end
}


local Example = extend "Base" "Example" {
    constructor = function(self, name)
        self.__super(name);
    end
}

print(Example.__extendee); -- [class Base]
```

</td></tr>
</table>

</td><td> 

<b>Type:</b><br>
- [`Prototype`](https://github.com/ReRand/LuaClassJS/wiki/Prototype)

</td><td>

<b>Sources:</b><br>
- [classjs / lib / keywords / extend](https://github.com/ReRand/LuaClassJS/tree/master/classjs/lib/keywords/extend.lua)

</td></tr>

</table>

<br> <h1> [🢀 Back](https://github.com/ReRand/LuaClassJS/wiki/Prototype) </h1>