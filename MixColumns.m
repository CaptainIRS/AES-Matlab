function [state] = MixColumns(state)
    row = [2 3 1 1];
    A = gf(gallery('circul', row), 8, Config.mx);
    state = A * state;
    state = state.x;
end