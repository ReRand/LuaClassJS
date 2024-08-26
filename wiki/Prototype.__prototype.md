<table>
<tr><td>

preset prototype data for the class copied over on every instance<br>

<table>

<tr><td> Lua </td></tr>
<tr><td>

```lua
local class = require("classjs")("class");


local Example = class "Example" {
    constructor = function(self, name)
        self.Name = name;
    end
}


print(Example.__prototype); -- {...}

```

</td></tr>
</table>

</td><td> 

<b>Type:</b><br>
- `Table`

</td><td>

<b>Sources:</b><br>
- [classjs / lib / classes / Prototype / methods / new](https://github.com/ReRand/LuaClassJS/tree/master/classjs/lib/classes/Prototype/methods/new.lua)

</td></tr>

</table>

<br> <h1> [🢀 Back](https://github.com/ReRand/LuaClassJS/wiki/Prototype) </h1>