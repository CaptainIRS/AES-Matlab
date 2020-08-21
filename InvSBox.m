function invsbox = InvSBox()
 row = [0 1 0 1 0 0 1 0]; % set up constants A and b.
 A = gf(gallery('circul', row), 2);
 b = gf([0; 0; 0; 0; 0; 1; 0; 1], 2);
 y = gf(transpose(dec2bin(0:255) == '1'), 2); % Affine transformation.
 z = A * y + repmat(b,1,256);
 z = gf(bin2dec(num2str(transpose(uint32(z.x)))), 8, Config.mx); % Reformat.
 zinv = gf(0:255, 8, Config.mx); % Invert results.
 zinv(1:99) = 1./z(1:99);
 zinv(100) = 0;
 zinv(101:256) = 1./z(101:256);
 invsbox = uint8(uint32(zinv.x)); % Reformat to make inverse sbox.
 invsbox = reshape(invsbox, 16, 16);
end