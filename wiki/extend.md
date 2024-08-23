<table>
<tr><td>

creates new class prototypes from a base<br>
creates the [__super()](https://github.com/ReRand/LuaClassJS/wiki/Prototype.__super()) method and [__extendee](https://github.com/ReRand/LuaClassJS/wiki/Prototype.__extendee) property in the class prototype

<table>

<tr><td> Lua </td></tr>
<tr><td>

```lua
local class, extend, new = require("classjs")("class", "extend", "new");


class "Base" {
    constructor = function(self, name)
        self.Name = name;
    end,

    Test = function(self)
        return string.lower(self.Name)                            
    end,

    Type = 1
}


local Example = extend "Base" "Example" {
    constructor = function(self, name)
        self.__super(name);
    end,

    Type = 2
}


local pim = new "Example"("Pim");

print(pim.Name); -- "Pim"
print(pim.Type); -- 2
print(pim.Test()); -- "pim"
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
- [classjs / lib / keywords / extend](https://github.com/ReRand/LuaClassJS/tree/master/classjs/lib/keywords/extend.lua)

</td></tr>

</table>

<table>
<tr>

<td>

#### Arguments:
> - [*base name*](https://github.com/ReRand/LuaClassJS/wiki/Prototype.__name) `String`<br>
> name of the class to extend from<br>
>
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