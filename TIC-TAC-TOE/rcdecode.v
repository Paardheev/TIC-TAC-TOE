module rcdecoder(input [1:0] r,input[1:0] c,output [8:0] v);
        wire [15:0] w;
        wire [3:0] a,b;
        decoder d1(r,a);
        decoder d2(c,b);
        and (v[0],a[1],b[1]);
        and (v[1],a[1],b[2]);
        and (v[2],a[1],b[3]);
        and (v[3],a[2],b[1]);
        and (v[4],a[2],b[2]);
        and (v[5],a[2],b[3]);
        and (v[6],a[3],b[1]);
        and (v[7],a[3],b[2]);
        and (v[8],a[3],b[3]);
endmodule

module decoder ( input [1:0] i, output [3:0] o);
    wire t1,t2;

    not (t1,i[0]);
    not (t2,i[1]);

    and (o[0],t1,t2);
    and (o[1],t2,i[0]);
    and (o[2],i[1],t1);
    and (o[3],i[1],i[0]);
endmodule