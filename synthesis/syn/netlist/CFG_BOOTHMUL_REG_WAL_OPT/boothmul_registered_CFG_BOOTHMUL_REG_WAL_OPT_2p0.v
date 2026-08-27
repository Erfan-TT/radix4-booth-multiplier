/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : W-2024.09-SP2
// Date      : Thu Aug 27 03:30:21 2026
/////////////////////////////////////////////////////////////


module boothmul_registered ( CLK, LD, RST, A, B, P );
  input [7:0] A;
  input [7:0] B;
  output [15:0] P;
  input CLK, LD, RST;
  wire   n148, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n201, n205, n206, n208, n209, n213, n214, n215,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n265, n267, n268,
         n269, n270, n271, n272, n273, n274, n275, n276, n277, n278, n279,
         n280, n281, n282, n283, n284, n285, n286, n287, n288, n289, n290,
         n291, n292, n293, n294, n295, n296, n297, DP_OP_72J14_124_2857_n18,
         DP_OP_72J14_124_2857_n17, DP_OP_72J14_124_2857_n16,
         DP_OP_72J14_124_2857_n4, DP_OP_71J14_123_5612_n19,
         DP_OP_71J14_123_5612_n18, DP_OP_71J14_123_5612_n17,
         DP_OP_71J14_123_5612_n4, DP_OP_70J14_122_5612_n18,
         DP_OP_70J14_122_5612_n17, DP_OP_70J14_122_5612_n16,
         DP_OP_70J14_122_5612_n4, n321, n322, n323, n324, n325, n326, n327,
         n328, n329, n330, n331, n332, n333, n334, n335, n336, n337, n338,
         n339, n340, n341, n342, n343, n344, n345, n346, n347, n348, n349,
         n350, n351, n352, n353, n354, n355, n356, n357, n358, n359, n360,
         n361, n362, n363, n364, n365, n366, n367, n368, n369, n370, n371,
         n372, n373, n374, n375, n376, n377, n378, n379, n380, n381, n382,
         n383, n384, n385, n386, n387, n388, n389, n390, n391, n392, n393,
         n394, n395, n396, n397, n398, n399, n400, n401, n402, n403, n404,
         n405, n406, n407, n408, n409, n410, n411, n412, n413, n414, n415,
         n416, n417, n418, n419, n420, n421, n422, n423, n425, n426, n427,
         n428, n429, n430, n431, n432, n433, n434, n435, n436, n437, n438,
         n439, n440, n441, n442, n443, n444, n445, n446, n447, n448, n449,
         n450, n451, n452, n453, n454, n455, n456, n457, n458, n459, n460,
         n461, n462, n463, n464, n465, n466, n467, n468, n469, n470, n471,
         n472, n473, n474, n475, n476, n477, n478, n479, n480, n481, n482,
         n483, n484, n485, n486, n487, n488, n489, n490, n491, n492, n493,
         n494, n495, n496, n497, n498, n499, n500, n501, n502, n503, n504,
         n505, n506, n507, n508, n509, n510, n511, n512, n513, n514, n515,
         n516, n517, n518, n519, n520, n521, n522, n523, n524, n525, n526,
         n527, n528, n529, n530, n531, n532, n533, n534, n535, n536, n537,
         n538, n539, n540, n541, n542, n543, n544, n545, n546, n547, n548,
         n549, n550, n551, n552, n553, n554, n555, n556, n557, n558, n559,
         n560, n561, n562, n563, n564, n565, n566, n567, n568, n569;
  wire   [7:0] A_i;
  wire   [7:0] B_i;
  wire   [3:1] mul_final_add_sum_gen_carry_select_int_1_S1;
  wire   [3:1] mul_final_add_sum_gen_carry_select_int_2_S1;
  wire   [3:1] mul_final_add_sum_gen_carry_select_int_3_S1;

  DFF_X1 B_reg_Y_temp_reg_2_ ( .D(n287), .CK(CLK), .Q(B_i[2]), .QN(n562) );
  DFF_X1 B_reg_Y_temp_reg_3_ ( .D(n286), .CK(CLK), .Q(B_i[3]), .QN(n561) );
  DFF_X1 B_reg_Y_temp_reg_4_ ( .D(n285), .CK(CLK), .Q(B_i[4]) );
  DFF_X1 B_reg_Y_temp_reg_5_ ( .D(n284), .CK(CLK), .Q(B_i[5]), .QN(n563) );
  DFF_X1 B_reg_Y_temp_reg_6_ ( .D(n283), .CK(CLK), .Q(B_i[6]) );
  DFF_X1 B_reg_Y_temp_reg_7_ ( .D(n282), .CK(CLK), .Q(B_i[7]), .QN(n564) );
  DFF_X1 p_reg_Y_temp_reg_0_ ( .D(n281), .CK(CLK), .Q(P[0]), .QN(n569) );
  DFF_X1 p_reg_Y_temp_reg_1_ ( .D(n280), .CK(CLK), .Q(P[1]), .QN(n566) );
  DFF_X1 p_reg_Y_temp_reg_2_ ( .D(n279), .CK(CLK), .Q(P[2]), .QN(n568) );
  DFF_X1 p_reg_Y_temp_reg_3_ ( .D(n278), .CK(CLK), .Q(P[3]), .QN(n567) );
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
  AOI222_X1 U204 ( .A1(n176), .A2(
        mul_final_add_sum_gen_carry_select_int_3_S1[3]), .B1(n233), .B2(P[15]), 
        .C1(n177), .C2(DP_OP_72J14_124_2857_n18), .ZN(n173) );
  INV_X1 U205 ( .A(n173), .ZN(n265) );
  AOI222_X1 U207 ( .A1(n176), .A2(
        mul_final_add_sum_gen_carry_select_int_3_S1[2]), .B1(n233), .B2(P[14]), 
        .C1(n177), .C2(DP_OP_72J14_124_2857_n17), .ZN(n174) );
  INV_X1 U208 ( .A(n174), .ZN(n267) );
  AOI222_X1 U209 ( .A1(n176), .A2(
        mul_final_add_sum_gen_carry_select_int_3_S1[1]), .B1(n233), .B2(P[13]), 
        .C1(n177), .C2(DP_OP_72J14_124_2857_n16), .ZN(n175) );
  INV_X1 U210 ( .A(n175), .ZN(n268) );
  AOI22_X1 U212 ( .A1(n233), .A2(P[12]), .B1(n177), .B2(
        DP_OP_72J14_124_2857_n4), .ZN(n178) );
  OAI21_X1 U213 ( .B1(DP_OP_72J14_124_2857_n4), .B2(n179), .A(n178), .ZN(n269)
         );
  NOR2_X1 U214 ( .A1(n214), .A2(n180), .ZN(n185) );
  NAND2_X1 U215 ( .A1(n180), .A2(n234), .ZN(n187) );
  AOI222_X1 U217 ( .A1(n233), .A2(P[11]), .B1(n185), .B2(
        DP_OP_71J14_123_5612_n19), .C1(n183), .C2(
        mul_final_add_sum_gen_carry_select_int_2_S1[3]), .ZN(n181) );
  INV_X1 U218 ( .A(n181), .ZN(n270) );
  AOI222_X1 U219 ( .A1(n233), .A2(P[10]), .B1(n185), .B2(
        DP_OP_71J14_123_5612_n18), .C1(n183), .C2(
        mul_final_add_sum_gen_carry_select_int_2_S1[2]), .ZN(n182) );
  AOI222_X1 U221 ( .A1(n233), .A2(P[9]), .B1(n185), .B2(
        DP_OP_71J14_123_5612_n17), .C1(n183), .C2(
        mul_final_add_sum_gen_carry_select_int_2_S1[1]), .ZN(n184) );
  AOI22_X1 U223 ( .A1(n233), .A2(P[8]), .B1(n185), .B2(DP_OP_71J14_123_5612_n4), .ZN(n186) );
  OAI21_X1 U224 ( .B1(DP_OP_71J14_123_5612_n4), .B2(n187), .A(n186), .ZN(n273)
         );
  NAND2_X1 U225 ( .A1(n234), .A2(n188), .ZN(n195) );
  NOR2_X1 U227 ( .A1(n188), .A2(n214), .ZN(n193) );
  AOI222_X1 U228 ( .A1(n233), .A2(P[7]), .B1(n191), .B2(
        mul_final_add_sum_gen_carry_select_int_1_S1[3]), .C1(n193), .C2(
        DP_OP_70J14_122_5612_n18), .ZN(n189) );
  AOI222_X1 U230 ( .A1(n233), .A2(P[6]), .B1(n191), .B2(
        mul_final_add_sum_gen_carry_select_int_1_S1[2]), .C1(n193), .C2(
        DP_OP_70J14_122_5612_n17), .ZN(n190) );
  AOI222_X1 U232 ( .A1(n233), .A2(P[5]), .B1(n191), .B2(
        mul_final_add_sum_gen_carry_select_int_1_S1[1]), .C1(n193), .C2(
        DP_OP_70J14_122_5612_n16), .ZN(n192) );
  AOI22_X1 U234 ( .A1(P[4]), .A2(n233), .B1(n193), .B2(DP_OP_70J14_122_5612_n4), .ZN(n194) );
  OAI21_X1 U235 ( .B1(DP_OP_70J14_122_5612_n4), .B2(n195), .A(n194), .ZN(n277)
         );
  OAI22_X1 U240 ( .A1(n214), .A2(n201), .B1(n217), .B2(n567), .ZN(n278) );
  OAI21_X1 U243 ( .B1(n206), .B2(n205), .A(n234), .ZN(n208) );
  OAI22_X1 U245 ( .A1(n209), .A2(n208), .B1(n568), .B2(n217), .ZN(n279) );
  OAI22_X1 U249 ( .A1(n214), .A2(n213), .B1(n217), .B2(n566), .ZN(n280) );
  NAND3_X1 U251 ( .A1(n234), .A2(A_i[0]), .A3(B_i[0]), .ZN(n215) );
  OAI21_X1 U252 ( .B1(n217), .B2(n569), .A(n215), .ZN(n281) );
  AOI22_X1 U253 ( .A1(n234), .A2(B[7]), .B1(B_i[7]), .B2(n233), .ZN(n218) );
  AOI22_X1 U255 ( .A1(n234), .A2(B[6]), .B1(B_i[6]), .B2(n233), .ZN(n219) );
  AOI22_X1 U257 ( .A1(n234), .A2(B[5]), .B1(B_i[5]), .B2(n233), .ZN(n220) );
  AOI22_X1 U259 ( .A1(n234), .A2(B[4]), .B1(B_i[4]), .B2(n233), .ZN(n221) );
  AOI22_X1 U261 ( .A1(n234), .A2(B[3]), .B1(B_i[3]), .B2(n233), .ZN(n222) );
  AOI22_X1 U263 ( .A1(n234), .A2(B[2]), .B1(B_i[2]), .B2(n233), .ZN(n223) );
  AOI22_X1 U265 ( .A1(n234), .A2(B[1]), .B1(B_i[1]), .B2(n233), .ZN(n224) );
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
  DFF_X1 A_reg_Y_temp_reg_7_ ( .D(n290), .CK(CLK), .Q(A_i[7]), .QN(n565) );
  DFF_X1 B_reg_Y_temp_reg_0_ ( .D(n289), .CK(CLK), .Q(B_i[0]), .QN(n560) );
  DFF_X1 B_reg_Y_temp_reg_1_ ( .D(n288), .CK(CLK), .Q(B_i[1]), .QN(n321) );
  NAND2_X1 U175 ( .A1(LD), .A2(n148), .ZN(n214) );
  INV_X1 U211 ( .A(n176), .ZN(n179) );
  NOR2_X2 U201 ( .A1(RST), .A2(LD), .ZN(n233) );
  INV_X1 U220 ( .A(n182), .ZN(n271) );
  INV_X1 U222 ( .A(n184), .ZN(n272) );
  INV_X1 U231 ( .A(n190), .ZN(n275) );
  INV_X1 U229 ( .A(n189), .ZN(n274) );
  INV_X1 U202 ( .A(n214), .ZN(n234) );
  AND2_X1 U203 ( .A1(n172), .A2(n234), .ZN(n177) );
  INV_X1 U216 ( .A(n187), .ZN(n183) );
  INV_X1 U226 ( .A(n195), .ZN(n191) );
  INV_X1 U233 ( .A(n192), .ZN(n276) );
  INV_X1 U238 ( .A(n233), .ZN(n217) );
  INV_X1 U272 ( .A(n227), .ZN(n291) );
  INV_X1 U274 ( .A(n228), .ZN(n292) );
  INV_X1 U276 ( .A(n229), .ZN(n293) );
  INV_X1 U278 ( .A(n230), .ZN(n294) );
  INV_X1 U268 ( .A(n225), .ZN(n289) );
  INV_X1 U270 ( .A(n226), .ZN(n290) );
  INV_X1 U280 ( .A(n231), .ZN(n295) );
  INV_X1 U256 ( .A(n219), .ZN(n283) );
  INV_X1 U282 ( .A(n232), .ZN(n296) );
  INV_X1 U284 ( .A(n235), .ZN(n297) );
  INV_X1 U254 ( .A(n218), .ZN(n282) );
  INV_X1 U264 ( .A(n223), .ZN(n287) );
  INV_X1 U258 ( .A(n220), .ZN(n284) );
  INV_X1 U260 ( .A(n221), .ZN(n285) );
  INV_X1 U262 ( .A(n222), .ZN(n286) );
  INV_X1 U266 ( .A(n224), .ZN(n288) );
  AOI21_X1 U308 ( .B1(B_i[2]), .B2(B_i[1]), .A(n561), .ZN(n423) );
  NAND2_X1 U309 ( .A1(B_i[3]), .A2(B_i[4]), .ZN(n322) );
  NAND2_X1 U310 ( .A1(B_i[5]), .A2(n322), .ZN(n449) );
  INV_X1 U311 ( .A(n449), .ZN(n472) );
  INV_X1 U312 ( .A(n423), .ZN(n446) );
  OAI22_X1 U313 ( .A1(n423), .A2(n472), .B1(n449), .B2(n446), .ZN(n438) );
  INV_X1 U314 ( .A(n438), .ZN(n454) );
  OAI22_X1 U315 ( .A1(n321), .A2(n454), .B1(n438), .B2(B_i[1]), .ZN(n395) );
  INV_X1 U316 ( .A(n395), .ZN(n397) );
  NOR2_X1 U317 ( .A1(B_i[3]), .A2(B_i[4]), .ZN(n458) );
  AOI21_X1 U318 ( .B1(B_i[4]), .B2(B_i[3]), .A(n458), .ZN(n444) );
  INV_X1 U319 ( .A(n458), .ZN(n323) );
  AOI22_X1 U320 ( .A1(B_i[5]), .A2(n323), .B1(n322), .B2(n563), .ZN(n443) );
  AOI22_X1 U321 ( .A1(n444), .A2(A_i[3]), .B1(A_i[2]), .B2(n443), .ZN(n357) );
  INV_X1 U322 ( .A(n357), .ZN(n324) );
  AOI22_X1 U323 ( .A1(n397), .A2(n357), .B1(n324), .B2(n395), .ZN(n327) );
  NOR2_X1 U324 ( .A1(B_i[0]), .A2(n321), .ZN(n375) );
  AOI22_X1 U325 ( .A1(A_i[7]), .A2(B_i[0]), .B1(A_i[6]), .B2(n375), .ZN(n355)
         );
  AOI22_X1 U326 ( .A1(B_i[2]), .A2(B_i[1]), .B1(n321), .B2(n562), .ZN(n418) );
  NAND2_X1 U327 ( .A1(B_i[2]), .A2(B_i[1]), .ZN(n325) );
  NOR2_X1 U328 ( .A1(n561), .A2(B_i[1]), .ZN(n488) );
  INV_X1 U329 ( .A(n488), .ZN(n368) );
  OAI22_X1 U330 ( .A1(B_i[3]), .A2(n325), .B1(B_i[2]), .B2(n368), .ZN(n417) );
  AOI22_X1 U331 ( .A1(A_i[5]), .A2(n418), .B1(A_i[4]), .B2(n417), .ZN(n353) );
  XNOR2_X1 U332 ( .A(n355), .B(n353), .ZN(n326) );
  XNOR2_X1 U333 ( .A(n327), .B(n326), .ZN(n351) );
  AOI22_X1 U334 ( .A1(A_i[4]), .A2(n418), .B1(A_i[3]), .B2(n417), .ZN(n338) );
  XOR2_X1 U335 ( .A(n423), .B(n338), .Z(n332) );
  AOI22_X1 U336 ( .A1(A_i[6]), .A2(B_i[0]), .B1(A_i[5]), .B2(n375), .ZN(n336)
         );
  AND2_X1 U337 ( .A1(A_i[6]), .A2(B_i[0]), .ZN(n328) );
  AOI22_X1 U338 ( .A1(B_i[1]), .A2(n336), .B1(n328), .B2(n321), .ZN(n331) );
  AOI22_X1 U339 ( .A1(n444), .A2(A_i[2]), .B1(A_i[1]), .B2(n443), .ZN(n337) );
  OAI22_X1 U340 ( .A1(n331), .A2(n332), .B1(n472), .B2(n337), .ZN(n329) );
  AOI21_X1 U341 ( .B1(n472), .B2(n337), .A(n329), .ZN(n330) );
  AOI21_X1 U342 ( .B1(n332), .B2(n331), .A(n330), .ZN(n350) );
  AOI21_X1 U343 ( .B1(B_i[5]), .B2(B_i[6]), .A(n564), .ZN(n482) );
  INV_X1 U344 ( .A(n482), .ZN(n494) );
  NOR2_X1 U345 ( .A1(B_i[5]), .A2(B_i[6]), .ZN(n480) );
  AOI21_X1 U346 ( .B1(B_i[6]), .B2(B_i[5]), .A(n480), .ZN(n475) );
  INV_X1 U347 ( .A(n480), .ZN(n334) );
  NAND2_X1 U348 ( .A1(B_i[5]), .A2(B_i[6]), .ZN(n333) );
  AOI22_X1 U349 ( .A1(B_i[7]), .A2(n334), .B1(n333), .B2(n564), .ZN(n474) );
  AOI22_X1 U350 ( .A1(n475), .A2(A_i[1]), .B1(A_i[0]), .B2(n474), .ZN(n335) );
  XOR2_X1 U351 ( .A(n494), .B(n335), .Z(n349) );
  NAND2_X1 U352 ( .A1(n475), .A2(A_i[0]), .ZN(n405) );
  XOR2_X1 U353 ( .A(n482), .B(n405), .Z(n348) );
  XNOR2_X1 U354 ( .A(n395), .B(n336), .ZN(n340) );
  XNOR2_X1 U355 ( .A(n338), .B(n337), .ZN(n339) );
  XNOR2_X1 U356 ( .A(n340), .B(n339), .ZN(n403) );
  AOI22_X1 U357 ( .A1(A_i[5]), .A2(B_i[0]), .B1(A_i[4]), .B2(n375), .ZN(n388)
         );
  AND2_X1 U358 ( .A1(A_i[5]), .A2(B_i[0]), .ZN(n341) );
  AOI22_X1 U359 ( .A1(B_i[1]), .A2(n388), .B1(n341), .B2(n321), .ZN(n345) );
  AOI22_X1 U360 ( .A1(n444), .A2(A_i[1]), .B1(A_i[0]), .B2(n443), .ZN(n392) );
  XOR2_X1 U361 ( .A(n392), .B(n472), .Z(n344) );
  AOI22_X1 U362 ( .A1(n418), .A2(A_i[3]), .B1(A_i[2]), .B2(n417), .ZN(n390) );
  AOI22_X1 U363 ( .A1(n345), .A2(n344), .B1(n446), .B2(n390), .ZN(n342) );
  OAI21_X1 U364 ( .B1(n446), .B2(n390), .A(n342), .ZN(n343) );
  OAI21_X1 U365 ( .B1(n345), .B2(n344), .A(n343), .ZN(n402) );
  NAND2_X1 U366 ( .A1(n403), .A2(n402), .ZN(n347) );
  NOR2_X1 U367 ( .A1(n403), .A2(n402), .ZN(n346) );
  AOI21_X1 U368 ( .B1(n348), .B2(n347), .A(n346), .ZN(n498) );
  FA_X1 U369 ( .A(n351), .B(n350), .CI(n349), .CO(n413), .S(n499) );
  AOI22_X1 U370 ( .A1(n475), .A2(A_i[2]), .B1(A_i[1]), .B2(n474), .ZN(n352) );
  XOR2_X1 U371 ( .A(n494), .B(n352), .Z(n416) );
  XOR2_X1 U372 ( .A(n423), .B(n353), .Z(n360) );
  NOR2_X1 U373 ( .A1(n565), .A2(n560), .ZN(n354) );
  AOI22_X1 U374 ( .A1(B_i[1]), .A2(n355), .B1(n354), .B2(n321), .ZN(n359) );
  OAI22_X1 U375 ( .A1(n359), .A2(n360), .B1(n357), .B2(n472), .ZN(n356) );
  AOI21_X1 U376 ( .B1(n357), .B2(n472), .A(n356), .ZN(n358) );
  AOI21_X1 U377 ( .B1(n360), .B2(n359), .A(n358), .ZN(n415) );
  AOI22_X1 U378 ( .A1(n444), .A2(A_i[4]), .B1(A_i[3]), .B2(n443), .ZN(n426) );
  INV_X1 U379 ( .A(n426), .ZN(n361) );
  AOI22_X1 U380 ( .A1(n397), .A2(n426), .B1(n361), .B2(n395), .ZN(n364) );
  AOI21_X1 U381 ( .B1(n321), .B2(n560), .A(n565), .ZN(n362) );
  AOI22_X1 U382 ( .A1(A_i[6]), .A2(n418), .B1(A_i[5]), .B2(n417), .ZN(n422) );
  XNOR2_X1 U383 ( .A(n362), .B(n422), .ZN(n363) );
  XNOR2_X1 U384 ( .A(n364), .B(n363), .ZN(n414) );
  XNOR2_X1 U385 ( .A(n413), .B(n412), .ZN(n366) );
  AOI21_X1 U386 ( .B1(n499), .B2(n498), .A(n366), .ZN(n365) );
  INV_X1 U387 ( .A(n365), .ZN(n548) );
  NAND3_X1 U388 ( .A1(n498), .A2(n499), .A3(n366), .ZN(n546) );
  NAND2_X1 U389 ( .A1(n548), .A2(n546), .ZN(n521) );
  INV_X1 U390 ( .A(n521), .ZN(DP_OP_71J14_123_5612_n4) );
  NAND2_X1 U391 ( .A1(n418), .A2(A_i[0]), .ZN(n533) );
  INV_X1 U392 ( .A(n533), .ZN(n532) );
  AOI22_X1 U393 ( .A1(A_i[1]), .A2(n375), .B1(B_i[0]), .B2(A_i[2]), .ZN(n485)
         );
  AND2_X1 U394 ( .A1(B_i[0]), .A2(A_i[2]), .ZN(n367) );
  AOI22_X1 U395 ( .A1(B_i[1]), .A2(n485), .B1(n367), .B2(n321), .ZN(n534) );
  AOI221_X1 U396 ( .B1(n446), .B2(n533), .C1(n423), .C2(n532), .A(n534), .ZN(
        n491) );
  NOR2_X1 U397 ( .A1(B_i[2]), .A2(n561), .ZN(n487) );
  OAI21_X1 U398 ( .B1(n487), .B2(n321), .A(n368), .ZN(n410) );
  AOI22_X1 U399 ( .A1(n418), .A2(A_i[1]), .B1(A_i[0]), .B2(n417), .ZN(n374) );
  INV_X1 U400 ( .A(n374), .ZN(n373) );
  AOI22_X1 U401 ( .A1(A_i[3]), .A2(B_i[0]), .B1(n375), .B2(A_i[2]), .ZN(n371)
         );
  XOR2_X1 U402 ( .A(n373), .B(n371), .Z(n369) );
  XNOR2_X1 U403 ( .A(n410), .B(n369), .ZN(n490) );
  NAND2_X1 U404 ( .A1(n491), .A2(n490), .ZN(n407) );
  AND2_X1 U405 ( .A1(A_i[3]), .A2(B_i[0]), .ZN(n370) );
  AOI22_X1 U406 ( .A1(B_i[1]), .A2(n371), .B1(n370), .B2(n321), .ZN(n372) );
  AOI221_X1 U407 ( .B1(n446), .B2(n374), .C1(n423), .C2(n373), .A(n372), .ZN(
        n393) );
  AOI22_X1 U408 ( .A1(n418), .A2(A_i[2]), .B1(A_i[1]), .B2(n417), .ZN(n384) );
  NAND2_X1 U409 ( .A1(n444), .A2(A_i[0]), .ZN(n380) );
  AOI22_X1 U410 ( .A1(A_i[4]), .A2(B_i[0]), .B1(A_i[3]), .B2(n375), .ZN(n376)
         );
  INV_X1 U411 ( .A(n376), .ZN(n382) );
  XNOR2_X1 U412 ( .A(n380), .B(n382), .ZN(n377) );
  XOR2_X1 U413 ( .A(n384), .B(n377), .Z(n396) );
  XOR2_X1 U414 ( .A(n393), .B(n396), .Z(n408) );
  AOI22_X1 U415 ( .A1(n449), .A2(n407), .B1(n397), .B2(n408), .ZN(n378) );
  OAI21_X1 U416 ( .B1(n397), .B2(n408), .A(n378), .ZN(n379) );
  OAI21_X1 U417 ( .B1(n449), .B2(n407), .A(n379), .ZN(n539) );
  XOR2_X1 U418 ( .A(n449), .B(n380), .Z(n387) );
  NAND2_X1 U419 ( .A1(A_i[4]), .A2(B_i[0]), .ZN(n381) );
  AOI22_X1 U420 ( .A1(B_i[1]), .A2(n382), .B1(n381), .B2(n321), .ZN(n386) );
  AOI22_X1 U421 ( .A1(n387), .A2(n386), .B1(n423), .B2(n384), .ZN(n383) );
  OAI21_X1 U422 ( .B1(n423), .B2(n384), .A(n383), .ZN(n385) );
  OAI21_X1 U423 ( .B1(n387), .B2(n386), .A(n385), .ZN(n401) );
  XNOR2_X1 U424 ( .A(n397), .B(n388), .ZN(n389) );
  XNOR2_X1 U425 ( .A(n390), .B(n389), .ZN(n391) );
  XNOR2_X1 U426 ( .A(n392), .B(n391), .ZN(n400) );
  XNOR2_X1 U427 ( .A(n401), .B(n400), .ZN(n399) );
  INV_X1 U428 ( .A(n396), .ZN(n394) );
  OAI221_X1 U429 ( .B1(n397), .B2(n396), .C1(n395), .C2(n394), .A(n393), .ZN(
        n398) );
  XOR2_X1 U430 ( .A(n399), .B(n398), .Z(n538) );
  NOR2_X1 U431 ( .A1(n399), .A2(n398), .ZN(n492) );
  AOI21_X1 U432 ( .B1(n539), .B2(n538), .A(n492), .ZN(n406) );
  NOR2_X1 U433 ( .A1(n401), .A2(n400), .ZN(n497) );
  XNOR2_X1 U434 ( .A(n403), .B(n402), .ZN(n404) );
  XNOR2_X1 U435 ( .A(n405), .B(n404), .ZN(n496) );
  XNOR2_X1 U436 ( .A(n497), .B(n496), .ZN(n537) );
  XNOR2_X1 U437 ( .A(n406), .B(n537), .ZN(DP_OP_70J14_122_5612_n17) );
  XNOR2_X1 U438 ( .A(n538), .B(n539), .ZN(n504) );
  INV_X1 U439 ( .A(n504), .ZN(DP_OP_70J14_122_5612_n16) );
  XNOR2_X1 U440 ( .A(n408), .B(n407), .ZN(n409) );
  XOR2_X1 U441 ( .A(n410), .B(n409), .Z(n505) );
  INV_X1 U442 ( .A(n505), .ZN(DP_OP_70J14_122_5612_n4) );
  NOR2_X1 U443 ( .A1(n504), .A2(n505), .ZN(n503) );
  NAND3_X1 U444 ( .A1(DP_OP_70J14_122_5612_n16), .A2(DP_OP_70J14_122_5612_n17), 
        .A3(DP_OP_70J14_122_5612_n4), .ZN(n502) );
  OAI21_X1 U445 ( .B1(n503), .B2(DP_OP_70J14_122_5612_n17), .A(n502), .ZN(n411) );
  INV_X1 U446 ( .A(n411), .ZN(mul_final_add_sum_gen_carry_select_int_1_S1[2])
         );
  NOR2_X1 U447 ( .A1(n413), .A2(n412), .ZN(n551) );
  FA_X1 U448 ( .A(n416), .B(n415), .CI(n414), .CO(n431), .S(n412) );
  AOI22_X1 U449 ( .A1(A_i[7]), .A2(n418), .B1(A_i[6]), .B2(n417), .ZN(n441) );
  AOI22_X1 U450 ( .A1(n444), .A2(A_i[5]), .B1(A_i[4]), .B2(n443), .ZN(n440) );
  INV_X1 U451 ( .A(n440), .ZN(n419) );
  AOI22_X1 U452 ( .A1(n440), .A2(n438), .B1(n454), .B2(n419), .ZN(n420) );
  XNOR2_X1 U453 ( .A(n441), .B(n420), .ZN(n434) );
  AOI22_X1 U454 ( .A1(n475), .A2(A_i[3]), .B1(A_i[2]), .B2(n474), .ZN(n421) );
  XOR2_X1 U455 ( .A(n494), .B(n421), .Z(n433) );
  XOR2_X1 U456 ( .A(n423), .B(n422), .Z(n429) );
  OAI33_X1 U458 ( .A1(1'b0), .A2(A_i[7]), .A3(n321), .B1(B_i[1]), .B2(n565), 
        .B3(n560), .ZN(n428) );
  OAI22_X1 U459 ( .A1(n428), .A2(n429), .B1(n426), .B2(n472), .ZN(n425) );
  AOI21_X1 U460 ( .B1(n426), .B2(n472), .A(n425), .ZN(n427) );
  AOI21_X1 U461 ( .B1(n429), .B2(n428), .A(n427), .ZN(n432) );
  NOR2_X1 U462 ( .A1(n430), .A2(n431), .ZN(n555) );
  AOI21_X1 U463 ( .B1(n431), .B2(n430), .A(n555), .ZN(n549) );
  INV_X1 U464 ( .A(n522), .ZN(DP_OP_71J14_123_5612_n17) );
  FA_X1 U465 ( .A(n434), .B(n433), .CI(n432), .CO(n513), .S(n430) );
  AOI22_X1 U466 ( .A1(n475), .A2(A_i[4]), .B1(A_i[3]), .B2(n474), .ZN(n435) );
  XOR2_X1 U467 ( .A(n435), .B(n482), .Z(n457) );
  AOI22_X1 U468 ( .A1(n444), .A2(A_i[6]), .B1(A_i[5]), .B2(n443), .ZN(n448) );
  AOI221_X1 U469 ( .B1(B_i[2]), .B2(n321), .C1(n561), .C2(B_i[1]), .A(n487), 
        .ZN(n436) );
  NOR2_X1 U470 ( .A1(n436), .A2(n565), .ZN(n447) );
  XOR2_X1 U471 ( .A(n448), .B(n447), .Z(n453) );
  XOR2_X1 U472 ( .A(n457), .B(n453), .Z(n437) );
  XOR2_X1 U473 ( .A(n438), .B(n437), .Z(n442) );
  AOI22_X1 U474 ( .A1(n446), .A2(n441), .B1(n449), .B2(n440), .ZN(n439) );
  OAI221_X1 U475 ( .B1(n446), .B2(n441), .C1(n449), .C2(n440), .A(n439), .ZN(
        n456) );
  XNOR2_X1 U476 ( .A(n442), .B(n456), .ZN(n512) );
  XNOR2_X1 U477 ( .A(n513), .B(n512), .ZN(n554) );
  FA_X1 U478 ( .A(n551), .B(n546), .CI(n549), .CO(n514), .S(n522) );
  INV_X1 U479 ( .A(n519), .ZN(DP_OP_71J14_123_5612_n18) );
  AOI22_X1 U480 ( .A1(A_i[7]), .A2(n444), .B1(A_i[6]), .B2(n443), .ZN(n464) );
  AOI22_X1 U481 ( .A1(n472), .A2(n482), .B1(n494), .B2(n449), .ZN(n461) );
  XOR2_X1 U482 ( .A(n464), .B(n461), .Z(n451) );
  OAI22_X1 U483 ( .A1(n449), .A2(n448), .B1(n446), .B2(n447), .ZN(n445) );
  AOI221_X1 U484 ( .B1(n449), .B2(n448), .C1(n447), .C2(n446), .A(n445), .ZN(
        n467) );
  AOI22_X1 U485 ( .A1(A_i[5]), .A2(n475), .B1(A_i[4]), .B2(n474), .ZN(n462) );
  XNOR2_X1 U486 ( .A(n467), .B(n462), .ZN(n450) );
  XNOR2_X1 U487 ( .A(n451), .B(n450), .ZN(n507) );
  AOI22_X1 U488 ( .A1(n457), .A2(n456), .B1(n454), .B2(n453), .ZN(n452) );
  OAI21_X1 U489 ( .B1(n454), .B2(n453), .A(n452), .ZN(n455) );
  OAI21_X1 U490 ( .B1(n457), .B2(n456), .A(n455), .ZN(n508) );
  NOR2_X1 U491 ( .A1(n507), .A2(n508), .ZN(n506) );
  AOI22_X1 U492 ( .A1(A_i[6]), .A2(n475), .B1(A_i[5]), .B2(n474), .ZN(n470) );
  NOR2_X1 U493 ( .A1(B_i[5]), .A2(n458), .ZN(n473) );
  OAI21_X1 U494 ( .B1(n472), .B2(n473), .A(A_i[7]), .ZN(n459) );
  XNOR2_X1 U495 ( .A(n470), .B(n459), .ZN(n460) );
  XNOR2_X1 U496 ( .A(n461), .B(n460), .ZN(n469) );
  XOR2_X1 U497 ( .A(n462), .B(n494), .Z(n466) );
  AOI22_X1 U498 ( .A1(n467), .A2(n466), .B1(n472), .B2(n464), .ZN(n463) );
  OAI21_X1 U499 ( .B1(n472), .B2(n464), .A(n463), .ZN(n465) );
  OAI21_X1 U500 ( .B1(n467), .B2(n466), .A(n465), .ZN(n468) );
  INV_X1 U501 ( .A(n528), .ZN(DP_OP_72J14_124_2857_n4) );
  FA_X1 U502 ( .A(n506), .B(n469), .CI(n468), .CO(n483), .S(n528) );
  XOR2_X1 U503 ( .A(n470), .B(n482), .Z(n471) );
  AOI221_X1 U504 ( .B1(n473), .B2(A_i[7]), .C1(n472), .C2(n565), .A(n471), 
        .ZN(n478) );
  AOI22_X1 U505 ( .A1(A_i[7]), .A2(n475), .B1(A_i[6]), .B2(n474), .ZN(n476) );
  XOR2_X1 U506 ( .A(n494), .B(n476), .Z(n477) );
  NOR2_X1 U507 ( .A1(n478), .A2(n477), .ZN(n484) );
  AOI21_X1 U508 ( .B1(n478), .B2(n477), .A(n484), .ZN(n479) );
  XNOR2_X1 U509 ( .A(n483), .B(n479), .ZN(n527) );
  INV_X1 U510 ( .A(n527), .ZN(DP_OP_72J14_124_2857_n16) );
  OAI21_X1 U511 ( .B1(n480), .B2(B_i[7]), .A(A_i[7]), .ZN(n481) );
  OAI21_X1 U512 ( .B1(A_i[7]), .B2(n482), .A(n481), .ZN(n524) );
  NAND2_X1 U513 ( .A1(n484), .A2(n483), .ZN(n523) );
  NAND2_X1 U514 ( .A1(n524), .A2(n523), .ZN(DP_OP_72J14_124_2857_n18) );
  AOI211_X1 U515 ( .C1(A_i[1]), .C2(B_i[0]), .A(A_i[0]), .B(n321), .ZN(n205)
         );
  INV_X1 U516 ( .A(n534), .ZN(n531) );
  AND2_X1 U517 ( .A1(n531), .A2(n205), .ZN(n209) );
  XOR2_X1 U518 ( .A(n485), .B(n532), .Z(n489) );
  NOR2_X1 U519 ( .A1(n489), .A2(n488), .ZN(n486) );
  AOI221_X1 U520 ( .B1(n489), .B2(n488), .C1(n487), .C2(n486), .A(n209), .ZN(
        n536) );
  XNOR2_X1 U521 ( .A(n491), .B(n490), .ZN(n535) );
  NOR2_X1 U522 ( .A1(n536), .A2(n535), .ZN(n188) );
  NAND2_X1 U523 ( .A1(n492), .A2(n537), .ZN(n541) );
  NAND3_X1 U524 ( .A1(n538), .A2(n537), .A3(n539), .ZN(n493) );
  NAND2_X1 U525 ( .A1(n541), .A2(n493), .ZN(n501) );
  NAND2_X1 U526 ( .A1(n496), .A2(n494), .ZN(n495) );
  OAI21_X1 U527 ( .B1(n497), .B2(n496), .A(n495), .ZN(n543) );
  XNOR2_X1 U528 ( .A(n499), .B(n498), .ZN(n545) );
  XNOR2_X1 U529 ( .A(n543), .B(n545), .ZN(n500) );
  XNOR2_X1 U530 ( .A(n501), .B(n500), .ZN(DP_OP_70J14_122_5612_n18) );
  XNOR2_X1 U531 ( .A(n502), .B(DP_OP_70J14_122_5612_n18), .ZN(
        mul_final_add_sum_gen_carry_select_int_1_S1[3]) );
  AOI21_X1 U532 ( .B1(n505), .B2(n504), .A(n503), .ZN(
        mul_final_add_sum_gen_carry_select_int_1_S1[1]) );
  AOI21_X1 U533 ( .B1(n508), .B2(n507), .A(n506), .ZN(n510) );
  NAND2_X1 U534 ( .A1(n513), .A2(n512), .ZN(n509) );
  NOR2_X1 U535 ( .A1(n510), .A2(n509), .ZN(n557) );
  INV_X1 U536 ( .A(n510), .ZN(n511) );
  AOI21_X1 U537 ( .B1(n513), .B2(n512), .A(n511), .ZN(n556) );
  NOR2_X1 U538 ( .A1(n557), .A2(n556), .ZN(n516) );
  FA_X1 U539 ( .A(n555), .B(n554), .CI(n514), .CO(n515), .S(n519) );
  XNOR2_X1 U540 ( .A(n516), .B(n515), .ZN(DP_OP_71J14_123_5612_n19) );
  NOR3_X1 U541 ( .A1(n521), .A2(n522), .A3(n519), .ZN(n517) );
  XOR2_X1 U542 ( .A(n517), .B(DP_OP_71J14_123_5612_n19), .Z(
        mul_final_add_sum_gen_carry_select_int_2_S1[3]) );
  NOR2_X1 U543 ( .A1(n521), .A2(n522), .ZN(n520) );
  INV_X1 U544 ( .A(n520), .ZN(n518) );
  AOI21_X1 U545 ( .B1(n519), .B2(n518), .A(n517), .ZN(
        mul_final_add_sum_gen_carry_select_int_2_S1[2]) );
  AOI21_X1 U546 ( .B1(n522), .B2(n521), .A(n520), .ZN(
        mul_final_add_sum_gen_carry_select_int_2_S1[1]) );
  XOR2_X1 U547 ( .A(n524), .B(n523), .Z(DP_OP_72J14_124_2857_n17) );
  NOR2_X1 U548 ( .A1(n528), .A2(n527), .ZN(n526) );
  INV_X1 U549 ( .A(DP_OP_72J14_124_2857_n18), .ZN(n525) );
  AOI21_X1 U550 ( .B1(n526), .B2(DP_OP_72J14_124_2857_n17), .A(n525), .ZN(
        mul_final_add_sum_gen_carry_select_int_3_S1[3]) );
  XOR2_X1 U551 ( .A(n526), .B(DP_OP_72J14_124_2857_n17), .Z(
        mul_final_add_sum_gen_carry_select_int_3_S1[2]) );
  AOI21_X1 U552 ( .B1(n528), .B2(n527), .A(n526), .ZN(
        mul_final_add_sum_gen_carry_select_int_3_S1[1]) );
  NAND2_X1 U553 ( .A1(A_i[1]), .A2(B_i[0]), .ZN(n530) );
  NAND2_X1 U554 ( .A1(B_i[1]), .A2(A_i[0]), .ZN(n529) );
  XNOR2_X1 U555 ( .A(n530), .B(n529), .ZN(n213) );
  AOI22_X1 U556 ( .A1(n534), .A2(n533), .B1(n532), .B2(n531), .ZN(n206) );
  XNOR2_X1 U557 ( .A(n536), .B(n535), .ZN(n201) );
  AND2_X1 U558 ( .A1(DP_OP_70J14_122_5612_n4), .A2(n188), .ZN(n540) );
  OAI211_X1 U559 ( .C1(n540), .C2(n539), .A(n538), .B(n537), .ZN(n542) );
  AND3_X1 U560 ( .A1(n543), .A2(n541), .A3(n542), .ZN(n544) );
  OAI22_X1 U561 ( .A1(n545), .A2(n544), .B1(n543), .B2(n542), .ZN(n180) );
  INV_X1 U562 ( .A(n546), .ZN(n547) );
  AOI21_X1 U563 ( .B1(n180), .B2(n548), .A(n547), .ZN(n550) );
  OAI222_X1 U564 ( .A1(n551), .A2(n550), .B1(n551), .B2(n549), .C1(n550), .C2(
        n549), .ZN(n552) );
  INV_X1 U565 ( .A(n552), .ZN(n553) );
  AOI222_X1 U566 ( .A1(n555), .A2(n554), .B1(n555), .B2(n553), .C1(n554), .C2(
        n553), .ZN(n559) );
  INV_X1 U567 ( .A(n556), .ZN(n558) );
  AOI21_X1 U568 ( .B1(n559), .B2(n558), .A(n557), .ZN(n172) );
endmodule

