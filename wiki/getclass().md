<table>
<tr><td>

gets a class prototype<br>

to learn how to create classes see keyword [class](https://github.com/ReRand/LuaClassJS/wiki/class)

<table>

<tr><td> Lua </td></tr>
<tr><td>

```lua
local class, getclass = require("classjs")("class", "getclass");


class "Example" {
    constructor = function(self, name)
        self.Name = name;
    end,

    Test = function(self)
        return string.lower(self.Name)                     
    end,

    Type = 1

}


local Example = getclass("Example");

print(Example); -- [class Example]

```

</td></tr>
</table>

</td><td> 

<b>Type:</b><br>
- `Function`

</td><td> 

<b>Returns:</b><br>
- [`Prototype`](https://github.com/ReRand/LuaClassJS/wiki/Prototype)

</td><td>

<b>Sources:</b><br>
- [classjs / lib / methods / getclass](https://github.com/ReRand/LuaClassJS/tree/master/classjs/lib/methods/getclass.lua)

</td></tr>

</table>

<table>
<tr>

<td>

#### Arguments:
> - [*name*](https://github.com/ReRand/LuaClassJS/wiki/Prototype.__name) `String`<br>
> name of the class<br>
>
> - [*prototable*](https://github.com/ReRand/LuaClassJS/wiki/Prototype.__prototype) `Table`<br>
> prototype data used for the class's properties<br>
> <br>

<br>

</td><td>

</td>

</table>

<br> <h1> [🢀 Back](https://github.com/ReRand/LuaClassJS/wiki) </h1>