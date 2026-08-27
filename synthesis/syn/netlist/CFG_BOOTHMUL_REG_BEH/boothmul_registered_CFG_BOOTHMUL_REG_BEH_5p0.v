/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : W-2024.09-SP2
// Date      : Thu Aug 27 03:33:46 2026
/////////////////////////////////////////////////////////////


module boothmul_registered ( CLK, LD, RST, A, B, P );
  input [7:0] A;
  input [7:0] B;
  output [15:0] P;
  input CLK, LD, RST;
  wire   mul_pp_0__0_, mul_pp_0__1_, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n30, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, intadd_14_A_8_,
         intadd_14_A_7_, intadd_14_A_6_, intadd_14_A_5_, intadd_14_A_4_,
         intadd_14_A_3_, intadd_14_A_2_, intadd_14_A_1_, intadd_14_A_0_,
         intadd_14_B_8_, intadd_14_B_7_, intadd_14_B_6_, intadd_14_B_5_,
         intadd_14_B_4_, intadd_14_B_3_, intadd_14_B_2_, intadd_14_B_1_,
         intadd_14_B_0_, intadd_14_CI, intadd_14_SUM_8_, intadd_14_SUM_7_,
         intadd_14_SUM_6_, intadd_14_SUM_5_, intadd_14_SUM_4_,
         intadd_14_SUM_3_, intadd_14_SUM_2_, intadd_14_SUM_1_,
         intadd_14_SUM_0_, intadd_14_n9, intadd_14_n8, intadd_14_n7,
         intadd_14_n6, intadd_14_n5, intadd_14_n4, intadd_14_n3, intadd_14_n2,
         intadd_14_n1, intadd_15_A_2_, intadd_15_A_1_, intadd_15_A_0_,
         intadd_15_B_2_, intadd_15_B_1_, intadd_15_B_0_, intadd_15_CI,
         intadd_15_SUM_1_, intadd_15_SUM_0_, intadd_15_n3, intadd_15_n2,
         intadd_15_n1, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n228,
         n229, n230, n231, n232, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n247, n248, n249, n250,
         n251, n252, n253, n254, n255, n256, n257, n258;
  wire   [7:0] A_i;
  wire   [7:0] B_i;
  wire   [14:2] P_i;

  DFF_X1 A_reg_Y_temp_reg_0_ ( .D(n149), .CK(CLK), .Q(A_i[0]), .QN(n258) );
  DFF_X1 B_reg_Y_temp_reg_0_ ( .D(n141), .CK(CLK), .Q(B_i[0]) );
  DFF_X1 B_reg_Y_temp_reg_1_ ( .D(n140), .CK(CLK), .Q(B_i[1]), .QN(n251) );
  DFF_X1 B_reg_Y_temp_reg_2_ ( .D(n139), .CK(CLK), .Q(B_i[2]) );
  DFF_X1 B_reg_Y_temp_reg_3_ ( .D(n138), .CK(CLK), .Q(B_i[3]), .QN(n252) );
  DFF_X1 B_reg_Y_temp_reg_4_ ( .D(n137), .CK(CLK), .Q(B_i[4]) );
  DFF_X1 B_reg_Y_temp_reg_5_ ( .D(n136), .CK(CLK), .Q(B_i[5]), .QN(n253) );
  DFF_X1 B_reg_Y_temp_reg_6_ ( .D(n135), .CK(CLK), .Q(B_i[6]) );
  DFF_X1 B_reg_Y_temp_reg_7_ ( .D(n134), .CK(CLK), .Q(B_i[7]), .QN(n254) );
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
  DFF_X1 p_reg_Y_temp_reg_13_ ( .D(n120), .CK(CLK), .Q(P[13]) );
  DFF_X1 p_reg_Y_temp_reg_14_ ( .D(n119), .CK(CLK), .Q(P[14]) );
  DFF_X1 p_reg_Y_temp_reg_15_ ( .D(n118), .CK(CLK), .Q(P[15]) );
  AOI22_X1 U3 ( .A1(n49), .A2(P[15]), .B1(n48), .B2(P_i[14]), .ZN(n13) );
  AOI22_X1 U5 ( .A1(n49), .A2(P[14]), .B1(n48), .B2(P_i[14]), .ZN(n14) );
  AOI22_X1 U7 ( .A1(n49), .A2(P[13]), .B1(n48), .B2(P_i[13]), .ZN(n15) );
  AOI22_X1 U9 ( .A1(n49), .A2(P[12]), .B1(n48), .B2(P_i[12]), .ZN(n16) );
  AOI22_X1 U11 ( .A1(n49), .A2(P[11]), .B1(n48), .B2(P_i[11]), .ZN(n17) );
  AOI22_X1 U13 ( .A1(n49), .A2(P[10]), .B1(n48), .B2(P_i[10]), .ZN(n18) );
  AOI22_X1 U15 ( .A1(n49), .A2(P[9]), .B1(n48), .B2(P_i[9]), .ZN(n19) );
  AOI22_X1 U17 ( .A1(n49), .A2(P[8]), .B1(n48), .B2(P_i[8]), .ZN(n20) );
  AOI22_X1 U19 ( .A1(n49), .A2(P[7]), .B1(n48), .B2(P_i[7]), .ZN(n21) );
  AOI22_X1 U21 ( .A1(n49), .A2(P[6]), .B1(n48), .B2(P_i[6]), .ZN(n22) );
  AOI22_X1 U23 ( .A1(n49), .A2(P[5]), .B1(n48), .B2(P_i[5]), .ZN(n23) );
  AOI22_X1 U25 ( .A1(n49), .A2(P[4]), .B1(n48), .B2(P_i[4]), .ZN(n24) );
  AOI22_X1 U27 ( .A1(n49), .A2(P[3]), .B1(n48), .B2(P_i[3]), .ZN(n25) );
  AOI22_X1 U29 ( .A1(n49), .A2(P[2]), .B1(n48), .B2(P_i[2]), .ZN(n26) );
  AOI22_X1 U35 ( .A1(P[1]), .A2(n49), .B1(n48), .B2(mul_pp_0__1_), .ZN(n30) );
  AOI22_X1 U40 ( .A1(n49), .A2(P[0]), .B1(n48), .B2(mul_pp_0__0_), .ZN(n32) );
  AOI22_X1 U42 ( .A1(B_i[7]), .A2(n49), .B1(n48), .B2(B[7]), .ZN(n33) );
  AOI22_X1 U44 ( .A1(B_i[6]), .A2(n49), .B1(n48), .B2(B[6]), .ZN(n34) );
  AOI22_X1 U46 ( .A1(B_i[5]), .A2(n49), .B1(n48), .B2(B[5]), .ZN(n35) );
  AOI22_X1 U48 ( .A1(B_i[4]), .A2(n49), .B1(n48), .B2(B[4]), .ZN(n36) );
  AOI22_X1 U50 ( .A1(B_i[3]), .A2(n49), .B1(n48), .B2(B[3]), .ZN(n37) );
  AOI22_X1 U52 ( .A1(B_i[2]), .A2(n49), .B1(n48), .B2(B[2]), .ZN(n38) );
  AOI22_X1 U54 ( .A1(B_i[1]), .A2(n49), .B1(n48), .B2(B[1]), .ZN(n39) );
  AOI22_X1 U56 ( .A1(B_i[0]), .A2(n49), .B1(n48), .B2(B[0]), .ZN(n40) );
  AOI22_X1 U58 ( .A1(A_i[7]), .A2(n49), .B1(n48), .B2(A[7]), .ZN(n41) );
  AOI22_X1 U60 ( .A1(A_i[6]), .A2(n49), .B1(n48), .B2(A[6]), .ZN(n42) );
  AOI22_X1 U62 ( .A1(A_i[5]), .A2(n49), .B1(n48), .B2(A[5]), .ZN(n43) );
  AOI22_X1 U64 ( .A1(A_i[4]), .A2(n49), .B1(n48), .B2(A[4]), .ZN(n44) );
  AOI22_X1 U66 ( .A1(A_i[3]), .A2(n49), .B1(n48), .B2(A[3]), .ZN(n45) );
  AOI22_X1 U68 ( .A1(A_i[2]), .A2(n49), .B1(n48), .B2(A[2]), .ZN(n46) );
  AOI22_X1 U70 ( .A1(A_i[1]), .A2(n49), .B1(n48), .B2(A[1]), .ZN(n47) );
  AOI22_X1 U72 ( .A1(A_i[0]), .A2(n49), .B1(n48), .B2(A[0]), .ZN(n50) );
  FA_X1 intadd_14_U10 ( .A(intadd_14_A_0_), .B(intadd_14_B_0_), .CI(
        intadd_14_CI), .CO(intadd_14_n9), .S(intadd_14_SUM_0_) );
  FA_X1 intadd_14_U9 ( .A(intadd_14_A_1_), .B(intadd_14_B_1_), .CI(
        intadd_14_n9), .CO(intadd_14_n8), .S(intadd_14_SUM_1_) );
  FA_X1 intadd_14_U8 ( .A(intadd_14_A_2_), .B(intadd_14_B_2_), .CI(
        intadd_14_n8), .CO(intadd_14_n7), .S(intadd_14_SUM_2_) );
  FA_X1 intadd_14_U7 ( .A(intadd_14_A_3_), .B(intadd_14_B_3_), .CI(
        intadd_14_n7), .CO(intadd_14_n6), .S(intadd_14_SUM_3_) );
  FA_X1 intadd_14_U6 ( .A(intadd_14_A_4_), .B(intadd_14_B_4_), .CI(
        intadd_14_n6), .CO(intadd_14_n5), .S(intadd_14_SUM_4_) );
  FA_X1 intadd_14_U5 ( .A(intadd_14_A_5_), .B(intadd_14_B_5_), .CI(
        intadd_14_n5), .CO(intadd_14_n4), .S(intadd_14_SUM_5_) );
  FA_X1 intadd_14_U4 ( .A(intadd_14_A_6_), .B(intadd_14_B_6_), .CI(
        intadd_14_n4), .CO(intadd_14_n3), .S(intadd_14_SUM_6_) );
  FA_X1 intadd_14_U3 ( .A(intadd_14_A_7_), .B(intadd_14_B_7_), .CI(
        intadd_14_n3), .CO(intadd_14_n2), .S(intadd_14_SUM_7_) );
  FA_X1 intadd_14_U2 ( .A(intadd_14_A_8_), .B(intadd_14_B_8_), .CI(
        intadd_14_n2), .CO(intadd_14_n1), .S(intadd_14_SUM_8_) );
  FA_X1 intadd_15_U4 ( .A(intadd_15_A_0_), .B(intadd_15_B_0_), .CI(
        intadd_15_CI), .CO(intadd_15_n3), .S(intadd_15_SUM_0_) );
  FA_X1 intadd_15_U3 ( .A(intadd_15_A_1_), .B(intadd_15_B_1_), .CI(
        intadd_15_n3), .CO(intadd_15_n2), .S(intadd_15_SUM_1_) );
  FA_X1 intadd_15_U2 ( .A(intadd_15_A_2_), .B(intadd_15_B_2_), .CI(
        intadd_15_n2), .CO(intadd_15_n1), .S(P_i[12]) );
  DFF_X1 A_reg_Y_temp_reg_1_ ( .D(n148), .CK(CLK), .Q(A_i[1]), .QN(n256) );
  DFF_X1 A_reg_Y_temp_reg_2_ ( .D(n147), .CK(CLK), .Q(A_i[2]) );
  DFF_X1 A_reg_Y_temp_reg_3_ ( .D(n146), .CK(CLK), .Q(A_i[3]), .QN(n255) );
  DFF_X1 A_reg_Y_temp_reg_4_ ( .D(n145), .CK(CLK), .Q(A_i[4]) );
  DFF_X1 A_reg_Y_temp_reg_5_ ( .D(n144), .CK(CLK), .Q(A_i[5]) );
  DFF_X1 A_reg_Y_temp_reg_6_ ( .D(n143), .CK(CLK), .Q(A_i[6]) );
  DFF_X1 A_reg_Y_temp_reg_7_ ( .D(n142), .CK(CLK), .Q(A_i[7]), .QN(n257) );
  NOR2_X2 U2 ( .A1(RST), .A2(n49), .ZN(n48) );
  NOR2_X2 U1 ( .A1(RST), .A2(LD), .ZN(n49) );
  INV_X1 U8 ( .A(n15), .ZN(n120) );
  INV_X1 U6 ( .A(n14), .ZN(n119) );
  INV_X1 U4 ( .A(n13), .ZN(n118) );
  INV_X1 U10 ( .A(n16), .ZN(n121) );
  INV_X1 U12 ( .A(n17), .ZN(n122) );
  INV_X1 U14 ( .A(n18), .ZN(n123) );
  INV_X1 U16 ( .A(n19), .ZN(n124) );
  INV_X1 U63 ( .A(n43), .ZN(n144) );
  INV_X1 U65 ( .A(n44), .ZN(n145) );
  INV_X1 U67 ( .A(n45), .ZN(n146) );
  INV_X1 U69 ( .A(n46), .ZN(n147) );
  INV_X1 U71 ( .A(n47), .ZN(n148) );
  INV_X1 U61 ( .A(n42), .ZN(n143) );
  INV_X1 U18 ( .A(n20), .ZN(n125) );
  INV_X1 U20 ( .A(n21), .ZN(n126) );
  INV_X1 U73 ( .A(n50), .ZN(n149) );
  INV_X1 U22 ( .A(n22), .ZN(n127) );
  INV_X1 U24 ( .A(n23), .ZN(n128) );
  INV_X1 U26 ( .A(n24), .ZN(n129) );
  INV_X1 U28 ( .A(n25), .ZN(n130) );
  INV_X1 U30 ( .A(n26), .ZN(n131) );
  INV_X1 U36 ( .A(n30), .ZN(n132) );
  INV_X1 U41 ( .A(n32), .ZN(n133) );
  INV_X1 U43 ( .A(n33), .ZN(n134) );
  INV_X1 U45 ( .A(n34), .ZN(n135) );
  INV_X1 U47 ( .A(n35), .ZN(n136) );
  INV_X1 U49 ( .A(n36), .ZN(n137) );
  INV_X1 U51 ( .A(n37), .ZN(n138) );
  INV_X1 U53 ( .A(n38), .ZN(n139) );
  INV_X1 U55 ( .A(n39), .ZN(n140) );
  INV_X1 U57 ( .A(n40), .ZN(n141) );
  INV_X1 U59 ( .A(n41), .ZN(n142) );
  INV_X1 U175 ( .A(intadd_14_SUM_0_), .ZN(P_i[3]) );
  INV_X1 U176 ( .A(intadd_14_SUM_1_), .ZN(P_i[4]) );
  INV_X1 U177 ( .A(intadd_14_SUM_2_), .ZN(P_i[5]) );
  INV_X1 U178 ( .A(intadd_14_SUM_3_), .ZN(P_i[6]) );
  INV_X1 U179 ( .A(intadd_14_SUM_4_), .ZN(P_i[7]) );
  INV_X1 U180 ( .A(intadd_14_SUM_5_), .ZN(P_i[8]) );
  INV_X1 U181 ( .A(intadd_14_SUM_6_), .ZN(P_i[9]) );
  INV_X1 U182 ( .A(intadd_14_SUM_7_), .ZN(P_i[10]) );
  INV_X1 U183 ( .A(intadd_14_SUM_8_), .ZN(P_i[11]) );
  INV_X1 U184 ( .A(intadd_14_n1), .ZN(intadd_15_B_2_) );
  INV_X1 U185 ( .A(intadd_15_SUM_1_), .ZN(intadd_14_A_8_) );
  NOR2_X1 U186 ( .A1(B_i[3]), .A2(B_i[4]), .ZN(n226) );
  AOI21_X1 U187 ( .B1(B_i[4]), .B2(B_i[3]), .A(n226), .ZN(n212) );
  INV_X1 U188 ( .A(n226), .ZN(n154) );
  NAND2_X1 U189 ( .A1(B_i[3]), .A2(B_i[4]), .ZN(n155) );
  AOI22_X1 U190 ( .A1(B_i[5]), .A2(n154), .B1(n155), .B2(n253), .ZN(n207) );
  AOI22_X1 U191 ( .A1(A_i[7]), .A2(n212), .B1(A_i[6]), .B2(n207), .ZN(n156) );
  AND2_X1 U192 ( .A1(B_i[5]), .A2(n155), .ZN(n228) );
  XNOR2_X1 U193 ( .A(n156), .B(n228), .ZN(n233) );
  INV_X1 U194 ( .A(n233), .ZN(intadd_15_A_1_) );
  NOR2_X1 U195 ( .A1(B_i[6]), .A2(B_i[5]), .ZN(n229) );
  AOI21_X1 U196 ( .B1(B_i[5]), .B2(B_i[6]), .A(n229), .ZN(n231) );
  INV_X1 U197 ( .A(n229), .ZN(n157) );
  NAND2_X1 U198 ( .A1(B_i[6]), .A2(B_i[5]), .ZN(n158) );
  AOI22_X1 U199 ( .A1(B_i[7]), .A2(n157), .B1(n158), .B2(n254), .ZN(n230) );
  AOI22_X1 U200 ( .A1(n231), .A2(A_i[4]), .B1(A_i[3]), .B2(n230), .ZN(n159) );
  NAND2_X1 U201 ( .A1(B_i[7]), .A2(n158), .ZN(n238) );
  XOR2_X1 U202 ( .A(n159), .B(n238), .Z(intadd_15_A_0_) );
  NAND2_X1 U203 ( .A1(B_i[1]), .A2(B_i[2]), .ZN(n164) );
  AND2_X1 U204 ( .A1(B_i[3]), .A2(n164), .ZN(n223) );
  NOR2_X1 U205 ( .A1(B_i[1]), .A2(B_i[2]), .ZN(n163) );
  OAI21_X1 U206 ( .B1(B_i[3]), .B2(n163), .A(A_i[7]), .ZN(n160) );
  OAI21_X1 U207 ( .B1(A_i[7]), .B2(n223), .A(n160), .ZN(intadd_15_B_0_) );
  AOI22_X1 U208 ( .A1(A_i[6]), .A2(n212), .B1(A_i[5]), .B2(n207), .ZN(n161) );
  XNOR2_X1 U209 ( .A(n161), .B(n228), .ZN(intadd_15_CI) );
  AOI22_X1 U210 ( .A1(n231), .A2(A_i[5]), .B1(A_i[4]), .B2(n230), .ZN(n162) );
  XOR2_X1 U211 ( .A(n162), .B(n238), .Z(intadd_15_B_1_) );
  INV_X1 U212 ( .A(intadd_15_SUM_0_), .ZN(n170) );
  NAND2_X1 U213 ( .A1(n251), .A2(B_i[0]), .ZN(n246) );
  AOI22_X1 U214 ( .A1(A_i[7]), .A2(n246), .B1(n251), .B2(n257), .ZN(n169) );
  INV_X1 U215 ( .A(n169), .ZN(n181) );
  AOI21_X1 U216 ( .B1(B_i[2]), .B2(B_i[1]), .A(n163), .ZN(n222) );
  INV_X1 U217 ( .A(n163), .ZN(n165) );
  AOI22_X1 U218 ( .A1(B_i[3]), .A2(n165), .B1(n164), .B2(n252), .ZN(n221) );
  AOI22_X1 U219 ( .A1(A_i[7]), .A2(n222), .B1(A_i[6]), .B2(n221), .ZN(n166) );
  XOR2_X1 U220 ( .A(n166), .B(n223), .Z(n172) );
  AOI22_X1 U221 ( .A1(n231), .A2(A_i[3]), .B1(A_i[2]), .B2(n230), .ZN(n167) );
  XNOR2_X1 U222 ( .A(n167), .B(n238), .ZN(n171) );
  FA_X1 U223 ( .A(n170), .B(n169), .CI(n168), .CO(intadd_14_B_8_), .S(
        intadd_14_A_7_) );
  FA_X1 U224 ( .A(n181), .B(n172), .CI(n171), .CO(n168), .S(n178) );
  AOI22_X1 U225 ( .A1(A_i[6]), .A2(n222), .B1(A_i[5]), .B2(n221), .ZN(n173) );
  XOR2_X1 U226 ( .A(n173), .B(n223), .Z(n180) );
  AOI22_X1 U227 ( .A1(n231), .A2(A_i[2]), .B1(A_i[1]), .B2(n230), .ZN(n174) );
  XNOR2_X1 U228 ( .A(n174), .B(n238), .ZN(n179) );
  AOI22_X1 U229 ( .A1(A_i[4]), .A2(n207), .B1(n212), .B2(A_i[5]), .ZN(n175) );
  XOR2_X1 U230 ( .A(n175), .B(n228), .Z(n176) );
  FA_X1 U231 ( .A(n178), .B(n177), .CI(n176), .CO(intadd_14_B_7_), .S(
        intadd_14_A_6_) );
  FA_X1 U232 ( .A(n181), .B(n180), .CI(n179), .CO(n177), .S(n188) );
  AOI22_X1 U233 ( .A1(A_i[0]), .A2(n230), .B1(n231), .B2(A_i[1]), .ZN(n182) );
  XNOR2_X1 U234 ( .A(n182), .B(n238), .ZN(n191) );
  INV_X1 U235 ( .A(n246), .ZN(n248) );
  NOR2_X1 U236 ( .A1(B_i[0]), .A2(n251), .ZN(n247) );
  INV_X1 U237 ( .A(n247), .ZN(n245) );
  NAND2_X1 U238 ( .A1(B_i[1]), .A2(B_i[0]), .ZN(n250) );
  OAI22_X1 U239 ( .A1(A_i[6]), .A2(n245), .B1(A_i[7]), .B2(n250), .ZN(n183) );
  AOI21_X1 U240 ( .B1(A_i[7]), .B2(n248), .A(n183), .ZN(n190) );
  AOI22_X1 U241 ( .A1(A_i[5]), .A2(n222), .B1(A_i[4]), .B2(n221), .ZN(n184) );
  XOR2_X1 U242 ( .A(n184), .B(n223), .Z(n189) );
  AOI22_X1 U243 ( .A1(A_i[3]), .A2(n207), .B1(A_i[4]), .B2(n212), .ZN(n185) );
  XOR2_X1 U244 ( .A(n185), .B(n228), .Z(n186) );
  FA_X1 U245 ( .A(n188), .B(n187), .CI(n186), .CO(intadd_14_B_6_), .S(
        intadd_14_A_5_) );
  FA_X1 U246 ( .A(n191), .B(n190), .CI(n189), .CO(n187), .S(n196) );
  AOI22_X1 U247 ( .A1(A_i[3]), .A2(n212), .B1(A_i[2]), .B2(n207), .ZN(n192) );
  XOR2_X1 U248 ( .A(n192), .B(n228), .Z(n195) );
  NAND2_X1 U249 ( .A1(A_i[0]), .A2(n231), .ZN(n193) );
  XOR2_X1 U250 ( .A(n238), .B(n193), .Z(n199) );
  AOI22_X1 U251 ( .A1(A_i[3]), .A2(n221), .B1(A_i[4]), .B2(n222), .ZN(n194) );
  XNOR2_X1 U252 ( .A(n194), .B(n223), .ZN(n198) );
  NAND2_X1 U253 ( .A1(n199), .A2(n198), .ZN(n197) );
  FA_X1 U254 ( .A(n196), .B(n195), .CI(n197), .CO(intadd_14_B_5_), .S(
        intadd_14_A_4_) );
  OAI21_X1 U255 ( .B1(n199), .B2(n198), .A(n197), .ZN(n204) );
  OAI22_X1 U256 ( .A1(A_i[6]), .A2(n250), .B1(A_i[5]), .B2(n245), .ZN(n200) );
  AOI21_X1 U257 ( .B1(A_i[6]), .B2(n248), .A(n200), .ZN(n203) );
  AOI22_X1 U258 ( .A1(A_i[1]), .A2(n207), .B1(A_i[2]), .B2(n212), .ZN(n201) );
  XOR2_X1 U259 ( .A(n201), .B(n228), .Z(n202) );
  FA_X1 U260 ( .A(n204), .B(n203), .CI(n202), .CO(intadd_14_B_4_), .S(
        intadd_14_A_3_) );
  AOI22_X1 U261 ( .A1(A_i[3]), .A2(n222), .B1(A_i[2]), .B2(n221), .ZN(n205) );
  XOR2_X1 U262 ( .A(n205), .B(n223), .Z(n211) );
  OAI22_X1 U263 ( .A1(A_i[4]), .A2(n245), .B1(A_i[5]), .B2(n250), .ZN(n206) );
  AOI21_X1 U264 ( .B1(n248), .B2(A_i[5]), .A(n206), .ZN(n210) );
  AOI22_X1 U265 ( .A1(A_i[0]), .A2(n207), .B1(A_i[1]), .B2(n212), .ZN(n208) );
  XOR2_X1 U266 ( .A(n208), .B(n228), .Z(n209) );
  FA_X1 U267 ( .A(n211), .B(n210), .CI(n209), .CO(intadd_14_B_3_), .S(
        intadd_14_A_2_) );
  NAND2_X1 U268 ( .A1(A_i[0]), .A2(n212), .ZN(n213) );
  XNOR2_X1 U269 ( .A(n228), .B(n213), .ZN(n216) );
  AOI22_X1 U270 ( .A1(n248), .A2(A_i[4]), .B1(n247), .B2(n255), .ZN(n214) );
  OAI21_X1 U271 ( .B1(A_i[4]), .B2(n250), .A(n214), .ZN(n215) );
  NAND2_X1 U272 ( .A1(n216), .A2(n215), .ZN(intadd_14_B_2_) );
  OAI21_X1 U273 ( .B1(n216), .B2(n215), .A(intadd_14_B_2_), .ZN(intadd_14_A_1_) );
  OAI22_X1 U274 ( .A1(A_i[2]), .A2(n245), .B1(A_i[3]), .B2(n250), .ZN(n217) );
  AOI21_X1 U275 ( .B1(A_i[3]), .B2(n248), .A(n217), .ZN(intadd_14_A_0_) );
  AOI22_X1 U276 ( .A1(A_i[0]), .A2(n221), .B1(n222), .B2(A_i[1]), .ZN(n218) );
  XOR2_X1 U277 ( .A(n218), .B(n223), .Z(intadd_14_B_0_) );
  NAND2_X1 U278 ( .A1(n222), .A2(A_i[0]), .ZN(n219) );
  XNOR2_X1 U279 ( .A(n223), .B(n219), .ZN(n244) );
  AOI22_X1 U280 ( .A1(n248), .A2(A_i[2]), .B1(n247), .B2(n256), .ZN(n220) );
  OAI21_X1 U281 ( .B1(A_i[2]), .B2(n250), .A(n220), .ZN(n243) );
  NAND2_X1 U282 ( .A1(n244), .A2(n243), .ZN(intadd_14_CI) );
  AOI22_X1 U283 ( .A1(A_i[2]), .A2(n222), .B1(A_i[1]), .B2(n221), .ZN(n224) );
  XOR2_X1 U284 ( .A(n224), .B(n223), .Z(intadd_14_B_1_) );
  AOI22_X1 U285 ( .A1(n231), .A2(A_i[6]), .B1(A_i[5]), .B2(n230), .ZN(n225) );
  XOR2_X1 U286 ( .A(n225), .B(n238), .Z(n235) );
  OAI21_X1 U287 ( .B1(B_i[5]), .B2(n226), .A(A_i[7]), .ZN(n227) );
  OAI21_X1 U288 ( .B1(A_i[7]), .B2(n228), .A(n227), .ZN(n234) );
  NOR2_X1 U289 ( .A1(B_i[7]), .A2(n229), .ZN(n236) );
  AOI22_X1 U290 ( .A1(n231), .A2(A_i[7]), .B1(A_i[6]), .B2(n230), .ZN(n232) );
  XNOR2_X1 U291 ( .A(n232), .B(n238), .ZN(n242) );
  FA_X1 U292 ( .A(n235), .B(n234), .CI(n233), .CO(n240), .S(intadd_15_A_2_) );
  NOR2_X1 U293 ( .A1(n240), .A2(intadd_15_n1), .ZN(n239) );
  AOI22_X1 U294 ( .A1(A_i[7]), .A2(n236), .B1(n242), .B2(n239), .ZN(n237) );
  OAI21_X1 U295 ( .B1(A_i[7]), .B2(n238), .A(n237), .ZN(P_i[14]) );
  AOI21_X1 U296 ( .B1(intadd_15_n1), .B2(n240), .A(n239), .ZN(n241) );
  XOR2_X1 U297 ( .A(n242), .B(n241), .Z(P_i[13]) );
  XOR2_X1 U298 ( .A(n244), .B(n243), .Z(P_i[2]) );
  OAI221_X1 U299 ( .B1(A_i[0]), .B2(n251), .C1(n258), .C2(n246), .A(n245), 
        .ZN(mul_pp_0__0_) );
  AOI22_X1 U300 ( .A1(n248), .A2(A_i[1]), .B1(n247), .B2(n258), .ZN(n249) );
  OAI21_X1 U301 ( .B1(A_i[1]), .B2(n250), .A(n249), .ZN(mul_pp_0__1_) );
endmodule

