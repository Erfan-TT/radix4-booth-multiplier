/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : W-2024.09-SP2
// Date      : Thu Aug 27 03:30:06 2026
/////////////////////////////////////////////////////////////


module boothmul_registered ( CLK, LD, RST, A, B, P );
  input [7:0] A;
  input [7:0] B;
  output [15:0] P;
  input CLK, LD, RST;
  wire   mul_final_add_sum_gen_carry_select_int_2_S1_1_, n148, n173, n174,
         n175, n176, n177, n178, n179, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n201, n205, n206, n208,
         n209, n213, n214, n215, n217, n218, n219, n220, n221, n222, n223,
         n224, n225, n226, n227, n228, n229, n230, n231, n232, n233, n234,
         n235, n269, n270, n271, n272, n273, n274, n275, n277, n278, n279,
         n280, n281, n283, n284, n285, n286, n287, n288, n290, n291, n292,
         n293, n294, n295, n296, n297, DP_OP_72J12_124_2857_n18,
         DP_OP_72J12_124_2857_n17, DP_OP_72J12_124_2857_n16,
         DP_OP_72J12_124_2857_n4, DP_OP_71J12_123_5612_n17,
         DP_OP_71J12_123_5612_n4, DP_OP_70J12_122_5612_n18,
         DP_OP_70J12_122_5612_n17, DP_OP_70J12_122_5612_n16, n321, n322, n323,
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
         n500, n501, n502, n503, n504, n505, n506, n507, n508, n509, n510,
         n511, n512, n513, n514, n515, n516, n517, n518, n519, n520, n521,
         n522, n523, n524, n525, n526, n527, n528, n529, n530, n531, n532,
         n533, n534, n535, n536, n537, n538, n539, n540, n541, n542, n543,
         n544, n545, n546, n547, n548, n549, n550, n551, n552, n553, n554,
         n555, n556, n557, n558, n559, n560, n561, n562, n563, n564, n565,
         n566, n567, n568, n569, n570, n571, n572, n573, n574, n575, n576,
         n577, n578, n579, n580, n581, n582, n583, n584, n585, n586, n587,
         n588, n589, n590, n591, n592, n593, n594, n595, n596, n597, n598,
         n599, n600, n601, n602, n603, n604, n605, n606, n607, n608, n609,
         n610, n611, n612, n613, n614, n615, n616, n617, n618, n619, n620,
         n621, n622, n623, n624, n625, n626, n627, n628, n629, n630, n631,
         n632, n633, n634, n635, n636, n637, n638, n639, n640, n641, n642,
         n643, n644, n645, n646, n657, n658, n659, n660, n661, n663, n664,
         n665, n666, n667, n668, n669, n670, n671, n672, n673, n674, n675,
         n676, n677, n678, n679, n680, n681, n682;
  wire   [7:0] A_i;
  wire   [7:0] B_i;
  wire   [3:1] mul_final_add_sum_gen_carry_select_int_1_S1;
  wire   [3:1] mul_final_add_sum_gen_carry_select_int_3_S1;

  DFF_X1 B_reg_Y_temp_reg_3_ ( .D(n286), .CK(CLK), .Q(B_i[3]), .QN(n682) );
  DFF_X1 B_reg_Y_temp_reg_4_ ( .D(n285), .CK(CLK), .Q(B_i[4]), .QN(n368) );
  DFF_X1 B_reg_Y_temp_reg_5_ ( .D(n284), .CK(CLK), .Q(B_i[5]), .QN(n669) );
  DFF_X1 B_reg_Y_temp_reg_6_ ( .D(n283), .CK(CLK), .Q(B_i[6]) );
  DFF_X1 p_reg_Y_temp_reg_0_ ( .D(n281), .CK(CLK), .Q(P[0]), .QN(n675) );
  DFF_X1 p_reg_Y_temp_reg_1_ ( .D(n280), .CK(CLK), .Q(P[1]), .QN(n672) );
  DFF_X1 p_reg_Y_temp_reg_2_ ( .D(n279), .CK(CLK), .Q(P[2]), .QN(n674) );
  DFF_X1 p_reg_Y_temp_reg_3_ ( .D(n278), .CK(CLK), .Q(P[3]), .QN(n673) );
  DFF_X1 p_reg_Y_temp_reg_4_ ( .D(n277), .CK(CLK), .Q(P[4]) );
  DFF_X1 p_reg_Y_temp_reg_6_ ( .D(n275), .CK(CLK), .Q(P[6]) );
  DFF_X1 p_reg_Y_temp_reg_7_ ( .D(n274), .CK(CLK), .Q(P[7]) );
  DFF_X1 p_reg_Y_temp_reg_9_ ( .D(n272), .CK(CLK), .Q(P[9]) );
  INV_X1 U174 ( .A(RST), .ZN(n148) );
  AOI222_X1 U204 ( .A1(n176), .A2(
        mul_final_add_sum_gen_carry_select_int_3_S1[3]), .B1(n233), .B2(P[15]), 
        .C1(n177), .C2(DP_OP_72J12_124_2857_n18), .ZN(n173) );
  AOI222_X1 U207 ( .A1(n176), .A2(
        mul_final_add_sum_gen_carry_select_int_3_S1[2]), .B1(n233), .B2(P[14]), 
        .C1(n177), .C2(DP_OP_72J12_124_2857_n17), .ZN(n174) );
  AOI222_X1 U209 ( .A1(n176), .A2(
        mul_final_add_sum_gen_carry_select_int_3_S1[1]), .B1(n233), .B2(P[13]), 
        .C1(n177), .C2(DP_OP_72J12_124_2857_n16), .ZN(n175) );
  INV_X1 U211 ( .A(n176), .ZN(n179) );
  AOI22_X1 U212 ( .A1(n233), .A2(P[12]), .B1(n177), .B2(
        DP_OP_72J12_124_2857_n4), .ZN(n178) );
  OAI21_X1 U213 ( .B1(DP_OP_72J12_124_2857_n4), .B2(n179), .A(n178), .ZN(n269)
         );
  NOR2_X1 U214 ( .A1(n214), .A2(n328), .ZN(n185) );
  NAND2_X1 U215 ( .A1(n328), .A2(n234), .ZN(n187) );
  AOI222_X1 U221 ( .A1(n233), .A2(P[9]), .B1(n185), .B2(
        DP_OP_71J12_123_5612_n17), .C1(n183), .C2(
        mul_final_add_sum_gen_carry_select_int_2_S1_1_), .ZN(n184) );
  INV_X1 U222 ( .A(n184), .ZN(n272) );
  AOI22_X1 U223 ( .A1(n233), .A2(P[8]), .B1(n185), .B2(DP_OP_71J12_123_5612_n4), .ZN(n186) );
  OAI21_X1 U224 ( .B1(DP_OP_71J12_123_5612_n4), .B2(n187), .A(n186), .ZN(n273)
         );
  NAND2_X1 U225 ( .A1(n234), .A2(n188), .ZN(n195) );
  NOR2_X1 U227 ( .A1(n188), .A2(n214), .ZN(n193) );
  AOI222_X1 U228 ( .A1(n233), .A2(P[7]), .B1(n191), .B2(
        mul_final_add_sum_gen_carry_select_int_1_S1[3]), .C1(n193), .C2(
        DP_OP_70J12_122_5612_n18), .ZN(n189) );
  INV_X1 U229 ( .A(n189), .ZN(n274) );
  AOI222_X1 U230 ( .A1(n233), .A2(P[6]), .B1(n191), .B2(
        mul_final_add_sum_gen_carry_select_int_1_S1[2]), .C1(n193), .C2(
        DP_OP_70J12_122_5612_n17), .ZN(n190) );
  INV_X1 U231 ( .A(n190), .ZN(n275) );
  AOI222_X1 U232 ( .A1(n233), .A2(P[5]), .B1(n191), .B2(
        mul_final_add_sum_gen_carry_select_int_1_S1[1]), .C1(n193), .C2(
        DP_OP_70J12_122_5612_n16), .ZN(n192) );
  AOI22_X1 U234 ( .A1(P[4]), .A2(n233), .B1(n193), .B2(n678), .ZN(n194) );
  OAI21_X1 U235 ( .B1(n678), .B2(n195), .A(n194), .ZN(n277) );
  OAI22_X1 U240 ( .A1(n214), .A2(n201), .B1(n217), .B2(n673), .ZN(n278) );
  OAI21_X1 U243 ( .B1(n206), .B2(n205), .A(n234), .ZN(n208) );
  OAI22_X1 U245 ( .A1(n209), .A2(n208), .B1(n674), .B2(n217), .ZN(n279) );
  OAI22_X1 U249 ( .A1(n214), .A2(n213), .B1(n217), .B2(n672), .ZN(n280) );
  NAND3_X1 U251 ( .A1(n234), .A2(A_i[0]), .A3(B_i[0]), .ZN(n215) );
  OAI21_X1 U252 ( .B1(n217), .B2(n675), .A(n215), .ZN(n281) );
  AOI22_X1 U253 ( .A1(n234), .A2(B[7]), .B1(B_i[7]), .B2(n233), .ZN(n218) );
  AOI22_X1 U255 ( .A1(n234), .A2(B[6]), .B1(B_i[6]), .B2(n233), .ZN(n219) );
  AOI22_X1 U257 ( .A1(n234), .A2(B[5]), .B1(n354), .B2(n233), .ZN(n220) );
  AOI22_X1 U259 ( .A1(n234), .A2(B[4]), .B1(n661), .B2(n233), .ZN(n221) );
  AOI22_X1 U261 ( .A1(n234), .A2(B[3]), .B1(n233), .B2(n338), .ZN(n222) );
  AOI22_X1 U263 ( .A1(n234), .A2(B[2]), .B1(n680), .B2(n233), .ZN(n223) );
  AOI22_X1 U265 ( .A1(n234), .A2(B[1]), .B1(n622), .B2(n233), .ZN(n224) );
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
  DFF_X1 A_reg_Y_temp_reg_7_ ( .D(n290), .CK(CLK), .Q(A_i[7]), .QN(n671) );
  DFF_X1 B_reg_Y_temp_reg_1_ ( .D(n288), .CK(CLK), .Q(B_i[1]), .QN(n681) );
  DFF_X1 B_reg_Y_temp_reg_2_ ( .D(n287), .CK(CLK), .Q(B_i[2]), .QN(n679) );
  NAND2_X1 U175 ( .A1(LD), .A2(n148), .ZN(n214) );
  NOR2_X2 U201 ( .A1(RST), .A2(LD), .ZN(n233) );
  INV_X1 U216 ( .A(n187), .ZN(n183) );
  INV_X1 U226 ( .A(n195), .ZN(n191) );
  INV_X1 U238 ( .A(n233), .ZN(n217) );
  INV_X1 U284 ( .A(n235), .ZN(n297) );
  INV_X1 U262 ( .A(n222), .ZN(n286) );
  INV_X1 U274 ( .A(n228), .ZN(n292) );
  INV_X1 U266 ( .A(n224), .ZN(n288) );
  INV_X1 U264 ( .A(n223), .ZN(n287) );
  INV_X1 U278 ( .A(n230), .ZN(n294) );
  INV_X1 U254 ( .A(n218) );
  INV_X1 U256 ( .A(n219), .ZN(n283) );
  INV_X1 U272 ( .A(n227), .ZN(n291) );
  INV_X1 U282 ( .A(n232), .ZN(n296) );
  INV_X1 U280 ( .A(n231), .ZN(n295) );
  INV_X1 U260 ( .A(n221), .ZN(n285) );
  INV_X1 U276 ( .A(n229), .ZN(n293) );
  INV_X1 U270 ( .A(n226), .ZN(n290) );
  INV_X1 U258 ( .A(n220), .ZN(n284) );
  INV_X1 U268 ( .A(n225) );
  DFFS_X2 p_reg_Y_temp_reg_5_ ( .D(n192), .CK(CLK), .SN(1'b1), .QN(P[5]) );
  SDFF_X1 B_reg_Y_temp_reg_7_ ( .D(n218), .SI(1'b0), .SE(1'b0), .CK(CLK), .Q(
        n670), .QN(B_i[7]) );
  DFFS_X2 p_reg_Y_temp_reg_8_ ( .D(n273), .CK(CLK), .SN(1'b1), .Q(P[8]) );
  SDFF_X2 B_reg_Y_temp_reg_0_ ( .D(n225), .SI(1'b0), .SE(1'b0), .CK(CLK), .Q(
        n677), .QN(B_i[0]) );
  DFFS_X2 p_reg_Y_temp_reg_12_ ( .D(n269), .CK(CLK), .SN(1'b1), .Q(P[12]) );
  DFFS_X2 p_reg_Y_temp_reg_15_ ( .D(n173), .CK(CLK), .SN(1'b1), .QN(P[15]) );
  DFFS_X2 p_reg_Y_temp_reg_14_ ( .D(n174), .CK(CLK), .SN(1'b1), .QN(P[14]) );
  DFFS_X2 p_reg_Y_temp_reg_13_ ( .D(n175), .CK(CLK), .SN(1'b1), .QN(P[13]) );
  DFFS_X1 p_reg_Y_temp_reg_11_ ( .D(n270), .CK(CLK), .SN(1'b1), .Q(P[11]), 
        .QN(n665) );
  DFFS_X1 p_reg_Y_temp_reg_10_ ( .D(n271), .CK(CLK), .SN(1'b1), .Q(P[10]), 
        .QN(n659) );
  BUF_X1 U308 ( .A(n363), .Z(n321) );
  OAI211_X1 U309 ( .C1(n187), .C2(n324), .A(n323), .B(n322), .ZN(n270) );
  OR2_X2 U310 ( .A1(n665), .A2(n666), .ZN(n322) );
  OR2_X2 U311 ( .A1(n664), .A2(n663), .ZN(n323) );
  XNOR2_X1 U312 ( .A(n495), .B(n494), .ZN(n324) );
  BUF_X1 U313 ( .A(n503), .Z(n325) );
  NAND2_X1 U314 ( .A1(B_i[3]), .A2(B_i[4]), .ZN(n326) );
  XNOR2_X1 U315 ( .A(n448), .B(n423), .ZN(n440) );
  INV_X1 U316 ( .A(DP_OP_71J12_123_5612_n17), .ZN(n327) );
  BUF_X1 U317 ( .A(n355), .Z(n328) );
  BUF_X1 U318 ( .A(n561), .Z(n329) );
  AOI21_X1 U319 ( .B1(n633), .B2(n355), .A(n632), .ZN(n330) );
  XOR2_X1 U320 ( .A(n641), .B(n642), .Z(n331) );
  XOR2_X1 U321 ( .A(n491), .B(n331), .Z(n471) );
  NAND2_X1 U322 ( .A1(n491), .A2(n641), .ZN(n332) );
  NAND2_X1 U323 ( .A1(n491), .A2(n642), .ZN(n333) );
  NAND2_X1 U324 ( .A1(n641), .A2(n642), .ZN(n334) );
  NAND3_X1 U325 ( .A1(n332), .A2(n333), .A3(n334), .ZN(n492) );
  AND2_X1 U326 ( .A1(n466), .A2(n467), .ZN(n335) );
  NOR2_X1 U327 ( .A1(n335), .A2(n642), .ZN(n635) );
  CLKBUF_X1 U328 ( .A(n423), .Z(n505) );
  BUF_X1 U329 ( .A(n500), .Z(n336) );
  AOI221_X1 U330 ( .B1(n680), .B2(n408), .C1(n420), .C2(n622), .A(n514), .ZN(
        n421) );
  BUF_X1 U331 ( .A(n356), .Z(n543) );
  CLKBUF_X1 U332 ( .A(n519), .Z(n525) );
  AOI21_X1 U333 ( .B1(n460), .B2(n459), .A(n458), .ZN(n564) );
  NOR2_X1 U334 ( .A1(n370), .A2(n369), .ZN(n583) );
  CLKBUF_X1 U335 ( .A(n534), .Z(n365) );
  CLKBUF_X1 U336 ( .A(n430), .Z(n431) );
  BUF_X1 U337 ( .A(n539), .Z(n526) );
  INV_X1 U338 ( .A(n214), .ZN(n234) );
  BUF_X1 U339 ( .A(n511), .Z(n337) );
  BUF_X1 U340 ( .A(n667), .Z(n338) );
  CLKBUF_X1 U341 ( .A(n425), .Z(n339) );
  NOR2_X1 U342 ( .A1(n487), .A2(n486), .ZN(n645) );
  INV_X1 U343 ( .A(n488), .ZN(n487) );
  NAND2_X1 U344 ( .A1(n387), .A2(n389), .ZN(n386) );
  AND2_X1 U345 ( .A1(n638), .A2(n639), .ZN(n387) );
  INV_X1 U346 ( .A(n645), .ZN(n388) );
  INV_X1 U347 ( .A(n446), .ZN(n379) );
  INV_X1 U348 ( .A(n401), .ZN(n382) );
  NAND2_X1 U349 ( .A1(n484), .A2(n485), .ZN(n372) );
  INV_X1 U350 ( .A(n596), .ZN(n371) );
  INV_X1 U351 ( .A(n502), .ZN(n376) );
  XNOR2_X1 U352 ( .A(n505), .B(n480), .ZN(n370) );
  XNOR2_X1 U353 ( .A(n526), .B(n481), .ZN(n369) );
  XNOR2_X1 U354 ( .A(n325), .B(n378), .ZN(n517) );
  XNOR2_X1 U355 ( .A(n506), .B(n509), .ZN(n378) );
  AND2_X1 U356 ( .A1(n386), .A2(n388), .ZN(n377) );
  INV_X1 U357 ( .A(n678), .ZN(n607) );
  BUF_X1 U358 ( .A(n496), .Z(n479) );
  INV_X1 U359 ( .A(n681), .ZN(n676) );
  NAND2_X1 U360 ( .A1(n350), .A2(n455), .ZN(n340) );
  AOI22_X1 U361 ( .A1(n479), .A2(A_i[4]), .B1(A_i[3]), .B2(n478), .ZN(n341) );
  XNOR2_X1 U362 ( .A(n528), .B(n527), .ZN(n521) );
  BUF_X1 U363 ( .A(n453), .Z(n342) );
  AND2_X1 U364 ( .A1(n646), .A2(n643), .ZN(n389) );
  NAND2_X1 U365 ( .A1(n372), .A2(n371), .ZN(n488) );
  AOI21_X1 U366 ( .B1(n661), .B2(n667), .A(n346), .ZN(n343) );
  BUF_X1 U367 ( .A(n409), .Z(n344) );
  OR2_X1 U368 ( .A1(B_i[1]), .A2(n682), .ZN(n511) );
  AOI21_X1 U369 ( .B1(n661), .B2(n667), .A(n346), .ZN(n496) );
  XNOR2_X1 U370 ( .A(n464), .B(n445), .ZN(n345) );
  AND2_X1 U371 ( .A1(n682), .A2(n368), .ZN(n346) );
  XNOR2_X1 U372 ( .A(n347), .B(n399), .ZN(n409) );
  AND2_X1 U373 ( .A1(n326), .A2(B_i[5]), .ZN(n347) );
  AND2_X1 U374 ( .A1(n676), .A2(n677), .ZN(n384) );
  AND2_X1 U375 ( .A1(n326), .A2(B_i[5]), .ZN(n351) );
  BUF_X2 U376 ( .A(B_i[3]), .Z(n667) );
  OAI21_X1 U377 ( .B1(n526), .B2(n525), .A(n524), .ZN(n348) );
  OAI21_X1 U378 ( .B1(n526), .B2(n525), .A(n524), .ZN(n597) );
  XNOR2_X1 U379 ( .A(n430), .B(n423), .ZN(n407) );
  XOR2_X1 U380 ( .A(n530), .B(n527), .Z(n349) );
  OR2_X1 U381 ( .A1(n457), .A2(n456), .ZN(n350) );
  NAND2_X1 U382 ( .A1(n350), .A2(n455), .ZN(n551) );
  OAI21_X1 U383 ( .B1(n563), .B2(n562), .A(n329), .ZN(n352) );
  OR2_X1 U384 ( .A1(n472), .A2(n471), .ZN(n353) );
  INV_X1 U385 ( .A(n669), .ZN(n354) );
  OR2_X1 U386 ( .A1(n609), .A2(n610), .ZN(n472) );
  OAI22_X1 U387 ( .A1(n567), .A2(n600), .B1(n352), .B2(n359), .ZN(n355) );
  BUF_X1 U388 ( .A(n399), .Z(n356) );
  AOI21_X1 U389 ( .B1(B_i[2]), .B2(B_i[1]), .A(n682), .ZN(n399) );
  XNOR2_X1 U390 ( .A(n357), .B(n542), .ZN(n530) );
  XNOR2_X1 U391 ( .A(n538), .B(n497), .ZN(n357) );
  BUF_X1 U392 ( .A(n635), .Z(n358) );
  XNOR2_X1 U393 ( .A(n534), .B(n543), .ZN(n454) );
  OAI211_X1 U394 ( .C1(n556), .C2(n348), .A(n571), .B(n568), .ZN(n359) );
  INV_X1 U395 ( .A(n533), .ZN(n360) );
  AND2_X1 U396 ( .A1(n440), .A2(n439), .ZN(n361) );
  NOR2_X1 U397 ( .A1(n438), .A2(n361), .ZN(n462) );
  BUF_X1 U398 ( .A(n447), .Z(n362) );
  AOI22_X1 U399 ( .A1(n479), .A2(A_i[2]), .B1(A_i[1]), .B2(n342), .ZN(n447) );
  MUX2_X1 U400 ( .A(n622), .B(n408), .S(n409), .Z(n363) );
  AOI21_X1 U401 ( .B1(n385), .B2(n377), .A(n214), .ZN(n176) );
  AND2_X1 U402 ( .A1(n407), .A2(n406), .ZN(n364) );
  NOR2_X1 U403 ( .A1(n364), .A2(n405), .ZN(n443) );
  INV_X1 U404 ( .A(n356), .ZN(n423) );
  OAI22_X1 U405 ( .A1(n667), .A2(n391), .B1(B_i[2]), .B2(n511), .ZN(n366) );
  AOI22_X1 U406 ( .A1(B_i[2]), .A2(n676), .B1(n681), .B2(n679), .ZN(n500) );
  NAND2_X1 U407 ( .A1(n682), .A2(n368), .ZN(n367) );
  NAND2_X1 U408 ( .A1(n373), .A2(n454), .ZN(n455) );
  NAND2_X1 U409 ( .A1(n456), .A2(n457), .ZN(n373) );
  AND3_X2 U410 ( .A1(n375), .A2(n374), .A3(n376), .ZN(n527) );
  XNOR2_X1 U411 ( .A(n363), .B(n379), .ZN(n450) );
  XNOR2_X1 U412 ( .A(n412), .B(n543), .ZN(n381) );
  NAND2_X1 U413 ( .A1(n503), .A2(n505), .ZN(n374) );
  NAND2_X1 U414 ( .A1(n507), .A2(n543), .ZN(n375) );
  NAND2_X1 U415 ( .A1(n668), .A2(n472), .ZN(n383) );
  XNOR2_X1 U416 ( .A(n411), .B(n351), .ZN(n380) );
  MUX2_X1 U417 ( .A(n622), .B(n408), .S(n409), .Z(n533) );
  NOR2_X2 U418 ( .A1(n466), .A2(n467), .ZN(n642) );
  FA_X1 U419 ( .A(n381), .B(n382), .CI(n380), .CO(n416) );
  INV_X1 U420 ( .A(n344), .ZN(n393) );
  NOR2_X1 U421 ( .A1(n471), .A2(n472), .ZN(n494) );
  NAND2_X1 U422 ( .A1(n383), .A2(n353), .ZN(n657) );
  AOI22_X1 U423 ( .A1(B_i[0]), .A2(A_i[4]), .B1(n384), .B2(A_i[3]), .ZN(n497)
         );
  AOI22_X1 U424 ( .A1(B_i[0]), .A2(A_i[5]), .B1(n384), .B2(A_i[4]), .ZN(n532)
         );
  AOI22_X1 U425 ( .A1(B_i[0]), .A2(A_i[3]), .B1(n384), .B2(A_i[2]), .ZN(n506)
         );
  AOI22_X1 U426 ( .A1(B_i[0]), .A2(A_i[2]), .B1(n384), .B2(A_i[1]), .ZN(n510)
         );
  AOI22_X1 U427 ( .A1(B_i[0]), .A2(A_i[6]), .B1(n384), .B2(A_i[5]), .ZN(n446)
         );
  AOI22_X1 U428 ( .A1(B_i[0]), .A2(A_i[7]), .B1(n384), .B2(A_i[6]), .ZN(n432)
         );
  NAND2_X1 U429 ( .A1(n640), .A2(n389), .ZN(n385) );
  AND4_X2 U430 ( .A1(n385), .A2(n388), .A3(n234), .A4(n386), .ZN(n177) );
  INV_X1 U431 ( .A(n558), .ZN(n549) );
  NAND2_X1 U432 ( .A1(n525), .A2(n526), .ZN(n522) );
  NOR2_X1 U433 ( .A1(n677), .A2(n671), .ZN(n390) );
  MUX2_X1 U434 ( .A(n390), .B(n671), .S(n622), .Z(n401) );
  BUF_X1 U445 ( .A(B_i[4]), .Z(n661) );
  INV_X1 U446 ( .A(n679), .ZN(n680) );
  INV_X1 U447 ( .A(B_i[1]), .ZN(n408) );
  NAND2_X1 U448 ( .A1(B_i[2]), .A2(n676), .ZN(n391) );
  OAI22_X1 U449 ( .A1(n667), .A2(n391), .B1(n511), .B2(B_i[2]), .ZN(n499) );
  BUF_X1 U450 ( .A(n499), .Z(n498) );
  BUF_X1 U451 ( .A(n435), .Z(n392) );
  AOI22_X1 U452 ( .A1(A_i[7]), .A2(n336), .B1(A_i[6]), .B2(n392), .ZN(n426) );
  AOI22_X1 U453 ( .A1(n367), .A2(B_i[5]), .B1(n326), .B2(n669), .ZN(n453) );
  INV_X1 U454 ( .A(n453), .ZN(n400) );
  INV_X1 U455 ( .A(n400), .ZN(n478) );
  AOI22_X1 U456 ( .A1(n479), .A2(A_i[5]), .B1(A_i[4]), .B2(n478), .ZN(n425) );
  INV_X1 U457 ( .A(n425), .ZN(n394) );
  AOI22_X1 U458 ( .A1(n425), .A2(n344), .B1(n393), .B2(n394), .ZN(n395) );
  XNOR2_X1 U459 ( .A(n395), .B(n426), .ZN(n418) );
  AOI21_X1 U460 ( .B1(B_i[5]), .B2(B_i[6]), .A(n670), .ZN(n586) );
  INV_X1 U461 ( .A(n586), .ZN(n593) );
  NOR2_X1 U462 ( .A1(B_i[5]), .A2(B_i[6]), .ZN(n584) );
  AOI21_X1 U463 ( .B1(B_i[6]), .B2(n354), .A(n584), .ZN(n591) );
  INV_X1 U464 ( .A(n584), .ZN(n397) );
  NAND2_X1 U465 ( .A1(n354), .A2(B_i[6]), .ZN(n396) );
  AOI22_X2 U466 ( .A1(B_i[7]), .A2(n397), .B1(n396), .B2(n670), .ZN(n590) );
  AOI22_X1 U467 ( .A1(n591), .A2(A_i[3]), .B1(A_i[2]), .B2(n590), .ZN(n398) );
  XOR2_X1 U468 ( .A(n593), .B(n398), .Z(n417) );
  AOI22_X1 U469 ( .A1(A_i[6]), .A2(n336), .B1(A_i[5]), .B2(n498), .ZN(n412) );
  AOI22_X1 U470 ( .A1(n479), .A2(A_i[4]), .B1(A_i[3]), .B2(n478), .ZN(n411) );
  AOI22_X1 U471 ( .A1(n591), .A2(A_i[2]), .B1(A_i[1]), .B2(n590), .ZN(n402) );
  XOR2_X1 U472 ( .A(n593), .B(n402), .Z(n444) );
  BUF_X1 U473 ( .A(n499), .Z(n435) );
  AOI22_X1 U474 ( .A1(A_i[5]), .A2(n500), .B1(n366), .B2(A_i[4]), .ZN(n430) );
  BUF_X1 U475 ( .A(B_i[1]), .Z(n622) );
  NOR2_X1 U476 ( .A1(n671), .A2(n677), .ZN(n403) );
  AOI22_X1 U477 ( .A1(n622), .A2(n432), .B1(n403), .B2(n408), .ZN(n406) );
  AOI22_X1 U478 ( .A1(n343), .A2(A_i[3]), .B1(A_i[2]), .B2(n342), .ZN(n429) );
  OAI22_X1 U479 ( .A1(n407), .A2(n406), .B1(n429), .B2(n351), .ZN(n404) );
  AOI21_X1 U480 ( .B1(n429), .B2(n351), .A(n404), .ZN(n405) );
  INV_X1 U481 ( .A(n533), .ZN(n529) );
  INV_X1 U482 ( .A(n360), .ZN(n520) );
  INV_X1 U483 ( .A(n341), .ZN(n410) );
  AOI22_X1 U484 ( .A1(n321), .A2(n341), .B1(n410), .B2(n529), .ZN(n415) );
  AOI21_X1 U485 ( .B1(n408), .B2(n677), .A(n671), .ZN(n413) );
  XNOR2_X1 U486 ( .A(n412), .B(n413), .ZN(n414) );
  XNOR2_X1 U487 ( .A(n415), .B(n414), .ZN(n442) );
  FA_X1 U488 ( .A(n418), .B(n417), .CI(n416), .CO(n490), .S(n466) );
  AOI22_X1 U489 ( .A1(n591), .A2(A_i[4]), .B1(A_i[3]), .B2(n590), .ZN(n419) );
  XOR2_X1 U490 ( .A(n419), .B(n586), .Z(n477) );
  AOI22_X1 U491 ( .A1(n479), .A2(A_i[6]), .B1(A_i[5]), .B2(n478), .ZN(n481) );
  BUF_X1 U492 ( .A(n682), .Z(n420) );
  NOR2_X1 U493 ( .A1(n680), .A2(n420), .ZN(n514) );
  NOR2_X1 U494 ( .A1(n421), .A2(n671), .ZN(n480) );
  XOR2_X1 U495 ( .A(n481), .B(n480), .Z(n474) );
  XOR2_X1 U496 ( .A(n477), .B(n474), .Z(n422) );
  XOR2_X1 U497 ( .A(n344), .B(n422), .Z(n427) );
  INV_X1 U498 ( .A(n351), .ZN(n539) );
  AOI22_X1 U499 ( .A1(n505), .A2(n426), .B1(n526), .B2(n339), .ZN(n424) );
  OAI221_X1 U500 ( .B1(n505), .B2(n426), .C1(n526), .C2(n339), .A(n424), .ZN(
        n476) );
  XNOR2_X1 U501 ( .A(n427), .B(n476), .ZN(n489) );
  XNOR2_X1 U502 ( .A(n490), .B(n489), .ZN(n641) );
  INV_X1 U503 ( .A(n429), .ZN(n428) );
  AOI22_X1 U504 ( .A1(n520), .A2(n429), .B1(n428), .B2(n529), .ZN(n434) );
  XNOR2_X1 U505 ( .A(n432), .B(n431), .ZN(n433) );
  XNOR2_X1 U506 ( .A(n434), .B(n433), .ZN(n463) );
  AOI22_X1 U507 ( .A1(A_i[4]), .A2(n336), .B1(n435), .B2(A_i[3]), .ZN(n448) );
  AND2_X1 U508 ( .A1(A_i[6]), .A2(B_i[0]), .ZN(n436) );
  AOI22_X1 U509 ( .A1(n622), .A2(n446), .B1(n436), .B2(n408), .ZN(n439) );
  OAI22_X1 U510 ( .A1(n440), .A2(n439), .B1(n351), .B2(n362), .ZN(n437) );
  AOI21_X1 U511 ( .B1(n351), .B2(n362), .A(n437), .ZN(n438) );
  AOI22_X1 U512 ( .A1(n591), .A2(A_i[1]), .B1(A_i[0]), .B2(n590), .ZN(n441) );
  XOR2_X1 U513 ( .A(n593), .B(n441), .Z(n461) );
  FA_X1 U514 ( .A(n443), .B(n444), .CI(n442), .CO(n467), .S(n465) );
  BUF_X1 U515 ( .A(n465), .Z(n445) );
  NOR2_X1 U516 ( .A1(n464), .A2(n445), .ZN(n637) );
  NAND2_X1 U517 ( .A1(n591), .A2(A_i[0]), .ZN(n552) );
  XOR2_X1 U518 ( .A(n586), .B(n552), .Z(n460) );
  XNOR2_X1 U519 ( .A(n448), .B(n447), .ZN(n449) );
  XNOR2_X1 U520 ( .A(n450), .B(n449), .ZN(n550) );
  CLKBUF_X1 U521 ( .A(n550), .Z(n451) );
  AND2_X1 U522 ( .A1(A_i[5]), .A2(B_i[0]), .ZN(n452) );
  AOI22_X1 U523 ( .A1(n622), .A2(n532), .B1(n452), .B2(n408), .ZN(n457) );
  AOI22_X1 U524 ( .A1(n343), .A2(A_i[1]), .B1(A_i[0]), .B2(n453), .ZN(n536) );
  XOR2_X1 U525 ( .A(n536), .B(n351), .Z(n456) );
  AOI22_X1 U526 ( .A1(n336), .A2(A_i[3]), .B1(A_i[2]), .B2(n435), .ZN(n534) );
  NAND2_X1 U527 ( .A1(n451), .A2(n340), .ZN(n459) );
  NOR2_X1 U528 ( .A1(n451), .A2(n340), .ZN(n458) );
  FA_X1 U529 ( .A(n461), .B(n463), .CI(n462), .CO(n464), .S(n565) );
  XNOR2_X1 U530 ( .A(n464), .B(n465), .ZN(n468) );
  NAND3_X1 U531 ( .A1(n468), .A2(n565), .A3(n564), .ZN(n631) );
  BUF_X1 U532 ( .A(n471), .Z(n668) );
  AOI21_X1 U533 ( .B1(n565), .B2(n564), .A(n345), .ZN(n469) );
  INV_X1 U534 ( .A(n469), .ZN(n633) );
  BUF_X1 U535 ( .A(n631), .Z(n470) );
  NAND2_X1 U536 ( .A1(n633), .A2(n470), .ZN(n609) );
  FA_X1 U537 ( .A(n637), .B(n631), .CI(n635), .CO(n491), .S(n610) );
  NOR2_X1 U538 ( .A1(n609), .A2(n610), .ZN(n608) );
  INV_X1 U539 ( .A(n185), .ZN(n658) );
  INV_X1 U540 ( .A(n233), .ZN(n660) );
  AOI22_X1 U541 ( .A1(n477), .A2(n476), .B1(n393), .B2(n474), .ZN(n473) );
  OAI21_X1 U542 ( .B1(n393), .B2(n474), .A(n473), .ZN(n475) );
  OAI21_X1 U543 ( .B1(n477), .B2(n476), .A(n475), .ZN(n485) );
  AOI22_X1 U544 ( .A1(A_i[7]), .A2(n343), .B1(A_i[6]), .B2(n342), .ZN(n580) );
  AOI22_X1 U545 ( .A1(n351), .A2(n586), .B1(n593), .B2(n526), .ZN(n577) );
  XOR2_X1 U546 ( .A(n580), .B(n577), .Z(n483) );
  AOI22_X1 U547 ( .A1(A_i[5]), .A2(n591), .B1(A_i[4]), .B2(n590), .ZN(n578) );
  XNOR2_X1 U548 ( .A(n583), .B(n578), .ZN(n482) );
  XNOR2_X1 U549 ( .A(n483), .B(n482), .ZN(n484) );
  NOR2_X1 U550 ( .A1(n484), .A2(n485), .ZN(n596) );
  NAND2_X1 U551 ( .A1(n490), .A2(n489), .ZN(n486) );
  AOI21_X1 U552 ( .B1(n490), .B2(n489), .A(n488), .ZN(n644) );
  NOR2_X1 U553 ( .A1(n645), .A2(n644), .ZN(n493) );
  XNOR2_X1 U554 ( .A(n493), .B(n492), .ZN(n495) );
  INV_X1 U555 ( .A(n495), .ZN(n663) );
  INV_X1 U556 ( .A(n185), .ZN(n664) );
  INV_X1 U557 ( .A(n233), .ZN(n666) );
  OAI21_X1 U558 ( .B1(n514), .B2(n408), .A(n337), .ZN(n509) );
  NAND2_X1 U559 ( .A1(n496), .A2(A_i[0]), .ZN(n538) );
  INV_X1 U560 ( .A(n497), .ZN(n541) );
  AOI22_X1 U561 ( .A1(n336), .A2(A_i[2]), .B1(A_i[1]), .B2(n498), .ZN(n542) );
  AOI22_X1 U562 ( .A1(n336), .A2(A_i[1]), .B1(n498), .B2(A_i[0]), .ZN(n503) );
  INV_X1 U563 ( .A(n503), .ZN(n507) );
  AND2_X1 U564 ( .A1(A_i[3]), .A2(B_i[0]), .ZN(n501) );
  AOI22_X1 U565 ( .A1(n622), .A2(n506), .B1(n501), .B2(n408), .ZN(n502) );
  NAND2_X1 U566 ( .A1(n336), .A2(A_i[0]), .ZN(n627) );
  INV_X1 U567 ( .A(n627), .ZN(n626) );
  AND2_X1 U568 ( .A1(B_i[0]), .A2(A_i[2]), .ZN(n504) );
  AOI22_X1 U569 ( .A1(n622), .A2(n510), .B1(n504), .B2(n408), .ZN(n628) );
  AOI221_X1 U570 ( .B1(n505), .B2(n627), .C1(n543), .C2(n626), .A(n628), .ZN(
        n516) );
  NAND2_X1 U571 ( .A1(n516), .A2(n517), .ZN(n519) );
  XNOR2_X1 U572 ( .A(n521), .B(n519), .ZN(n508) );
  XNOR2_X1 U573 ( .A(n508), .B(n509), .ZN(n518) );
  BUF_X1 U574 ( .A(n518), .Z(n678) );
  AOI211_X1 U575 ( .C1(A_i[1]), .C2(B_i[0]), .A(A_i[0]), .B(n408), .ZN(n205)
         );
  INV_X1 U576 ( .A(n628), .ZN(n625) );
  AND2_X1 U577 ( .A1(n625), .A2(n205), .ZN(n209) );
  XOR2_X1 U578 ( .A(n510), .B(n626), .Z(n515) );
  INV_X1 U579 ( .A(n337), .ZN(n512) );
  NOR2_X1 U580 ( .A1(n515), .A2(n512), .ZN(n513) );
  AOI221_X1 U581 ( .B1(n515), .B2(n512), .C1(n514), .C2(n513), .A(n209), .ZN(
        n630) );
  XNOR2_X1 U582 ( .A(n517), .B(n516), .ZN(n629) );
  NOR2_X1 U583 ( .A1(n630), .A2(n629), .ZN(n188) );
  AND2_X1 U584 ( .A1(n518), .A2(n188), .ZN(n556) );
  BUF_X1 U585 ( .A(n520), .Z(n531) );
  XOR2_X1 U586 ( .A(n349), .B(n531), .Z(n523) );
  NAND2_X1 U587 ( .A1(n523), .A2(n522), .ZN(n524) );
  INV_X1 U588 ( .A(n530), .ZN(n528) );
  OAI221_X1 U589 ( .B1(n531), .B2(n530), .C1(n360), .C2(n528), .A(n527), .ZN(
        n558) );
  XNOR2_X1 U590 ( .A(n363), .B(n532), .ZN(n535) );
  XNOR2_X1 U591 ( .A(n535), .B(n365), .ZN(n537) );
  XNOR2_X1 U592 ( .A(n537), .B(n536), .ZN(n554) );
  XOR2_X1 U593 ( .A(n539), .B(n538), .Z(n548) );
  NAND2_X1 U594 ( .A1(A_i[4]), .A2(B_i[0]), .ZN(n540) );
  AOI22_X1 U595 ( .A1(n622), .A2(n541), .B1(n540), .B2(n408), .ZN(n547) );
  XOR2_X1 U596 ( .A(n543), .B(n542), .Z(n545) );
  NAND2_X1 U597 ( .A1(n548), .A2(n547), .ZN(n544) );
  NAND2_X1 U598 ( .A1(n545), .A2(n544), .ZN(n546) );
  OAI21_X1 U599 ( .B1(n548), .B2(n547), .A(n546), .ZN(n555) );
  XNOR2_X1 U600 ( .A(n554), .B(n555), .ZN(n557) );
  XNOR2_X1 U601 ( .A(n557), .B(n549), .ZN(n568) );
  XNOR2_X1 U602 ( .A(n550), .B(n551), .ZN(n553) );
  XNOR2_X1 U603 ( .A(n553), .B(n552), .ZN(n560) );
  NOR2_X1 U604 ( .A1(n555), .A2(n554), .ZN(n559) );
  XNOR2_X1 U605 ( .A(n560), .B(n559), .ZN(n571) );
  OAI211_X1 U606 ( .C1(n556), .C2(n597), .A(n568), .B(n571), .ZN(n566) );
  NOR2_X1 U607 ( .A1(n557), .A2(n558), .ZN(n570) );
  NAND2_X1 U608 ( .A1(n571), .A2(n570), .ZN(n599) );
  BUF_X1 U609 ( .A(n559), .Z(n563) );
  BUF_X1 U610 ( .A(n560), .Z(n562) );
  NAND2_X1 U611 ( .A1(n562), .A2(n593), .ZN(n561) );
  OAI21_X1 U612 ( .B1(n563), .B2(n562), .A(n561), .ZN(n601) );
  AND3_X1 U613 ( .A1(n566), .A2(n599), .A3(n601), .ZN(n567) );
  XNOR2_X1 U614 ( .A(n565), .B(n564), .ZN(n600) );
  OAI22_X1 U615 ( .A1(n567), .A2(n600), .B1(n352), .B2(n359), .ZN(n634) );
  CLKBUF_X1 U616 ( .A(n568), .Z(n569) );
  XNOR2_X1 U617 ( .A(n569), .B(n348), .ZN(n606) );
  INV_X1 U618 ( .A(n606), .ZN(DP_OP_70J12_122_5612_n16) );
  INV_X1 U619 ( .A(n610), .ZN(DP_OP_71J12_123_5612_n17) );
  AOI21_X1 U620 ( .B1(n348), .B2(n569), .A(n570), .ZN(n573) );
  BUF_X1 U621 ( .A(n571), .Z(n572) );
  XNOR2_X1 U622 ( .A(n573), .B(n572), .ZN(DP_OP_70J12_122_5612_n17) );
  NOR2_X1 U623 ( .A1(n606), .A2(n607), .ZN(n605) );
  NAND3_X1 U624 ( .A1(DP_OP_70J12_122_5612_n16), .A2(DP_OP_70J12_122_5612_n17), 
        .A3(n678), .ZN(n604) );
  OAI21_X1 U625 ( .B1(n605), .B2(DP_OP_70J12_122_5612_n17), .A(n604), .ZN(n574) );
  INV_X1 U626 ( .A(n574), .ZN(mul_final_add_sum_gen_carry_select_int_1_S1[2])
         );
  AOI22_X1 U627 ( .A1(A_i[6]), .A2(n591), .B1(A_i[5]), .B2(n590), .ZN(n587) );
  NOR2_X1 U628 ( .A1(n354), .A2(n346), .ZN(n589) );
  OAI21_X1 U629 ( .B1(n351), .B2(n589), .A(A_i[7]), .ZN(n575) );
  XNOR2_X1 U630 ( .A(n587), .B(n575), .ZN(n576) );
  XNOR2_X1 U631 ( .A(n577), .B(n576), .ZN(n595) );
  XOR2_X1 U632 ( .A(n578), .B(n593), .Z(n582) );
  AOI22_X1 U633 ( .A1(n583), .A2(n582), .B1(n351), .B2(n580), .ZN(n579) );
  OAI21_X1 U634 ( .B1(n351), .B2(n580), .A(n579), .ZN(n581) );
  OAI21_X1 U635 ( .B1(n583), .B2(n582), .A(n581), .ZN(n594) );
  INV_X1 U636 ( .A(n621), .ZN(DP_OP_72J12_124_2857_n4) );
  INV_X1 U637 ( .A(n609), .ZN(DP_OP_71J12_123_5612_n4) );
  OAI21_X1 U638 ( .B1(n584), .B2(B_i[7]), .A(A_i[7]), .ZN(n585) );
  OAI21_X1 U639 ( .B1(A_i[7]), .B2(n586), .A(n585), .ZN(n612) );
  XOR2_X1 U640 ( .A(n587), .B(n586), .Z(n588) );
  AOI221_X1 U641 ( .B1(n589), .B2(A_i[7]), .C1(n351), .C2(n671), .A(n588), 
        .ZN(n615) );
  AOI22_X1 U642 ( .A1(A_i[7]), .A2(n591), .B1(A_i[6]), .B2(n590), .ZN(n592) );
  XOR2_X1 U643 ( .A(n593), .B(n592), .Z(n614) );
  NOR2_X1 U644 ( .A1(n615), .A2(n614), .ZN(n613) );
  FA_X1 U645 ( .A(n596), .B(n595), .CI(n594), .CO(n617), .S(n621) );
  NAND2_X1 U646 ( .A1(n613), .A2(n617), .ZN(n611) );
  NAND2_X1 U647 ( .A1(n612), .A2(n611), .ZN(DP_OP_72J12_124_2857_n18) );
  NAND3_X1 U648 ( .A1(n569), .A2(n572), .A3(n348), .ZN(n598) );
  NAND2_X1 U649 ( .A1(n599), .A2(n598), .ZN(n603) );
  XNOR2_X1 U650 ( .A(n352), .B(n600), .ZN(n602) );
  XNOR2_X1 U651 ( .A(n603), .B(n602), .ZN(DP_OP_70J12_122_5612_n18) );
  XNOR2_X1 U652 ( .A(n604), .B(DP_OP_70J12_122_5612_n18), .ZN(
        mul_final_add_sum_gen_carry_select_int_1_S1[3]) );
  AOI21_X1 U653 ( .B1(n607), .B2(n606), .A(n605), .ZN(
        mul_final_add_sum_gen_carry_select_int_1_S1[1]) );
  AOI21_X1 U654 ( .B1(n327), .B2(n609), .A(n608), .ZN(
        mul_final_add_sum_gen_carry_select_int_2_S1_1_) );
  XOR2_X1 U655 ( .A(n612), .B(n611), .Z(DP_OP_72J12_124_2857_n17) );
  AOI21_X1 U656 ( .B1(n615), .B2(n614), .A(n613), .ZN(n616) );
  XNOR2_X1 U657 ( .A(n617), .B(n616), .ZN(n620) );
  NOR2_X1 U658 ( .A1(n621), .A2(n620), .ZN(n619) );
  INV_X1 U659 ( .A(DP_OP_72J12_124_2857_n18), .ZN(n618) );
  AOI21_X1 U660 ( .B1(n619), .B2(DP_OP_72J12_124_2857_n17), .A(n618), .ZN(
        mul_final_add_sum_gen_carry_select_int_3_S1[3]) );
  XOR2_X1 U661 ( .A(n619), .B(DP_OP_72J12_124_2857_n17), .Z(
        mul_final_add_sum_gen_carry_select_int_3_S1[2]) );
  INV_X1 U662 ( .A(n620), .ZN(DP_OP_72J12_124_2857_n16) );
  AOI21_X1 U663 ( .B1(n621), .B2(n620), .A(n619), .ZN(
        mul_final_add_sum_gen_carry_select_int_3_S1[1]) );
  NAND2_X1 U664 ( .A1(A_i[1]), .A2(B_i[0]), .ZN(n624) );
  NAND2_X1 U665 ( .A1(n622), .A2(A_i[0]), .ZN(n623) );
  XNOR2_X1 U666 ( .A(n624), .B(n623), .ZN(n213) );
  AOI22_X1 U667 ( .A1(n628), .A2(n627), .B1(n626), .B2(n625), .ZN(n206) );
  XNOR2_X1 U668 ( .A(n630), .B(n629), .ZN(n201) );
  INV_X1 U669 ( .A(n470), .ZN(n632) );
  AOI21_X1 U670 ( .B1(n633), .B2(n634), .A(n632), .ZN(n636) );
  OAI222_X1 U671 ( .A1(n330), .A2(n637), .B1(n358), .B2(n637), .C1(n636), .C2(
        n358), .ZN(n640) );
  INV_X1 U672 ( .A(n641), .ZN(n638) );
  INV_X1 U673 ( .A(n642), .ZN(n639) );
  NAND2_X1 U674 ( .A1(n642), .A2(n641), .ZN(n643) );
  INV_X1 U675 ( .A(n644), .ZN(n646) );
  OAI222_X1 U676 ( .A1(n660), .A2(n659), .B1(n658), .B2(n668), .C1(n187), .C2(
        n657), .ZN(n271) );
endmodule

