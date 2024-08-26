return function(p, payload, Prototype)

    function p.__super(base) return function(...)
        local constructor = rawget(base, "constructor") and rawget(base, "constructor") or rawget(base.__prototype, "constructor");
        return constructor(...);
    end end

end