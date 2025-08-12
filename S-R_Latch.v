//---------------------------------------------------------
                    DESIGN - SR latch  		
//---------------------------------------------------------
    module sr_latch(
	                 o_q,
					 o_q_,
					 i_s,
					 i_r);
	output           o_q;
	output           o_q_;
	
	input            i_s;
	input            i_r;
	
	always @(i_s or i_r) 
	    begin
	        if(i_s)
			begin	
                if (i_r)
                begin 				
			    o_q <=  1'bx;
				o_q <=  !(o_q);
				end
			else 
			    begin 
				o_q <=  1'b0;
				o_q <=  !(o_q);
			end
		end
		else
		begin 	
            if (i_r)
                begin 				
			    o_q <=  1'b1;
				o_q <=  !(o_q);
				end
			else 
			    begin 
				o_q <=  1'b0;
				o_q <=  !(o_q);
			    end 
		    end
		end
		endmodule
//Testbench
   module sr_latch_tb();
        wire          o_q;
		wire          o_q_;
		
		reg           i_s;
		reg           i_r;
		
		parameter TIME_PERIOD = 10;
	sr_latch INST_0 (
	                 .o_q(o_q),
					 .o_q_(o_q_),
					 .i_s(i_s),
					 .i_r(i_r));
					 
	initial $monitor ($time," /t %b /t %b /t %b /t %b",i_s,i_r,o_q,o_q_);
	initial begin
	    i_s = 1'b0;
		i_r = 1'b0;
		end
    always begin 
      #(TIME_PERIOD)     i_s = !(i_s);
      #100;
    end
endmodule
