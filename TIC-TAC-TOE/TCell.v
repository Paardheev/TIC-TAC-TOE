module TCell(input clk, set, reset, set_symbol, output reg valid, symbol);
    initial begin
        valid = 0 ;
    end
    always @(clk,set,reset) begin
        if(clk && reset) begin
            valid = 0 ;
        end
        else begin
            if(clk) begin
                if(set) begin
                    if(!valid) begin
                        symbol = set_symbol ;
                        valid = 1;
                    end
                end
            end                
        end
    end
endmodule