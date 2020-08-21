function [state] = InvSubBytes(state)
    state = arrayfun(@(x) Config.invsbox(floor(x/16) + 1, mod(x, 16) + 1), double(state));
end