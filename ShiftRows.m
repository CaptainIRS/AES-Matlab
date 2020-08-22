%% *ShiftRows()* Transformation
% In the ShiftRows() transformation, the bytes in the last three rows of 
% the State are cyclically shifted over different numbers of bytes 
% (offsets). The first row, r = 0, is not shifted. 
% 
% Specifically, the ShiftRows() transformation proceeds as follows: 
%
% $$s'_{r, c} = s_{r,(c+ shift (r, N_b)) mod N_b}, $$
%
% for $0 < r < 4$ and 
% $0 \leq c < N_b$ 
%
% where the shift value $shift(r,N_b)$ depends on the row number, $r$, as 
% follows (recall that $N_b$ = 4): 
%
% $$shift(1,4) = 1; shift(2,4) = 2; shift(3,4) = 3$$
%
% This has the effect of moving bytes to “lower” positions in the row 
% (i.e., lower values of c in a given row), while the “lowest” bytes wrap 
% around into the “top” of the row (i.e., higher values ofc in a given row).
%

function [state] = ShiftRows(state)
    for i = 2:4
        state(i, :) = circshift(state(i, :), 1-i);
    end
end