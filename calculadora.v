module calculadora(botao, botaoSOMA, botaoSUB, botaoMULT, numero0, numero1, dec0, dec1, uni0, uni1, milR, cenR, decR, uniR, clock);

input [6:0]numero0, numero1;
output[0:6] dec0, dec1, uni0, uni1, milR, cenR, decR, uniR;
input clock, botao, botaoSOMA, botaoSUB, botaoMULT;
reg b = 0, bSOMA = 0, bSUB = 0, bMULT = 0;
parameter off = 0, soma = 1, sub = 2, mult = 3, on = 4;
reg on, so, su, mu = 0;
reg[2:0]EA = off;

always@(posedge clock)begin
    if(~botao)begin // 
        b = 1;
    end
    if(botao && b)begin

        b = 0;
        if(EA != soma)begin
            so = 1;
            su = 0;
            mu = 0;
        end
        else if(EA == soma)begin
            so = 0;
        end


    if(botaoS && b)begin

        b = 0;
        if(EA != soma)begin
            so = 1;
            su = 0;
            mu = 0;
        end
        else if(EA == soma)begin
            so = 0;
        end

    end
    end




        


end

