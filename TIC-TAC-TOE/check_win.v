module check_win (
    input [8:0]sym,input [8:0] val ,output [1:0] gs 
);
    and (v1,val[0],val[1],val[2]);
    and (px1,v1,sym[0],sym[2],sym[1]);
    nor (po1,~v1,sym[0],sym[2],sym[1]);

    and (v2,val[3],val[4],val[5]);
    and (px2,v2,sym[3],sym[4],sym[5]);
    nor (po2,~v2,sym[3],sym[4],sym[5]);

    and (v3,val[6],val[7],val[8]);
    and (px3,v3,sym[6],sym[7],sym[8]);
    nor (po3,~v3,sym[6],sym[7],sym[8]);

    and (v4,val[0],val[3],val[6]);
    and (px4,v4,sym[0],sym[3],sym[6]);
    nor (po4,~v4,sym[0],sym[3],sym[6]);

    and (v5,val[1],val[4],val[7]);
    and (px5,v5,sym[4],sym[7],sym[1]);
    nor (po5,~v5,sym[4],sym[7],sym[1]);

    and (v6,val[5],val[8],val[2]);
    and (px6,v6,sym[5],sym[2],sym[8]);
    nor (po6,~v6,sym[5],sym[2],sym[8]);

    and (v7,val[0],val[4],val[8]);
    and (px7,v7,sym[0],sym[4],sym[8]);
    nor (po7,~v7,sym[0],sym[4],sym[8]);

    and (v8,val[4],val[6],val[2]);
    and (px8,v8,sym[4],sym[2],sym[6]);
    nor (po8,~v8,sym[4],sym[2],sym[6]);

    or (gs[0],px1,px2,px3,px4,px5,px6,px7,px8);
    or (gs[1],po1,po2,po3,po4,po5,po6,po7,po8);

endmodule