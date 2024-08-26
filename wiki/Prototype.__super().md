<table>
<tr><td>

used in extentions to run the constructor of the class extended from<br>
only available in extentions<br>

to learn about extentions see keyword [extend](https://github.com/ReRand/LuaClassJS/wiki/extend)

<table>

<tr><td> Lua </td></tr>
<tr><td>

```lua
local class, extend, new = require("classjs")("class", "extend", "new");


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


local pim = new "Example"("Pim");

print(pim.Name); -- "Pim"
```

</td></tr>
</table>

</td><td> 

<b>Type:</b><br>
- `Function`

</td><td> 

<b>Returns:</b><br>
- `Any`

</td><td>

<b>Sources:</b><br>
- [classjs / lib / classes / Prototype / methods / __super](https://github.com/ReRand/LuaClassJS/tree/master/classjs/lib/classes/Prototype/methods/__super.lua)

</td></tr>

</table>

<table>
<tr>

<td>

#### Arguments:
> - *?...* `Any` <br>
> Arguments for the constructor<br>
> <br>

<br>

</td><td>

</td>

</table>

<br> <h1> [🢀 Back](https://github.com/ReRand/LuaClassJS/wiki/Prototype) </h1>