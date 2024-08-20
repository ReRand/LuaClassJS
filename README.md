# LuaClassJS
a recreation of JavaScript classes and prototypes in lua and luau

includes: 
- class, new, and extend keywords
- class checking and super functions
- isa and getclass built-in functions

<br>

```lua
local class, new, extend = require("classjs")("class", "new", "extend");


local Base = class "Base" {
  constructor = function(self, name)
    self.Name = name;
  end,

  AddAttribute = function(self, k, v)
    self.Attributes[k] = v;
    return self.Attributes;
  end,

  Attributes = {}
}


function Base.ClearAttributes(self)
  self.Attributes = {};
  return self.Attributes;
end


extend "Base" "User" {
  constructor = function(self, id, name)
    self.Id = id;
    self.__super(name);
  end,

  RemoveAttribute = function(self, k)
    self.Attributes[k] = nil;
  end,

  Attributes = {
    Type = "User"
  }
}


local user = new "User"("user_1", "User1");

print(user.Attributes); -- { Type = "User" }

user.RemoveAttribute("Type");
user.AddAttribute("Status", "Cool");

print(user.Attributes); -- { Status = "Cool" }

user.ClearAttributes();

print(user.Attributes); -- { }

```
