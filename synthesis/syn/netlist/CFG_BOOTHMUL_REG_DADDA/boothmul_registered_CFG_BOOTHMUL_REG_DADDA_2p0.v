/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : W-2024.09-SP2
// Date      : Thu Aug 27 03:31:49 2026
/////////////////////////////////////////////////////////////


module boothmul_registered ( CLK, LD, RST, A, B, P );
  input [7:0] A;
  input [7:0] B;
  output [15:0] P;
  input CLK, LD, RST;
  wire   n138, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n217, n221, n222, n226, n227, n228, n230, n231,
         n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n274, n276, n277, n278, n279,
         n280, n281, n282, n283, n284, n285, n286, n287, n288, n289, n290,
         n291, n292, n293, n294, n295, n296, n297, n298, n299, n300, n301,
         n302, n303, n304, n305, n306, DP_OP_72J25_124_9845_n18,
         DP_OP_72J25_124_9845_n17, DP_OP_72J25_124_9845_n16,
         DP_OP_72J25_124_9845_n4, DP_OP_71J25_123_5612_n19,
         DP_OP_71J25_123_5612_n18, DP_OP_71J25_123_5612_n17,
         DP_OP_71J25_123_5612_n4, DP_OP_70J25_122_5612_n19,
         DP_OP_70J25_122_5612_n18, DP_OP_70J25_122_5612_n17,
         DP_OP_70J25_122_5612_n4, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n386, n387, n388, n389, n390, n391,
         n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, n424,
         n425, n426, n427, n428, n429, n430, n431, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n442, n443, n444, n445, n446, n447,
         n448, n449, n450, n451, n452, n453, n454, n455, n456, n457, n458,
         n459, n460, n461, n462, n463, n464, n465, n466, n467, n468, n469,
         n470, n471, n472, n473, n474, n475, n476, n477, n478, n479, n480,
         n481, n482, n483, n484, n485, n486, n487, n488, n489, n490, n491,
         n492, n493, n494, n495, n496, n497, n498, n499, n500, n501, n502,
         n503, n504, n505, n506, n507, n508, n509, n510, n511, n512, n513,
         n514, n515, n516, n517, n518, n519, n520, n521, n522, n523, n524,
         n525, n526, n527, n528, n529, n530, n531, n532, n533, n534, n535,
         n536, n537, n538, n539, n540, n541, n542, n543, n544, n545, n546,
         n547, n548, n549, n550, n551, n552, n553, n554, n555, n556, n557,
         n558, n559, n560, n561, n562, n563, n564, n565, n566, n567, n568,
         n569, n570, n571, n572, n573, n574, n575, n576, n577, n578, n579,
         n580;
  wire   [7:0] A_i;
  wire   [7:0] B_i;
  wire   [3:1] mul_final_add_sum_gen_carry_select_int_1_S1;
  wire   [3:1] mul_final_add_sum_gen_carry_select_int_2_S1;
  wire   [3:1] mul_final_add_sum_gen_carry_select_int_3_S1;

  DFF_X1 B_reg_Y_temp_reg_2_ ( .D(n296), .CK(CLK), .Q(B_i[2]) );
  DFF_X1 B_reg_Y_temp_reg_3_ ( .D(n295), .CK(CLK), .Q(B_i[3]), .QN(n574) );
  DFF_X1 B_reg_Y_temp_reg_4_ ( .D(n294), .CK(CLK), .Q(B_i[4]) );
  DFF_X1 B_reg_Y_temp_reg_5_ ( .D(n293), .CK(CLK), .Q(B_i[5]), .QN(n575) );
  DFF_X1 B_reg_Y_temp_reg_6_ ( .D(n292), .CK(CLK), .Q(B_i[6]) );
  DFF_X1 B_reg_Y_temp_reg_7_ ( .D(n291), .CK(CLK), .Q(B_i[7]), .QN(n576) );
  DFF_X1 p_reg_Y_temp_reg_0_ ( .D(n290), .CK(CLK), .Q(P[0]), .QN(n580) );
  DFF_X1 p_reg_Y_temp_reg_1_ ( .D(n289), .CK(CLK), .Q(P[1]), .QN(n578) );
  DFF_X1 p_reg_Y_temp_reg_2_ ( .D(n288), .CK(CLK), .Q(P[2]) );
  DFF_X1 p_reg_Y_temp_reg_3_ ( .D(n287), .CK(CLK), .Q(P[3]), .QN(n579) );
  DFF_X1 p_reg_Y_temp_reg_4_ ( .D(n286), .CK(CLK), .Q(P[4]) );
  DFF_X1 p_reg_Y_temp_reg_5_ ( .D(n285), .CK(CLK), .Q(P[5]) );
  DFF_X1 p_reg_Y_temp_reg_6_ ( .D(n284), .CK(CLK), .Q(P[6]) );
  DFF_X1 p_reg_Y_temp_reg_7_ ( .D(n283), .CK(CLK), .Q(P[7]) );
  DFF_X1 p_reg_Y_temp_reg_8_ ( .D(n282), .CK(CLK), .Q(P[8]) );
  DFF_X1 p_reg_Y_temp_reg_9_ ( .D(n281), .CK(CLK), .Q(P[9]) );
  DFF_X1 p_reg_Y_temp_reg_10_ ( .D(n280), .CK(CLK), .Q(P[10]) );
  DFF_X1 p_reg_Y_temp_reg_11_ ( .D(n279), .CK(CLK), .Q(P[11]) );
  DFF_X1 p_reg_Y_temp_reg_12_ ( .D(n278), .CK(CLK), .Q(P[12]) );
  DFF_X1 p_reg_Y_temp_reg_13_ ( .D(n277), .CK(CLK), .Q(P[13]) );
  DFF_X1 p_reg_Y_temp_reg_14_ ( .D(n276), .CK(CLK), .Q(P[14]) );
  DFF_X1 p_reg_Y_temp_reg_15_ ( .D(n274), .CK(CLK), .Q(P[15]) );
  INV_X1 U167 ( .A(RST), .ZN(n138) );
  NOR2_X1 U214 ( .A1(n227), .A2(n187), .ZN(n191) );
  AOI222_X1 U218 ( .A1(n191), .A2(
        mul_final_add_sum_gen_carry_select_int_3_S1[3]), .B1(n192), .B2(
        DP_OP_72J25_124_9845_n18), .C1(n246), .C2(P[15]), .ZN(n188) );
  AOI222_X1 U221 ( .A1(n191), .A2(
        mul_final_add_sum_gen_carry_select_int_3_S1[2]), .B1(n192), .B2(
        DP_OP_72J25_124_9845_n17), .C1(n246), .C2(P[14]), .ZN(n189) );
  AOI222_X1 U223 ( .A1(n191), .A2(
        mul_final_add_sum_gen_carry_select_int_3_S1[1]), .B1(n192), .B2(
        DP_OP_72J25_124_9845_n16), .C1(n246), .C2(P[13]), .ZN(n190) );
  AOI22_X1 U226 ( .A1(n192), .A2(DP_OP_72J25_124_9845_n4), .B1(n246), .B2(
        P[12]), .ZN(n193) );
  OAI21_X1 U227 ( .B1(DP_OP_72J25_124_9845_n4), .B2(n194), .A(n193), .ZN(n278)
         );
  NAND2_X1 U228 ( .A1(n247), .A2(n195), .ZN(n202) );
  NOR2_X1 U230 ( .A1(n195), .A2(n227), .ZN(n200) );
  AOI222_X1 U231 ( .A1(n246), .A2(P[11]), .B1(n198), .B2(
        mul_final_add_sum_gen_carry_select_int_2_S1[3]), .C1(n200), .C2(
        DP_OP_71J25_123_5612_n19), .ZN(n196) );
  AOI222_X1 U233 ( .A1(n246), .A2(P[10]), .B1(n198), .B2(
        mul_final_add_sum_gen_carry_select_int_2_S1[2]), .C1(n200), .C2(
        DP_OP_71J25_123_5612_n18), .ZN(n197) );
  AOI222_X1 U235 ( .A1(n246), .A2(P[9]), .B1(n198), .B2(
        mul_final_add_sum_gen_carry_select_int_2_S1[1]), .C1(n200), .C2(
        DP_OP_71J25_123_5612_n17), .ZN(n199) );
  AOI22_X1 U237 ( .A1(n246), .A2(P[8]), .B1(n200), .B2(DP_OP_71J25_123_5612_n4), .ZN(n201) );
  OAI21_X1 U238 ( .B1(DP_OP_71J25_123_5612_n4), .B2(n202), .A(n201), .ZN(n282)
         );
  NAND2_X1 U239 ( .A1(n247), .A2(n203), .ZN(n210) );
  NOR2_X1 U241 ( .A1(n203), .A2(n227), .ZN(n208) );
  AOI222_X1 U242 ( .A1(n246), .A2(P[7]), .B1(n206), .B2(
        mul_final_add_sum_gen_carry_select_int_1_S1[3]), .C1(n208), .C2(
        DP_OP_70J25_122_5612_n19), .ZN(n204) );
  AOI222_X1 U244 ( .A1(n246), .A2(P[6]), .B1(n206), .B2(
        mul_final_add_sum_gen_carry_select_int_1_S1[2]), .C1(n208), .C2(
        DP_OP_70J25_122_5612_n18), .ZN(n205) );
  AOI222_X1 U246 ( .A1(n246), .A2(P[5]), .B1(n206), .B2(
        mul_final_add_sum_gen_carry_select_int_1_S1[1]), .C1(n208), .C2(
        DP_OP_70J25_122_5612_n17), .ZN(n207) );
  AOI22_X1 U248 ( .A1(n246), .A2(P[4]), .B1(n208), .B2(DP_OP_70J25_122_5612_n4), .ZN(n209) );
  OAI21_X1 U249 ( .B1(DP_OP_70J25_122_5612_n4), .B2(n210), .A(n209), .ZN(n286)
         );
  OAI22_X1 U255 ( .A1(n227), .A2(n217), .B1(n230), .B2(n579), .ZN(n287) );
  AOI22_X1 U257 ( .A1(n247), .A2(n221), .B1(n246), .B2(P[2]), .ZN(n222) );
  OAI22_X1 U262 ( .A1(n227), .A2(n226), .B1(n230), .B2(n578), .ZN(n289) );
  NAND3_X1 U264 ( .A1(n247), .A2(B_i[0]), .A3(A_i[0]), .ZN(n228) );
  OAI21_X1 U265 ( .B1(n230), .B2(n580), .A(n228), .ZN(n290) );
  AOI22_X1 U266 ( .A1(n247), .A2(B[7]), .B1(B_i[7]), .B2(n246), .ZN(n231) );
  AOI22_X1 U268 ( .A1(n247), .A2(B[6]), .B1(B_i[6]), .B2(n246), .ZN(n232) );
  AOI22_X1 U270 ( .A1(n247), .A2(B[5]), .B1(B_i[5]), .B2(n246), .ZN(n233) );
  AOI22_X1 U272 ( .A1(n247), .A2(B[4]), .B1(B_i[4]), .B2(n246), .ZN(n234) );
  AOI22_X1 U274 ( .A1(n247), .A2(B[3]), .B1(B_i[3]), .B2(n246), .ZN(n235) );
  AOI22_X1 U276 ( .A1(n247), .A2(B[2]), .B1(B_i[2]), .B2(n246), .ZN(n236) );
  AOI22_X1 U278 ( .A1(n247), .A2(B[1]), .B1(B_i[1]), .B2(n246), .ZN(n237) );
  AOI22_X1 U280 ( .A1(n247), .A2(B[0]), .B1(B_i[0]), .B2(n246), .ZN(n238) );
  AOI22_X1 U282 ( .A1(n247), .A2(A[7]), .B1(A_i[7]), .B2(n246), .ZN(n239) );
  AOI22_X1 U284 ( .A1(n247), .A2(A[6]), .B1(A_i[6]), .B2(n246), .ZN(n240) );
  AOI22_X1 U286 ( .A1(n247), .A2(A[5]), .B1(A_i[5]), .B2(n246), .ZN(n241) );
  AOI22_X1 U288 ( .A1(n247), .A2(A[4]), .B1(A_i[4]), .B2(n246), .ZN(n242) );
  AOI22_X1 U290 ( .A1(n247), .A2(A[3]), .B1(A_i[3]), .B2(n246), .ZN(n243) );
  AOI22_X1 U292 ( .A1(n247), .A2(A[2]), .B1(A_i[2]), .B2(n246), .ZN(n244) );
  AOI22_X1 U294 ( .A1(n247), .A2(A[1]), .B1(A_i[1]), .B2(n246), .ZN(n245) );
  AOI22_X1 U296 ( .A1(n247), .A2(A[0]), .B1(A_i[0]), .B2(n246), .ZN(n248) );
  DFF_X1 A_reg_Y_temp_reg_0_ ( .D(n306), .CK(CLK), .Q(A_i[0]) );
  DFF_X1 A_reg_Y_temp_reg_1_ ( .D(n305), .CK(CLK), .Q(A_i[1]) );
  DFF_X1 A_reg_Y_temp_reg_2_ ( .D(n304), .CK(CLK), .Q(A_i[2]) );
  DFF_X1 A_reg_Y_temp_reg_3_ ( .D(n303), .CK(CLK), .Q(A_i[3]) );
  DFF_X1 A_reg_Y_temp_reg_4_ ( .D(n302), .CK(CLK), .Q(A_i[4]) );
  DFF_X1 A_reg_Y_temp_reg_5_ ( .D(n301), .CK(CLK), .Q(A_i[5]) );
  DFF_X1 A_reg_Y_temp_reg_6_ ( .D(n300), .CK(CLK), .Q(A_i[6]) );
  DFF_X1 A_reg_Y_temp_reg_7_ ( .D(n299), .CK(CLK), .Q(A_i[7]), .QN(n577) );
  DFF_X1 B_reg_Y_temp_reg_0_ ( .D(n298), .CK(CLK), .Q(B_i[0]) );
  DFF_X1 B_reg_Y_temp_reg_1_ ( .D(n297), .CK(CLK), .Q(B_i[1]), .QN(n332) );
  NAND2_X1 U168 ( .A1(LD), .A2(n138), .ZN(n227) );
  INV_X1 U222 ( .A(n189), .ZN(n276) );
  INV_X1 U219 ( .A(n188), .ZN(n274) );
  INV_X1 U224 ( .A(n190), .ZN(n277) );
  INV_X1 U225 ( .A(n191), .ZN(n194) );
  NOR2_X2 U217 ( .A1(RST), .A2(LD), .ZN(n246) );
  INV_X1 U232 ( .A(n196), .ZN(n279) );
  INV_X1 U234 ( .A(n197), .ZN(n280) );
  INV_X1 U236 ( .A(n199), .ZN(n281) );
  INV_X1 U243 ( .A(n204), .ZN(n283) );
  INV_X1 U215 ( .A(n227), .ZN(n247) );
  AND2_X1 U216 ( .A1(n187), .A2(n247), .ZN(n192) );
  INV_X1 U229 ( .A(n202), .ZN(n198) );
  INV_X1 U240 ( .A(n210), .ZN(n206) );
  INV_X1 U245 ( .A(n205), .ZN(n284) );
  INV_X1 U247 ( .A(n207), .ZN(n285) );
  INV_X1 U258 ( .A(n222), .ZN(n288) );
  INV_X1 U253 ( .A(n246), .ZN(n230) );
  INV_X1 U285 ( .A(n240), .ZN(n300) );
  INV_X1 U287 ( .A(n241), .ZN(n301) );
  INV_X1 U289 ( .A(n242), .ZN(n302) );
  INV_X1 U291 ( .A(n243), .ZN(n303) );
  INV_X1 U281 ( .A(n238), .ZN(n298) );
  INV_X1 U283 ( .A(n239), .ZN(n299) );
  INV_X1 U293 ( .A(n244), .ZN(n304) );
  INV_X1 U269 ( .A(n232), .ZN(n292) );
  INV_X1 U295 ( .A(n245), .ZN(n305) );
  INV_X1 U297 ( .A(n248), .ZN(n306) );
  INV_X1 U267 ( .A(n231), .ZN(n291) );
  INV_X1 U277 ( .A(n236), .ZN(n296) );
  INV_X1 U271 ( .A(n233), .ZN(n293) );
  INV_X1 U273 ( .A(n234), .ZN(n294) );
  INV_X1 U275 ( .A(n235), .ZN(n295) );
  INV_X1 U279 ( .A(n237), .ZN(n297) );
  INV_X1 U316 ( .A(n492), .ZN(n330) );
  INV_X1 U317 ( .A(n330), .ZN(n331) );
  AOI21_X2 U318 ( .B1(B_i[2]), .B2(B_i[1]), .A(n574), .ZN(n556) );
  AOI21_X2 U319 ( .B1(B_i[4]), .B2(B_i[3]), .A(n575), .ZN(n532) );
  NOR2_X1 U320 ( .A1(B_i[4]), .A2(B_i[3]), .ZN(n341) );
  AOI21_X1 U321 ( .B1(B_i[3]), .B2(B_i[4]), .A(n341), .ZN(n445) );
  NAND2_X1 U322 ( .A1(n445), .A2(A_i[0]), .ZN(n338) );
  INV_X1 U323 ( .A(n338), .ZN(n336) );
  NOR2_X1 U324 ( .A1(B_i[0]), .A2(n332), .ZN(n481) );
  AOI22_X1 U325 ( .A1(A_i[4]), .A2(B_i[0]), .B1(A_i[3]), .B2(n481), .ZN(n343)
         );
  INV_X1 U326 ( .A(n556), .ZN(n487) );
  AOI22_X1 U327 ( .A1(B_i[1]), .A2(n487), .B1(B_i[3]), .B2(n332), .ZN(n492) );
  NOR2_X1 U328 ( .A1(B_i[2]), .A2(B_i[1]), .ZN(n431) );
  AND2_X1 U329 ( .A1(B_i[2]), .A2(B_i[1]), .ZN(n333) );
  OAI22_X1 U330 ( .A1(n574), .A2(n431), .B1(n333), .B2(B_i[3]), .ZN(n334) );
  INV_X1 U331 ( .A(n334), .ZN(n376) );
  AOI21_X1 U332 ( .B1(B_i[1]), .B2(B_i[2]), .A(n431), .ZN(n480) );
  AOI22_X1 U333 ( .A1(n376), .A2(A_i[1]), .B1(n480), .B2(A_i[2]), .ZN(n345) );
  INV_X1 U334 ( .A(n345), .ZN(n346) );
  AOI22_X1 U335 ( .A1(n331), .A2(n345), .B1(n346), .B2(n330), .ZN(n335) );
  XNOR2_X1 U336 ( .A(n343), .B(n335), .ZN(n337) );
  AOI22_X1 U337 ( .A1(n336), .A2(n337), .B1(n532), .B2(n338), .ZN(n511) );
  XNOR2_X1 U338 ( .A(n338), .B(n337), .ZN(n507) );
  AOI22_X1 U339 ( .A1(n480), .A2(A_i[1]), .B1(A_i[0]), .B2(n376), .ZN(n490) );
  INV_X1 U340 ( .A(n490), .ZN(n340) );
  AOI22_X1 U341 ( .A1(B_i[0]), .A2(A_i[3]), .B1(A_i[2]), .B2(n481), .ZN(n489)
         );
  AND2_X1 U342 ( .A1(n332), .A2(B_i[0]), .ZN(n483) );
  AOI22_X1 U343 ( .A1(B_i[1]), .A2(n489), .B1(A_i[3]), .B2(n483), .ZN(n339) );
  AOI221_X1 U344 ( .B1(n490), .B2(n487), .C1(n340), .C2(n556), .A(n339), .ZN(
        n506) );
  NAND2_X1 U345 ( .A1(n507), .A2(n506), .ZN(n365) );
  INV_X1 U346 ( .A(n532), .ZN(n460) );
  AOI22_X1 U347 ( .A1(n532), .A2(n331), .B1(n330), .B2(n460), .ZN(n417) );
  AOI22_X1 U348 ( .A1(A_i[5]), .A2(B_i[0]), .B1(A_i[4]), .B2(n481), .ZN(n352)
         );
  AOI22_X1 U349 ( .A1(n480), .A2(A_i[3]), .B1(A_i[2]), .B2(n376), .ZN(n356) );
  XOR2_X1 U350 ( .A(n352), .B(n356), .Z(n361) );
  INV_X1 U351 ( .A(n341), .ZN(n443) );
  NAND2_X1 U352 ( .A1(B_i[4]), .A2(B_i[3]), .ZN(n342) );
  AOI22_X1 U353 ( .A1(B_i[5]), .A2(n443), .B1(n342), .B2(n575), .ZN(n444) );
  AOI22_X1 U354 ( .A1(n445), .A2(A_i[1]), .B1(A_i[0]), .B2(n444), .ZN(n359) );
  AOI22_X1 U355 ( .A1(A_i[4]), .A2(n483), .B1(B_i[1]), .B2(n343), .ZN(n344) );
  AOI221_X1 U356 ( .B1(n556), .B2(n346), .C1(n487), .C2(n345), .A(n344), .ZN(
        n364) );
  XNOR2_X1 U357 ( .A(n359), .B(n364), .ZN(n347) );
  XNOR2_X1 U358 ( .A(n361), .B(n347), .ZN(n348) );
  XNOR2_X1 U359 ( .A(n417), .B(n348), .ZN(n509) );
  INV_X1 U360 ( .A(n349), .ZN(DP_OP_70J25_122_5612_n17) );
  INV_X1 U361 ( .A(n365), .ZN(n508) );
  NOR2_X1 U362 ( .A1(n507), .A2(n506), .ZN(n350) );
  NOR2_X1 U363 ( .A1(n508), .A2(n350), .ZN(DP_OP_70J25_122_5612_n4) );
  NAND2_X1 U364 ( .A1(DP_OP_70J25_122_5612_n4), .A2(DP_OP_70J25_122_5612_n17), 
        .ZN(n526) );
  OAI21_X1 U365 ( .B1(DP_OP_70J25_122_5612_n17), .B2(DP_OP_70J25_122_5612_n4), 
        .A(n526), .ZN(n351) );
  INV_X1 U366 ( .A(n351), .ZN(mul_final_add_sum_gen_carry_select_int_1_S1[1])
         );
  INV_X1 U367 ( .A(n356), .ZN(n355) );
  AOI22_X1 U368 ( .A1(A_i[5]), .A2(n483), .B1(B_i[1]), .B2(n352), .ZN(n353) );
  INV_X1 U369 ( .A(n353), .ZN(n354) );
  OAI221_X1 U370 ( .B1(n487), .B2(n356), .C1(n556), .C2(n355), .A(n354), .ZN(
        n505) );
  AOI22_X1 U371 ( .A1(n445), .A2(A_i[2]), .B1(A_i[1]), .B2(n444), .ZN(n406) );
  NOR2_X1 U372 ( .A1(B_i[6]), .A2(B_i[5]), .ZN(n440) );
  AOI21_X1 U373 ( .B1(B_i[5]), .B2(B_i[6]), .A(n440), .ZN(n467) );
  NAND2_X1 U374 ( .A1(n467), .A2(A_i[0]), .ZN(n405) );
  AOI22_X1 U375 ( .A1(A_i[6]), .A2(B_i[0]), .B1(A_i[5]), .B2(n481), .ZN(n395)
         );
  AOI22_X1 U376 ( .A1(A_i[4]), .A2(n480), .B1(A_i[3]), .B2(n376), .ZN(n397) );
  INV_X1 U377 ( .A(n397), .ZN(n398) );
  XNOR2_X1 U378 ( .A(n395), .B(n398), .ZN(n408) );
  XNOR2_X1 U379 ( .A(n405), .B(n408), .ZN(n357) );
  XOR2_X1 U380 ( .A(n406), .B(n357), .Z(n502) );
  XNOR2_X1 U381 ( .A(n505), .B(n502), .ZN(n358) );
  XNOR2_X1 U382 ( .A(n417), .B(n358), .ZN(n522) );
  XNOR2_X1 U383 ( .A(n532), .B(n359), .ZN(n363) );
  AOI22_X1 U384 ( .A1(n364), .A2(n363), .B1(n331), .B2(n361), .ZN(n360) );
  OAI21_X1 U385 ( .B1(n331), .B2(n361), .A(n360), .ZN(n362) );
  OAI21_X1 U386 ( .B1(n364), .B2(n363), .A(n362), .ZN(n521) );
  FA_X1 U387 ( .A(n511), .B(n365), .CI(n509), .CO(n520), .S(n349) );
  INV_X1 U388 ( .A(n527), .ZN(DP_OP_70J25_122_5612_n18) );
  AOI21_X1 U389 ( .B1(B_i[6]), .B2(B_i[5]), .A(n576), .ZN(n442) );
  INV_X1 U390 ( .A(n442), .ZN(n528) );
  AOI22_X1 U391 ( .A1(n442), .A2(n532), .B1(n460), .B2(n528), .ZN(n451) );
  AOI22_X1 U392 ( .A1(A_i[6]), .A2(n480), .B1(A_i[5]), .B2(n376), .ZN(n383) );
  XOR2_X1 U393 ( .A(n556), .B(n383), .Z(n369) );
  AOI21_X1 U394 ( .B1(A_i[7]), .B2(B_i[0]), .A(B_i[1]), .ZN(n377) );
  AOI21_X1 U395 ( .B1(B_i[1]), .B2(A_i[7]), .A(n377), .ZN(n368) );
  AOI22_X1 U396 ( .A1(n445), .A2(A_i[4]), .B1(A_i[3]), .B2(n444), .ZN(n381) );
  OAI22_X1 U397 ( .A1(n368), .A2(n369), .B1(n532), .B2(n381), .ZN(n366) );
  AOI21_X1 U398 ( .B1(n532), .B2(n381), .A(n366), .ZN(n367) );
  AOI21_X1 U399 ( .B1(n369), .B2(n368), .A(n367), .ZN(n430) );
  AOI22_X1 U400 ( .A1(n445), .A2(A_i[5]), .B1(A_i[4]), .B2(n444), .ZN(n435) );
  AOI22_X1 U401 ( .A1(A_i[7]), .A2(n480), .B1(A_i[6]), .B2(n376), .ZN(n370) );
  XOR2_X1 U402 ( .A(n556), .B(n370), .Z(n433) );
  INV_X1 U403 ( .A(n433), .ZN(n371) );
  XNOR2_X1 U404 ( .A(n435), .B(n371), .ZN(n427) );
  INV_X1 U405 ( .A(n440), .ZN(n373) );
  NAND2_X1 U406 ( .A1(B_i[6]), .A2(B_i[5]), .ZN(n372) );
  AOI22_X1 U407 ( .A1(B_i[7]), .A2(n373), .B1(n372), .B2(n576), .ZN(n466) );
  AOI22_X1 U408 ( .A1(n467), .A2(A_i[3]), .B1(A_i[2]), .B2(n466), .ZN(n425) );
  XNOR2_X1 U409 ( .A(n427), .B(n425), .ZN(n374) );
  XNOR2_X1 U410 ( .A(n430), .B(n374), .ZN(n375) );
  XNOR2_X1 U411 ( .A(n451), .B(n375), .ZN(n388) );
  AOI22_X1 U412 ( .A1(A_i[7]), .A2(B_i[0]), .B1(A_i[6]), .B2(n481), .ZN(n400)
         );
  AOI22_X1 U413 ( .A1(A_i[5]), .A2(n480), .B1(A_i[4]), .B2(n376), .ZN(n399) );
  XNOR2_X1 U414 ( .A(n556), .B(n399), .ZN(n379) );
  INV_X1 U415 ( .A(n377), .ZN(n378) );
  OAI211_X1 U416 ( .C1(n400), .C2(n332), .A(n379), .B(n378), .ZN(n394) );
  AOI22_X1 U417 ( .A1(n467), .A2(A_i[2]), .B1(A_i[1]), .B2(n466), .ZN(n390) );
  XNOR2_X1 U418 ( .A(n390), .B(n528), .ZN(n386) );
  OAI21_X1 U419 ( .B1(B_i[1]), .B2(B_i[0]), .A(A_i[7]), .ZN(n380) );
  XNOR2_X1 U420 ( .A(n381), .B(n380), .ZN(n382) );
  XNOR2_X1 U421 ( .A(n383), .B(n382), .ZN(n392) );
  OAI22_X1 U422 ( .A1(n386), .A2(n394), .B1(n392), .B2(n417), .ZN(n384) );
  AOI21_X1 U423 ( .B1(n392), .B2(n417), .A(n384), .ZN(n385) );
  AOI21_X1 U424 ( .B1(n394), .B2(n386), .A(n385), .ZN(n387) );
  NOR2_X1 U425 ( .A1(n388), .A2(n387), .ZN(n570) );
  AOI21_X1 U426 ( .B1(n388), .B2(n387), .A(n570), .ZN(n562) );
  INV_X1 U427 ( .A(n451), .ZN(n389) );
  AOI22_X1 U428 ( .A1(n451), .A2(n331), .B1(n330), .B2(n389), .ZN(n503) );
  XNOR2_X1 U429 ( .A(n390), .B(n503), .ZN(n391) );
  XNOR2_X1 U430 ( .A(n392), .B(n391), .ZN(n393) );
  XNOR2_X1 U431 ( .A(n394), .B(n393), .ZN(n421) );
  AOI22_X1 U432 ( .A1(A_i[6]), .A2(n483), .B1(B_i[1]), .B2(n395), .ZN(n396) );
  AOI221_X1 U433 ( .B1(n556), .B2(n398), .C1(n487), .C2(n397), .A(n396), .ZN(
        n415) );
  INV_X1 U434 ( .A(n415), .ZN(n404) );
  AOI22_X1 U435 ( .A1(n445), .A2(A_i[3]), .B1(A_i[2]), .B2(n444), .ZN(n412) );
  XNOR2_X1 U436 ( .A(n412), .B(n460), .ZN(n403) );
  XOR2_X1 U437 ( .A(n400), .B(n399), .Z(n413) );
  OAI22_X1 U438 ( .A1(n403), .A2(n404), .B1(n413), .B2(n331), .ZN(n401) );
  AOI21_X1 U439 ( .B1(n413), .B2(n331), .A(n401), .ZN(n402) );
  AOI21_X1 U440 ( .B1(n404), .B2(n403), .A(n402), .ZN(n420) );
  NOR2_X1 U441 ( .A1(n421), .A2(n420), .ZN(n559) );
  XNOR2_X1 U442 ( .A(n442), .B(n405), .ZN(n411) );
  XNOR2_X1 U443 ( .A(n532), .B(n406), .ZN(n410) );
  AOI22_X1 U444 ( .A1(n411), .A2(n410), .B1(n331), .B2(n408), .ZN(n407) );
  OAI21_X1 U445 ( .B1(n331), .B2(n408), .A(n407), .ZN(n409) );
  OAI21_X1 U446 ( .B1(n411), .B2(n410), .A(n409), .ZN(n496) );
  AOI22_X1 U447 ( .A1(n467), .A2(A_i[1]), .B1(A_i[0]), .B2(n466), .ZN(n497) );
  XNOR2_X1 U448 ( .A(n497), .B(n528), .ZN(n419) );
  XNOR2_X1 U449 ( .A(n413), .B(n412), .ZN(n414) );
  XNOR2_X1 U450 ( .A(n415), .B(n414), .ZN(n498) );
  AOI22_X1 U451 ( .A1(n496), .A2(n419), .B1(n498), .B2(n417), .ZN(n416) );
  OAI21_X1 U452 ( .B1(n498), .B2(n417), .A(n416), .ZN(n418) );
  OAI21_X1 U453 ( .B1(n496), .B2(n419), .A(n418), .ZN(n422) );
  XNOR2_X1 U454 ( .A(n421), .B(n420), .ZN(n423) );
  NAND2_X1 U455 ( .A1(n422), .A2(n423), .ZN(n564) );
  INV_X1 U456 ( .A(n541), .ZN(DP_OP_71J25_123_5612_n17) );
  OR2_X1 U457 ( .A1(n423), .A2(n422), .ZN(n560) );
  NAND2_X1 U458 ( .A1(n560), .A2(n564), .ZN(n542) );
  INV_X1 U459 ( .A(n542), .ZN(DP_OP_71J25_123_5612_n4) );
  NAND2_X1 U460 ( .A1(DP_OP_71J25_123_5612_n4), .A2(DP_OP_71J25_123_5612_n17), 
        .ZN(n544) );
  OAI21_X1 U461 ( .B1(DP_OP_71J25_123_5612_n17), .B2(DP_OP_71J25_123_5612_n4), 
        .A(n544), .ZN(n424) );
  INV_X1 U462 ( .A(n424), .ZN(mul_final_add_sum_gen_carry_select_int_2_S1[1])
         );
  XNOR2_X1 U463 ( .A(n442), .B(n425), .ZN(n429) );
  OAI22_X1 U464 ( .A1(n429), .A2(n430), .B1(n427), .B2(n532), .ZN(n426) );
  AOI21_X1 U465 ( .B1(n427), .B2(n532), .A(n426), .ZN(n428) );
  AOI21_X1 U466 ( .B1(n430), .B2(n429), .A(n428), .ZN(n535) );
  AOI22_X1 U467 ( .A1(n467), .A2(A_i[4]), .B1(A_i[3]), .B2(n466), .ZN(n529) );
  AOI22_X1 U468 ( .A1(n445), .A2(A_i[6]), .B1(A_i[5]), .B2(n444), .ZN(n455) );
  OAI33_X1 U470 ( .A1(1'b0), .A2(A_i[7]), .A3(n487), .B1(n577), .B2(B_i[3]), 
        .B3(n431), .ZN(n458) );
  AOI21_X1 U471 ( .B1(n435), .B2(n460), .A(n433), .ZN(n434) );
  OAI21_X1 U472 ( .B1(n435), .B2(n460), .A(n434), .ZN(n457) );
  INV_X1 U473 ( .A(n457), .ZN(n436) );
  XNOR2_X1 U474 ( .A(n458), .B(n436), .ZN(n437) );
  XOR2_X1 U475 ( .A(n455), .B(n437), .Z(n531) );
  XOR2_X1 U476 ( .A(n529), .B(n531), .Z(n438) );
  XNOR2_X1 U477 ( .A(n535), .B(n438), .ZN(n439) );
  XNOR2_X1 U478 ( .A(n451), .B(n439), .ZN(n568) );
  FA_X1 U479 ( .A(n562), .B(n559), .CI(n564), .CO(n536), .S(n541) );
  INV_X1 U480 ( .A(n545), .ZN(DP_OP_71J25_123_5612_n18) );
  OAI21_X1 U481 ( .B1(B_i[7]), .B2(n440), .A(A_i[7]), .ZN(n441) );
  OAI21_X1 U482 ( .B1(A_i[7]), .B2(n442), .A(n441), .ZN(n477) );
  NAND3_X1 U483 ( .A1(n575), .A2(n443), .A3(A_i[7]), .ZN(n459) );
  OAI21_X1 U484 ( .B1(n577), .B2(n460), .A(n459), .ZN(n447) );
  AOI22_X1 U485 ( .A1(A_i[7]), .A2(n445), .B1(A_i[6]), .B2(n444), .ZN(n450) );
  AOI22_X1 U486 ( .A1(A_i[5]), .A2(n467), .B1(A_i[4]), .B2(n466), .ZN(n453) );
  AOI22_X1 U487 ( .A1(n460), .A2(n450), .B1(n528), .B2(n453), .ZN(n446) );
  OAI221_X1 U488 ( .B1(n460), .B2(n450), .C1(n528), .C2(n453), .A(n446), .ZN(
        n465) );
  XOR2_X1 U489 ( .A(n447), .B(n465), .Z(n449) );
  AOI22_X1 U490 ( .A1(A_i[6]), .A2(n467), .B1(A_i[5]), .B2(n466), .ZN(n462) );
  XNOR2_X1 U491 ( .A(n451), .B(n462), .ZN(n448) );
  XNOR2_X1 U492 ( .A(n449), .B(n448), .ZN(n474) );
  XNOR2_X1 U493 ( .A(n451), .B(n450), .ZN(n452) );
  XNOR2_X1 U494 ( .A(n453), .B(n452), .ZN(n538) );
  AOI22_X1 U495 ( .A1(n458), .A2(n457), .B1(n455), .B2(n460), .ZN(n454) );
  OAI21_X1 U496 ( .B1(n455), .B2(n460), .A(n454), .ZN(n456) );
  OAI21_X1 U497 ( .B1(n458), .B2(n457), .A(n456), .ZN(n537) );
  NOR2_X1 U498 ( .A1(n538), .A2(n537), .ZN(n475) );
  NOR2_X1 U499 ( .A1(n474), .A2(n475), .ZN(n473) );
  OAI21_X1 U500 ( .B1(A_i[7]), .B2(n460), .A(n459), .ZN(n464) );
  AOI22_X1 U501 ( .A1(n465), .A2(n464), .B1(n462), .B2(n528), .ZN(n461) );
  OAI21_X1 U502 ( .B1(n462), .B2(n528), .A(n461), .ZN(n463) );
  OAI21_X1 U503 ( .B1(n465), .B2(n464), .A(n463), .ZN(n470) );
  NOR2_X1 U504 ( .A1(n473), .A2(n470), .ZN(n469) );
  AOI22_X1 U505 ( .A1(A_i[7]), .A2(n467), .B1(A_i[6]), .B2(n466), .ZN(n468) );
  XNOR2_X1 U506 ( .A(n468), .B(n528), .ZN(n472) );
  NAND2_X1 U507 ( .A1(n469), .A2(n472), .ZN(n476) );
  NAND2_X1 U508 ( .A1(n477), .A2(n476), .ZN(DP_OP_72J25_124_9845_n18) );
  AOI21_X1 U509 ( .B1(n473), .B2(n470), .A(n469), .ZN(n471) );
  XOR2_X1 U510 ( .A(n472), .B(n471), .Z(DP_OP_72J25_124_9845_n16) );
  AOI21_X1 U511 ( .B1(n475), .B2(n474), .A(n473), .ZN(DP_OP_72J25_124_9845_n4)
         );
  XOR2_X1 U512 ( .A(n477), .B(n476), .Z(DP_OP_72J25_124_9845_n17) );
  NAND3_X1 U513 ( .A1(DP_OP_72J25_124_9845_n16), .A2(DP_OP_72J25_124_9845_n4), 
        .A3(DP_OP_72J25_124_9845_n17), .ZN(n478) );
  AND2_X1 U514 ( .A1(DP_OP_72J25_124_9845_n18), .A2(n478), .ZN(
        mul_final_add_sum_gen_carry_select_int_3_S1[3]) );
  INV_X1 U515 ( .A(DP_OP_72J25_124_9845_n16), .ZN(n548) );
  INV_X1 U516 ( .A(DP_OP_72J25_124_9845_n4), .ZN(n547) );
  NOR2_X1 U517 ( .A1(n548), .A2(n547), .ZN(n546) );
  OAI21_X1 U518 ( .B1(n546), .B2(DP_OP_72J25_124_9845_n17), .A(n478), .ZN(n479) );
  INV_X1 U519 ( .A(n479), .ZN(mul_final_add_sum_gen_carry_select_int_3_S1[2])
         );
  NAND2_X1 U520 ( .A1(n480), .A2(A_i[0]), .ZN(n486) );
  AOI22_X1 U521 ( .A1(B_i[0]), .A2(A_i[2]), .B1(n481), .B2(A_i[1]), .ZN(n484)
         );
  XNOR2_X1 U522 ( .A(n484), .B(n330), .ZN(n482) );
  XNOR2_X1 U523 ( .A(n486), .B(n482), .ZN(n554) );
  AOI211_X1 U524 ( .C1(B_i[0]), .C2(A_i[1]), .A(A_i[0]), .B(n332), .ZN(n555)
         );
  AOI22_X1 U525 ( .A1(n556), .A2(n554), .B1(n484), .B2(n555), .ZN(n495) );
  INV_X1 U526 ( .A(n486), .ZN(n488) );
  AOI22_X1 U527 ( .A1(B_i[1]), .A2(n484), .B1(A_i[2]), .B2(n483), .ZN(n485) );
  AOI221_X1 U528 ( .B1(n556), .B2(n488), .C1(n487), .C2(n486), .A(n485), .ZN(
        n494) );
  XOR2_X1 U529 ( .A(n490), .B(n489), .Z(n491) );
  XNOR2_X1 U530 ( .A(n331), .B(n491), .ZN(n493) );
  NAND2_X1 U531 ( .A1(n494), .A2(n493), .ZN(n551) );
  NOR2_X1 U532 ( .A1(n494), .A2(n493), .ZN(n553) );
  AOI21_X1 U533 ( .B1(n495), .B2(n551), .A(n553), .ZN(n203) );
  XOR2_X1 U534 ( .A(n496), .B(n503), .Z(n500) );
  XNOR2_X1 U535 ( .A(n498), .B(n497), .ZN(n499) );
  XNOR2_X1 U536 ( .A(n500), .B(n499), .ZN(n515) );
  AOI22_X1 U537 ( .A1(n528), .A2(n505), .B1(n503), .B2(n502), .ZN(n501) );
  OAI21_X1 U538 ( .B1(n503), .B2(n502), .A(n501), .ZN(n504) );
  OAI21_X1 U539 ( .B1(n528), .B2(n505), .A(n504), .ZN(n514) );
  NOR2_X1 U540 ( .A1(n515), .A2(n514), .ZN(n519) );
  INV_X1 U541 ( .A(n519), .ZN(n517) );
  OAI22_X1 U542 ( .A1(n203), .A2(n508), .B1(n507), .B2(n506), .ZN(n510) );
  AOI222_X1 U543 ( .A1(n511), .A2(n510), .B1(n511), .B2(n509), .C1(n510), .C2(
        n509), .ZN(n512) );
  INV_X1 U544 ( .A(n512), .ZN(n513) );
  OAI222_X1 U545 ( .A1(n522), .A2(n513), .B1(n522), .B2(n521), .C1(n513), .C2(
        n521), .ZN(n516) );
  AND2_X1 U546 ( .A1(n515), .A2(n514), .ZN(n518) );
  AOI21_X1 U547 ( .B1(n517), .B2(n516), .A(n518), .ZN(n563) );
  INV_X1 U548 ( .A(n563), .ZN(n195) );
  NOR2_X1 U549 ( .A1(n519), .A2(n518), .ZN(n524) );
  FA_X1 U550 ( .A(n522), .B(n521), .CI(n520), .CO(n523), .S(n527) );
  XNOR2_X1 U551 ( .A(n524), .B(n523), .ZN(DP_OP_70J25_122_5612_n19) );
  AND3_X1 U552 ( .A1(DP_OP_70J25_122_5612_n4), .A2(DP_OP_70J25_122_5612_n17), 
        .A3(DP_OP_70J25_122_5612_n18), .ZN(n525) );
  XOR2_X1 U553 ( .A(n525), .B(DP_OP_70J25_122_5612_n19), .Z(
        mul_final_add_sum_gen_carry_select_int_1_S1[3]) );
  AOI21_X1 U554 ( .B1(n527), .B2(n526), .A(n525), .ZN(
        mul_final_add_sum_gen_carry_select_int_1_S1[2]) );
  XNOR2_X1 U555 ( .A(n529), .B(n528), .ZN(n534) );
  OAI22_X1 U556 ( .A1(n534), .A2(n535), .B1(n532), .B2(n531), .ZN(n530) );
  AOI21_X1 U557 ( .B1(n532), .B2(n531), .A(n530), .ZN(n533) );
  AOI21_X1 U558 ( .B1(n535), .B2(n534), .A(n533), .ZN(n571) );
  FA_X1 U559 ( .A(n570), .B(n568), .CI(n536), .CO(n539), .S(n545) );
  XNOR2_X1 U560 ( .A(n538), .B(n537), .ZN(n572) );
  XOR2_X1 U561 ( .A(n539), .B(n572), .Z(n540) );
  XNOR2_X1 U562 ( .A(n571), .B(n540), .ZN(DP_OP_71J25_123_5612_n19) );
  NOR3_X1 U563 ( .A1(n542), .A2(n541), .A3(n545), .ZN(n543) );
  XOR2_X1 U564 ( .A(n543), .B(DP_OP_71J25_123_5612_n19), .Z(
        mul_final_add_sum_gen_carry_select_int_2_S1[3]) );
  AOI21_X1 U565 ( .B1(n545), .B2(n544), .A(n543), .ZN(
        mul_final_add_sum_gen_carry_select_int_2_S1[2]) );
  AOI21_X1 U566 ( .B1(n548), .B2(n547), .A(n546), .ZN(
        mul_final_add_sum_gen_carry_select_int_3_S1[1]) );
  NAND2_X1 U567 ( .A1(B_i[0]), .A2(A_i[1]), .ZN(n550) );
  NAND2_X1 U568 ( .A1(B_i[1]), .A2(A_i[0]), .ZN(n549) );
  XNOR2_X1 U569 ( .A(n550), .B(n549), .ZN(n226) );
  INV_X1 U570 ( .A(n551), .ZN(n552) );
  NOR2_X1 U571 ( .A1(n553), .A2(n552), .ZN(n558) );
  FA_X1 U572 ( .A(n556), .B(n555), .CI(n554), .CO(n557), .S(n221) );
  XNOR2_X1 U573 ( .A(n558), .B(n557), .ZN(n217) );
  INV_X1 U574 ( .A(n562), .ZN(n567) );
  INV_X1 U575 ( .A(n559), .ZN(n566) );
  NAND2_X1 U576 ( .A1(n566), .A2(n560), .ZN(n561) );
  AOI22_X1 U577 ( .A1(n564), .A2(n563), .B1(n562), .B2(n561), .ZN(n565) );
  AOI21_X1 U578 ( .B1(n567), .B2(n566), .A(n565), .ZN(n569) );
  AOI222_X1 U579 ( .A1(n570), .A2(n569), .B1(n570), .B2(n568), .C1(n569), .C2(
        n568), .ZN(n573) );
  AOI222_X1 U580 ( .A1(n573), .A2(n572), .B1(n573), .B2(n571), .C1(n572), .C2(
        n571), .ZN(n187) );
endmodule

