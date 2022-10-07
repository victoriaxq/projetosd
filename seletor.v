module main1(numero0, numero1, dis0, dis1, dis2, dis3, dis4, dis5, dis6, dis7);

input[6:0] numero0, numero1;
reg[13:0]result;
output [6:0] dis0, dis1, dis2, dis3, dis4, dis5, dis6, dis7;
reg[2:0]EA;
reg[6:0]num0, num1;
reg[3:0]dec0, uni0, dec1, uni1, milR, cenR, decR, uniR;
parameter off = 0, on = 1, soma = 2, sub = 3, mult = 4;


always@(numero0, numero1)begin
	num0 = numero0;
	num1 = numero1;

	case(EA != off)
		on: begin
		if(numero0 > 99)begin
			num0 <= 99;
			uni0 <= 9;
			dec0 <= 9;
			end
		else if(numero0 <= 99)begin
			num0 <= numero0;
			uni0 <= numero0%10;
			dec0 <= numero0/10;
			end
			
		if(numero1 > 99)begin
			num1 <= 99;
			uni1 <= 9;
			dec1 <= 9;
			end
		else if(numero1 <= 99)begin
			num1 <= numero1;
			uni1 <= numero1%10;
			dec1 <= numero1/10;
			end
		end
		
		soma: begin //botao1 foi apertado
			if(numero0 > 99)begin
			num0 <= 99;
			uni0 <= 9;
			dec0 <= 9;
			end
		else if(numero0 <= 99)begin
			num0 <= numero0;
			uni0 <= numero0%10;
			dec0 <= numero0/10;
			end
			
		if(numero1 > 99)begin
			num1 <= 99;
			uni1 <= 9;
			dec1 <= 9;
			end
		else if(numero1 <= 99)begin
			num1 <= numero1;
			uni1 <= numero1%10;
			dec1 <= numero1/10;
			end
		end
		
		sub: begin //botao2 foi apertado
			if(numero0 > 99)begin
			num0 <= 99;
			uni0 <= 9;
			dec0 <= 9;
			end
		else if(numero0 <= 99)begin
			num0 <= numero0;
			uni0 <= numero0%10;
			dec0 <= numero0/10;
			end
			
		if(numero1 > 99)begin
			num1 <= 99;
			uni1 <= 9;
			dec1 <= 9;
			end
		else if(numero1 <= 99)begin
			num1 <= numero1;
			uni1 <= numero1%10;
			dec1 <= numero1/10;
			end
		end
		
		mult: begin //botao1 foi apertado
			if(numero0 > 99)begin
			num0 <= 99;
			uni0 <= 9;
			dec0 <= 9;
			end
		else if(numero0 <= 99)begin
			num0 <= numero0;
			uni0 <= numero0%10;
			dec0 <= numero0/10;
			end
			
		if(numero1 > 99)begin
			num1 <= 99;
			uni1 <= 9;
			dec1 <= 9;
			end
		else if(numero1 <= 99)begin
			num1 <= numero1;
			uni1 <= numero1%10;
			dec1 <= numero1/10;
			end
		end
	endcase
end

always@(EA)begin
	case(EA)
    
    off:begin
        result = 10;
        uniR <= 10;
        decR <= 10;
        cenR <= 10;
        milR <= 10;
    end

    on:begin
        result = 10;
        uniR <= 10;
        decR <= 10;
        cenR <= 10;
        milR <= 10;
    end

    soma:begin
        result = num0 + num1;
        uniR <= (result%100)%10;
        decR <= (result%100)/10;
        cenR <= result/100;
    end

    sub:begin
        result = num0 - num1;

        if(num0 < numero1)begin
            cenR <= 11;
        end
        else if(num0 >= num1)begin
            cenR <= 10;
        end
        milR <= 10;
        decR <= result/10;
        uniR <= result%10;

    end

    mult:begin
        result = num0 * num1;
        milR <= result/1000;
        cenR <= (result%1000)/100;
        decR <= ((result%1000)/10)/10;
        uniR <= (result/10)%10;

    end
    endcase
	
end
    //numero0
    decodificador(.number(dec0), .display(dis0));
    decodificador(.number(uni0), .display(dis1));

    //numero1
    decodificador(.number(dec1), .display(dis2));
    decodificador(.number(uni1), .display(dis3)); 

    //resultado
    decodificador(.number(milR), .display(dis4));
    decodificador(.number(cenR), .display(dis5));
    decodificador(.number(decR), .display(dis6));
    decodificador(.number(uniR), .display(dis7));

endmodule