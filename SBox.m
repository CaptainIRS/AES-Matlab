function [sbox] = SBox()
    row = [1 1 1 1 1 0 0 0];
    % Set up constants A and b.
    A = gf(gallery('circul', row), 2);
    b = gf([0; 1; 1; 0; 0; 0; 1; 1], 2);
    xinv = gf(0:255, 8, Config.mx); 
    % Compute inverses.
    xinv(2:256) = 1./xinv(2:256);
    y = gf(transpose(dec2bin(xinv.x,8) == '1'),2);
    % Affine transformation.
    z = A * y + repmat(b,1,256);
    sbox = transpose(uint8(bin2dec(num2str(transpose(z.x))))); % Reformat to make sbox.
    sbox = reshape(sbox, 16, 16);
end