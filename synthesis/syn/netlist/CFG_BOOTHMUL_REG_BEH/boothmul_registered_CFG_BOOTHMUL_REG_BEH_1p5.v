/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : W-2024.09-SP2
// Date      : Thu Aug 27 03:33:06 2026
/////////////////////////////////////////////////////////////


module boothmul_registered ( CLK, LD, RST, A, B, P );
  input [7:0] A;
  input [7:0] B;
  output [15:0] P;
  input CLK, LD, RST;
  wire   mul_pp_0__0_, mul_pp_0__1_, n13, n14, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n30, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, intadd_1_A_1_,
         intadd_1_A_0_, intadd_1_B_1_, intadd_1_B_0_, intadd_1_CI,
         intadd_1_SUM_1_, intadd_1_SUM_0_, intadd_1_n3, intadd_1_n2,
         intadd_0_A_4_, intadd_0_B_4_, intadd_0_SUM_4_, intadd_0_n6,
         intadd_0_n5, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n228,
         n229, n230, n231, n232, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n247, n248, n249, n250,
         n251, n252, n253, n254, n255, n256, n257, n258, n259, n260, n261,
         n262, n263, n264, n265, n266, n267, n268, n269, n270, n271, n272,
         n273, n274, n275, n276, n277, n278, n279, n280, n281, n282, n283,
         n284, n285, n286, n287, n288, n289, n290, n291, n292, n293, n294,
         n295, n296, n297, n298, n299, n300, n301, n302, n303, n304, n305,
         n306, n307, n308, n309, n310, n311, n312, n313, n314, n315, n316,
         n317, n318, n319, n320, n321, n322, n323, n324, n325, n326, n327,
         n328, n329, n330, n331, n332, n333, n334, n335, n336, n337, n338,
         n339, n340, n341, n342, n343, n344, n345, n346, n347, n348, n349,
         n350, n351, n352, n353, n354, n355, n356, n357, n358;
  wire   [7:0] A_i;
  wire   [7:0] B_i;
  wire   [14:2] P_i;

  DFF_X1 A_reg_Y_temp_reg_0_ ( .D(n149), .CK(CLK), .Q(A_i[0]), .QN(n350) );
  DFF_X1 B_reg_Y_temp_reg_0_ ( .D(n141), .CK(CLK), .Q(B_i[0]), .QN(n356) );
  DFF_X1 B_reg_Y_temp_reg_1_ ( .D(n140), .CK(CLK), .Q(B_i[1]), .QN(n357) );
  DFF_X1 B_reg_Y_temp_reg_2_ ( .D(n139), .CK(CLK), .Q(B_i[2]), .QN(n358) );
  DFF_X1 B_reg_Y_temp_reg_4_ ( .D(n137), .CK(CLK), .Q(B_i[4]), .QN(n351) );
  DFF_X1 B_reg_Y_temp_reg_6_ ( .D(n135), .CK(CLK), .Q(B_i[6]), .QN(n353) );
  DFF_X1 B_reg_Y_temp_reg_7_ ( .D(n134), .CK(CLK), .Q(B_i[7]), .QN(n341) );
  DFF_X1 p_reg_Y_temp_reg_0_ ( .D(n133), .CK(CLK), .Q(P[0]) );
  DFF_X1 p_reg_Y_temp_reg_1_ ( .D(n132), .CK(CLK), .Q(P[1]) );
  DFF_X1 p_reg_Y_temp_reg_2_ ( .D(n131), .CK(CLK), .Q(P[2]) );
  DFF_X1 p_reg_Y_temp_reg_3_ ( .D(n130), .CK(CLK), .Q(P[3]) );
  DFF_X1 p_reg_Y_temp_reg_4_ ( .D(n129), .CK(CLK), .Q(P[4]) );
  DFF_X1 p_reg_Y_temp_reg_5_ ( .D(n128), .CK(CLK), .Q(P[5]) );
  DFF_X1 p_reg_Y_temp_reg_6_ ( .D(n127), .CK(CLK), .Q(P[6]) );
  DFF_X1 p_reg_Y_temp_reg_7_ ( .D(n126), .CK(CLK), .Q(P[7]) );
  DFF_X1 p_reg_Y_temp_reg_8_ ( .D(n125), .CK(CLK), .Q(P[8]) );
  DFF_X1 p_reg_Y_temp_reg_9_ ( .D(n124), .CK(CLK), .Q(P[9]) );
  DFF_X1 p_reg_Y_temp_reg_10_ ( .D(n123), .CK(CLK), .Q(P[10]) );
  DFF_X1 p_reg_Y_temp_reg_11_ ( .D(n122), .CK(CLK), .Q(P[11]) );
  DFF_X1 p_reg_Y_temp_reg_12_ ( .D(n121), .CK(CLK), .Q(P[12]) );
  DFF_X1 p_reg_Y_temp_reg_14_ ( .D(n119), .CK(CLK), .Q(P[14]) );
  DFF_X1 p_reg_Y_temp_reg_15_ ( .D(n118), .CK(CLK), .Q(P[15]) );
  AOI22_X1 U3 ( .A1(n49), .A2(P[15]), .B1(n48), .B2(P_i[14]), .ZN(n13) );
  INV_X1 U4 ( .A(n13), .ZN(n118) );
  AOI22_X1 U5 ( .A1(n49), .A2(P[14]), .B1(n48), .B2(P_i[14]), .ZN(n14) );
  INV_X1 U6 ( .A(n14), .ZN(n119) );
  AOI22_X1 U9 ( .A1(n49), .A2(P[12]), .B1(n48), .B2(P_i[12]), .ZN(n16) );
  AOI22_X1 U11 ( .A1(n49), .A2(P[11]), .B1(n48), .B2(n164), .ZN(n17) );
  AOI22_X1 U13 ( .A1(n49), .A2(P[10]), .B1(n48), .B2(n343), .ZN(n18) );
  AOI22_X1 U15 ( .A1(n49), .A2(P[9]), .B1(n48), .B2(n344), .ZN(n19) );
  AOI22_X1 U17 ( .A1(n49), .A2(P[8]), .B1(n48), .B2(n345), .ZN(n20) );
  AOI22_X1 U19 ( .A1(n49), .A2(P[7]), .B1(n48), .B2(P_i[7]), .ZN(n21) );
  AOI22_X1 U21 ( .A1(n49), .A2(P[6]), .B1(n48), .B2(n346), .ZN(n22) );
  AOI22_X1 U23 ( .A1(n49), .A2(P[5]), .B1(n48), .B2(n347), .ZN(n23) );
  AOI22_X1 U25 ( .A1(n49), .A2(P[4]), .B1(n48), .B2(n348), .ZN(n24) );
  AOI22_X1 U27 ( .A1(n49), .A2(P[3]), .B1(n48), .B2(n349), .ZN(n25) );
  AOI22_X1 U29 ( .A1(n49), .A2(P[2]), .B1(n48), .B2(P_i[2]), .ZN(n26) );
  AOI22_X1 U35 ( .A1(P[1]), .A2(n49), .B1(n48), .B2(mul_pp_0__1_), .ZN(n30) );
  AOI22_X1 U40 ( .A1(n49), .A2(P[0]), .B1(n48), .B2(mul_pp_0__0_), .ZN(n32) );
  AOI22_X1 U42 ( .A1(B_i[7]), .A2(n49), .B1(n48), .B2(B[7]), .ZN(n33) );
  AOI22_X1 U44 ( .A1(B_i[6]), .A2(n49), .B1(n48), .B2(B[6]), .ZN(n34) );
  AOI22_X1 U46 ( .A1(B_i[5]), .A2(n49), .B1(n48), .B2(B[5]), .ZN(n35) );
  AOI22_X1 U48 ( .A1(B_i[4]), .A2(n49), .B1(n48), .B2(B[4]), .ZN(n36) );
  AOI22_X1 U50 ( .A1(B_i[3]), .A2(n49), .B1(n48), .B2(B[3]), .ZN(n37) );
  AOI22_X1 U52 ( .A1(B_i[2]), .A2(n49), .B1(n48), .B2(B[2]), .ZN(n38) );
  AOI22_X1 U54 ( .A1(n352), .A2(n49), .B1(n48), .B2(B[1]), .ZN(n39) );
  AOI22_X1 U56 ( .A1(B_i[0]), .A2(n49), .B1(n48), .B2(B[0]), .ZN(n40) );
  AOI22_X1 U58 ( .A1(A_i[7]), .A2(n49), .B1(n48), .B2(A[7]), .ZN(n41) );
  AOI22_X1 U60 ( .A1(A_i[6]), .A2(n49), .B1(n48), .B2(A[6]), .ZN(n42) );
  AOI22_X1 U62 ( .A1(A_i[5]), .A2(n49), .B1(n48), .B2(A[5]), .ZN(n43) );
  AOI22_X1 U64 ( .A1(A_i[4]), .A2(n49), .B1(n48), .B2(A[4]), .ZN(n44) );
  AOI22_X1 U66 ( .A1(A_i[3]), .A2(n49), .B1(n48), .B2(A[3]), .ZN(n45) );
  AOI22_X1 U68 ( .A1(A_i[2]), .A2(n49), .B1(n48), .B2(A[2]), .ZN(n46) );
  AOI22_X1 U70 ( .A1(A_i[1]), .A2(n49), .B1(n48), .B2(A[1]), .ZN(n47) );
  AOI22_X1 U72 ( .A1(A_i[0]), .A2(n49), .B1(n48), .B2(A[0]), .ZN(n50) );
  FA_X1 intadd_1_U4 ( .A(intadd_1_A_0_), .B(intadd_1_B_0_), .CI(intadd_1_CI), 
        .CO(intadd_1_n3), .S(intadd_1_SUM_0_) );
  FA_X1 intadd_1_U3 ( .A(intadd_1_A_1_), .B(intadd_1_B_1_), .CI(intadd_1_n3), 
        .CO(intadd_1_n2), .S(intadd_1_SUM_1_) );
  FA_X1 intadd_0_U6 ( .A(intadd_0_A_4_), .B(intadd_0_B_4_), .CI(intadd_0_n6), 
        .CO(intadd_0_n5), .S(intadd_0_SUM_4_) );
  DFF_X1 A_reg_Y_temp_reg_1_ ( .D(n148), .CK(CLK), .Q(A_i[1]), .QN(n342) );
  DFF_X1 A_reg_Y_temp_reg_2_ ( .D(n147), .CK(CLK), .Q(A_i[2]) );
  DFF_X1 A_reg_Y_temp_reg_3_ ( .D(n146), .CK(CLK), .Q(A_i[3]), .QN(n340) );
  DFF_X1 A_reg_Y_temp_reg_4_ ( .D(n145), .CK(CLK), .Q(A_i[4]) );
  DFF_X1 A_reg_Y_temp_reg_5_ ( .D(n144), .CK(CLK), .Q(A_i[5]) );
  DFF_X1 A_reg_Y_temp_reg_6_ ( .D(n143), .CK(CLK), .Q(A_i[6]) );
  DFF_X1 A_reg_Y_temp_reg_7_ ( .D(n142), .CK(CLK), .Q(A_i[7]), .QN(n165) );
  DFF_X1 B_reg_Y_temp_reg_5_ ( .D(n136), .CK(CLK), .Q(B_i[5]), .QN(n354) );
  DFF_X1 B_reg_Y_temp_reg_3_ ( .D(n138), .CK(CLK), .Q(B_i[3]), .QN(n355) );
  NOR2_X2 U2 ( .A1(RST), .A2(n49), .ZN(n48) );
  INV_X1 U10 ( .A(n16), .ZN(n121) );
  NOR2_X2 U1 ( .A1(RST), .A2(LD), .ZN(n49) );
  INV_X1 U12 ( .A(n17), .ZN(n122) );
  INV_X1 U14 ( .A(n18), .ZN(n123) );
  INV_X1 U16 ( .A(n19), .ZN(n124) );
  INV_X1 U18 ( .A(n20), .ZN(n125) );
  INV_X1 U51 ( .A(n37), .ZN(n138) );
  INV_X1 U57 ( .A(n40), .ZN(n141) );
  INV_X1 U49 ( .A(n36), .ZN(n137) );
  INV_X1 U53 ( .A(n38), .ZN(n139) );
  INV_X1 U47 ( .A(n35), .ZN(n136) );
  INV_X1 U45 ( .A(n34), .ZN(n135) );
  INV_X1 U43 ( .A(n33), .ZN(n134) );
  INV_X1 U41 ( .A(n32), .ZN(n133) );
  INV_X1 U36 ( .A(n30), .ZN(n132) );
  INV_X1 U30 ( .A(n26), .ZN(n131) );
  INV_X1 U28 ( .A(n25), .ZN(n130) );
  INV_X1 U26 ( .A(n24), .ZN(n129) );
  INV_X1 U24 ( .A(n23), .ZN(n128) );
  INV_X1 U22 ( .A(n22), .ZN(n127) );
  INV_X1 U20 ( .A(n21), .ZN(n126) );
  INV_X1 U71 ( .A(n47), .ZN(n148) );
  INV_X1 U69 ( .A(n46), .ZN(n147) );
  INV_X1 U67 ( .A(n45), .ZN(n146) );
  INV_X1 U65 ( .A(n44), .ZN(n145) );
  INV_X1 U63 ( .A(n43), .ZN(n144) );
  INV_X1 U61 ( .A(n42), .ZN(n143) );
  INV_X1 U59 ( .A(n41), .ZN(n142) );
  INV_X1 U55 ( .A(n39), .ZN(n140) );
  INV_X1 U73 ( .A(n50), .ZN(n149) );
  DFF_X1 p_reg_Y_temp_reg_13_ ( .D(n120), .CK(CLK), .Q(P[13]) );
  AOI21_X1 U175 ( .B1(B_i[5]), .B2(B_i[6]), .A(n323), .ZN(n315) );
  AND3_X1 U176 ( .A1(n211), .A2(n210), .A3(n209), .ZN(n230) );
  NAND2_X1 U177 ( .A1(B_i[7]), .A2(n172), .ZN(n328) );
  NAND2_X1 U178 ( .A1(n158), .A2(n157), .ZN(n160) );
  AND2_X1 U179 ( .A1(n156), .A2(n215), .ZN(n157) );
  OR2_X1 U180 ( .A1(n162), .A2(n226), .ZN(n161) );
  INV_X1 U181 ( .A(n160), .ZN(n159) );
  NAND2_X1 U182 ( .A1(n163), .A2(n166), .ZN(n174) );
  NAND2_X1 U183 ( .A1(n232), .A2(n231), .ZN(n215) );
  OR2_X1 U184 ( .A1(n155), .A2(n230), .ZN(n158) );
  CLKBUF_X1 U185 ( .A(n295), .Z(n297) );
  OR2_X1 U186 ( .A1(n174), .A2(n350), .ZN(n248) );
  NAND2_X1 U187 ( .A1(n49), .A2(P[13]), .ZN(n338) );
  AND2_X1 U188 ( .A1(n158), .A2(n215), .ZN(n154) );
  NOR2_X1 U189 ( .A1(n232), .A2(n231), .ZN(n155) );
  NAND2_X1 U190 ( .A1(n221), .A2(n216), .ZN(n156) );
  NAND2_X1 U191 ( .A1(n160), .A2(n222), .ZN(n225) );
  NOR2_X1 U192 ( .A1(n161), .A2(n159), .ZN(n324) );
  INV_X1 U193 ( .A(n222), .ZN(n162) );
  NAND2_X1 U194 ( .A1(B_i[1]), .A2(B_i[2]), .ZN(n163) );
  XOR2_X1 U195 ( .A(n230), .B(n233), .Z(n164) );
  AOI22_X1 U196 ( .A1(B_i[5]), .A2(n178), .B1(n180), .B2(n354), .ZN(n311) );
  BUF_X1 U197 ( .A(B_i[1]), .Z(n352) );
  INV_X1 U198 ( .A(B_i[1]), .ZN(n333) );
  NAND2_X1 U199 ( .A1(n333), .A2(B_i[0]), .ZN(n332) );
  AOI22_X1 U200 ( .A1(A_i[7]), .A2(n332), .B1(n333), .B2(n165), .ZN(n213) );
  INV_X1 U201 ( .A(n213), .ZN(n208) );
  AND2_X1 U202 ( .A1(n357), .A2(n358), .ZN(n308) );
  INV_X1 U203 ( .A(n174), .ZN(n246) );
  INV_X1 U204 ( .A(n308), .ZN(n166) );
  NAND2_X1 U205 ( .A1(B_i[3]), .A2(n166), .ZN(n168) );
  NAND2_X1 U206 ( .A1(B_i[1]), .A2(B_i[2]), .ZN(n169) );
  NAND2_X1 U207 ( .A1(n169), .A2(n355), .ZN(n167) );
  AND2_X2 U208 ( .A1(n168), .A2(n167), .ZN(n265) );
  AOI22_X1 U209 ( .A1(A_i[6]), .A2(n246), .B1(A_i[5]), .B2(n265), .ZN(n170) );
  AND2_X2 U210 ( .A1(B_i[3]), .A2(n169), .ZN(n310) );
  XOR2_X1 U211 ( .A(n170), .B(n310), .Z(n195) );
  AND2_X1 U212 ( .A1(n353), .A2(n354), .ZN(n323) );
  INV_X1 U213 ( .A(n323), .ZN(n171) );
  NAND2_X1 U214 ( .A1(B_i[6]), .A2(B_i[5]), .ZN(n172) );
  AOI22_X1 U215 ( .A1(B_i[7]), .A2(n171), .B1(n172), .B2(n341), .ZN(n192) );
  AOI22_X1 U216 ( .A1(n315), .A2(A_i[2]), .B1(A_i[1]), .B2(n192), .ZN(n173) );
  XNOR2_X1 U217 ( .A(n173), .B(n328), .ZN(n194) );
  INV_X1 U218 ( .A(n174), .ZN(n266) );
  AOI22_X1 U219 ( .A1(A_i[5]), .A2(n266), .B1(A_i[4]), .B2(n265), .ZN(n175) );
  XOR2_X1 U220 ( .A(n175), .B(n310), .Z(n184) );
  INV_X1 U221 ( .A(n332), .ZN(n335) );
  AND2_X1 U222 ( .A1(n356), .A2(n352), .ZN(n334) );
  INV_X1 U223 ( .A(n334), .ZN(n331) );
  NAND2_X1 U224 ( .A1(n352), .A2(B_i[0]), .ZN(n337) );
  OAI22_X1 U225 ( .A1(A_i[6]), .A2(n331), .B1(A_i[7]), .B2(n337), .ZN(n176) );
  AOI21_X1 U226 ( .B1(A_i[7]), .B2(n335), .A(n176), .ZN(n183) );
  AOI22_X1 U227 ( .A1(A_i[0]), .A2(n192), .B1(n315), .B2(A_i[1]), .ZN(n177) );
  XNOR2_X1 U228 ( .A(n177), .B(n328), .ZN(n182) );
  AND2_X1 U229 ( .A1(n355), .A2(n351), .ZN(n218) );
  INV_X1 U230 ( .A(n218), .ZN(n178) );
  NAND2_X1 U231 ( .A1(B_i[3]), .A2(B_i[4]), .ZN(n180) );
  AOI21_X1 U232 ( .B1(B_i[4]), .B2(B_i[3]), .A(n218), .ZN(n255) );
  INV_X1 U233 ( .A(n255), .ZN(n179) );
  INV_X1 U234 ( .A(n179), .ZN(n312) );
  AOI22_X1 U235 ( .A1(A_i[3]), .A2(n311), .B1(A_i[4]), .B2(n312), .ZN(n181) );
  AND2_X1 U236 ( .A1(B_i[5]), .A2(n180), .ZN(n313) );
  XOR2_X1 U237 ( .A(n181), .B(n313), .Z(n197) );
  NAND2_X1 U238 ( .A1(intadd_0_n5), .A2(n244), .ZN(n190) );
  FA_X1 U239 ( .A(n184), .B(n183), .CI(n182), .CO(n198), .S(n319) );
  AOI22_X1 U240 ( .A1(A_i[3]), .A2(n312), .B1(A_i[2]), .B2(n311), .ZN(n185) );
  XOR2_X1 U241 ( .A(n185), .B(n313), .Z(n318) );
  AND2_X1 U242 ( .A1(A_i[0]), .A2(n315), .ZN(n186) );
  XNOR2_X1 U243 ( .A(n328), .B(n186), .ZN(n274) );
  AOI22_X1 U244 ( .A1(A_i[3]), .A2(n265), .B1(A_i[4]), .B2(n266), .ZN(n187) );
  XNOR2_X1 U245 ( .A(n187), .B(n310), .ZN(n273) );
  NAND2_X1 U246 ( .A1(n274), .A2(n273), .ZN(n317) );
  NAND2_X1 U247 ( .A1(intadd_0_n5), .A2(n243), .ZN(n189) );
  NAND2_X1 U248 ( .A1(n244), .A2(n243), .ZN(n188) );
  NAND3_X1 U249 ( .A1(n190), .A2(n189), .A3(n188), .ZN(n239) );
  AOI22_X1 U250 ( .A1(A_i[7]), .A2(n266), .B1(A_i[6]), .B2(n265), .ZN(n191) );
  XOR2_X1 U251 ( .A(n191), .B(n310), .Z(n207) );
  AOI22_X1 U252 ( .A1(n315), .A2(A_i[3]), .B1(A_i[2]), .B2(n192), .ZN(n193) );
  XNOR2_X1 U253 ( .A(n193), .B(n328), .ZN(n206) );
  FA_X1 U254 ( .A(n208), .B(n195), .CI(n194), .CO(n204), .S(n199) );
  AOI22_X1 U255 ( .A1(A_i[4]), .A2(n311), .B1(n312), .B2(A_i[5]), .ZN(n196) );
  XOR2_X1 U256 ( .A(n196), .B(n313), .Z(n203) );
  NAND2_X1 U257 ( .A1(n239), .A2(n241), .ZN(n202) );
  FA_X1 U258 ( .A(n199), .B(n198), .CI(n197), .CO(n240), .S(n244) );
  NAND2_X1 U259 ( .A1(n239), .A2(n240), .ZN(n201) );
  NAND2_X1 U260 ( .A1(n241), .A2(n240), .ZN(n200) );
  NAND3_X1 U261 ( .A1(n202), .A2(n201), .A3(n200), .ZN(n235) );
  FA_X1 U262 ( .A(n205), .B(n204), .CI(n203), .CO(n236), .S(n241) );
  NAND2_X1 U263 ( .A1(n235), .A2(n236), .ZN(n211) );
  INV_X1 U264 ( .A(intadd_1_SUM_0_), .ZN(n214) );
  FA_X1 U265 ( .A(n208), .B(n207), .CI(n206), .CO(n212), .S(n205) );
  NAND2_X1 U266 ( .A1(n235), .A2(n237), .ZN(n210) );
  NAND2_X1 U267 ( .A1(n237), .A2(n236), .ZN(n209) );
  INV_X1 U268 ( .A(intadd_1_SUM_1_), .ZN(n232) );
  FA_X1 U269 ( .A(n214), .B(n213), .CI(n212), .CO(n231), .S(n237) );
  INV_X1 U270 ( .A(intadd_1_n2), .ZN(n216) );
  AOI22_X1 U271 ( .A1(n315), .A2(A_i[6]), .B1(A_i[5]), .B2(n192), .ZN(n217) );
  XOR2_X1 U272 ( .A(n217), .B(n328), .Z(n224) );
  OAI21_X1 U273 ( .B1(B_i[5]), .B2(n218), .A(A_i[7]), .ZN(n219) );
  OAI21_X1 U274 ( .B1(A_i[7]), .B2(n313), .A(n219), .ZN(n223) );
  AOI22_X1 U275 ( .A1(A_i[7]), .A2(n312), .B1(A_i[6]), .B2(n311), .ZN(n220) );
  XNOR2_X1 U276 ( .A(n220), .B(n313), .ZN(n234) );
  INV_X1 U277 ( .A(n305), .ZN(n221) );
  NAND2_X1 U278 ( .A1(intadd_1_n2), .A2(n305), .ZN(n222) );
  FA_X1 U279 ( .A(n224), .B(n223), .CI(n234), .CO(n226), .S(n305) );
  AOI21_X1 U280 ( .B1(n225), .B2(n226), .A(n324), .ZN(n228) );
  AOI22_X1 U281 ( .A1(n315), .A2(A_i[7]), .B1(A_i[6]), .B2(n192), .ZN(n227) );
  XNOR2_X1 U282 ( .A(n227), .B(n328), .ZN(n325) );
  XOR2_X1 U283 ( .A(n228), .B(n325), .Z(n229) );
  NAND2_X1 U284 ( .A1(n229), .A2(n48), .ZN(n339) );
  XOR2_X1 U285 ( .A(n232), .B(n231), .Z(n233) );
  INV_X1 U286 ( .A(n234), .ZN(intadd_1_A_1_) );
  INV_X1 U287 ( .A(intadd_0_SUM_4_), .ZN(P_i[7]) );
  XOR2_X1 U288 ( .A(n237), .B(n236), .Z(n238) );
  XNOR2_X1 U289 ( .A(n235), .B(n238), .ZN(n343) );
  XOR2_X1 U290 ( .A(n241), .B(n240), .Z(n242) );
  XNOR2_X1 U291 ( .A(n239), .B(n242), .ZN(n344) );
  XOR2_X1 U292 ( .A(n244), .B(n243), .Z(n245) );
  XNOR2_X1 U293 ( .A(intadd_0_n5), .B(n245), .ZN(n345) );
  AOI22_X1 U294 ( .A1(A_i[0]), .A2(n265), .B1(n246), .B2(A_i[1]), .ZN(n247) );
  XOR2_X1 U295 ( .A(n247), .B(n310), .Z(n294) );
  XNOR2_X1 U296 ( .A(n248), .B(n310), .ZN(n329) );
  AOI22_X1 U297 ( .A1(n335), .A2(A_i[2]), .B1(n334), .B2(n342), .ZN(n250) );
  OR2_X1 U298 ( .A1(A_i[2]), .A2(n337), .ZN(n249) );
  NAND2_X1 U299 ( .A1(n250), .A2(n249), .ZN(n330) );
  NAND2_X1 U300 ( .A1(n329), .A2(n330), .ZN(n295) );
  NAND2_X1 U301 ( .A1(n294), .A2(n295), .ZN(n254) );
  OAI22_X1 U302 ( .A1(A_i[2]), .A2(n331), .B1(A_i[3]), .B2(n337), .ZN(n251) );
  AOI21_X1 U303 ( .B1(A_i[3]), .B2(n335), .A(n251), .ZN(n296) );
  NAND2_X1 U304 ( .A1(n294), .A2(n296), .ZN(n253) );
  NAND2_X1 U305 ( .A1(n295), .A2(n296), .ZN(n252) );
  NAND3_X1 U306 ( .A1(n254), .A2(n253), .A3(n252), .ZN(n289) );
  NAND2_X1 U307 ( .A1(A_i[0]), .A2(n255), .ZN(n256) );
  XNOR2_X1 U308 ( .A(n313), .B(n256), .ZN(n259) );
  AOI22_X1 U309 ( .A1(n335), .A2(A_i[4]), .B1(n334), .B2(n340), .ZN(n257) );
  OAI21_X1 U310 ( .B1(A_i[4]), .B2(n337), .A(n257), .ZN(n258) );
  NAND2_X1 U311 ( .A1(n259), .A2(n258), .ZN(n286) );
  OAI21_X1 U312 ( .B1(n259), .B2(n258), .A(n286), .ZN(n292) );
  NAND2_X1 U313 ( .A1(n289), .A2(n292), .ZN(n263) );
  AOI22_X1 U314 ( .A1(A_i[2]), .A2(n266), .B1(A_i[1]), .B2(n265), .ZN(n260) );
  XOR2_X1 U315 ( .A(n260), .B(n310), .Z(n291) );
  NAND2_X1 U316 ( .A1(n289), .A2(n291), .ZN(n262) );
  NAND2_X1 U317 ( .A1(n292), .A2(n291), .ZN(n261) );
  NAND3_X1 U318 ( .A1(n263), .A2(n262), .A3(n261), .ZN(n284) );
  AOI22_X1 U319 ( .A1(A_i[0]), .A2(n311), .B1(A_i[1]), .B2(n312), .ZN(n264) );
  XOR2_X1 U320 ( .A(n264), .B(n313), .Z(n277) );
  AOI22_X1 U321 ( .A1(A_i[3]), .A2(n266), .B1(A_i[2]), .B2(n265), .ZN(n267) );
  XOR2_X1 U322 ( .A(n267), .B(n310), .Z(n279) );
  OAI22_X1 U323 ( .A1(A_i[4]), .A2(n331), .B1(A_i[5]), .B2(n337), .ZN(n268) );
  AOI21_X1 U324 ( .B1(n335), .B2(A_i[5]), .A(n268), .ZN(n278) );
  XNOR2_X1 U325 ( .A(n279), .B(n278), .ZN(n269) );
  XNOR2_X1 U326 ( .A(n277), .B(n269), .ZN(n287) );
  NAND2_X1 U327 ( .A1(n284), .A2(n287), .ZN(n272) );
  NAND2_X1 U328 ( .A1(n284), .A2(n286), .ZN(n271) );
  NAND2_X1 U329 ( .A1(n287), .A2(n286), .ZN(n270) );
  NAND3_X1 U330 ( .A1(n272), .A2(n271), .A3(n270), .ZN(n299) );
  OAI21_X1 U331 ( .B1(n274), .B2(n273), .A(n317), .ZN(n322) );
  OAI22_X1 U332 ( .A1(A_i[6]), .A2(n337), .B1(A_i[5]), .B2(n331), .ZN(n275) );
  AOI21_X1 U333 ( .B1(A_i[6]), .B2(n335), .A(n275), .ZN(n321) );
  AOI22_X1 U334 ( .A1(A_i[1]), .A2(n311), .B1(A_i[2]), .B2(n312), .ZN(n276) );
  XOR2_X1 U335 ( .A(n276), .B(n313), .Z(n320) );
  NAND2_X1 U336 ( .A1(n277), .A2(n279), .ZN(n282) );
  NAND2_X1 U337 ( .A1(n277), .A2(n278), .ZN(n281) );
  NAND2_X1 U338 ( .A1(n279), .A2(n278), .ZN(n280) );
  NAND3_X1 U339 ( .A1(n282), .A2(n281), .A3(n280), .ZN(n300) );
  XOR2_X1 U340 ( .A(n301), .B(n300), .Z(n283) );
  XNOR2_X1 U341 ( .A(n299), .B(n283), .ZN(n346) );
  CLKBUF_X1 U342 ( .A(n284), .Z(n285) );
  XOR2_X1 U343 ( .A(n287), .B(n286), .Z(n288) );
  XNOR2_X1 U344 ( .A(n285), .B(n288), .ZN(n347) );
  CLKBUF_X1 U345 ( .A(n289), .Z(n290) );
  XOR2_X1 U346 ( .A(n292), .B(n291), .Z(n293) );
  XNOR2_X1 U347 ( .A(n290), .B(n293), .ZN(n348) );
  XOR2_X1 U348 ( .A(n297), .B(n296), .Z(n298) );
  XNOR2_X1 U349 ( .A(n294), .B(n298), .ZN(n349) );
  NAND2_X1 U350 ( .A1(n299), .A2(n301), .ZN(n304) );
  NAND2_X1 U351 ( .A1(n299), .A2(n300), .ZN(n303) );
  NAND2_X1 U352 ( .A1(n301), .A2(n300), .ZN(n302) );
  NAND3_X1 U353 ( .A1(n304), .A2(n303), .A3(n302), .ZN(intadd_0_n6) );
  XOR2_X1 U354 ( .A(intadd_1_n2), .B(n305), .Z(n306) );
  XOR2_X1 U355 ( .A(n154), .B(n306), .Z(P_i[12]) );
  AOI22_X1 U356 ( .A1(n315), .A2(A_i[4]), .B1(A_i[3]), .B2(n192), .ZN(n307) );
  XOR2_X1 U357 ( .A(n307), .B(n328), .Z(intadd_1_A_0_) );
  OAI21_X1 U358 ( .B1(B_i[3]), .B2(n308), .A(A_i[7]), .ZN(n309) );
  OAI21_X1 U359 ( .B1(A_i[7]), .B2(n310), .A(n309), .ZN(intadd_1_B_0_) );
  AOI22_X1 U360 ( .A1(A_i[6]), .A2(n312), .B1(A_i[5]), .B2(n311), .ZN(n314) );
  XNOR2_X1 U361 ( .A(n314), .B(n313), .ZN(intadd_1_CI) );
  AOI22_X1 U362 ( .A1(n315), .A2(A_i[5]), .B1(A_i[4]), .B2(n192), .ZN(n316) );
  XOR2_X1 U363 ( .A(n316), .B(n328), .Z(intadd_1_B_1_) );
  FA_X1 U364 ( .A(n319), .B(n318), .CI(n317), .CO(n243), .S(intadd_0_A_4_) );
  FA_X1 U365 ( .A(n322), .B(n321), .CI(n320), .CO(intadd_0_B_4_), .S(n301) );
  NOR2_X1 U366 ( .A1(B_i[7]), .A2(n323), .ZN(n326) );
  AOI22_X1 U367 ( .A1(A_i[7]), .A2(n326), .B1(n325), .B2(n324), .ZN(n327) );
  OAI21_X1 U368 ( .B1(A_i[7]), .B2(n328), .A(n327), .ZN(P_i[14]) );
  XOR2_X1 U369 ( .A(n329), .B(n330), .Z(P_i[2]) );
  OAI221_X1 U370 ( .B1(A_i[0]), .B2(n333), .C1(n350), .C2(n332), .A(n331), 
        .ZN(mul_pp_0__0_) );
  AOI22_X1 U371 ( .A1(n335), .A2(A_i[1]), .B1(n334), .B2(n350), .ZN(n336) );
  OAI21_X1 U372 ( .B1(A_i[1]), .B2(n337), .A(n336), .ZN(mul_pp_0__1_) );
  NAND2_X1 U373 ( .A1(n339), .A2(n338), .ZN(n120) );
endmodule

