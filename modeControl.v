module modeControl(input clock,
input reset,
input mode,
input valid_vote_casted,
input [7:0] candidate1_vote,
input [7:0] candidate2_vote,
input [7:0] candidate3_vote,
input [7:0] candidate4_vote,
input candidate1_button_press,
input candidate2_button_press,
input candidate3_button_press,
input candidate4_button_press,
output reg [7:0] candidate,
output reg [6:0] seg_1,
output reg [6:0] seg_2
    );
reg [30:0] counter;
always @(posedge clock)
begin
    if(reset)
        counter <= 0;   //Whenever reset is pressed, counter started from 0
    else if(valid_vote_casted) //If a valid vote is casted, counter becomes 1
        counter <= counter + 1;
    else if(counter !=0 & counter < 100000000)//If counter is not 0, increment it till 100000000
        counter <= counter + 1;
    else //Once counter becomes 100000000, reset it to zero
        counter <= 0;
end 

always @(posedge clock)
begin
    if(reset)
        seg_1 = 7'b0000000;
    else
    begin
        if(mode == 0 &  counter > 0 ) //mode0 -> voting mode, mode 1 -> result mode
            seg_1 = 7'b0000000;
        else if(mode == 0)
            seg_1 = 7'b0000000;
        else if(mode == 1) //result mode
        begin
            if(candidate1_button_press)begin
				     if (candidate1_vote<16)
					  begin
					   case (candidate1_vote[3:0])
							4'b0000 : begin seg_2 <= 7'b0000000; seg_1 = 7'b1111110; end
							4'b0001 : begin seg_2 <= 7'b0000000; seg_1 = 7'b0110000; end
							4'b0010 : begin seg_2 <= 7'b0000000; seg_1 = 7'b1101101; end
							4'b0011 : begin seg_2 <= 7'b0000000; seg_1 = 7'b1111001; end
							4'b0100 : begin seg_2 <= 7'b0000000; seg_1 = 7'b0110011; end
							4'b0101 : begin seg_2 <= 7'b0000000; seg_1 = 7'b1011011; end
							4'b0110 : begin seg_2 <= 7'b0000000; seg_1 = 7'b1011111; end
							4'b0111 : begin seg_2 <= 7'b0000000; seg_1 = 7'b1110000; end
							4'b1000 : begin seg_2 <= 7'b0000000; seg_1 = 7'b1111111; end
							4'b1001 : begin seg_2 <= 7'b0000000; seg_1 = 7'b1110011; end
							4'b1010 : begin seg_2 <= 7'b0110000; seg_1 = 7'b1111110; end  //10
							4'b1011 : begin seg_2 <= 7'b0110000; seg_1 = 7'b0110000; end  //11
							4'b1100 : begin seg_2 <= 7'b0110000; seg_1 = 7'b1101101; end  //12
							4'b1101 : begin seg_2 <= 7'b0110000; seg_1 = 7'b1111001; end  //13
							4'b1110 : begin seg_2 <= 7'b0110000; seg_1 = 7'b0110011; end  //14
							4'b1111 : begin seg_2 <= 7'b0110000; seg_1 = 7'b1011011; end  //15
							default : begin seg_2 <= 7'b0000000; seg_1 = 7'b0000000; end
						  endcase
						end  	
					 candidate<=8'd193;
					 end
            else if(candidate2_button_press)begin
               if (candidate2_vote<10)
					  begin
					   case (candidate2_vote[3:0])
							4'b0000 : begin seg_2 <= 7'b0000000; seg_1 = 7'b1111110; end
							4'b0001 : begin seg_2 <= 7'b0000000; seg_1 = 7'b0110000; end
							4'b0010 : begin seg_2 <= 7'b0000000; seg_1 = 7'b1101101; end
							4'b0011 : begin seg_2 <= 7'b0000000; seg_1 = 7'b1111001; end
							4'b0100 : begin seg_2 <= 7'b0000000; seg_1 = 7'b0110011; end
							4'b0101 : begin seg_2 <= 7'b0000000; seg_1 = 7'b1011011; end
							4'b0110 : begin seg_2 <= 7'b0000000; seg_1 = 7'b1011111; end
							4'b0111 : begin seg_2 <= 7'b0000000; seg_1 = 7'b1110000; end
							4'b1000 : begin seg_2 <= 7'b0000000; seg_1 = 7'b1111111; end
							4'b1001 : begin seg_2 <= 7'b0000000; seg_1 = 7'b1110011; end
							4'b1010 : begin seg_2 <= 7'b0110000; seg_1 = 7'b1111110; end  //10
							4'b1011 : begin seg_2 <= 7'b0110000; seg_1 = 7'b0110000; end  //11
							4'b1100 : begin seg_2 <= 7'b0110000; seg_1 = 7'b1101101; end  //12
							4'b1101 : begin seg_2 <= 7'b0110000; seg_1 = 7'b1111001; end  //13
							4'b1110 : begin seg_2 <= 7'b0110000; seg_1 = 7'b0110011; end  //14
							4'b1111 : begin seg_2 <= 7'b0110000; seg_1 = 7'b1011011; end  //15
							default : begin seg_2 <= 7'b0000000; seg_1 = 7'b0000000; end
						  endcase
						end  
					candidate<=8'd194;end
            else if(candidate3_button_press)begin
                if (candidate3_vote<10)
					  begin
					  case (candidate3_vote[3:0])
							4'b0000 : begin seg_2 <= 7'b0000000; seg_1 = 7'b1111110; end
							4'b0001 : begin seg_2 <= 7'b0000000; seg_1 = 7'b0110000; end
							4'b0010 : begin seg_2 <= 7'b0000000; seg_1 = 7'b1101101; end
							4'b0011 : begin seg_2 <= 7'b0000000; seg_1 = 7'b1111001; end
							4'b0100 : begin seg_2 <= 7'b0000000; seg_1 = 7'b0110011; end
							4'b0101 : begin seg_2 <= 7'b0000000; seg_1 = 7'b1011011; end
							4'b0110 : begin seg_2 <= 7'b0000000; seg_1 = 7'b1011111; end
							4'b0111 : begin seg_2 <= 7'b0000000; seg_1 = 7'b1110000; end
							4'b1000 : begin seg_2 <= 7'b0000000; seg_1 = 7'b1111111; end
							4'b1001 : begin seg_2 <= 7'b0000000; seg_1 = 7'b1110011; end
							4'b1010 : begin seg_2 <= 7'b0110000; seg_1 = 7'b1111110; end  //10
							4'b1011 : begin seg_2 <= 7'b0110000; seg_1 = 7'b0110000; end  //11
							4'b1100 : begin seg_2 <= 7'b0110000; seg_1 = 7'b1101101; end  //12
							4'b1101 : begin seg_2 <= 7'b0110000; seg_1 = 7'b1111001; end  //13
							4'b1110 : begin seg_2 <= 7'b0110000; seg_1 = 7'b0110011; end  //14
							4'b1111 : begin seg_2 <= 7'b0110000; seg_1 = 7'b1011011; end  //15
							default : begin seg_2 <= 7'b0000000; seg_1 = 7'b0000000; end
						  endcase
						end  
					 candidate<=8'd195;end
            else if(candidate4_button_press)begin
                if (candidate4_vote<10)
					  begin
					  case (candidate4_vote[3:0])
							4'b0000 : begin seg_2 <= 7'b0000000; seg_1 = 7'b1111110; end
							4'b0001 : begin seg_2 <= 7'b0000000; seg_1 = 7'b0110000; end
							4'b0010 : begin seg_2 <= 7'b0000000; seg_1 = 7'b1101101; end
							4'b0011 : begin seg_2 <= 7'b0000000; seg_1 = 7'b1111001; end
							4'b0100 : begin seg_2 <= 7'b0000000; seg_1 = 7'b0110011; end
							4'b0101 : begin seg_2 <= 7'b0000000; seg_1 = 7'b1011011; end
							4'b0110 : begin seg_2 <= 7'b0000000; seg_1 = 7'b1011111; end
							4'b0111 : begin seg_2 <= 7'b0000000; seg_1 = 7'b1110000; end
							4'b1000 : begin seg_2 <= 7'b0000000; seg_1 = 7'b1111111; end
							4'b1001 : begin seg_2 <= 7'b0000000; seg_1 = 7'b1110011; end
							4'b1010 : begin seg_2 <= 7'b0110000; seg_1 = 7'b1111110; end  //10
							4'b1011 : begin seg_2 <= 7'b0110000; seg_1 = 7'b0110000; end  //11
							4'b1100 : begin seg_2 <= 7'b0110000; seg_1 = 7'b1101101; end  //12
							4'b1101 : begin seg_2 <= 7'b0110000; seg_1 = 7'b1111001; end  //13
							4'b1110 : begin seg_2 <= 7'b0110000; seg_1 = 7'b0110011; end  //14
							4'b1111 : begin seg_2 <= 7'b0110000; seg_1 = 7'b1011011; end  //15
							default : begin seg_2 <= 7'b0000000; seg_1 = 7'b0000000; end
						  endcase
						end  
					 candidate<=8'd195;end
        end
    end  
end

endmodule