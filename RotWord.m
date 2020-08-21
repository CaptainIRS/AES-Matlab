function [out] = RotWord(in)
    out = circshift(in, -1);
end