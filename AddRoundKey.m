function [state] = AddRoundKey(state, w, Nb)
    w = gf(w, 8, Config.mx);
    state = gf(state, 8, Config.mx);
    for i = 1:Nb
        state(i, :) = state(i, :) + w(i, :);
    end
    state = int16(state.x);
end