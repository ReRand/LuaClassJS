<table>
<tr><td>

creates new class prototypes<br>

to learn how to initiate classes see keyword [new](https://github.com/ReRand/LuaClassJS/wiki/new)

<table>

<tr><td> Lua </td></tr>
<tr><td>

```lua
local class = require("classjs")("class");


local Example = class "Example" {
    constructor = function(self, name)
        self.Name = name;
    end,

    Test = function(self)
        return string.lower(self.Name)                     
    end,

    Type = 1

}
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
- [classjs / lib / keywords / class](https://github.com/ReRand/LuaClassJS/tree/master/classjs/lib/keywords/class.lua)

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