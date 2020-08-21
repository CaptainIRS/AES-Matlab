function [state] = SubBytes(state)
% Transformation in the Cipher that processes the State using a nonlinear 
% byte substitution table (S-box) that operates on each of the State bytes 
% independently
    state = arrayfun(@(x) Config.sbox(floor(x/16) + 1, mod(x, 16) + 1), double(state));
end