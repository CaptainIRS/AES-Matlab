%% Add Round Key
% In the *AddRoundKey()* transformation, a Round Key is added to the State 
% by a simple bitwise XOR operation. Each Round Key consists of $Nb$ words 
% from the key schedule. Those $Nb$ words are each added into the columns 
% of the State, such that
% 
% $$[s'_{(1, c)},s'_{(2, c)},s'_{(3, c)},s'_{(4, c)}] = [s_{(1, c)},s_{(2, c)},s_{(3,
% c)},s_{(4, c)}] \oplus [w_{(Nb+c)}], 1 \leq c \leq Nb $$ 
% 
% where $[w_i]$ are the key schedule words

function [state] = AddRoundKey(state, w, Nb)
    w = gf(w, 8, Config.mx);
    state = gf(state, 8, Config.mx);
    for c = 1:Nb
        state(c, :) = state(c, :) + w(c, :);
    end
    state = int16(state.x);
end