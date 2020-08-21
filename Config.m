classdef Config < dynamicprops
    properties(Constant)
        mx = hex2dec('11B') % modulus function for
        sbox = TestSBox(),
        invsbox = TestInvSBox()
    end
    properties
        Nb = 4,  % number of 32 bit words in the State
        Nk = 4,  % number of 32 bit words in the Cipher Key
        Nr = 10, % number of rounds
        K = [0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 0x09 0x0a 0x0b 0x0c 0x0d 0x0e 0x0f];
        sBox = TestSBox(),
        invSBox = TestInvSBox() 
    end
end