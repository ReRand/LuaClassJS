<table>
<tr><td>

a class prototype template thing that dictates what should be the basis for all instances<br>

the main big thing for the module that does all the big cool awesome things

<br>

to learn how to create class prototyps see keyword [class](https://github.com/ReRand/LuaClassJS/wiki/class)
to learn how to create class instances see keyword [new](https://github.com/ReRand/LuaClassJS/wiki/new)

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


print(Example) -- [class Example]
```

</td></tr>
</table>

</td><td> 

<b>Type:</b><br>
- `Metatable`

</td><td> 

<b>Returns:</b><br>
- [`Prototype`](https://github.com/ReRand/LuaClassJS/wiki/Prototype) (Instance)

</td><td>

<b>Sources:</b><br>
- [classjs / lib / classes / Prototype](https://github.com/ReRand/LuaClassJS/tree/master/classjs/lib/classes/Prototype)

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

#### Methods
> - <b> [🛈](https://github.com/ReRand/LuaClassJs/wiki/Prototype.new()) new() </b>
> - <b> [🛈](https://github.com/ReRand/LuaClassJs/wiki/Prototype.__isa()) __isa() </b>
> - <b> [🛈](https://github.com/ReRand/LuaClassJs/wiki/Prototype.__super()) __super() </b>

---

#### Properties
> - <b> [🛈](https://github.com/ReRand/LuaClassJs/wiki/Prototype.__name) __name </b>
> - <b> [🛈](https://github.com/ReRand/LuaClassJs/wiki/Prototype.__instances) __instances </b>
> - <b> [🛈](https://github.com/ReRand/LuaClassJs/wiki/Prototype.__prototype) __prototype </b>
<br>

</td>

</table>

<br> <h1> [🢀 Back](https://github.com/ReRand/LuaClassJS/wiki) </h1>