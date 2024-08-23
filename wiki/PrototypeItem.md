<table>
<tr><td>

a fake item in a class using JavaScript's Objects<br>
<table>

<tr><td> Lua </td></tr>
<tr><td>

```lua
local class, new = require("classjs")("class", "new");


local Example = class "Example" {
    Type = 1
}


local ex = new "Example"();


print(ex.Type == 1) -- true
print(ex.Type == 2) -- false

print(ex.Type.__writable) -- true
```

</td></tr>
</table>

</td><td> 

<b>Type:</b><br>
- `Metatable`

</td><td> 

<b>Returns:</b><br>
- [`PrototypeItem`](https://github.com/ReRand/LuaClassJS/wiki/PrototypeItem) (Instance)

</td><td>

<b>Sources:</b><br>
- [classjs / lib / classes / PrototypeItem](https://github.com/ReRand/LuaClassJS/tree/master/classjs/lib/classes/PrototypeItem)
- [classjs / lib / classes / Object](https://github.com/ReRand/LuaClassJS/tree/master/classjs/lib/classes/Object)

</td></tr>

</table>

<table>
<tr>

<td>

#### Arguments:
> - [*parent*](https://github.com/ReRand/LuaClassJS/wiki/PrototypeItem.__parent) `class`<br>
> parent class instance<br>
>
> - [*value*](https://github.com/ReRand/LuaClassJS/wiki/PrototypeItem.__value) `Any`<br>
> value of the item<br>
>
> - *?descriptors* `Table`<br>
> descriptors like [*writable*](https://github.com/ReRand/LuaClassJS/wiki/PrototypeItem.__writable), [*configurable*](https://github.com/ReRand/LuaClassJS/wiki/PrototypeItem.__configurable), and [*enumerable*](https://github.com/ReRand/LuaClassJS/wiki/PrototypeItem.__enumerable)
> <br>

<br>

</td><td>

#### Methods
> - <b> [🛈](https://github.com/ReRand/LuaClassJs/wiki/PrototypeItem.new()) new() </b>

---

#### Properties
> - <b> [🛈](https://github.com/ReRand/LuaClassJs/wiki/PrototypeItem.__value) __value </b>
> - <b> [🛈](https://github.com/ReRand/LuaClassJs/wiki/PrototypeItem.__parent) __parent </b>
> - <b> [🛈](https://github.com/ReRand/LuaClassJs/wiki/PrototypeItem.__writable) __writable </b>
> - <b> [🛈](https://github.com/ReRand/LuaClassJs/wiki/PrototypeItem.__configurable) __configurable </b>
> - <b> [🛈](https://github.com/ReRand/LuaClassJs/wiki/PrototypeItem.__enumerable) __enumerable </b>
<br>

</td>

</table>

<br> <h1> [🢀 Back](https://github.com/ReRand/LuaClassJS/wiki) </h1>