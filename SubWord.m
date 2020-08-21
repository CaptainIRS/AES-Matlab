function [out] = SubWord(in) 
% A function that takes a four-byte input word and applies the S-box
% to each of the four bytes to produce an output word
    out = arrayfun(@(x) Config.sbox(floor(x/16) + 1, mod(x, 16) + 1), double(in.x));
    out = gf(out, 8, Config.mx);
end