<table>
<tr><td>

creates new class instance<br>

to learn how to create classes see keyword [class](https://github.com/ReRand/LuaClassJS/wiki/class)

<table>

<tr><td> Lua </td></tr>
<tr><td>

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

}


local pim = new "Example"("Pim");

print(pim.Type); -- 1
```

</td></tr>
</table>

</td><td> 

<b>Type:</b><br>
- `Function`

</td><td> 

<b>Returns:</b><br>
- [`Prototype`](https://github.com/ReRand/LuaClassJS/wiki/Prototype) (Instance)

</td><td>

<b>Sources:</b><br>
- [classjs / lib / keywords / new](https://github.com/ReRand/LuaClassJS/tree/master/classjs/lib/keywords/new.lua)

</td></tr>

</table>

<table>
<tr>

<td>

#### Arguments:
> - [*name*](https://github.com/ReRand/LuaClassJS/wiki/Prototype.__name) `String`<br>
> name of the class you're creating from<br>
>
> - *?...* `Any`<br>
> arguments for the class's prototype<br>
> <br>

<br>

</td><td>

</td>

</table>

<br> <h1> [🢀 Back](https://github.com/ReRand/LuaClassJS/wiki) </h1>