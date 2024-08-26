<table>
<tr><td>

checks if a class instance's prototype matches up with a given prototype<br>
there's also a version in the default payload, see [isa()](https://github.com/ReRand/LuaClassJS/wiki/isa())


to learn how to create classes see keyword [class](https://github.com/ReRand/LuaClassJS/wiki/class)

<table>

<tr><td> Lua </td></tr>
<tr><td>

```lua
local class, new = require("classjs")("class", "new", "isa");


local Example = class "Example" {
    constructor = function(self, name)
        self.Name = name;
    end,

}


local pim = new "Example"("Pim");


print(pim.__isa("Example")); -- true

```

</td></tr>
</table>

</td><td> 

<b>Type:</b><br>
- `Function`

</td><td> 

<b>Returns:</b><br>
- `Boolean`

</td><td>

<b>Sources:</b><br>
- [classjs / lib / classes / Prototype / methods / __isa](https://github.com/ReRand/LuaClassJS/tree/master/classjs/lib/classes/Prototype/methods/__isa.lua)

</td></tr>

</table>

<table>
<tr>

<td>

#### Arguments:
> - *b* `String` || [`Prototype`](https://github.com/ReRand/LuaClassJS/wiki/Prototype) <br>
> class to check with<br>
> <br>

<br>

</td><td>

</td>

</table>

<br> <h1> [🢀 Back](https://github.com/ReRand/LuaClassJS/wiki/Prototype) </h1>