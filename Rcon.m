function [out] = Rcon(i)
    temp = gf([0x02, 0x00, 0x00, 0x00], 8, Config.mx);
    out = gf([0x01, 0x00, 0x00, 0x00], 8, Config.mx);
    for j = 1:(i-1)
        out = out .* temp;
    end
    out = out.x;
end