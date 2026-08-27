/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : W-2024.09-SP2
// Date      : Thu Aug 27 03:30:48 2026
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
         n291, n292, n293, n294, n295, n296, n297, DP_OP_72J18_124_2857_n18,
         DP_OP_72J18_124_2857_n17, DP_OP_72J18_124_2857_n16,
         DP_OP_72J18_124_2857_n4, DP_OP_71J18_123_5612_n19,
         DP_OP_71J18_123_5612_n18, DP_OP_71J18_123_5612_n17,
         DP_OP_71J18_123_5612_n4, DP_OP_70J18_122_5612_n18,
         DP_OP_70J18_122_5612_n17, DP_OP_70J18_122_5612_n16,
         DP_OP_70J18_122_5612_n4, n321, n322, n323, n324, n325, n326, n327,
         n328, n329, n330, n331, n332, n333, n334, n335, n336, n337, n338,
         n339, n340, n341, n342, n343, n344, n345, n346, n347, n348, n349,
         n350, n351, n352, n353, n354, n355, n356, n357, n358, n359, n360,
         n361, n362, n363, n364, n365, n366, n367, n368, n369, n370, n371,
         n372, n373, n374, n375, n376, n377, n378, n379, n380, n381, n382,
         n383, n384, n385, n386, n387, n388, n389, n390, n391, n392, n393,
         n394, n395, n396, n397, n398, n399, n400, n401, n402, n403, n404,
         n405, n406, n407, n408, n409, n410, n411, n412, n413, n414, n415,
         n416, n417, n418, n419, n420, n421, n422, n424, n425, n426, n427,
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
        .C1(n177), .C2(DP_OP_72J18_124_2857_n18), .ZN(n173) );
  AOI222_X1 U207 ( .A1(n176), .A2(
        mul_final_add_sum_gen_carry_select_int_3_S1[2]), .B1(n233), .B2(P[14]), 
        .C1(n177), .C2(DP_OP_72J18_124_2857_n17), .ZN(n174) );
  AOI222_X1 U209 ( .A1(n176), .A2(
        mul_final_add_sum_gen_carry_select_int_3_S1[1]), .B1(n233), .B2(P[13]), 
        .C1(n177), .C2(DP_OP_72J18_124_2857_n16), .ZN(n175) );
  AOI22_X1 U212 ( .A1(n233), .A2(P[12]), .B1(n177), .B2(
        DP_OP_72J18_124_2857_n4), .ZN(n178) );
  OAI21_X1 U213 ( .B1(DP_OP_72J18_124_2857_n4), .B2(n179), .A(n178), .ZN(n269)
         );
  NOR2_X1 U214 ( .A1(n214), .A2(n180), .ZN(n185) );
  NAND2_X1 U215 ( .A1(n180), .A2(n234), .ZN(n187) );
  AOI222_X1 U217 ( .A1(n233), .A2(P[11]), .B1(n185), .B2(
        DP_OP_71J18_123_5612_n19), .C1(n183), .C2(
        mul_final_add_sum_gen_carry_select_int_2_S1[3]), .ZN(n181) );
  AOI222_X1 U219 ( .A1(n233), .A2(P[10]), .B1(n185), .B2(
        DP_OP_71J18_123_5612_n18), .C1(n183), .C2(
        mul_final_add_sum_gen_carry_select_int_2_S1[2]), .ZN(n182) );
  AOI222_X1 U221 ( .A1(n233), .A2(P[9]), .B1(n185), .B2(
        DP_OP_71J18_123_5612_n17), .C1(n183), .C2(
        mul_final_add_sum_gen_carry_select_int_2_S1[1]), .ZN(n184) );
  AOI22_X1 U223 ( .A1(n233), .A2(P[8]), .B1(n185), .B2(DP_OP_71J18_123_5612_n4), .ZN(n186) );
  OAI21_X1 U224 ( .B1(DP_OP_71J18_123_5612_n4), .B2(n187), .A(n186), .ZN(n273)
         );
  NAND2_X1 U225 ( .A1(n234), .A2(n188), .ZN(n195) );
  NOR2_X1 U227 ( .A1(n188), .A2(n214), .ZN(n193) );
  AOI222_X1 U228 ( .A1(n233), .A2(P[7]), .B1(n191), .B2(
        mul_final_add_sum_gen_carry_select_int_1_S1[3]), .C1(n193), .C2(
        DP_OP_70J18_122_5612_n18), .ZN(n189) );
  AOI222_X1 U230 ( .A1(n233), .A2(P[6]), .B1(n191), .B2(
        mul_final_add_sum_gen_carry_select_int_1_S1[2]), .C1(n193), .C2(
        DP_OP_70J18_122_5612_n17), .ZN(n190) );
  AOI222_X1 U232 ( .A1(n233), .A2(P[5]), .B1(n191), .B2(
        mul_final_add_sum_gen_carry_select_int_1_S1[1]), .C1(n193), .C2(
        DP_OP_70J18_122_5612_n16), .ZN(n192) );
  AOI22_X1 U234 ( .A1(P[4]), .A2(n233), .B1(n193), .B2(DP_OP_70J18_122_5612_n4), .ZN(n194) );
  OAI21_X1 U235 ( .B1(DP_OP_70J18_122_5612_n4), .B2(n195), .A(n194), .ZN(n277)
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
  DFF_X1 B_reg_Y_temp_reg_1_ ( .D(n288), .CK(CLK), .Q(B_i[1]), .QN(n559) );
  NAND2_X1 U175 ( .A1(LD), .A2(n148), .ZN(n214) );
  NOR2_X2 U201 ( .A1(RST), .A2(LD), .ZN(n233) );
  INV_X1 U202 ( .A(n214), .ZN(n234) );
  AND2_X1 U203 ( .A1(n172), .A2(n234), .ZN(n177) );
  INV_X1 U208 ( .A(n174), .ZN(n267) );
  INV_X1 U205 ( .A(n173), .ZN(n265) );
  INV_X1 U210 ( .A(n175), .ZN(n268) );
  INV_X1 U211 ( .A(n176), .ZN(n179) );
  INV_X1 U216 ( .A(n187), .ZN(n183) );
  INV_X1 U218 ( .A(n181), .ZN(n270) );
  INV_X1 U220 ( .A(n182), .ZN(n271) );
  INV_X1 U222 ( .A(n184), .ZN(n272) );
  INV_X1 U226 ( .A(n195), .ZN(n191) );
  INV_X1 U231 ( .A(n190), .ZN(n275) );
  INV_X1 U229 ( .A(n189), .ZN(n274) );
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
  AOI21_X1 U308 ( .B1(B_i[2]), .B2(B_i[1]), .A(n561), .ZN(n422) );
  NAND2_X1 U309 ( .A1(B_i[3]), .A2(B_i[4]), .ZN(n321) );
  NAND2_X1 U310 ( .A1(B_i[5]), .A2(n321), .ZN(n448) );
  INV_X1 U311 ( .A(n448), .ZN(n471) );
  INV_X1 U312 ( .A(n422), .ZN(n445) );
  OAI22_X1 U313 ( .A1(n422), .A2(n471), .B1(n448), .B2(n445), .ZN(n437) );
  INV_X1 U314 ( .A(n437), .ZN(n453) );
  OAI22_X1 U315 ( .A1(n559), .A2(n453), .B1(n437), .B2(B_i[1]), .ZN(n394) );
  INV_X1 U316 ( .A(n394), .ZN(n396) );
  NOR2_X1 U317 ( .A1(B_i[3]), .A2(B_i[4]), .ZN(n457) );
  AOI21_X1 U318 ( .B1(B_i[4]), .B2(B_i[3]), .A(n457), .ZN(n443) );
  INV_X1 U319 ( .A(n457), .ZN(n322) );
  AOI22_X1 U320 ( .A1(B_i[5]), .A2(n322), .B1(n321), .B2(n563), .ZN(n442) );
  AOI22_X1 U321 ( .A1(n443), .A2(A_i[3]), .B1(A_i[2]), .B2(n442), .ZN(n356) );
  INV_X1 U322 ( .A(n356), .ZN(n323) );
  AOI22_X1 U323 ( .A1(n396), .A2(n356), .B1(n323), .B2(n394), .ZN(n326) );
  NOR2_X1 U324 ( .A1(B_i[0]), .A2(n559), .ZN(n374) );
  AOI22_X1 U325 ( .A1(A_i[7]), .A2(B_i[0]), .B1(A_i[6]), .B2(n374), .ZN(n354)
         );
  AOI22_X1 U326 ( .A1(B_i[2]), .A2(B_i[1]), .B1(n559), .B2(n562), .ZN(n417) );
  NAND2_X1 U327 ( .A1(B_i[2]), .A2(B_i[1]), .ZN(n324) );
  NOR2_X1 U328 ( .A1(n561), .A2(B_i[1]), .ZN(n487) );
  INV_X1 U329 ( .A(n487), .ZN(n367) );
  OAI22_X1 U330 ( .A1(B_i[3]), .A2(n324), .B1(B_i[2]), .B2(n367), .ZN(n416) );
  AOI22_X1 U331 ( .A1(A_i[5]), .A2(n417), .B1(A_i[4]), .B2(n416), .ZN(n352) );
  XNOR2_X1 U332 ( .A(n354), .B(n352), .ZN(n325) );
  XNOR2_X1 U333 ( .A(n326), .B(n325), .ZN(n350) );
  AOI22_X1 U334 ( .A1(A_i[4]), .A2(n417), .B1(A_i[3]), .B2(n416), .ZN(n337) );
  XOR2_X1 U335 ( .A(n422), .B(n337), .Z(n331) );
  AOI22_X1 U336 ( .A1(A_i[6]), .A2(B_i[0]), .B1(A_i[5]), .B2(n374), .ZN(n335)
         );
  AND2_X1 U337 ( .A1(A_i[6]), .A2(B_i[0]), .ZN(n327) );
  AOI22_X1 U338 ( .A1(B_i[1]), .A2(n335), .B1(n327), .B2(n559), .ZN(n330) );
  AOI22_X1 U339 ( .A1(n443), .A2(A_i[2]), .B1(A_i[1]), .B2(n442), .ZN(n336) );
  OAI22_X1 U340 ( .A1(n330), .A2(n331), .B1(n471), .B2(n336), .ZN(n328) );
  AOI21_X1 U341 ( .B1(n471), .B2(n336), .A(n328), .ZN(n329) );
  AOI21_X1 U342 ( .B1(n331), .B2(n330), .A(n329), .ZN(n349) );
  AOI21_X1 U343 ( .B1(B_i[5]), .B2(B_i[6]), .A(n564), .ZN(n481) );
  INV_X1 U344 ( .A(n481), .ZN(n493) );
  NOR2_X1 U345 ( .A1(B_i[5]), .A2(B_i[6]), .ZN(n479) );
  AOI21_X1 U346 ( .B1(B_i[6]), .B2(B_i[5]), .A(n479), .ZN(n474) );
  INV_X1 U347 ( .A(n479), .ZN(n333) );
  NAND2_X1 U348 ( .A1(B_i[5]), .A2(B_i[6]), .ZN(n332) );
  AOI22_X1 U349 ( .A1(B_i[7]), .A2(n333), .B1(n332), .B2(n564), .ZN(n473) );
  AOI22_X1 U350 ( .A1(n474), .A2(A_i[1]), .B1(A_i[0]), .B2(n473), .ZN(n334) );
  XOR2_X1 U351 ( .A(n493), .B(n334), .Z(n348) );
  NAND2_X1 U352 ( .A1(n474), .A2(A_i[0]), .ZN(n404) );
  XOR2_X1 U353 ( .A(n481), .B(n404), .Z(n347) );
  XNOR2_X1 U354 ( .A(n394), .B(n335), .ZN(n339) );
  XNOR2_X1 U355 ( .A(n337), .B(n336), .ZN(n338) );
  XNOR2_X1 U356 ( .A(n339), .B(n338), .ZN(n402) );
  AOI22_X1 U357 ( .A1(A_i[5]), .A2(B_i[0]), .B1(A_i[4]), .B2(n374), .ZN(n387)
         );
  AND2_X1 U358 ( .A1(A_i[5]), .A2(B_i[0]), .ZN(n340) );
  AOI22_X1 U359 ( .A1(B_i[1]), .A2(n387), .B1(n340), .B2(n559), .ZN(n344) );
  AOI22_X1 U360 ( .A1(n443), .A2(A_i[1]), .B1(A_i[0]), .B2(n442), .ZN(n391) );
  XOR2_X1 U361 ( .A(n391), .B(n471), .Z(n343) );
  AOI22_X1 U362 ( .A1(n417), .A2(A_i[3]), .B1(A_i[2]), .B2(n416), .ZN(n389) );
  AOI22_X1 U363 ( .A1(n344), .A2(n343), .B1(n445), .B2(n389), .ZN(n341) );
  OAI21_X1 U364 ( .B1(n445), .B2(n389), .A(n341), .ZN(n342) );
  OAI21_X1 U365 ( .B1(n344), .B2(n343), .A(n342), .ZN(n401) );
  NAND2_X1 U366 ( .A1(n402), .A2(n401), .ZN(n346) );
  NOR2_X1 U367 ( .A1(n402), .A2(n401), .ZN(n345) );
  AOI21_X1 U368 ( .B1(n347), .B2(n346), .A(n345), .ZN(n497) );
  FA_X1 U369 ( .A(n350), .B(n349), .CI(n348), .CO(n412), .S(n498) );
  AOI22_X1 U370 ( .A1(n474), .A2(A_i[2]), .B1(A_i[1]), .B2(n473), .ZN(n351) );
  XOR2_X1 U371 ( .A(n493), .B(n351), .Z(n415) );
  XOR2_X1 U372 ( .A(n422), .B(n352), .Z(n359) );
  NOR2_X1 U373 ( .A1(n565), .A2(n560), .ZN(n353) );
  AOI22_X1 U374 ( .A1(B_i[1]), .A2(n354), .B1(n353), .B2(n559), .ZN(n358) );
  OAI22_X1 U375 ( .A1(n358), .A2(n359), .B1(n356), .B2(n471), .ZN(n355) );
  AOI21_X1 U376 ( .B1(n356), .B2(n471), .A(n355), .ZN(n357) );
  AOI21_X1 U377 ( .B1(n359), .B2(n358), .A(n357), .ZN(n414) );
  AOI22_X1 U378 ( .A1(n443), .A2(A_i[4]), .B1(A_i[3]), .B2(n442), .ZN(n425) );
  INV_X1 U379 ( .A(n425), .ZN(n360) );
  AOI22_X1 U380 ( .A1(n396), .A2(n425), .B1(n360), .B2(n394), .ZN(n363) );
  AOI21_X1 U381 ( .B1(n559), .B2(n560), .A(n565), .ZN(n361) );
  AOI22_X1 U382 ( .A1(A_i[6]), .A2(n417), .B1(A_i[5]), .B2(n416), .ZN(n421) );
  XNOR2_X1 U383 ( .A(n361), .B(n421), .ZN(n362) );
  XNOR2_X1 U384 ( .A(n363), .B(n362), .ZN(n413) );
  XNOR2_X1 U385 ( .A(n412), .B(n411), .ZN(n365) );
  AOI21_X1 U386 ( .B1(n498), .B2(n497), .A(n365), .ZN(n364) );
  INV_X1 U387 ( .A(n364), .ZN(n547) );
  NAND3_X1 U388 ( .A1(n497), .A2(n498), .A3(n365), .ZN(n545) );
  NAND2_X1 U389 ( .A1(n547), .A2(n545), .ZN(n520) );
  INV_X1 U390 ( .A(n520), .ZN(DP_OP_71J18_123_5612_n4) );
  NAND2_X1 U391 ( .A1(n417), .A2(A_i[0]), .ZN(n532) );
  INV_X1 U392 ( .A(n532), .ZN(n531) );
  AOI22_X1 U393 ( .A1(A_i[1]), .A2(n374), .B1(B_i[0]), .B2(A_i[2]), .ZN(n484)
         );
  AND2_X1 U394 ( .A1(B_i[0]), .A2(A_i[2]), .ZN(n366) );
  AOI22_X1 U395 ( .A1(B_i[1]), .A2(n484), .B1(n366), .B2(n559), .ZN(n533) );
  AOI221_X1 U396 ( .B1(n445), .B2(n532), .C1(n422), .C2(n531), .A(n533), .ZN(
        n490) );
  NOR2_X1 U397 ( .A1(B_i[2]), .A2(n561), .ZN(n486) );
  OAI21_X1 U398 ( .B1(n486), .B2(n559), .A(n367), .ZN(n409) );
  AOI22_X1 U399 ( .A1(n417), .A2(A_i[1]), .B1(A_i[0]), .B2(n416), .ZN(n373) );
  INV_X1 U400 ( .A(n373), .ZN(n372) );
  AOI22_X1 U401 ( .A1(A_i[3]), .A2(B_i[0]), .B1(n374), .B2(A_i[2]), .ZN(n370)
         );
  XOR2_X1 U402 ( .A(n372), .B(n370), .Z(n368) );
  XNOR2_X1 U403 ( .A(n409), .B(n368), .ZN(n489) );
  NAND2_X1 U404 ( .A1(n490), .A2(n489), .ZN(n406) );
  AND2_X1 U405 ( .A1(A_i[3]), .A2(B_i[0]), .ZN(n369) );
  AOI22_X1 U406 ( .A1(B_i[1]), .A2(n370), .B1(n369), .B2(n559), .ZN(n371) );
  AOI221_X1 U407 ( .B1(n445), .B2(n373), .C1(n422), .C2(n372), .A(n371), .ZN(
        n392) );
  AOI22_X1 U408 ( .A1(n417), .A2(A_i[2]), .B1(A_i[1]), .B2(n416), .ZN(n383) );
  NAND2_X1 U409 ( .A1(n443), .A2(A_i[0]), .ZN(n379) );
  AOI22_X1 U410 ( .A1(A_i[4]), .A2(B_i[0]), .B1(A_i[3]), .B2(n374), .ZN(n375)
         );
  INV_X1 U411 ( .A(n375), .ZN(n381) );
  XNOR2_X1 U412 ( .A(n379), .B(n381), .ZN(n376) );
  XOR2_X1 U413 ( .A(n383), .B(n376), .Z(n395) );
  XOR2_X1 U414 ( .A(n392), .B(n395), .Z(n407) );
  AOI22_X1 U415 ( .A1(n448), .A2(n406), .B1(n396), .B2(n407), .ZN(n377) );
  OAI21_X1 U416 ( .B1(n396), .B2(n407), .A(n377), .ZN(n378) );
  OAI21_X1 U417 ( .B1(n448), .B2(n406), .A(n378), .ZN(n538) );
  XOR2_X1 U418 ( .A(n448), .B(n379), .Z(n386) );
  NAND2_X1 U419 ( .A1(A_i[4]), .A2(B_i[0]), .ZN(n380) );
  AOI22_X1 U420 ( .A1(B_i[1]), .A2(n381), .B1(n380), .B2(n559), .ZN(n385) );
  AOI22_X1 U421 ( .A1(n386), .A2(n385), .B1(n422), .B2(n383), .ZN(n382) );
  OAI21_X1 U422 ( .B1(n422), .B2(n383), .A(n382), .ZN(n384) );
  OAI21_X1 U423 ( .B1(n386), .B2(n385), .A(n384), .ZN(n400) );
  XNOR2_X1 U424 ( .A(n396), .B(n387), .ZN(n388) );
  XNOR2_X1 U425 ( .A(n389), .B(n388), .ZN(n390) );
  XNOR2_X1 U426 ( .A(n391), .B(n390), .ZN(n399) );
  XNOR2_X1 U427 ( .A(n400), .B(n399), .ZN(n398) );
  INV_X1 U428 ( .A(n395), .ZN(n393) );
  OAI221_X1 U429 ( .B1(n396), .B2(n395), .C1(n394), .C2(n393), .A(n392), .ZN(
        n397) );
  XOR2_X1 U430 ( .A(n398), .B(n397), .Z(n537) );
  NOR2_X1 U431 ( .A1(n398), .A2(n397), .ZN(n491) );
  AOI21_X1 U432 ( .B1(n538), .B2(n537), .A(n491), .ZN(n405) );
  NOR2_X1 U433 ( .A1(n400), .A2(n399), .ZN(n496) );
  XNOR2_X1 U434 ( .A(n402), .B(n401), .ZN(n403) );
  XNOR2_X1 U435 ( .A(n404), .B(n403), .ZN(n495) );
  XNOR2_X1 U436 ( .A(n496), .B(n495), .ZN(n536) );
  XNOR2_X1 U437 ( .A(n405), .B(n536), .ZN(DP_OP_70J18_122_5612_n17) );
  XNOR2_X1 U438 ( .A(n537), .B(n538), .ZN(n503) );
  INV_X1 U439 ( .A(n503), .ZN(DP_OP_70J18_122_5612_n16) );
  XNOR2_X1 U440 ( .A(n407), .B(n406), .ZN(n408) );
  XOR2_X1 U441 ( .A(n409), .B(n408), .Z(n504) );
  INV_X1 U442 ( .A(n504), .ZN(DP_OP_70J18_122_5612_n4) );
  NOR2_X1 U443 ( .A1(n503), .A2(n504), .ZN(n502) );
  NAND3_X1 U444 ( .A1(DP_OP_70J18_122_5612_n16), .A2(DP_OP_70J18_122_5612_n17), 
        .A3(DP_OP_70J18_122_5612_n4), .ZN(n501) );
  OAI21_X1 U445 ( .B1(n502), .B2(DP_OP_70J18_122_5612_n17), .A(n501), .ZN(n410) );
  INV_X1 U446 ( .A(n410), .ZN(mul_final_add_sum_gen_carry_select_int_1_S1[2])
         );
  NOR2_X1 U447 ( .A1(n412), .A2(n411), .ZN(n550) );
  FA_X1 U448 ( .A(n415), .B(n414), .CI(n413), .CO(n430), .S(n411) );
  AOI22_X1 U449 ( .A1(A_i[7]), .A2(n417), .B1(A_i[6]), .B2(n416), .ZN(n440) );
  AOI22_X1 U450 ( .A1(n443), .A2(A_i[5]), .B1(A_i[4]), .B2(n442), .ZN(n439) );
  INV_X1 U451 ( .A(n439), .ZN(n418) );
  AOI22_X1 U452 ( .A1(n439), .A2(n437), .B1(n453), .B2(n418), .ZN(n419) );
  XNOR2_X1 U453 ( .A(n440), .B(n419), .ZN(n433) );
  AOI22_X1 U454 ( .A1(n474), .A2(A_i[3]), .B1(A_i[2]), .B2(n473), .ZN(n420) );
  XOR2_X1 U455 ( .A(n493), .B(n420), .Z(n432) );
  XOR2_X1 U456 ( .A(n422), .B(n421), .Z(n428) );
  OAI33_X1 U458 ( .A1(1'b0), .A2(A_i[7]), .A3(n559), .B1(B_i[1]), .B2(n565), 
        .B3(n560), .ZN(n427) );
  OAI22_X1 U459 ( .A1(n427), .A2(n428), .B1(n425), .B2(n471), .ZN(n424) );
  AOI21_X1 U460 ( .B1(n425), .B2(n471), .A(n424), .ZN(n426) );
  AOI21_X1 U461 ( .B1(n428), .B2(n427), .A(n426), .ZN(n431) );
  NOR2_X1 U462 ( .A1(n429), .A2(n430), .ZN(n554) );
  AOI21_X1 U463 ( .B1(n430), .B2(n429), .A(n554), .ZN(n548) );
  INV_X1 U464 ( .A(n521), .ZN(DP_OP_71J18_123_5612_n17) );
  FA_X1 U465 ( .A(n433), .B(n432), .CI(n431), .CO(n512), .S(n429) );
  AOI22_X1 U466 ( .A1(n474), .A2(A_i[4]), .B1(A_i[3]), .B2(n473), .ZN(n434) );
  XOR2_X1 U467 ( .A(n434), .B(n481), .Z(n456) );
  AOI22_X1 U468 ( .A1(n443), .A2(A_i[6]), .B1(A_i[5]), .B2(n442), .ZN(n447) );
  AOI221_X1 U469 ( .B1(B_i[2]), .B2(n559), .C1(n561), .C2(B_i[1]), .A(n486), 
        .ZN(n435) );
  NOR2_X1 U470 ( .A1(n435), .A2(n565), .ZN(n446) );
  XOR2_X1 U471 ( .A(n447), .B(n446), .Z(n452) );
  XOR2_X1 U472 ( .A(n456), .B(n452), .Z(n436) );
  XOR2_X1 U473 ( .A(n437), .B(n436), .Z(n441) );
  AOI22_X1 U474 ( .A1(n445), .A2(n440), .B1(n448), .B2(n439), .ZN(n438) );
  OAI221_X1 U475 ( .B1(n445), .B2(n440), .C1(n448), .C2(n439), .A(n438), .ZN(
        n455) );
  XNOR2_X1 U476 ( .A(n441), .B(n455), .ZN(n511) );
  XNOR2_X1 U477 ( .A(n512), .B(n511), .ZN(n553) );
  FA_X1 U478 ( .A(n550), .B(n545), .CI(n548), .CO(n513), .S(n521) );
  INV_X1 U479 ( .A(n518), .ZN(DP_OP_71J18_123_5612_n18) );
  AOI22_X1 U480 ( .A1(A_i[7]), .A2(n443), .B1(A_i[6]), .B2(n442), .ZN(n463) );
  AOI22_X1 U481 ( .A1(n471), .A2(n481), .B1(n493), .B2(n448), .ZN(n460) );
  XOR2_X1 U482 ( .A(n463), .B(n460), .Z(n450) );
  OAI22_X1 U483 ( .A1(n448), .A2(n447), .B1(n445), .B2(n446), .ZN(n444) );
  AOI221_X1 U484 ( .B1(n448), .B2(n447), .C1(n446), .C2(n445), .A(n444), .ZN(
        n466) );
  AOI22_X1 U485 ( .A1(A_i[5]), .A2(n474), .B1(A_i[4]), .B2(n473), .ZN(n461) );
  XNOR2_X1 U486 ( .A(n466), .B(n461), .ZN(n449) );
  XNOR2_X1 U487 ( .A(n450), .B(n449), .ZN(n506) );
  AOI22_X1 U488 ( .A1(n456), .A2(n455), .B1(n453), .B2(n452), .ZN(n451) );
  OAI21_X1 U489 ( .B1(n453), .B2(n452), .A(n451), .ZN(n454) );
  OAI21_X1 U490 ( .B1(n456), .B2(n455), .A(n454), .ZN(n507) );
  NOR2_X1 U491 ( .A1(n506), .A2(n507), .ZN(n505) );
  AOI22_X1 U492 ( .A1(A_i[6]), .A2(n474), .B1(A_i[5]), .B2(n473), .ZN(n469) );
  NOR2_X1 U493 ( .A1(B_i[5]), .A2(n457), .ZN(n472) );
  OAI21_X1 U494 ( .B1(n471), .B2(n472), .A(A_i[7]), .ZN(n458) );
  XNOR2_X1 U495 ( .A(n469), .B(n458), .ZN(n459) );
  XNOR2_X1 U496 ( .A(n460), .B(n459), .ZN(n468) );
  XOR2_X1 U497 ( .A(n461), .B(n493), .Z(n465) );
  AOI22_X1 U498 ( .A1(n466), .A2(n465), .B1(n471), .B2(n463), .ZN(n462) );
  OAI21_X1 U499 ( .B1(n471), .B2(n463), .A(n462), .ZN(n464) );
  OAI21_X1 U500 ( .B1(n466), .B2(n465), .A(n464), .ZN(n467) );
  INV_X1 U501 ( .A(n527), .ZN(DP_OP_72J18_124_2857_n4) );
  FA_X1 U502 ( .A(n505), .B(n468), .CI(n467), .CO(n482), .S(n527) );
  XOR2_X1 U503 ( .A(n469), .B(n481), .Z(n470) );
  AOI221_X1 U504 ( .B1(n472), .B2(A_i[7]), .C1(n471), .C2(n565), .A(n470), 
        .ZN(n477) );
  AOI22_X1 U505 ( .A1(A_i[7]), .A2(n474), .B1(A_i[6]), .B2(n473), .ZN(n475) );
  XOR2_X1 U506 ( .A(n493), .B(n475), .Z(n476) );
  NOR2_X1 U507 ( .A1(n477), .A2(n476), .ZN(n483) );
  AOI21_X1 U508 ( .B1(n477), .B2(n476), .A(n483), .ZN(n478) );
  XNOR2_X1 U509 ( .A(n482), .B(n478), .ZN(n526) );
  INV_X1 U510 ( .A(n526), .ZN(DP_OP_72J18_124_2857_n16) );
  OAI21_X1 U511 ( .B1(n479), .B2(B_i[7]), .A(A_i[7]), .ZN(n480) );
  OAI21_X1 U512 ( .B1(A_i[7]), .B2(n481), .A(n480), .ZN(n523) );
  NAND2_X1 U513 ( .A1(n483), .A2(n482), .ZN(n522) );
  NAND2_X1 U514 ( .A1(n523), .A2(n522), .ZN(DP_OP_72J18_124_2857_n18) );
  AOI211_X1 U515 ( .C1(A_i[1]), .C2(B_i[0]), .A(A_i[0]), .B(n559), .ZN(n205)
         );
  INV_X1 U516 ( .A(n533), .ZN(n530) );
  AND2_X1 U517 ( .A1(n530), .A2(n205), .ZN(n209) );
  XOR2_X1 U518 ( .A(n484), .B(n531), .Z(n488) );
  NOR2_X1 U519 ( .A1(n488), .A2(n487), .ZN(n485) );
  AOI221_X1 U520 ( .B1(n488), .B2(n487), .C1(n486), .C2(n485), .A(n209), .ZN(
        n535) );
  XNOR2_X1 U521 ( .A(n490), .B(n489), .ZN(n534) );
  NOR2_X1 U522 ( .A1(n535), .A2(n534), .ZN(n188) );
  NAND2_X1 U523 ( .A1(n491), .A2(n536), .ZN(n540) );
  NAND3_X1 U524 ( .A1(n537), .A2(n536), .A3(n538), .ZN(n492) );
  NAND2_X1 U525 ( .A1(n540), .A2(n492), .ZN(n500) );
  NAND2_X1 U526 ( .A1(n495), .A2(n493), .ZN(n494) );
  OAI21_X1 U527 ( .B1(n496), .B2(n495), .A(n494), .ZN(n542) );
  XNOR2_X1 U528 ( .A(n498), .B(n497), .ZN(n544) );
  XNOR2_X1 U529 ( .A(n542), .B(n544), .ZN(n499) );
  XNOR2_X1 U530 ( .A(n500), .B(n499), .ZN(DP_OP_70J18_122_5612_n18) );
  XNOR2_X1 U531 ( .A(n501), .B(DP_OP_70J18_122_5612_n18), .ZN(
        mul_final_add_sum_gen_carry_select_int_1_S1[3]) );
  AOI21_X1 U532 ( .B1(n504), .B2(n503), .A(n502), .ZN(
        mul_final_add_sum_gen_carry_select_int_1_S1[1]) );
  AOI21_X1 U533 ( .B1(n507), .B2(n506), .A(n505), .ZN(n509) );
  NAND2_X1 U534 ( .A1(n512), .A2(n511), .ZN(n508) );
  NOR2_X1 U535 ( .A1(n509), .A2(n508), .ZN(n556) );
  INV_X1 U536 ( .A(n509), .ZN(n510) );
  AOI21_X1 U537 ( .B1(n512), .B2(n511), .A(n510), .ZN(n555) );
  NOR2_X1 U538 ( .A1(n556), .A2(n555), .ZN(n515) );
  FA_X1 U539 ( .A(n554), .B(n553), .CI(n513), .CO(n514), .S(n518) );
  XNOR2_X1 U540 ( .A(n515), .B(n514), .ZN(DP_OP_71J18_123_5612_n19) );
  NOR3_X1 U541 ( .A1(n520), .A2(n521), .A3(n518), .ZN(n516) );
  XOR2_X1 U542 ( .A(n516), .B(DP_OP_71J18_123_5612_n19), .Z(
        mul_final_add_sum_gen_carry_select_int_2_S1[3]) );
  NOR2_X1 U543 ( .A1(n520), .A2(n521), .ZN(n519) );
  INV_X1 U544 ( .A(n519), .ZN(n517) );
  AOI21_X1 U545 ( .B1(n518), .B2(n517), .A(n516), .ZN(
        mul_final_add_sum_gen_carry_select_int_2_S1[2]) );
  AOI21_X1 U546 ( .B1(n521), .B2(n520), .A(n519), .ZN(
        mul_final_add_sum_gen_carry_select_int_2_S1[1]) );
  XOR2_X1 U547 ( .A(n523), .B(n522), .Z(DP_OP_72J18_124_2857_n17) );
  NOR2_X1 U548 ( .A1(n527), .A2(n526), .ZN(n525) );
  INV_X1 U549 ( .A(DP_OP_72J18_124_2857_n18), .ZN(n524) );
  AOI21_X1 U550 ( .B1(n525), .B2(DP_OP_72J18_124_2857_n17), .A(n524), .ZN(
        mul_final_add_sum_gen_carry_select_int_3_S1[3]) );
  XOR2_X1 U551 ( .A(n525), .B(DP_OP_72J18_124_2857_n17), .Z(
        mul_final_add_sum_gen_carry_select_int_3_S1[2]) );
  AOI21_X1 U552 ( .B1(n527), .B2(n526), .A(n525), .ZN(
        mul_final_add_sum_gen_carry_select_int_3_S1[1]) );
  NAND2_X1 U553 ( .A1(A_i[1]), .A2(B_i[0]), .ZN(n529) );
  NAND2_X1 U554 ( .A1(B_i[1]), .A2(A_i[0]), .ZN(n528) );
  XNOR2_X1 U555 ( .A(n529), .B(n528), .ZN(n213) );
  AOI22_X1 U556 ( .A1(n533), .A2(n532), .B1(n531), .B2(n530), .ZN(n206) );
  XNOR2_X1 U557 ( .A(n535), .B(n534), .ZN(n201) );
  AND2_X1 U558 ( .A1(DP_OP_70J18_122_5612_n4), .A2(n188), .ZN(n539) );
  OAI211_X1 U559 ( .C1(n539), .C2(n538), .A(n537), .B(n536), .ZN(n541) );
  AND3_X1 U560 ( .A1(n542), .A2(n540), .A3(n541), .ZN(n543) );
  OAI22_X1 U561 ( .A1(n544), .A2(n543), .B1(n542), .B2(n541), .ZN(n180) );
  INV_X1 U562 ( .A(n545), .ZN(n546) );
  AOI21_X1 U563 ( .B1(n180), .B2(n547), .A(n546), .ZN(n549) );
  OAI222_X1 U564 ( .A1(n550), .A2(n549), .B1(n550), .B2(n548), .C1(n549), .C2(
        n548), .ZN(n551) );
  INV_X1 U565 ( .A(n551), .ZN(n552) );
  AOI222_X1 U566 ( .A1(n554), .A2(n553), .B1(n554), .B2(n552), .C1(n553), .C2(
        n552), .ZN(n558) );
  INV_X1 U567 ( .A(n555), .ZN(n557) );
  AOI21_X1 U568 ( .B1(n558), .B2(n557), .A(n556), .ZN(n172) );
endmodule

