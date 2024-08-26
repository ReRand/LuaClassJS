return function(p, payload, Prototype)
    
    p.__isa(self, n)
        if type(n) == "table" then
            return n.__name == self.__name;
        else
            return n == self.__name;
        end
    end

end