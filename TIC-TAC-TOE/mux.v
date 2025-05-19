module mux ( input [1:0] in , input sel , output o );
    and (t1,sel,in[0]);
    and (t2,~sel,in[1]);
    or (o,t1,t2);
endmodule