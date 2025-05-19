`include "Tcell.v"
`include "mux.v"
`include "rcdecode.v"
`include "check_win.v"

module TBox(input clk, set, reset, input [1:0] row, input [1:0] col, output [8:0] valid, output [8:0] symbol, output [1:0] game_state);
        wire [8:0] s1,s ;
        rcdecoder rc1(row,col,s1);
        assign s[0] = s1[0] & set & ~game_state[0] & ~game_state[1] ;
        assign s[1] = s1[1] & set & ~game_state[0] & ~game_state[1] ;
        assign s[2] = s1[2] & set & ~game_state[0] & ~game_state[1] ;
        assign s[3] = s1[3] & set & ~game_state[0] & ~game_state[1] ;
        assign s[4] = s1[4] & set & ~game_state[0] & ~game_state[1] ;
        assign s[5] = s1[5] & set & ~game_state[0] & ~game_state[1] ;
        assign s[6] = s1[6] & set & ~game_state[0] & ~game_state[1] ;
        assign s[7] = s1[7] & set & ~game_state[0] & ~game_state[1] ;
        assign s[8] = s1[8] & set & ~game_state[0] & ~game_state[1] ;
        wire ssymbol;
        xor (ssymbol,valid[0],valid[1],valid[2],valid[3],valid[4],valid[5],valid[6],valid[7],valid[8]);
        TCell t1(clk,s[0],reset,~ssymbol,valid[0],symbol[0]);
        TCell t2(clk,s[1],reset,~ssymbol,valid[1],symbol[1]);
        TCell t3(clk,s[2],reset,~ssymbol,valid[2],symbol[2]);
        TCell t4(clk,s[3],reset,~ssymbol,valid[3],symbol[3]);
        TCell t5(clk,s[4],reset,~ssymbol,valid[4],symbol[4]);
        TCell t6(clk,s[5],reset,~ssymbol,valid[5],symbol[5]);
        TCell t7(clk,s[6],reset,~ssymbol,valid[6],symbol[6]);
        TCell t8(clk,s[7],reset,~ssymbol,valid[7],symbol[7]);
        TCell t9(clk,s[8],reset,~ssymbol,valid[8],symbol[8]);
        wire [1:0] gs;
        check_win c1(symbol,valid,gs);
        wire va ;
        assign va = &valid;
        and (sel,va,~gs[0],~gs[1]);
        mux m1({gs[0],1'b1},sel,game_state[0]);
        mux m2({gs[1],1'b1},sel,game_state[1]);
endmodule