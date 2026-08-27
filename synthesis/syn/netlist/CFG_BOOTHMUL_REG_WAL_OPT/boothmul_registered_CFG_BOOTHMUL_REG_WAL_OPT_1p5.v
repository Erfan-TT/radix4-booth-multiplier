/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : W-2024.09-SP2
// Date      : Thu Aug 27 03:30:14 2026
/////////////////////////////////////////////////////////////


module boothmul_registered ( CLK, LD, RST, A, B, P );
  input [7:0] A;
  input [7:0] B;
  output [15:0] P;
  input CLK, LD, RST;
  wire   n148, n172, n173, n174, n175, n176, n177, n178, n179, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n201, n205, n206, n208, n209, n213, n214, n215, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n228,
         n229, n230, n231, n232, n233, n234, n235, n265, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, DP_OP_72J13_124_2857_n18,
         DP_OP_72J13_124_2857_n17, DP_OP_72J13_124_2857_n16,
         DP_OP_72J13_124_2857_n4, DP_OP_71J13_123_5612_n19,
         DP_OP_71J13_123_5612_n18, DP_OP_71J13_123_5612_n17,
         DP_OP_71J13_123_5612_n4, DP_OP_70J13_122_5612_n18,
         DP_OP_70J13_122_5612_n17, DP_OP_70J13_122_5612_n16, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n341, n342, n343, n344, n345,
         n346, n347, n348, n349, n350, n351, n352, n353, n354, n355, n356,
         n357, n358, n359, n360, n361, n362, n363, n364, n365, n366, n367,
         n368, n369, n370, n371, n372, n373, n374, n375, n376, n377, n378,
         n379, n380, n381, n382, n383, n384, n385, n386, n387, n388, n389,
         n390, n391, n392, n393, n394, n395, n396, n397, n398, n399, n400,
         n401, n402, n403, n404, n405, n406, n407, n408, n409, n410, n411,
         n412, n413, n414, n415, n416, n417, n418, n419, n420, n421, n422,
         n423, n424, n425, n426, n427, n428, n429, n430, n431, n432, n433,
         n434, n435, n436, n437, n438, n439, n440, n441, n442, n443, n444,
         n445, n446, n447, n448, n449, n450, n451, n452, n453, n454, n455,
         n456, n457, n458, n459, n460, n461, n462, n463, n464, n465, n466,
         n467, n468, n469, n470, n471, n472, n473, n474, n475, n476, n477,
         n478, n479, n480, n481, n482, n483, n484, n485, n486, n487, n488,
         n489, n490, n491, n492, n493, n494, n495, n496, n497, n498, n499,
         n500, n501, n503, n504, n505, n506, n507, n508, n509, n510, n511,
         n512, n513, n514, n515, n516, n517, n518, n519, n520, n521, n522,
         n523, n524, n525, n526, n527, n528, n529, n530, n531, n532, n533,
         n534, n535, n536, n537, n538, n539, n540, n541, n542, n543, n544,
         n545, n546, n547, n548, n549, n550, n551, n552, n553, n554, n555,
         n556, n557, n558, n559, n560, n561, n562, n563, n564, n565, n566,
         n567, n568, n569, n570, n571, n572, n573, n574, n575, n576, n577,
         n578, n579, n580, n581, n582, n583, n584, n585, n586, n587, n588,
         n589, n590, n591, n592, n593, n594, n595, n596, n597, n598;
  wire   [7:0] A_i;
  wire   [7:0] B_i;
  wire   [3:1] mul_final_add_sum_gen_carry_select_int_1_S1;
  wire   [3:1] mul_final_add_sum_gen_carry_select_int_2_S1;
  wire   [3:1] mul_final_add_sum_gen_carry_select_int_3_S1;

  DFF_X1 B_reg_Y_temp_reg_3_ ( .D(n286), .CK(CLK), .Q(B_i[3]), .QN(n598) );
  DFF_X1 B_reg_Y_temp_reg_4_ ( .D(n285), .CK(CLK), .Q(B_i[4]), .QN(n594) );
  DFF_X1 B_reg_Y_temp_reg_5_ ( .D(n284), .CK(CLK), .Q(B_i[5]), .QN(n595) );
  DFF_X1 B_reg_Y_temp_reg_6_ ( .D(n283), .CK(CLK), .Q(B_i[6]) );
  DFF_X1 B_reg_Y_temp_reg_7_ ( .D(n282), .CK(CLK), .Q(B_i[7]), .QN(n583) );
  DFF_X1 p_reg_Y_temp_reg_0_ ( .D(n281), .CK(CLK), .Q(P[0]), .QN(n588) );
  DFF_X1 p_reg_Y_temp_reg_1_ ( .D(n280), .CK(CLK), .Q(P[1]), .QN(n585) );
  DFF_X1 p_reg_Y_temp_reg_2_ ( .D(n279), .CK(CLK), .Q(P[2]), .QN(n587) );
  DFF_X1 p_reg_Y_temp_reg_3_ ( .D(n278), .CK(CLK), .Q(P[3]), .QN(n586) );
  DFF_X1 p_reg_Y_temp_reg_4_ ( .D(n277), .CK(CLK), .Q(P[4]) );
  DFF_X1 p_reg_Y_temp_reg_5_ ( .D(n276), .CK(CLK), .Q(P[5]) );
  DFF_X1 p_reg_Y_temp_reg_6_ ( .D(n275), .CK(CLK), .Q(P[6]) );
  DFF_X1 p_reg_Y_temp_reg_7_ ( .D(n274), .CK(CLK), .Q(P[7]) );
  DFF_X1 p_reg_Y_temp_reg_8_ ( .D(n273), .CK(CLK), .Q(P[8]) );
  DFF_X1 p_reg_Y_temp_reg_9_ ( .D(n272), .CK(CLK), .Q(P[9]) );
  DFF_X1 p_reg_Y_temp_reg_10_ ( .D(n271), .CK(CLK), .Q(P[10]) );
  DFF_X1 p_reg_Y_temp_reg_11_ ( .D(n270), .CK(CLK), .Q(P[11]) );
  DFF_X1 p_reg_Y_temp_reg_12_ ( .D(n269), .CK(CLK), .Q(P[12]) );
  DFF_X1 p_reg_Y_temp_reg_13_ ( .D(n268), .CK(CLK), .Q(P[13]) );
  DFF_X1 p_reg_Y_temp_reg_14_ ( .D(n267), .CK(CLK), .Q(P[14]) );
  DFF_X1 p_reg_Y_temp_reg_15_ ( .D(n265), .CK(CLK), .Q(P[15]) );
  INV_X1 U174 ( .A(RST), .ZN(n148) );
  NOR2_X1 U200 ( .A1(n214), .A2(n172), .ZN(n176) );
  AND2_X1 U203 ( .A1(n172), .A2(n234), .ZN(n177) );
  AOI222_X1 U204 ( .A1(n176), .A2(
        mul_final_add_sum_gen_carry_select_int_3_S1[3]), .B1(n233), .B2(P[15]), 
        .C1(n177), .C2(DP_OP_72J13_124_2857_n18), .ZN(n173) );
  INV_X1 U205 ( .A(n173), .ZN(n265) );
  AOI222_X1 U207 ( .A1(n176), .A2(
        mul_final_add_sum_gen_carry_select_int_3_S1[2]), .B1(n233), .B2(P[14]), 
        .C1(n177), .C2(DP_OP_72J13_124_2857_n17), .ZN(n174) );
  INV_X1 U208 ( .A(n174), .ZN(n267) );
  AOI222_X1 U209 ( .A1(n176), .A2(
        mul_final_add_sum_gen_carry_select_int_3_S1[1]), .B1(n233), .B2(P[13]), 
        .C1(n177), .C2(DP_OP_72J13_124_2857_n16), .ZN(n175) );
  INV_X1 U210 ( .A(n175), .ZN(n268) );
  INV_X1 U211 ( .A(n176), .ZN(n179) );
  AOI22_X1 U212 ( .A1(n233), .A2(P[12]), .B1(n177), .B2(
        DP_OP_72J13_124_2857_n4), .ZN(n178) );
  OAI21_X1 U213 ( .B1(DP_OP_72J13_124_2857_n4), .B2(n179), .A(n178), .ZN(n269)
         );
  NOR2_X1 U214 ( .A1(n214), .A2(n582), .ZN(n185) );
  NAND2_X1 U215 ( .A1(n582), .A2(n234), .ZN(n187) );
  AOI222_X1 U217 ( .A1(n233), .A2(P[11]), .B1(n185), .B2(
        DP_OP_71J13_123_5612_n19), .C1(n183), .C2(
        mul_final_add_sum_gen_carry_select_int_2_S1[3]), .ZN(n181) );
  INV_X1 U218 ( .A(n181), .ZN(n270) );
  AOI222_X1 U219 ( .A1(n233), .A2(P[10]), .B1(n185), .B2(
        DP_OP_71J13_123_5612_n18), .C1(n183), .C2(
        mul_final_add_sum_gen_carry_select_int_2_S1[2]), .ZN(n182) );
  INV_X1 U220 ( .A(n182), .ZN(n271) );
  AOI222_X1 U221 ( .A1(n233), .A2(P[9]), .B1(n185), .B2(
        DP_OP_71J13_123_5612_n17), .C1(n183), .C2(
        mul_final_add_sum_gen_carry_select_int_2_S1[1]), .ZN(n184) );
  INV_X1 U222 ( .A(n184), .ZN(n272) );
  AOI22_X1 U223 ( .A1(n233), .A2(P[8]), .B1(n185), .B2(DP_OP_71J13_123_5612_n4), .ZN(n186) );
  OAI21_X1 U224 ( .B1(DP_OP_71J13_123_5612_n4), .B2(n187), .A(n186), .ZN(n273)
         );
  NAND2_X1 U225 ( .A1(n234), .A2(n188), .ZN(n195) );
  NOR2_X1 U227 ( .A1(n188), .A2(n214), .ZN(n193) );
  AOI222_X1 U228 ( .A1(n233), .A2(P[7]), .B1(n191), .B2(
        mul_final_add_sum_gen_carry_select_int_1_S1[3]), .C1(n193), .C2(
        DP_OP_70J13_122_5612_n18), .ZN(n189) );
  AOI222_X1 U230 ( .A1(n233), .A2(P[6]), .B1(n191), .B2(
        mul_final_add_sum_gen_carry_select_int_1_S1[2]), .C1(n193), .C2(
        DP_OP_70J13_122_5612_n17), .ZN(n190) );
  AOI222_X1 U232 ( .A1(n233), .A2(P[5]), .B1(n191), .B2(
        mul_final_add_sum_gen_carry_select_int_1_S1[1]), .C1(n193), .C2(
        DP_OP_70J13_122_5612_n16), .ZN(n192) );
  AOI22_X1 U234 ( .A1(P[4]), .A2(n233), .B1(n193), .B2(n591), .ZN(n194) );
  OAI21_X1 U235 ( .B1(n591), .B2(n195), .A(n194), .ZN(n277) );
  OAI22_X1 U240 ( .A1(n214), .A2(n201), .B1(n217), .B2(n586), .ZN(n278) );
  OAI21_X1 U243 ( .B1(n206), .B2(n205), .A(n234), .ZN(n208) );
  OAI22_X1 U245 ( .A1(n209), .A2(n208), .B1(n587), .B2(n217), .ZN(n279) );
  OAI22_X1 U249 ( .A1(n214), .A2(n213), .B1(n217), .B2(n585), .ZN(n280) );
  NAND3_X1 U251 ( .A1(n234), .A2(A_i[0]), .A3(B_i[0]), .ZN(n215) );
  OAI21_X1 U252 ( .B1(n217), .B2(n588), .A(n215), .ZN(n281) );
  AOI22_X1 U253 ( .A1(n234), .A2(B[7]), .B1(B_i[7]), .B2(n233), .ZN(n218) );
  AOI22_X1 U255 ( .A1(n234), .A2(B[6]), .B1(B_i[6]), .B2(n233), .ZN(n219) );
  AOI22_X1 U257 ( .A1(n234), .A2(B[5]), .B1(B_i[5]), .B2(n233), .ZN(n220) );
  AOI22_X1 U259 ( .A1(n234), .A2(B[4]), .B1(B_i[4]), .B2(n233), .ZN(n221) );
  AOI22_X1 U261 ( .A1(n234), .A2(B[3]), .B1(n593), .B2(n233), .ZN(n222) );
  AOI22_X1 U263 ( .A1(n234), .A2(B[2]), .B1(n592), .B2(n233), .ZN(n223) );
  AOI22_X1 U265 ( .A1(n234), .A2(B[1]), .B1(n597), .B2(n233), .ZN(n224) );
  AOI22_X1 U267 ( .A1(n234), .A2(B[0]), .B1(B_i[0]), .B2(n233), .ZN(n225) );
  AOI22_X1 U269 ( .A1(n234), .A2(A[7]), .B1(A_i[7]), .B2(n233), .ZN(n226) );
  AOI22_X1 U271 ( .A1(n234), .A2(A[6]), .B1(A_i[6]), .B2(n233), .ZN(n227) );
  AOI22_X1 U273 ( .A1(n234), .A2(A[5]), .B1(A_i[5]), .B2(n233), .ZN(n228) );
  AOI22_X1 U275 ( .A1(n234), .A2(A[4]), .B1(A_i[4]), .B2(n233), .ZN(n229) );
  AOI22_X1 U277 ( .A1(n234), .A2(A[3]), .B1(A_i[3]), .B2(n233), .ZN(n230) );
  AOI22_X1 U279 ( .A1(n234), .A2(A[2]), .B1(A_i[2]), .B2(n233), .ZN(n231) );
  AOI22_X1 U281 ( .A1(n234), .A2(A[1]), .B1(A_i[1]), .B2(n233), .ZN(n232) );
  AOI22_X1 U283 ( .A1(n234), .A2(A[0]), .B1(A_i[0]), .B2(n233), .ZN(n235) );
  DFF_X1 A_reg_Y_temp_reg_0_ ( .D(n297), .CK(CLK), .Q(A_i[0]) );
  DFF_X1 A_reg_Y_temp_reg_1_ ( .D(n296), .CK(CLK), .Q(A_i[1]) );
  DFF_X1 A_reg_Y_temp_reg_2_ ( .D(n295), .CK(CLK), .Q(A_i[2]) );
  DFF_X1 A_reg_Y_temp_reg_3_ ( .D(n294), .CK(CLK), .Q(A_i[3]) );
  DFF_X1 A_reg_Y_temp_reg_4_ ( .D(n293), .CK(CLK), .Q(A_i[4]) );
  DFF_X1 A_reg_Y_temp_reg_5_ ( .D(n292), .CK(CLK), .Q(A_i[5]) );
  DFF_X1 A_reg_Y_temp_reg_6_ ( .D(n291), .CK(CLK), .Q(A_i[6]) );
  DFF_X1 A_reg_Y_temp_reg_7_ ( .D(n290), .CK(CLK), .Q(A_i[7]), .QN(n584) );
  DFF_X1 B_reg_Y_temp_reg_0_ ( .D(n289), .CK(CLK), .Q(B_i[0]), .QN(n590) );
  DFF_X1 B_reg_Y_temp_reg_1_ ( .D(n288), .CK(CLK), .Q(B_i[1]), .QN(n596) );
  DFF_X1 B_reg_Y_temp_reg_2_ ( .D(n287), .CK(CLK), .Q(B_i[2]), .QN(n589) );
  NAND2_X1 U175 ( .A1(LD), .A2(n148), .ZN(n214) );
  NOR2_X2 U201 ( .A1(RST), .A2(LD), .ZN(n233) );
  INV_X1 U229 ( .A(n189), .ZN(n274) );
  INV_X1 U231 ( .A(n190), .ZN(n275) );
  INV_X1 U233 ( .A(n192), .ZN(n276) );
  INV_X1 U202 ( .A(n214), .ZN(n234) );
  INV_X1 U216 ( .A(n187), .ZN(n183) );
  INV_X1 U226 ( .A(n195), .ZN(n191) );
  INV_X1 U238 ( .A(n233), .ZN(n217) );
  INV_X1 U272 ( .A(n227), .ZN(n291) );
  INV_X1 U254 ( .A(n218), .ZN(n282) );
  INV_X1 U274 ( .A(n228), .ZN(n292) );
  INV_X1 U278 ( .A(n230), .ZN(n294) );
  INV_X1 U276 ( .A(n229), .ZN(n293) );
  INV_X1 U256 ( .A(n219), .ZN(n283) );
  INV_X1 U258 ( .A(n220), .ZN(n284) );
  INV_X1 U270 ( .A(n226), .ZN(n290) );
  INV_X1 U268 ( .A(n225), .ZN(n289) );
  INV_X1 U284 ( .A(n235), .ZN(n297) );
  INV_X1 U282 ( .A(n232), .ZN(n296) );
  INV_X1 U280 ( .A(n231), .ZN(n295) );
  INV_X1 U266 ( .A(n224), .ZN(n288) );
  INV_X1 U264 ( .A(n223), .ZN(n287) );
  INV_X1 U260 ( .A(n221), .ZN(n285) );
  INV_X1 U262 ( .A(n222), .ZN(n286) );
  CLKBUF_X1 U308 ( .A(n360), .Z(n430) );
  CLKBUF_X1 U309 ( .A(n433), .Z(n491) );
  CLKBUF_X1 U310 ( .A(n366), .Z(n367) );
  CLKBUF_X1 U311 ( .A(n567), .Z(n582) );
  INV_X1 U312 ( .A(n589), .ZN(n592) );
  INV_X1 U313 ( .A(n598), .ZN(n593) );
  INV_X1 U314 ( .A(n596), .ZN(n597) );
  INV_X1 U315 ( .A(n593), .ZN(n422) );
  NOR2_X1 U316 ( .A1(n592), .A2(n422), .ZN(n420) );
  INV_X1 U317 ( .A(B_i[1]), .ZN(n501) );
  NOR2_X1 U318 ( .A1(n598), .A2(B_i[1]), .ZN(n338) );
  INV_X1 U319 ( .A(n338), .ZN(n322) );
  OAI21_X1 U320 ( .B1(n420), .B2(n501), .A(n322), .ZN(n335) );
  AOI21_X1 U321 ( .B1(B_i[2]), .B2(B_i[1]), .A(n598), .ZN(n424) );
  INV_X1 U322 ( .A(n424), .ZN(n379) );
  INV_X1 U323 ( .A(n596), .ZN(n421) );
  OAI22_X1 U324 ( .A1(n589), .A2(n596), .B1(n421), .B2(n592), .ZN(n321) );
  INV_X1 U325 ( .A(n321), .ZN(n467) );
  NAND2_X1 U326 ( .A1(B_i[2]), .A2(n421), .ZN(n323) );
  OAI22_X1 U327 ( .A1(n593), .A2(n323), .B1(n592), .B2(n322), .ZN(n360) );
  AOI22_X1 U328 ( .A1(n467), .A2(A_i[1]), .B1(A_i[0]), .B2(n360), .ZN(n326) );
  INV_X1 U329 ( .A(n379), .ZN(n500) );
  INV_X1 U330 ( .A(n326), .ZN(n332) );
  AND2_X1 U331 ( .A1(n590), .A2(n421), .ZN(n393) );
  AOI22_X1 U332 ( .A1(A_i[3]), .A2(B_i[0]), .B1(n393), .B2(A_i[2]), .ZN(n331)
         );
  AND2_X1 U333 ( .A1(A_i[3]), .A2(B_i[0]), .ZN(n324) );
  AOI22_X1 U334 ( .A1(n597), .A2(n331), .B1(n324), .B2(n501), .ZN(n325) );
  AOI221_X1 U335 ( .B1(n379), .B2(n326), .C1(n500), .C2(n332), .A(n325), .ZN(
        n363) );
  NOR2_X1 U336 ( .A1(n593), .A2(B_i[4]), .ZN(n327) );
  AOI21_X1 U337 ( .B1(B_i[4]), .B2(n593), .A(n327), .ZN(n368) );
  NAND2_X1 U338 ( .A1(n368), .A2(A_i[0]), .ZN(n350) );
  AOI22_X1 U339 ( .A1(A_i[4]), .A2(B_i[0]), .B1(A_i[3]), .B2(n393), .ZN(n328)
         );
  INV_X1 U340 ( .A(n328), .ZN(n352) );
  XNOR2_X1 U341 ( .A(n350), .B(n352), .ZN(n329) );
  BUF_X1 U342 ( .A(n360), .Z(n466) );
  AOI22_X1 U343 ( .A1(n467), .A2(A_i[2]), .B1(A_i[1]), .B2(n466), .ZN(n354) );
  XOR2_X1 U344 ( .A(n329), .B(n354), .Z(n365) );
  XOR2_X1 U345 ( .A(n363), .B(n365), .Z(n347) );
  NAND2_X1 U346 ( .A1(n467), .A2(A_i[0]), .ZN(n560) );
  INV_X1 U347 ( .A(n560), .ZN(n559) );
  AOI22_X1 U348 ( .A1(A_i[1]), .A2(n393), .B1(B_i[0]), .B2(A_i[2]), .ZN(n336)
         );
  AND2_X1 U349 ( .A1(B_i[0]), .A2(A_i[2]), .ZN(n330) );
  AOI22_X1 U350 ( .A1(n597), .A2(n336), .B1(n330), .B2(n501), .ZN(n561) );
  AOI221_X1 U351 ( .B1(n379), .B2(n560), .C1(n500), .C2(n559), .A(n561), .ZN(
        n341) );
  XOR2_X1 U352 ( .A(n332), .B(n331), .Z(n333) );
  XNOR2_X1 U353 ( .A(n335), .B(n333), .ZN(n340) );
  NAND2_X1 U354 ( .A1(n341), .A2(n340), .ZN(n349) );
  XNOR2_X1 U355 ( .A(n347), .B(n349), .ZN(n334) );
  XNOR2_X1 U356 ( .A(n335), .B(n334), .ZN(n591) );
  AOI211_X1 U357 ( .C1(A_i[1]), .C2(B_i[0]), .A(A_i[0]), .B(n501), .ZN(n205)
         );
  INV_X1 U358 ( .A(n561), .ZN(n558) );
  AND2_X1 U359 ( .A1(n558), .A2(n205), .ZN(n209) );
  XOR2_X1 U360 ( .A(n336), .B(n559), .Z(n339) );
  NOR2_X1 U361 ( .A1(n339), .A2(n338), .ZN(n337) );
  AOI221_X1 U362 ( .B1(n339), .B2(n338), .C1(n420), .C2(n337), .A(n209), .ZN(
        n563) );
  XNOR2_X1 U363 ( .A(n341), .B(n340), .ZN(n562) );
  NOR2_X1 U364 ( .A1(n563), .A2(n562), .ZN(n188) );
  AND2_X1 U365 ( .A1(n591), .A2(n188), .ZN(n386) );
  INV_X1 U366 ( .A(n595), .ZN(n343) );
  INV_X1 U367 ( .A(n594), .ZN(n342) );
  NAND2_X1 U368 ( .A1(B_i[3]), .A2(n342), .ZN(n358) );
  NAND2_X1 U369 ( .A1(n343), .A2(n358), .ZN(n344) );
  AND2_X2 U370 ( .A1(n343), .A2(n358), .ZN(n504) );
  OAI22_X1 U371 ( .A1(n424), .A2(n504), .B1(n344), .B2(n379), .ZN(n345) );
  INV_X1 U372 ( .A(n345), .ZN(n433) );
  OAI22_X1 U373 ( .A1(n433), .A2(n501), .B1(n345), .B2(n597), .ZN(n366) );
  INV_X1 U374 ( .A(n366), .ZN(n359) );
  INV_X1 U375 ( .A(n359), .ZN(n463) );
  INV_X1 U376 ( .A(n463), .ZN(n465) );
  AOI22_X1 U377 ( .A1(n344), .A2(n349), .B1(n465), .B2(n347), .ZN(n346) );
  OAI21_X1 U378 ( .B1(n465), .B2(n347), .A(n346), .ZN(n348) );
  OAI21_X1 U379 ( .B1(n344), .B2(n349), .A(n348), .ZN(n520) );
  XOR2_X1 U380 ( .A(n344), .B(n350), .Z(n357) );
  NAND2_X1 U381 ( .A1(A_i[4]), .A2(B_i[0]), .ZN(n351) );
  AOI22_X1 U382 ( .A1(n597), .A2(n352), .B1(n351), .B2(n501), .ZN(n356) );
  AOI22_X1 U383 ( .A1(n357), .A2(n356), .B1(n500), .B2(n354), .ZN(n353) );
  OAI21_X1 U384 ( .B1(n500), .B2(n354), .A(n353), .ZN(n355) );
  OAI21_X1 U385 ( .B1(n357), .B2(n356), .A(n355), .ZN(n385) );
  OR2_X1 U386 ( .A1(B_i[3]), .A2(B_i[4]), .ZN(n417) );
  AOI22_X1 U387 ( .A1(B_i[5]), .A2(n417), .B1(n358), .B2(n595), .ZN(n370) );
  AOI22_X1 U388 ( .A1(n368), .A2(A_i[1]), .B1(A_i[0]), .B2(n370), .ZN(n376) );
  AOI22_X1 U389 ( .A1(A_i[5]), .A2(B_i[0]), .B1(A_i[4]), .B2(n393), .ZN(n375)
         );
  XNOR2_X1 U390 ( .A(n359), .B(n375), .ZN(n361) );
  AOI22_X1 U391 ( .A1(n467), .A2(A_i[3]), .B1(A_i[2]), .B2(n430), .ZN(n378) );
  XNOR2_X1 U392 ( .A(n361), .B(n378), .ZN(n362) );
  XNOR2_X1 U393 ( .A(n376), .B(n362), .ZN(n384) );
  XNOR2_X1 U394 ( .A(n385), .B(n384), .ZN(n387) );
  INV_X1 U395 ( .A(n365), .ZN(n364) );
  OAI221_X1 U396 ( .B1(n465), .B2(n365), .C1(n463), .C2(n364), .A(n363), .ZN(
        n388) );
  XOR2_X1 U397 ( .A(n387), .B(n388), .Z(n522) );
  NOR2_X1 U398 ( .A1(B_i[5]), .A2(B_i[6]), .ZN(n415) );
  AOI21_X1 U399 ( .B1(B_i[6]), .B2(B_i[5]), .A(n415), .ZN(n496) );
  NAND2_X1 U400 ( .A1(n496), .A2(A_i[0]), .ZN(n407) );
  AOI22_X1 U401 ( .A1(A_i[6]), .A2(B_i[0]), .B1(A_i[5]), .B2(n393), .ZN(n398)
         );
  XNOR2_X1 U402 ( .A(n367), .B(n398), .ZN(n373) );
  AOI22_X1 U403 ( .A1(A_i[4]), .A2(n467), .B1(A_i[3]), .B2(n466), .ZN(n396) );
  INV_X1 U404 ( .A(n368), .ZN(n369) );
  INV_X1 U405 ( .A(n369), .ZN(n462) );
  INV_X1 U406 ( .A(n370), .ZN(n371) );
  INV_X1 U407 ( .A(n371), .ZN(n461) );
  AOI22_X1 U408 ( .A1(n462), .A2(A_i[2]), .B1(A_i[1]), .B2(n461), .ZN(n400) );
  XNOR2_X1 U409 ( .A(n396), .B(n400), .ZN(n372) );
  XNOR2_X1 U410 ( .A(n373), .B(n372), .ZN(n408) );
  AND2_X1 U411 ( .A1(A_i[5]), .A2(B_i[0]), .ZN(n374) );
  AOI22_X1 U412 ( .A1(n597), .A2(n375), .B1(n374), .B2(n501), .ZN(n382) );
  XOR2_X1 U413 ( .A(n376), .B(n504), .Z(n381) );
  AOI22_X1 U414 ( .A1(n381), .A2(n382), .B1(n379), .B2(n378), .ZN(n377) );
  OAI21_X1 U415 ( .B1(n379), .B2(n378), .A(n377), .ZN(n380) );
  OAI21_X1 U416 ( .B1(n382), .B2(n381), .A(n380), .ZN(n409) );
  XNOR2_X1 U417 ( .A(n408), .B(n409), .ZN(n383) );
  XNOR2_X1 U418 ( .A(n407), .B(n383), .ZN(n390) );
  NOR2_X1 U419 ( .A1(n385), .A2(n384), .ZN(n391) );
  XNOR2_X1 U420 ( .A(n390), .B(n391), .ZN(n521) );
  OAI211_X1 U421 ( .C1(n386), .C2(n520), .A(n522), .B(n521), .ZN(n413) );
  NOR2_X1 U422 ( .A1(n387), .A2(n388), .ZN(n477) );
  NAND2_X1 U423 ( .A1(n477), .A2(n521), .ZN(n524) );
  AOI21_X1 U424 ( .B1(B_i[5]), .B2(B_i[6]), .A(n583), .ZN(n428) );
  INV_X1 U425 ( .A(n428), .ZN(n498) );
  NAND2_X1 U426 ( .A1(n390), .A2(n498), .ZN(n389) );
  OAI21_X1 U427 ( .B1(n391), .B2(n390), .A(n389), .ZN(n526) );
  AND3_X1 U428 ( .A1(n413), .A2(n524), .A3(n526), .ZN(n414) );
  AOI22_X1 U429 ( .A1(n462), .A2(A_i[3]), .B1(A_i[2]), .B2(n461), .ZN(n457) );
  INV_X1 U430 ( .A(n457), .ZN(n392) );
  AOI22_X1 U431 ( .A1(n465), .A2(n457), .B1(n392), .B2(n463), .ZN(n395) );
  AOI22_X1 U432 ( .A1(A_i[7]), .A2(B_i[0]), .B1(A_i[6]), .B2(n393), .ZN(n455)
         );
  AOI22_X1 U433 ( .A1(A_i[5]), .A2(n467), .B1(A_i[4]), .B2(n466), .ZN(n453) );
  XNOR2_X1 U434 ( .A(n455), .B(n453), .ZN(n394) );
  XNOR2_X1 U435 ( .A(n395), .B(n394), .ZN(n451) );
  XOR2_X1 U436 ( .A(n500), .B(n396), .Z(n403) );
  AND2_X1 U437 ( .A1(A_i[6]), .A2(B_i[0]), .ZN(n397) );
  AOI22_X1 U438 ( .A1(n421), .A2(n398), .B1(n397), .B2(n501), .ZN(n402) );
  OAI22_X1 U439 ( .A1(n402), .A2(n403), .B1(n504), .B2(n400), .ZN(n399) );
  AOI21_X1 U440 ( .B1(n504), .B2(n400), .A(n399), .ZN(n401) );
  AOI21_X1 U441 ( .B1(n403), .B2(n402), .A(n401), .ZN(n450) );
  INV_X1 U442 ( .A(n415), .ZN(n405) );
  NAND2_X1 U443 ( .A1(B_i[5]), .A2(B_i[6]), .ZN(n404) );
  AOI22_X1 U444 ( .A1(B_i[7]), .A2(n405), .B1(n404), .B2(n583), .ZN(n495) );
  AOI22_X1 U445 ( .A1(n496), .A2(A_i[1]), .B1(A_i[0]), .B2(n495), .ZN(n406) );
  XOR2_X1 U446 ( .A(n498), .B(n406), .Z(n449) );
  XOR2_X1 U447 ( .A(n428), .B(n407), .Z(n412) );
  NAND2_X1 U448 ( .A1(n408), .A2(n409), .ZN(n411) );
  NOR2_X1 U449 ( .A1(n408), .A2(n409), .ZN(n410) );
  AOI21_X1 U450 ( .B1(n412), .B2(n411), .A(n410), .ZN(n474) );
  XNOR2_X1 U451 ( .A(n473), .B(n474), .ZN(n525) );
  OAI22_X1 U452 ( .A1(n414), .A2(n525), .B1(n526), .B2(n413), .ZN(n567) );
  OAI21_X1 U453 ( .B1(n415), .B2(B_i[7]), .A(A_i[7]), .ZN(n416) );
  OAI21_X1 U454 ( .B1(A_i[7]), .B2(n428), .A(n416), .ZN(n551) );
  NOR2_X1 U455 ( .A1(B_i[5]), .A2(n327), .ZN(n438) );
  AOI22_X1 U456 ( .A1(A_i[6]), .A2(n496), .B1(A_i[5]), .B2(n495), .ZN(n440) );
  XOR2_X1 U457 ( .A(n440), .B(n428), .Z(n418) );
  AOI221_X1 U458 ( .B1(n438), .B2(A_i[7]), .C1(n504), .C2(n584), .A(n418), 
        .ZN(n482) );
  AOI22_X1 U459 ( .A1(A_i[7]), .A2(n496), .B1(A_i[6]), .B2(n495), .ZN(n419) );
  XOR2_X1 U460 ( .A(n498), .B(n419), .Z(n481) );
  NOR2_X1 U461 ( .A1(n482), .A2(n481), .ZN(n480) );
  AOI22_X1 U462 ( .A1(A_i[7]), .A2(n462), .B1(A_i[6]), .B2(n461), .ZN(n445) );
  AOI22_X1 U463 ( .A1(n504), .A2(n428), .B1(n498), .B2(n344), .ZN(n442) );
  XOR2_X1 U464 ( .A(n445), .B(n442), .Z(n427) );
  AOI22_X1 U465 ( .A1(n462), .A2(A_i[6]), .B1(A_i[5]), .B2(n461), .ZN(n435) );
  AOI221_X1 U466 ( .B1(n592), .B2(n501), .C1(n422), .C2(n421), .A(n420), .ZN(
        n423) );
  NOR2_X1 U467 ( .A1(n423), .A2(n584), .ZN(n434) );
  INV_X1 U468 ( .A(n424), .ZN(n432) );
  OAI22_X1 U469 ( .A1(n344), .A2(n435), .B1(n432), .B2(n434), .ZN(n425) );
  AOI221_X1 U470 ( .B1(n344), .B2(n435), .C1(n434), .C2(n432), .A(n425), .ZN(
        n448) );
  AOI22_X1 U471 ( .A1(A_i[5]), .A2(n496), .B1(A_i[4]), .B2(n495), .ZN(n443) );
  XNOR2_X1 U472 ( .A(n448), .B(n443), .ZN(n426) );
  XNOR2_X1 U473 ( .A(n427), .B(n426), .ZN(n534) );
  AOI22_X1 U474 ( .A1(n496), .A2(A_i[4]), .B1(A_i[3]), .B2(n495), .ZN(n429) );
  XOR2_X1 U475 ( .A(n429), .B(n428), .Z(n515) );
  AOI22_X1 U476 ( .A1(A_i[7]), .A2(n467), .B1(A_i[6]), .B2(n430), .ZN(n494) );
  AOI22_X1 U477 ( .A1(n462), .A2(A_i[5]), .B1(A_i[4]), .B2(n461), .ZN(n492) );
  AOI22_X1 U478 ( .A1(n432), .A2(n494), .B1(n344), .B2(n492), .ZN(n431) );
  OAI221_X1 U479 ( .B1(n432), .B2(n494), .C1(n344), .C2(n492), .A(n431), .ZN(
        n518) );
  XOR2_X1 U480 ( .A(n435), .B(n434), .Z(n514) );
  AOI22_X1 U481 ( .A1(n515), .A2(n518), .B1(n491), .B2(n514), .ZN(n436) );
  OAI21_X1 U482 ( .B1(n491), .B2(n514), .A(n436), .ZN(n437) );
  OAI21_X1 U483 ( .B1(n515), .B2(n518), .A(n437), .ZN(n535) );
  NOR2_X1 U484 ( .A1(n534), .A2(n535), .ZN(n533) );
  OAI21_X1 U485 ( .B1(n504), .B2(n438), .A(A_i[7]), .ZN(n439) );
  XNOR2_X1 U486 ( .A(n440), .B(n439), .ZN(n441) );
  XNOR2_X1 U487 ( .A(n442), .B(n441), .ZN(n476) );
  XOR2_X1 U488 ( .A(n443), .B(n498), .Z(n447) );
  AOI22_X1 U489 ( .A1(n448), .A2(n447), .B1(n504), .B2(n445), .ZN(n444) );
  OAI21_X1 U490 ( .B1(n504), .B2(n445), .A(n444), .ZN(n446) );
  OAI21_X1 U491 ( .B1(n448), .B2(n447), .A(n446), .ZN(n475) );
  NAND2_X1 U492 ( .A1(n480), .A2(n484), .ZN(n550) );
  NAND2_X1 U493 ( .A1(n551), .A2(n550), .ZN(DP_OP_72J13_124_2857_n18) );
  FA_X1 U494 ( .A(n451), .B(n450), .CI(n449), .CO(n486), .S(n473) );
  AOI22_X1 U495 ( .A1(n496), .A2(A_i[2]), .B1(A_i[1]), .B2(n495), .ZN(n452) );
  XOR2_X1 U496 ( .A(n498), .B(n452), .Z(n489) );
  XOR2_X1 U497 ( .A(n500), .B(n453), .Z(n460) );
  NOR2_X1 U498 ( .A1(n584), .A2(n590), .ZN(n454) );
  AOI22_X1 U499 ( .A1(n597), .A2(n455), .B1(n454), .B2(n501), .ZN(n459) );
  OAI22_X1 U500 ( .A1(n459), .A2(n460), .B1(n457), .B2(n504), .ZN(n456) );
  AOI21_X1 U501 ( .B1(n457), .B2(n504), .A(n456), .ZN(n458) );
  AOI21_X1 U502 ( .B1(n460), .B2(n459), .A(n458), .ZN(n488) );
  AOI22_X1 U503 ( .A1(n462), .A2(A_i[4]), .B1(A_i[3]), .B2(n461), .ZN(n505) );
  INV_X1 U504 ( .A(n505), .ZN(n464) );
  AOI22_X1 U505 ( .A1(n465), .A2(n505), .B1(n464), .B2(n463), .ZN(n470) );
  AOI21_X1 U506 ( .B1(n501), .B2(n590), .A(n584), .ZN(n468) );
  AOI22_X1 U507 ( .A1(A_i[6]), .A2(n467), .B1(A_i[5]), .B2(n466), .ZN(n499) );
  XNOR2_X1 U508 ( .A(n468), .B(n499), .ZN(n469) );
  XNOR2_X1 U509 ( .A(n470), .B(n469), .ZN(n487) );
  XNOR2_X1 U510 ( .A(n486), .B(n485), .ZN(n472) );
  AOI21_X1 U511 ( .B1(n473), .B2(n474), .A(n472), .ZN(n471) );
  INV_X1 U512 ( .A(n471), .ZN(n566) );
  NAND3_X1 U513 ( .A1(n474), .A2(n473), .A3(n472), .ZN(n564) );
  NAND2_X1 U514 ( .A1(n566), .A2(n564), .ZN(n548) );
  INV_X1 U515 ( .A(n548), .ZN(DP_OP_71J13_123_5612_n4) );
  XNOR2_X1 U516 ( .A(n522), .B(n520), .ZN(n531) );
  INV_X1 U517 ( .A(n531), .ZN(DP_OP_70J13_122_5612_n16) );
  FA_X1 U518 ( .A(n533), .B(n476), .CI(n475), .CO(n484), .S(n555) );
  INV_X1 U519 ( .A(n555), .ZN(DP_OP_72J13_124_2857_n4) );
  AOI21_X1 U520 ( .B1(n520), .B2(n522), .A(n477), .ZN(n478) );
  XNOR2_X1 U521 ( .A(n478), .B(n521), .ZN(DP_OP_70J13_122_5612_n17) );
  INV_X1 U522 ( .A(n591), .ZN(n532) );
  NOR2_X1 U523 ( .A1(n531), .A2(n532), .ZN(n530) );
  NAND3_X1 U524 ( .A1(DP_OP_70J13_122_5612_n16), .A2(DP_OP_70J13_122_5612_n17), 
        .A3(n591), .ZN(n529) );
  OAI21_X1 U525 ( .B1(n530), .B2(DP_OP_70J13_122_5612_n17), .A(n529), .ZN(n479) );
  INV_X1 U526 ( .A(n479), .ZN(mul_final_add_sum_gen_carry_select_int_1_S1[2])
         );
  AOI21_X1 U527 ( .B1(n482), .B2(n481), .A(n480), .ZN(n483) );
  XNOR2_X1 U528 ( .A(n484), .B(n483), .ZN(n554) );
  INV_X1 U529 ( .A(n554), .ZN(DP_OP_72J13_124_2857_n16) );
  NOR2_X1 U530 ( .A1(n486), .A2(n485), .ZN(n570) );
  FA_X1 U531 ( .A(n489), .B(n488), .CI(n487), .CO(n510), .S(n485) );
  INV_X1 U532 ( .A(n491), .ZN(n517) );
  INV_X1 U533 ( .A(n492), .ZN(n490) );
  AOI22_X1 U534 ( .A1(n492), .A2(n517), .B1(n491), .B2(n490), .ZN(n493) );
  XNOR2_X1 U535 ( .A(n494), .B(n493), .ZN(n513) );
  AOI22_X1 U536 ( .A1(n496), .A2(A_i[3]), .B1(A_i[2]), .B2(n495), .ZN(n497) );
  XOR2_X1 U537 ( .A(n498), .B(n497), .Z(n512) );
  XOR2_X1 U538 ( .A(n500), .B(n499), .Z(n508) );
  OAI33_X1 U540 ( .A1(1'b0), .A2(A_i[7]), .A3(n501), .B1(n597), .B2(n584), 
        .B3(n590), .ZN(n507) );
  OAI22_X1 U541 ( .A1(n507), .A2(n508), .B1(n505), .B2(n504), .ZN(n503) );
  AOI21_X1 U542 ( .B1(n505), .B2(n504), .A(n503), .ZN(n506) );
  AOI21_X1 U543 ( .B1(n508), .B2(n507), .A(n506), .ZN(n511) );
  NOR2_X1 U544 ( .A1(n509), .A2(n510), .ZN(n574) );
  AOI21_X1 U545 ( .B1(n510), .B2(n509), .A(n574), .ZN(n568) );
  INV_X1 U546 ( .A(n549), .ZN(DP_OP_71J13_123_5612_n17) );
  FA_X1 U547 ( .A(n513), .B(n512), .CI(n511), .CO(n540), .S(n509) );
  XOR2_X1 U548 ( .A(n515), .B(n514), .Z(n516) );
  XOR2_X1 U549 ( .A(n517), .B(n516), .Z(n519) );
  XNOR2_X1 U550 ( .A(n519), .B(n518), .ZN(n539) );
  XNOR2_X1 U551 ( .A(n540), .B(n539), .ZN(n572) );
  FA_X1 U552 ( .A(n570), .B(n564), .CI(n568), .CO(n541), .S(n549) );
  INV_X1 U553 ( .A(n546), .ZN(DP_OP_71J13_123_5612_n18) );
  NAND3_X1 U554 ( .A1(n522), .A2(n521), .A3(n520), .ZN(n523) );
  NAND2_X1 U555 ( .A1(n524), .A2(n523), .ZN(n528) );
  XNOR2_X1 U556 ( .A(n526), .B(n525), .ZN(n527) );
  XNOR2_X1 U557 ( .A(n528), .B(n527), .ZN(DP_OP_70J13_122_5612_n18) );
  XNOR2_X1 U558 ( .A(n529), .B(DP_OP_70J13_122_5612_n18), .ZN(
        mul_final_add_sum_gen_carry_select_int_1_S1[3]) );
  AOI21_X1 U559 ( .B1(n532), .B2(n531), .A(n530), .ZN(
        mul_final_add_sum_gen_carry_select_int_1_S1[1]) );
  AOI21_X1 U560 ( .B1(n535), .B2(n534), .A(n533), .ZN(n537) );
  NAND2_X1 U561 ( .A1(n540), .A2(n539), .ZN(n536) );
  NOR2_X1 U562 ( .A1(n537), .A2(n536), .ZN(n579) );
  INV_X1 U563 ( .A(n537), .ZN(n538) );
  AOI21_X1 U564 ( .B1(n540), .B2(n539), .A(n538), .ZN(n578) );
  NOR2_X1 U565 ( .A1(n579), .A2(n578), .ZN(n543) );
  FA_X1 U566 ( .A(n574), .B(n572), .CI(n541), .CO(n542), .S(n546) );
  XNOR2_X1 U567 ( .A(n543), .B(n542), .ZN(DP_OP_71J13_123_5612_n19) );
  NOR3_X1 U568 ( .A1(n548), .A2(n549), .A3(n546), .ZN(n544) );
  XOR2_X1 U569 ( .A(n544), .B(DP_OP_71J13_123_5612_n19), .Z(
        mul_final_add_sum_gen_carry_select_int_2_S1[3]) );
  NOR2_X1 U570 ( .A1(n548), .A2(n549), .ZN(n547) );
  INV_X1 U571 ( .A(n547), .ZN(n545) );
  AOI21_X1 U572 ( .B1(n546), .B2(n545), .A(n544), .ZN(
        mul_final_add_sum_gen_carry_select_int_2_S1[2]) );
  AOI21_X1 U573 ( .B1(n549), .B2(n548), .A(n547), .ZN(
        mul_final_add_sum_gen_carry_select_int_2_S1[1]) );
  XOR2_X1 U574 ( .A(n551), .B(n550), .Z(DP_OP_72J13_124_2857_n17) );
  NOR2_X1 U575 ( .A1(n555), .A2(n554), .ZN(n553) );
  INV_X1 U576 ( .A(DP_OP_72J13_124_2857_n18), .ZN(n552) );
  AOI21_X1 U577 ( .B1(n553), .B2(DP_OP_72J13_124_2857_n17), .A(n552), .ZN(
        mul_final_add_sum_gen_carry_select_int_3_S1[3]) );
  XOR2_X1 U578 ( .A(n553), .B(DP_OP_72J13_124_2857_n17), .Z(
        mul_final_add_sum_gen_carry_select_int_3_S1[2]) );
  AOI21_X1 U579 ( .B1(n555), .B2(n554), .A(n553), .ZN(
        mul_final_add_sum_gen_carry_select_int_3_S1[1]) );
  NAND2_X1 U580 ( .A1(A_i[1]), .A2(B_i[0]), .ZN(n557) );
  NAND2_X1 U581 ( .A1(n597), .A2(A_i[0]), .ZN(n556) );
  XNOR2_X1 U582 ( .A(n557), .B(n556), .ZN(n213) );
  AOI22_X1 U583 ( .A1(n561), .A2(n560), .B1(n559), .B2(n558), .ZN(n206) );
  XNOR2_X1 U584 ( .A(n563), .B(n562), .ZN(n201) );
  NAND2_X1 U585 ( .A1(n574), .A2(n572), .ZN(n577) );
  INV_X1 U586 ( .A(n564), .ZN(n565) );
  AOI21_X1 U587 ( .B1(n567), .B2(n566), .A(n565), .ZN(n569) );
  OAI222_X1 U588 ( .A1(n570), .A2(n569), .B1(n570), .B2(n568), .C1(n569), .C2(
        n568), .ZN(n571) );
  INV_X1 U589 ( .A(n571), .ZN(n573) );
  NAND2_X1 U590 ( .A1(n572), .A2(n573), .ZN(n576) );
  NAND2_X1 U591 ( .A1(n574), .A2(n573), .ZN(n575) );
  AND3_X1 U592 ( .A1(n577), .A2(n576), .A3(n575), .ZN(n581) );
  INV_X1 U593 ( .A(n578), .ZN(n580) );
  AOI21_X1 U594 ( .B1(n581), .B2(n580), .A(n579), .ZN(n172) );
endmodule

