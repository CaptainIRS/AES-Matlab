%% Inverse Cipher
% *Parameters:*
% 
% * |in| - Input
% * |K|  - Cipher key in integer array format
% * $N_k$ - Number of 32-bit words comprising the Cipher Key. For this 
% standard, $N_k$ = 4, 6, or 8
% * $N_b$ - Number of columns (32-bit words) comprising the State. For this
% standard, $N_b$ = 4
% * $N_r$ = Number of rounds, which is a function of $N_k$ and $N_b$ (which is 
% fixed). For this standard, $N_r$ = 10, 12, or 14
% 

function [out] = InvCipher(in, K, Nk, Nb, Nr)

    w = KeyExpansion(K, Nk, Nb, Nr);
    
    in = reshape(in, Nb, 4);
    state = int32(in);
    fprintf("\n\nInitial Round: \nInitial State  :");
    fprintf("%0x ", state);
    fprintf("\n");
    state = AddRoundKey(state, w(Nr*Nb+1:(Nr+1)*Nb, :)', Nb);
    fprintf("FirstRoundKey  : ");
    fprintf("%0x ", w(Nr*Nb+1:(Nr+1)*Nb, :)');
    fprintf("\nState          :");
    fprintf("%0x ", state);
    
    for round = (Nr-1):-1:1
       fprintf("\n\nRound %d: ", Nr - round);
       fprintf("\nInvShiftRows  : ");
       state = InvShiftRows(state);
       fprintf("%0x ", state);
       fprintf("\nInvSubBytes   : ");
       state = InvSubBytes(state);
       fprintf("%0x ", state);
       fprintf("\nRoundKey      : ");
       fprintf("%0x ", w(round*Nb+1:(round+1)*Nb, :));
       fprintf("\nAddRoundKey   : ");
       state = AddRoundKey(state, w(round*Nb+1:(round+1)*Nb, :)', Nb);
       fprintf("%0x ", state);
       fprintf("\nInvMixColumns : ");
       state = InvMixColumns(state);
       fprintf("%0x ", state);
    end
    
    fprintf("\n\nFinal Round:"); 
    fprintf("\nInvShiftRows : ");
    state = InvShiftRows(state);
    fprintf("%0x ", state);
    fprintf("\nInvSubBytes  : ");
    state = InvSubBytes(state);
    fprintf("%0x ", state);
    fprintf("\nRoundKey     : ");
    fprintf("%0x ", w(1:Nb, :)');
    fprintf("\nAddRoundKey  : ");
    state = AddRoundKey(state, w(1:Nb, :)', Nb);
    fprintf("%0x ", state);
    fprintf("\n");
    
    fprintf("\nFinal State   : ");
    fprintf("%0x ",  state);
    
    out = state;
end