<table>
<tr><td>

creates a new Prototype<br>

<table>

<tr><td> Lua </td></tr>
<tr><td>

```lua
local Prototype = require("classjs")("Prototype");


local Example = Prototype.new("Example", {
    constructor = function(self, name)
        self.Name = name;
    end,

    Test = function(self)
        return string.lower(self.Name)                     
    end,

    Type = 1

});


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
- [classjs / lib / classes / Prototype / methods / new](https://github.com/ReRand/LuaClassJS/tree/master/classjs/lib/classes/Prototype/methods/new.lua)

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

<br> <h1> [🢀 Back](https://github.com/ReRand/LuaClassJS/wiki/Prototype) </h1>