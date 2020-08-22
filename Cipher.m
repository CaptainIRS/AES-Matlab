function [out] =  Cipher(in, K, Nk, Nb, Nr)
    in = reshape(in, Nb, 4);
    state = int32(in);
    fprintf("\n\nInitial Round: \nInitial State  :");
    fprintf("%0x ", state);
    fprintf("\n");
    w = KeyExpansion(K, Nk, Nb, Nr);
    state = AddRoundKey(state, w(1:Nb, :)', Nb);
    fprintf("FirstRoundKey  : ");
    fprintf("%0x ", w(1:Nb, :)');
    fprintf("\nState          :");
    fprintf("%0x ", state);
    
    for round = 1:(Nr-1)
        fprintf("\n\nRound %d: ", round);
        fprintf("\nSubBytes      : ");
        state = SubBytes(state);
        fprintf("%0x ", state);
        fprintf("\nShiftRows     : ");
        state = ShiftRows(state);
        fprintf("%0x ", state);
        fprintf("\nMixColumns    : ");
        state = MixColumns(state);
        fprintf("%0x ", state);
        fprintf("\nRoundKey      : ");
        fprintf("%0x ", w(round*Nb+1:(round+1)*Nb, :)');
        fprintf("\nAddRoundKey   : ");
        state = AddRoundKey(state, w(round*Nb+1:(round+1)*Nb, :)', Nb);
        fprintf("%0x ", state);
    end
    
    fprintf("\n\nFinal Round:");
    fprintf("\nSubBytes      : ");
    state = SubBytes(state);
    fprintf("%0x ", state);
    fprintf("\nShiftRows     : ");
    state = ShiftRows(state);
    fprintf("%0x ", state);
    fprintf("\nRoundKey      : ");
    fprintf("%0x ", w(Nr*Nb+1:(Nr+1)*Nb, :)');
    fprintf("\nAddRoundKey   : ");
    state = AddRoundKey(state, w(Nr*Nb+1:(Nr+1)*Nb, :)', Nb);
    fprintf("%0x ", state);
    fprintf("\n");
    
    fprintf("\nFinal State   : ");
    fprintf("%0x ",  state);
    out = state;
end