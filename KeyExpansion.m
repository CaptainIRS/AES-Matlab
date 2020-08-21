function [w] = KeyExpansion(K, Nk, Nb, Nr)

    warning('off');
    w = gf(zeros(Nb*(Nr+1), 4), 8, Config.mx);
    
    for i = 1:Nk
       j = 4*(i-1)+1;
       w(i,:) = [K(j) K(j+1) K(j+2) K(j+3)];
    end
    for i = Nk+1:Nb*(Nr+1)
         temp = w(i-1, :);
        if mod(i-1, Nk) == 0
            temp = SubWord(RotWord(temp)) + Rcon((i-1)/Nk);
        elseif Nk > 6 && mod(i-1, Nk) == 4
            temp = SubWord(temp);
        end
        w(i, :) = w(i-Nk, :) + temp;
    end
    w = int32(w.x);
end