function [state] = InvMixColumns(state)
    row = [14 11 13 9];
    A = gf(gallery('circul', row), 8, Config.mx);
    state = A * state;
    state = state.x;
end