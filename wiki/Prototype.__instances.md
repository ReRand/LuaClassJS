<table>
<tr><td>

table of instances for the class<br>

<table>

<tr><td> Lua </td></tr>
<tr><td>

```lua
local class, new = require("classjs")("class", "new");


local Example = class "Example" {
    constructor = function(self, name)
        self.Name = name;
    end
}


new "Example"("pim");
new "Example"("jim");


print(Example.__instances); -- { {...}, {...} }

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