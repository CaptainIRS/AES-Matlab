function [state] = InvShiftRows(state)
    for i = 2:4
        state(i, :) = circshift(state(i, :), i-1);
    end
end