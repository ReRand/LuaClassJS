--[[ 
NOTE: cool print is some methods used to make printing on base lua prettier
if you're using this on roblox it should be disabled anyway
]]


return {

	
coolPrintDebugClassStuff = false, 	-- if the cool print should include debug class things such as __ functions
disableInnerCoolPrint = false,    	-- if PropertyItem's cool print should be disabled
disableCoolPrint = false,		-- if instances' cool print should be disabled
useObjects = false,			-- if it should use PropertyItem and object stuff, if false it just sets the property's value
forceRbx = nil				-- if roblox features should be forced, change from nil to use this
	
};
