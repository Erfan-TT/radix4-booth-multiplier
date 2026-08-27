/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : W-2024.09-SP2
// Date      : Thu Aug 27 03:31:41 2026
/////////////////////////////////////////////////////////////


module boothmul_registered ( CLK, LD, RST, A, B, P );
  input [7:0] A;
  input [7:0] B;
  output [15:0] P;
  input CLK, LD, RST;
  wire   n138, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n204, n205, n206, n207, n208,
         n209, n210, n217, n221, n222, n226, n227, n228, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n278, n282, n286, n287, n289, n290,
         n291, n293, n295, n297, DP_OP_72J24_124_9845_n18,
         DP_OP_72J24_124_9845_n17, DP_OP_72J24_124_9845_n16,
         DP_OP_72J24_124_9845_n4, DP_OP_71J24_123_5612_n19,
         DP_OP_71J24_123_5612_n18, DP_OP_71J24_123_5612_n17,
         DP_OP_71J24_123_5612_n4, DP_OP_70J24_122_5612_n19,
         DP_OP_70J24_122_5612_n18, DP_OP_70J24_122_5612_n17,
         DP_OP_70J24_122_5612_n4, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n368, n369, n370,
         n371, n372, n373, n374, n375, n376, n377, n378, n379, n380, n381,
         n382, n383, n384, n385, n386, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
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
         n580, n581, n582, n583, n584, n585, n586, n587, n588, n589, n590,
         n591;
  wire   [7:0] A_i;
  wire   [7:0] B_i;
  wire   [3:1] mul_final_add_sum_gen_carry_select_int_1_S1;
  wire   [3:1] mul_final_add_sum_gen_carry_select_int_2_S1;
  wire   [3:1] mul_final_add_sum_gen_carry_select_int_3_S1;

  DFF_X1 B_reg_Y_temp_reg_5_ ( .D(n293), .CK(CLK), .Q(B_i[5]), .QN(n584) );
  DFF_X1 B_reg_Y_temp_reg_7_ ( .D(n291), .CK(CLK), .Q(B_i[7]), .QN(n585) );
  DFF_X1 p_reg_Y_temp_reg_0_ ( .D(n290), .CK(CLK), .Q(P[0]), .QN(n588) );
  DFF_X1 p_reg_Y_temp_reg_1_ ( .D(n289), .CK(CLK), .Q(P[1]), .QN(n586) );
  DFF_X1 p_reg_Y_temp_reg_3_ ( .D(n287), .CK(CLK), .Q(P[3]), .QN(n587) );
  INV_X1 U167 ( .A(RST), .ZN(n138) );
  NOR2_X1 U214 ( .A1(n227), .A2(n187), .ZN(n191) );
  AOI222_X1 U218 ( .A1(n191), .A2(
        mul_final_add_sum_gen_carry_select_int_3_S1[3]), .B1(n192), .B2(
        DP_OP_72J24_124_9845_n18), .C1(n246), .C2(P[15]), .ZN(n188) );
  INV_X1 U219 ( .A(n188) );
  AOI222_X1 U221 ( .A1(n191), .A2(
        mul_final_add_sum_gen_carry_select_int_3_S1[2]), .B1(n192), .B2(
        DP_OP_72J24_124_9845_n17), .C1(n246), .C2(P[14]), .ZN(n189) );
  INV_X1 U222 ( .A(n189) );
  AOI222_X1 U223 ( .A1(n191), .A2(
        mul_final_add_sum_gen_carry_select_int_3_S1[1]), .B1(n192), .B2(
        DP_OP_72J24_124_9845_n16), .C1(n246), .C2(P[13]), .ZN(n190) );
  INV_X1 U224 ( .A(n190) );
  INV_X1 U225 ( .A(n191), .ZN(n194) );
  AOI22_X1 U226 ( .A1(n192), .A2(DP_OP_72J24_124_9845_n4), .B1(n246), .B2(
        P[12]), .ZN(n193) );
  OAI21_X1 U227 ( .B1(DP_OP_72J24_124_9845_n4), .B2(n194), .A(n193), .ZN(n278)
         );
  NAND2_X1 U228 ( .A1(n247), .A2(n195), .ZN(n202) );
  NOR2_X1 U230 ( .A1(n195), .A2(n227), .ZN(n200) );
  AOI222_X1 U231 ( .A1(n246), .A2(P[11]), .B1(n198), .B2(
        mul_final_add_sum_gen_carry_select_int_2_S1[3]), .C1(n200), .C2(
        DP_OP_71J24_123_5612_n19), .ZN(n196) );
  INV_X1 U232 ( .A(n196) );
  AOI222_X1 U233 ( .A1(n246), .A2(P[10]), .B1(n198), .B2(
        mul_final_add_sum_gen_carry_select_int_2_S1[2]), .C1(n200), .C2(
        DP_OP_71J24_123_5612_n18), .ZN(n197) );
  INV_X1 U234 ( .A(n197) );
  AOI222_X1 U235 ( .A1(n246), .A2(P[9]), .B1(n198), .B2(
        mul_final_add_sum_gen_carry_select_int_2_S1[1]), .C1(n200), .C2(
        DP_OP_71J24_123_5612_n17), .ZN(n199) );
  INV_X1 U236 ( .A(n199) );
  AOI22_X1 U237 ( .A1(n246), .A2(P[8]), .B1(n200), .B2(DP_OP_71J24_123_5612_n4), .ZN(n201) );
  OAI21_X1 U238 ( .B1(DP_OP_71J24_123_5612_n4), .B2(n202), .A(n201), .ZN(n282)
         );
  NAND2_X1 U239 ( .A1(n247), .A2(n527), .ZN(n210) );
  NOR2_X1 U241 ( .A1(n527), .A2(n227), .ZN(n208) );
  AOI222_X1 U242 ( .A1(n246), .A2(P[7]), .B1(n206), .B2(
        mul_final_add_sum_gen_carry_select_int_1_S1[3]), .C1(n208), .C2(
        DP_OP_70J24_122_5612_n19), .ZN(n204) );
  INV_X1 U243 ( .A(n204) );
  AOI222_X1 U244 ( .A1(n246), .A2(P[6]), .B1(n206), .B2(
        mul_final_add_sum_gen_carry_select_int_1_S1[2]), .C1(n208), .C2(
        DP_OP_70J24_122_5612_n18), .ZN(n205) );
  AOI222_X1 U246 ( .A1(n246), .A2(P[5]), .B1(n206), .B2(
        mul_final_add_sum_gen_carry_select_int_1_S1[1]), .C1(n208), .C2(
        DP_OP_70J24_122_5612_n17), .ZN(n207) );
  AOI22_X1 U248 ( .A1(n246), .A2(P[4]), .B1(n208), .B2(DP_OP_70J24_122_5612_n4), .ZN(n209) );
  OAI21_X1 U249 ( .B1(DP_OP_70J24_122_5612_n4), .B2(n210), .A(n209), .ZN(n286)
         );
  OAI22_X1 U255 ( .A1(n227), .A2(n217), .B1(n230), .B2(n587), .ZN(n287) );
  AOI22_X1 U257 ( .A1(n247), .A2(n221), .B1(n246), .B2(P[2]), .ZN(n222) );
  OAI22_X1 U262 ( .A1(n227), .A2(n226), .B1(n230), .B2(n586), .ZN(n289) );
  NAND3_X1 U264 ( .A1(n247), .A2(B_i[0]), .A3(A_i[0]), .ZN(n228) );
  OAI21_X1 U265 ( .B1(n230), .B2(n588), .A(n228), .ZN(n290) );
  AOI22_X1 U266 ( .A1(n247), .A2(B[7]), .B1(B_i[7]), .B2(n246), .ZN(n231) );
  AOI22_X1 U268 ( .A1(n247), .A2(B[6]), .B1(B_i[6]), .B2(n246), .ZN(n232) );
  AOI22_X1 U270 ( .A1(n247), .A2(B[5]), .B1(B_i[5]), .B2(n246), .ZN(n233) );
  AOI22_X1 U272 ( .A1(n247), .A2(B[4]), .B1(B_i[4]), .B2(n246), .ZN(n234) );
  AOI22_X1 U274 ( .A1(n247), .A2(B[3]), .B1(B_i[3]), .B2(n246), .ZN(n235) );
  AOI22_X1 U276 ( .A1(n247), .A2(B[2]), .B1(B_i[2]), .B2(n246), .ZN(n236) );
  AOI22_X1 U278 ( .A1(n247), .A2(B[1]), .B1(n590), .B2(n246), .ZN(n237) );
  AOI22_X1 U280 ( .A1(n247), .A2(B[0]), .B1(B_i[0]), .B2(n246), .ZN(n238) );
  AOI22_X1 U282 ( .A1(n247), .A2(A[7]), .B1(A_i[7]), .B2(n246), .ZN(n239) );
  AOI22_X1 U284 ( .A1(n247), .A2(A[6]), .B1(A_i[6]), .B2(n246), .ZN(n240) );
  AOI22_X1 U286 ( .A1(n247), .A2(A[5]), .B1(A_i[5]), .B2(n246), .ZN(n241) );
  AOI22_X1 U288 ( .A1(n247), .A2(A[4]), .B1(A_i[4]), .B2(n246), .ZN(n242) );
  AOI22_X1 U290 ( .A1(n247), .A2(A[3]), .B1(A_i[3]), .B2(n246), .ZN(n243) );
  AOI22_X1 U292 ( .A1(n247), .A2(A[2]), .B1(A_i[2]), .B2(n246), .ZN(n244) );
  AOI22_X1 U294 ( .A1(n247), .A2(A[1]), .B1(A_i[1]), .B2(n246), .ZN(n245) );
  AOI22_X1 U296 ( .A1(n247), .A2(A[0]), .B1(A_i[0]), .B2(n246), .ZN(n248) );
  DFF_X1 B_reg_Y_temp_reg_1_ ( .D(n297), .CK(CLK), .Q(B_i[1]), .QN(n589) );
  DFF_X1 B_reg_Y_temp_reg_3_ ( .D(n295), .CK(CLK), .Q(B_i[3]), .QN(n583) );
  NAND2_X1 U168 ( .A1(LD), .A2(n138), .ZN(n227) );
  NOR2_X2 U217 ( .A1(RST), .A2(LD), .ZN(n246) );
  INV_X1 U245 ( .A(n205) );
  INV_X1 U247 ( .A(n207) );
  INV_X1 U215 ( .A(n227), .ZN(n247) );
  INV_X1 U229 ( .A(n202), .ZN(n198) );
  INV_X1 U240 ( .A(n210), .ZN(n206) );
  INV_X1 U253 ( .A(n246), .ZN(n230) );
  INV_X1 U258 ( .A(n222) );
  INV_X1 U277 ( .A(n236) );
  INV_X1 U297 ( .A(n248) );
  INV_X1 U275 ( .A(n235), .ZN(n295) );
  INV_X1 U295 ( .A(n245) );
  INV_X1 U267 ( .A(n231), .ZN(n291) );
  INV_X1 U269 ( .A(n232) );
  INV_X1 U285 ( .A(n240) );
  INV_X1 U283 ( .A(n239) );
  INV_X1 U281 ( .A(n238) );
  INV_X1 U293 ( .A(n244) );
  INV_X1 U291 ( .A(n243) );
  INV_X1 U289 ( .A(n242) );
  INV_X1 U287 ( .A(n241) );
  INV_X1 U279 ( .A(n237), .ZN(n297) );
  INV_X1 U271 ( .A(n233), .ZN(n293) );
  INV_X1 U273 ( .A(n234) );
  DFF_X1 B_reg_Y_temp_reg_0_ ( .D(n238), .CK(CLK), .QN(B_i[0]) );
  DFF_X1 B_reg_Y_temp_reg_6_ ( .D(n232), .CK(CLK), .QN(B_i[6]) );
  DFF_X1 B_reg_Y_temp_reg_4_ ( .D(n234), .CK(CLK), .QN(B_i[4]) );
  DFF_X1 B_reg_Y_temp_reg_2_ ( .D(n236), .CK(CLK), .QN(B_i[2]) );
  DFF_X1 A_reg_Y_temp_reg_7_ ( .D(n239), .CK(CLK), .Q(n591), .QN(A_i[7]) );
  DFF_X1 A_reg_Y_temp_reg_6_ ( .D(n240), .CK(CLK), .QN(A_i[6]) );
  DFF_X1 A_reg_Y_temp_reg_5_ ( .D(n241), .CK(CLK), .QN(A_i[5]) );
  DFF_X1 A_reg_Y_temp_reg_4_ ( .D(n242), .CK(CLK), .QN(A_i[4]) );
  DFF_X1 A_reg_Y_temp_reg_3_ ( .D(n243), .CK(CLK), .QN(A_i[3]) );
  DFF_X1 A_reg_Y_temp_reg_2_ ( .D(n244), .CK(CLK), .QN(A_i[2]) );
  DFF_X1 A_reg_Y_temp_reg_1_ ( .D(n245), .CK(CLK), .QN(A_i[1]) );
  DFF_X1 A_reg_Y_temp_reg_0_ ( .D(n248), .CK(CLK), .QN(A_i[0]) );
  DFF_X1 p_reg_Y_temp_reg_2_ ( .D(n222), .CK(CLK), .QN(P[2]) );
  DFF_X1 p_reg_Y_temp_reg_4_ ( .D(n286), .CK(CLK), .Q(P[4]) );
  DFF_X1 p_reg_Y_temp_reg_5_ ( .D(n207), .CK(CLK), .QN(P[5]) );
  DFF_X1 p_reg_Y_temp_reg_8_ ( .D(n282), .CK(CLK), .Q(P[8]) );
  DFF_X1 p_reg_Y_temp_reg_6_ ( .D(n205), .CK(CLK), .QN(P[6]) );
  DFF_X1 p_reg_Y_temp_reg_7_ ( .D(n204), .CK(CLK), .QN(P[7]) );
  DFF_X1 p_reg_Y_temp_reg_9_ ( .D(n199), .CK(CLK), .QN(P[9]) );
  DFF_X1 p_reg_Y_temp_reg_10_ ( .D(n197), .CK(CLK), .QN(P[10]) );
  DFF_X1 p_reg_Y_temp_reg_11_ ( .D(n196), .CK(CLK), .QN(P[11]) );
  DFF_X1 p_reg_Y_temp_reg_12_ ( .D(n278), .CK(CLK), .Q(P[12]) );
  DFF_X1 p_reg_Y_temp_reg_15_ ( .D(n188), .CK(CLK), .QN(P[15]) );
  DFF_X1 p_reg_Y_temp_reg_14_ ( .D(n189), .CK(CLK), .QN(P[14]) );
  DFF_X1 p_reg_Y_temp_reg_13_ ( .D(n190), .CK(CLK), .QN(P[13]) );
  BUF_X2 U316 ( .A(n507), .Z(n330) );
  AOI22_X1 U317 ( .A1(n590), .A2(n502), .B1(B_i[3]), .B2(n589), .ZN(n507) );
  INV_X1 U318 ( .A(n355), .ZN(n502) );
  INV_X1 U319 ( .A(n406), .ZN(n420) );
  AND2_X1 U320 ( .A1(B_i[3]), .A2(n331), .ZN(n355) );
  AND2_X1 U321 ( .A1(n187), .A2(n247), .ZN(n192) );
  XNOR2_X1 U322 ( .A(n420), .B(n419), .ZN(DP_OP_71J24_123_5612_n19) );
  XNOR2_X1 U323 ( .A(n581), .B(n580), .ZN(n419) );
  AOI22_X1 U324 ( .A1(B_i[5]), .A2(n444), .B1(n335), .B2(n584), .ZN(n429) );
  AOI21_X1 U325 ( .B1(B_i[3]), .B2(B_i[4]), .A(n334), .ZN(n430) );
  AOI221_X1 U326 ( .B1(n564), .B2(n434), .C1(n502), .C2(n433), .A(n432), .ZN(
        n489) );
  BUF_X1 U327 ( .A(B_i[1]), .Z(n590) );
  NAND2_X1 U328 ( .A1(B_i[1]), .A2(B_i[2]), .ZN(n331) );
  BUF_X1 U329 ( .A(n355), .Z(n564) );
  NOR2_X1 U330 ( .A1(B_i[2]), .A2(B_i[1]), .ZN(n366) );
  AOI21_X1 U331 ( .B1(B_i[1]), .B2(B_i[2]), .A(n366), .ZN(n421) );
  AND2_X1 U332 ( .A1(B_i[2]), .A2(B_i[1]), .ZN(n332) );
  OAI22_X1 U333 ( .A1(n583), .A2(n366), .B1(n332), .B2(B_i[3]), .ZN(n333) );
  INV_X1 U334 ( .A(n333), .ZN(n422) );
  AOI22_X1 U335 ( .A1(A_i[6]), .A2(n421), .B1(A_i[5]), .B2(n422), .ZN(n354) );
  XOR2_X1 U336 ( .A(n564), .B(n354), .Z(n339) );
  AOI21_X1 U337 ( .B1(A_i[7]), .B2(B_i[0]), .A(n590), .ZN(n348) );
  AOI21_X1 U338 ( .B1(n590), .B2(A_i[7]), .A(n348), .ZN(n338) );
  AOI21_X1 U339 ( .B1(B_i[4]), .B2(B_i[3]), .A(n584), .ZN(n345) );
  BUF_X1 U340 ( .A(n345), .Z(n484) );
  NOR2_X1 U341 ( .A1(B_i[4]), .A2(B_i[3]), .ZN(n334) );
  INV_X1 U342 ( .A(n334), .ZN(n444) );
  NAND2_X1 U343 ( .A1(B_i[4]), .A2(B_i[3]), .ZN(n335) );
  AOI22_X1 U344 ( .A1(n430), .A2(A_i[4]), .B1(A_i[3]), .B2(n429), .ZN(n352) );
  OAI22_X1 U345 ( .A1(n338), .A2(n339), .B1(n484), .B2(n352), .ZN(n336) );
  AOI21_X1 U346 ( .B1(n484), .B2(n352), .A(n336), .ZN(n337) );
  AOI21_X1 U347 ( .B1(n339), .B2(n338), .A(n337), .ZN(n365) );
  AOI22_X1 U348 ( .A1(n430), .A2(A_i[5]), .B1(A_i[4]), .B2(n429), .ZN(n370) );
  AOI22_X1 U349 ( .A1(A_i[7]), .A2(n421), .B1(A_i[6]), .B2(n422), .ZN(n340) );
  XOR2_X1 U350 ( .A(n564), .B(n340), .Z(n368) );
  INV_X1 U351 ( .A(n368), .ZN(n341) );
  XNOR2_X1 U352 ( .A(n370), .B(n341), .ZN(n362) );
  NOR2_X1 U353 ( .A1(B_i[6]), .A2(B_i[5]), .ZN(n441) );
  AOI21_X1 U354 ( .B1(B_i[5]), .B2(B_i[6]), .A(n441), .ZN(n461) );
  INV_X1 U355 ( .A(n441), .ZN(n343) );
  NAND2_X1 U356 ( .A1(B_i[6]), .A2(B_i[5]), .ZN(n342) );
  AOI22_X1 U357 ( .A1(B_i[7]), .A2(n343), .B1(n342), .B2(n585), .ZN(n460) );
  AOI22_X1 U358 ( .A1(n461), .A2(A_i[3]), .B1(A_i[2]), .B2(n460), .ZN(n360) );
  XNOR2_X1 U359 ( .A(n362), .B(n360), .ZN(n344) );
  XNOR2_X1 U360 ( .A(n365), .B(n344), .ZN(n347) );
  AOI21_X1 U361 ( .B1(B_i[6]), .B2(B_i[5]), .A(n585), .ZN(n443) );
  INV_X1 U362 ( .A(n345), .ZN(n356) );
  INV_X1 U363 ( .A(n443), .ZN(n346) );
  AOI22_X1 U364 ( .A1(n443), .A2(n484), .B1(n356), .B2(n346), .ZN(n449) );
  XNOR2_X1 U365 ( .A(n347), .B(n449), .ZN(n376) );
  NOR2_X1 U366 ( .A1(B_i[0]), .A2(n589), .ZN(n495) );
  AOI22_X1 U367 ( .A1(A_i[7]), .A2(B_i[0]), .B1(A_i[6]), .B2(n495), .ZN(n386)
         );
  AOI22_X1 U368 ( .A1(A_i[5]), .A2(n421), .B1(A_i[4]), .B2(n422), .ZN(n385) );
  XNOR2_X1 U369 ( .A(n564), .B(n385), .ZN(n350) );
  INV_X1 U370 ( .A(n348), .ZN(n349) );
  OAI211_X1 U371 ( .C1(n386), .C2(n589), .A(n350), .B(n349), .ZN(n381) );
  AOI22_X1 U372 ( .A1(n461), .A2(A_i[2]), .B1(A_i[1]), .B2(n460), .ZN(n378) );
  INV_X1 U373 ( .A(n443), .ZN(n523) );
  XNOR2_X1 U374 ( .A(n378), .B(n523), .ZN(n359) );
  OAI21_X1 U375 ( .B1(n590), .B2(B_i[0]), .A(A_i[7]), .ZN(n351) );
  XNOR2_X1 U376 ( .A(n352), .B(n351), .ZN(n353) );
  XNOR2_X1 U377 ( .A(n354), .B(n353), .ZN(n379) );
  INV_X1 U378 ( .A(n330), .ZN(n496) );
  AOI22_X1 U379 ( .A1(n484), .A2(n330), .B1(n496), .B2(n356), .ZN(n482) );
  OAI22_X1 U380 ( .A1(n359), .A2(n381), .B1(n379), .B2(n482), .ZN(n357) );
  AOI21_X1 U381 ( .B1(n379), .B2(n482), .A(n357), .ZN(n358) );
  AOI21_X1 U382 ( .B1(n381), .B2(n359), .A(n358), .ZN(n375) );
  NOR2_X1 U383 ( .A1(n376), .A2(n375), .ZN(n579) );
  XNOR2_X1 U384 ( .A(n443), .B(n360), .ZN(n364) );
  OAI22_X1 U385 ( .A1(n364), .A2(n365), .B1(n362), .B2(n484), .ZN(n361) );
  AOI21_X1 U386 ( .B1(n362), .B2(n484), .A(n361), .ZN(n363) );
  AOI21_X1 U387 ( .B1(n365), .B2(n364), .A(n363), .ZN(n418) );
  AOI22_X1 U388 ( .A1(n461), .A2(A_i[4]), .B1(A_i[3]), .B2(n460), .ZN(n413) );
  AOI22_X1 U389 ( .A1(n430), .A2(A_i[6]), .B1(A_i[5]), .B2(n429), .ZN(n409) );
  OAI33_X1 U391 ( .A1(1'b0), .A2(A_i[7]), .A3(n502), .B1(n591), .B2(B_i[3]), 
        .B3(n366), .ZN(n412) );
  AOI21_X1 U392 ( .B1(n370), .B2(n356), .A(n368), .ZN(n369) );
  OAI21_X1 U393 ( .B1(n370), .B2(n356), .A(n369), .ZN(n411) );
  INV_X1 U394 ( .A(n411), .ZN(n371) );
  XNOR2_X1 U395 ( .A(n412), .B(n371), .ZN(n372) );
  XOR2_X1 U396 ( .A(n409), .B(n372), .Z(n415) );
  XOR2_X1 U397 ( .A(n413), .B(n415), .Z(n373) );
  XNOR2_X1 U398 ( .A(n418), .B(n373), .ZN(n374) );
  XNOR2_X1 U399 ( .A(n449), .B(n374), .ZN(n577) );
  AOI21_X1 U400 ( .B1(n376), .B2(n375), .A(n579), .ZN(n572) );
  INV_X1 U401 ( .A(n449), .ZN(n377) );
  AOI22_X1 U402 ( .A1(n449), .A2(n330), .B1(n496), .B2(n377), .ZN(n520) );
  XNOR2_X1 U403 ( .A(n378), .B(n520), .ZN(n380) );
  XNOR2_X1 U404 ( .A(n380), .B(n379), .ZN(n382) );
  XNOR2_X1 U405 ( .A(n382), .B(n381), .ZN(n405) );
  AOI22_X1 U406 ( .A1(A_i[4]), .A2(n421), .B1(A_i[3]), .B2(n422), .ZN(n384) );
  INV_X1 U407 ( .A(n384), .ZN(n391) );
  AND2_X1 U408 ( .A1(n589), .A2(B_i[0]), .ZN(n498) );
  AOI22_X1 U409 ( .A1(A_i[6]), .A2(B_i[0]), .B1(A_i[5]), .B2(n495), .ZN(n392)
         );
  AOI22_X1 U410 ( .A1(A_i[6]), .A2(n498), .B1(n590), .B2(n392), .ZN(n383) );
  AOI221_X1 U411 ( .B1(n564), .B2(n391), .C1(n502), .C2(n384), .A(n383), .ZN(
        n400) );
  INV_X1 U412 ( .A(n400), .ZN(n390) );
  AOI22_X1 U413 ( .A1(n430), .A2(A_i[3]), .B1(A_i[2]), .B2(n429), .ZN(n397) );
  XNOR2_X1 U414 ( .A(n397), .B(n356), .ZN(n389) );
  XOR2_X1 U415 ( .A(n386), .B(n385), .Z(n398) );
  OAI22_X1 U416 ( .A1(n389), .A2(n390), .B1(n398), .B2(n330), .ZN(n387) );
  AOI21_X1 U417 ( .B1(n398), .B2(n330), .A(n387), .ZN(n388) );
  AOI21_X1 U418 ( .B1(n390), .B2(n389), .A(n388), .ZN(n404) );
  NOR2_X1 U419 ( .A1(n405), .A2(n404), .ZN(n567) );
  NAND2_X1 U420 ( .A1(n461), .A2(A_i[0]), .ZN(n478) );
  XNOR2_X1 U421 ( .A(n443), .B(n478), .ZN(n396) );
  AOI22_X1 U422 ( .A1(n430), .A2(A_i[2]), .B1(A_i[1]), .B2(n429), .ZN(n480) );
  XNOR2_X1 U423 ( .A(n484), .B(n480), .ZN(n395) );
  XNOR2_X1 U424 ( .A(n392), .B(n391), .ZN(n477) );
  AOI22_X1 U425 ( .A1(n396), .A2(n395), .B1(n330), .B2(n477), .ZN(n393) );
  OAI21_X1 U426 ( .B1(n330), .B2(n477), .A(n393), .ZN(n394) );
  OAI21_X1 U427 ( .B1(n396), .B2(n395), .A(n394), .ZN(n513) );
  AOI22_X1 U428 ( .A1(n461), .A2(A_i[1]), .B1(A_i[0]), .B2(n460), .ZN(n514) );
  XNOR2_X1 U429 ( .A(n514), .B(n523), .ZN(n403) );
  XNOR2_X1 U430 ( .A(n398), .B(n397), .ZN(n399) );
  XNOR2_X1 U431 ( .A(n400), .B(n399), .ZN(n515) );
  AOI22_X1 U432 ( .A1(n513), .A2(n403), .B1(n515), .B2(n482), .ZN(n401) );
  OAI21_X1 U433 ( .B1(n515), .B2(n482), .A(n401), .ZN(n402) );
  OAI21_X1 U434 ( .B1(n513), .B2(n403), .A(n402), .ZN(n491) );
  XNOR2_X1 U435 ( .A(n405), .B(n404), .ZN(n492) );
  NAND2_X1 U436 ( .A1(n491), .A2(n492), .ZN(n571) );
  AOI22_X1 U437 ( .A1(A_i[5]), .A2(n461), .B1(A_i[4]), .B2(n460), .ZN(n446) );
  AOI22_X1 U438 ( .A1(A_i[7]), .A2(n430), .B1(A_i[6]), .B2(n429), .ZN(n447) );
  XNOR2_X1 U439 ( .A(n449), .B(n447), .ZN(n407) );
  XNOR2_X1 U440 ( .A(n446), .B(n407), .ZN(n453) );
  AOI22_X1 U441 ( .A1(n412), .A2(n411), .B1(n409), .B2(n356), .ZN(n408) );
  OAI21_X1 U442 ( .B1(n409), .B2(n356), .A(n408), .ZN(n410) );
  OAI21_X1 U443 ( .B1(n412), .B2(n411), .A(n410), .ZN(n452) );
  XNOR2_X1 U444 ( .A(n453), .B(n452), .ZN(n581) );
  XNOR2_X1 U445 ( .A(n413), .B(n523), .ZN(n417) );
  OAI22_X1 U446 ( .A1(n417), .A2(n418), .B1(n484), .B2(n415), .ZN(n414) );
  AOI21_X1 U447 ( .B1(n484), .B2(n415), .A(n414), .ZN(n416) );
  AOI21_X1 U448 ( .B1(n418), .B2(n417), .A(n416), .ZN(n580) );
  NAND2_X1 U449 ( .A1(n430), .A2(A_i[0]), .ZN(n425) );
  INV_X1 U450 ( .A(n425), .ZN(n424) );
  AOI22_X1 U451 ( .A1(n422), .A2(A_i[1]), .B1(n421), .B2(A_i[2]), .ZN(n433) );
  INV_X1 U452 ( .A(n433), .ZN(n434) );
  AOI22_X1 U453 ( .A1(n330), .A2(n433), .B1(n496), .B2(n434), .ZN(n423) );
  AOI22_X1 U454 ( .A1(A_i[4]), .A2(B_i[0]), .B1(A_i[3]), .B2(n495), .ZN(n431)
         );
  XNOR2_X1 U455 ( .A(n423), .B(n431), .ZN(n426) );
  AOI22_X1 U456 ( .A1(n424), .A2(n426), .B1(n484), .B2(n425), .ZN(n524) );
  XNOR2_X1 U457 ( .A(n426), .B(n425), .ZN(n438) );
  AOI22_X1 U458 ( .A1(n421), .A2(A_i[1]), .B1(A_i[0]), .B2(n422), .ZN(n505) );
  INV_X1 U459 ( .A(n505), .ZN(n428) );
  AOI22_X1 U460 ( .A1(B_i[0]), .A2(A_i[3]), .B1(A_i[2]), .B2(n495), .ZN(n504)
         );
  AOI22_X1 U461 ( .A1(n590), .A2(n504), .B1(A_i[3]), .B2(n498), .ZN(n427) );
  AOI221_X1 U462 ( .B1(n505), .B2(n502), .C1(n428), .C2(n564), .A(n427), .ZN(
        n525) );
  AND2_X1 U463 ( .A1(n438), .A2(n525), .ZN(n528) );
  INV_X1 U464 ( .A(n528), .ZN(n490) );
  AOI22_X1 U465 ( .A1(A_i[5]), .A2(B_i[0]), .B1(A_i[4]), .B2(n495), .ZN(n472)
         );
  AOI22_X1 U466 ( .A1(n421), .A2(A_i[3]), .B1(A_i[2]), .B2(n422), .ZN(n476) );
  XOR2_X1 U467 ( .A(n472), .B(n476), .Z(n486) );
  AOI22_X1 U468 ( .A1(n430), .A2(A_i[1]), .B1(A_i[0]), .B2(n429), .ZN(n483) );
  AOI22_X1 U469 ( .A1(A_i[4]), .A2(n498), .B1(n590), .B2(n431), .ZN(n432) );
  XNOR2_X1 U470 ( .A(n483), .B(n489), .ZN(n435) );
  XNOR2_X1 U471 ( .A(n486), .B(n435), .ZN(n436) );
  XNOR2_X1 U472 ( .A(n436), .B(n482), .ZN(n530) );
  INV_X1 U473 ( .A(n437), .ZN(DP_OP_70J24_122_5612_n17) );
  BUF_X1 U474 ( .A(n438), .Z(n526) );
  NOR2_X1 U475 ( .A1(n526), .A2(n525), .ZN(n439) );
  NOR2_X1 U476 ( .A1(n528), .A2(n439), .ZN(DP_OP_70J24_122_5612_n4) );
  NAND2_X1 U477 ( .A1(DP_OP_70J24_122_5612_n4), .A2(DP_OP_70J24_122_5612_n17), 
        .ZN(n547) );
  OAI21_X1 U478 ( .B1(DP_OP_70J24_122_5612_n17), .B2(DP_OP_70J24_122_5612_n4), 
        .A(n547), .ZN(n440) );
  INV_X1 U479 ( .A(n440), .ZN(mul_final_add_sum_gen_carry_select_int_1_S1[1])
         );
  OAI21_X1 U480 ( .B1(B_i[7]), .B2(n441), .A(A_i[7]), .ZN(n442) );
  OAI21_X1 U481 ( .B1(A_i[7]), .B2(n443), .A(n442), .ZN(n471) );
  NAND3_X1 U482 ( .A1(n584), .A2(n444), .A3(A_i[7]), .ZN(n454) );
  OAI21_X1 U483 ( .B1(n591), .B2(n356), .A(n454), .ZN(n448) );
  AOI22_X1 U484 ( .A1(n356), .A2(n447), .B1(n523), .B2(n446), .ZN(n445) );
  OAI221_X1 U485 ( .B1(n356), .B2(n447), .C1(n523), .C2(n446), .A(n445), .ZN(
        n459) );
  XOR2_X1 U486 ( .A(n448), .B(n459), .Z(n451) );
  AOI22_X1 U487 ( .A1(A_i[6]), .A2(n461), .B1(A_i[5]), .B2(n460), .ZN(n456) );
  XNOR2_X1 U488 ( .A(n449), .B(n456), .ZN(n450) );
  XNOR2_X1 U489 ( .A(n451), .B(n450), .ZN(n468) );
  NOR2_X1 U490 ( .A1(n453), .A2(n452), .ZN(n469) );
  NOR2_X1 U491 ( .A1(n468), .A2(n469), .ZN(n467) );
  OAI21_X1 U492 ( .B1(A_i[7]), .B2(n356), .A(n454), .ZN(n458) );
  AOI22_X1 U493 ( .A1(n459), .A2(n458), .B1(n456), .B2(n523), .ZN(n455) );
  OAI21_X1 U494 ( .B1(n456), .B2(n523), .A(n455), .ZN(n457) );
  OAI21_X1 U495 ( .B1(n459), .B2(n458), .A(n457), .ZN(n464) );
  NOR2_X1 U496 ( .A1(n467), .A2(n464), .ZN(n463) );
  AOI22_X1 U497 ( .A1(A_i[7]), .A2(n461), .B1(A_i[6]), .B2(n460), .ZN(n462) );
  XNOR2_X1 U498 ( .A(n462), .B(n523), .ZN(n466) );
  NAND2_X1 U499 ( .A1(n463), .A2(n466), .ZN(n470) );
  NAND2_X1 U500 ( .A1(n471), .A2(n470), .ZN(DP_OP_72J24_124_9845_n18) );
  AOI21_X1 U501 ( .B1(n467), .B2(n464), .A(n463), .ZN(n465) );
  XOR2_X1 U502 ( .A(n466), .B(n465), .Z(DP_OP_72J24_124_9845_n16) );
  AOI21_X1 U503 ( .B1(n469), .B2(n468), .A(n467), .ZN(DP_OP_72J24_124_9845_n4)
         );
  XOR2_X1 U504 ( .A(n471), .B(n470), .Z(DP_OP_72J24_124_9845_n17) );
  NAND3_X1 U505 ( .A1(DP_OP_72J24_124_9845_n16), .A2(DP_OP_72J24_124_9845_n4), 
        .A3(DP_OP_72J24_124_9845_n17), .ZN(n493) );
  AND2_X1 U506 ( .A1(DP_OP_72J24_124_9845_n18), .A2(n493), .ZN(
        mul_final_add_sum_gen_carry_select_int_3_S1[3]) );
  INV_X1 U507 ( .A(n476), .ZN(n475) );
  AOI22_X1 U508 ( .A1(A_i[5]), .A2(n498), .B1(n590), .B2(n472), .ZN(n473) );
  INV_X1 U509 ( .A(n473), .ZN(n474) );
  OAI221_X1 U510 ( .B1(n502), .B2(n476), .C1(n564), .C2(n475), .A(n474), .ZN(
        n522) );
  XNOR2_X1 U511 ( .A(n478), .B(n477), .ZN(n479) );
  XOR2_X1 U512 ( .A(n480), .B(n479), .Z(n519) );
  XNOR2_X1 U513 ( .A(n522), .B(n519), .ZN(n481) );
  XNOR2_X1 U514 ( .A(n482), .B(n481), .ZN(n543) );
  XNOR2_X1 U515 ( .A(n484), .B(n483), .ZN(n488) );
  AOI22_X1 U516 ( .A1(n489), .A2(n488), .B1(n330), .B2(n486), .ZN(n485) );
  OAI21_X1 U517 ( .B1(n330), .B2(n486), .A(n485), .ZN(n487) );
  OAI21_X1 U518 ( .B1(n489), .B2(n488), .A(n487), .ZN(n542) );
  FA_X1 U519 ( .A(n524), .B(n490), .CI(n530), .CO(n541), .S(n437) );
  INV_X1 U520 ( .A(n548), .ZN(DP_OP_70J24_122_5612_n18) );
  OR2_X1 U521 ( .A1(n492), .A2(n491), .ZN(n568) );
  NAND2_X1 U522 ( .A1(n568), .A2(n571), .ZN(n550) );
  INV_X1 U523 ( .A(n550), .ZN(DP_OP_71J24_123_5612_n4) );
  INV_X1 U524 ( .A(DP_OP_72J24_124_9845_n16), .ZN(n556) );
  INV_X1 U525 ( .A(DP_OP_72J24_124_9845_n4), .ZN(n555) );
  NOR2_X1 U526 ( .A1(n556), .A2(n555), .ZN(n554) );
  OAI21_X1 U527 ( .B1(n554), .B2(DP_OP_72J24_124_9845_n17), .A(n493), .ZN(n494) );
  INV_X1 U528 ( .A(n494), .ZN(mul_final_add_sum_gen_carry_select_int_3_S1[2])
         );
  NAND2_X1 U529 ( .A1(n421), .A2(A_i[0]), .ZN(n501) );
  AOI22_X1 U530 ( .A1(B_i[0]), .A2(A_i[2]), .B1(n495), .B2(A_i[1]), .ZN(n499)
         );
  XNOR2_X1 U531 ( .A(n499), .B(n496), .ZN(n497) );
  XNOR2_X1 U532 ( .A(n501), .B(n497), .ZN(n562) );
  AOI211_X1 U533 ( .C1(B_i[0]), .C2(A_i[1]), .A(A_i[0]), .B(n589), .ZN(n563)
         );
  AOI22_X1 U534 ( .A1(n564), .A2(n562), .B1(n499), .B2(n563), .ZN(n510) );
  INV_X1 U535 ( .A(n501), .ZN(n503) );
  AOI22_X1 U536 ( .A1(n590), .A2(n499), .B1(A_i[2]), .B2(n498), .ZN(n500) );
  AOI221_X1 U537 ( .B1(n564), .B2(n503), .C1(n502), .C2(n501), .A(n500), .ZN(
        n509) );
  XOR2_X1 U538 ( .A(n505), .B(n504), .Z(n506) );
  XNOR2_X1 U539 ( .A(n330), .B(n506), .ZN(n508) );
  NAND2_X1 U540 ( .A1(n509), .A2(n508), .ZN(n559) );
  NOR2_X1 U541 ( .A1(n509), .A2(n508), .ZN(n561) );
  AOI21_X1 U542 ( .B1(n510), .B2(n559), .A(n561), .ZN(n527) );
  FA_X1 U543 ( .A(n572), .B(n567), .CI(n571), .CO(n512), .S(n549) );
  INV_X1 U544 ( .A(n549), .ZN(DP_OP_71J24_123_5612_n17) );
  NAND2_X1 U545 ( .A1(DP_OP_71J24_123_5612_n4), .A2(DP_OP_71J24_123_5612_n17), 
        .ZN(n552) );
  OAI21_X1 U546 ( .B1(DP_OP_71J24_123_5612_n17), .B2(DP_OP_71J24_123_5612_n4), 
        .A(n552), .ZN(n511) );
  INV_X1 U547 ( .A(n511), .ZN(mul_final_add_sum_gen_carry_select_int_2_S1[1])
         );
  FA_X1 U548 ( .A(n579), .B(n577), .CI(n512), .CO(n406), .S(n553) );
  INV_X1 U549 ( .A(n553), .ZN(DP_OP_71J24_123_5612_n18) );
  XOR2_X1 U550 ( .A(n513), .B(n520), .Z(n517) );
  XNOR2_X1 U551 ( .A(n515), .B(n514), .ZN(n516) );
  XNOR2_X1 U552 ( .A(n517), .B(n516), .ZN(n536) );
  AOI22_X1 U553 ( .A1(n523), .A2(n522), .B1(n520), .B2(n519), .ZN(n518) );
  OAI21_X1 U554 ( .B1(n520), .B2(n519), .A(n518), .ZN(n521) );
  OAI21_X1 U555 ( .B1(n523), .B2(n522), .A(n521), .ZN(n535) );
  NOR2_X1 U556 ( .A1(n536), .A2(n535), .ZN(n540) );
  INV_X1 U557 ( .A(n540), .ZN(n538) );
  INV_X1 U558 ( .A(n524), .ZN(n533) );
  OAI22_X1 U559 ( .A1(n528), .A2(n527), .B1(n526), .B2(n525), .ZN(n529) );
  INV_X1 U560 ( .A(n529), .ZN(n532) );
  INV_X1 U561 ( .A(n530), .ZN(n531) );
  OAI222_X1 U562 ( .A1(n533), .A2(n532), .B1(n533), .B2(n531), .C1(n532), .C2(
        n531), .ZN(n534) );
  OAI222_X1 U563 ( .A1(n543), .A2(n534), .B1(n543), .B2(n542), .C1(n534), .C2(
        n542), .ZN(n537) );
  AND2_X1 U564 ( .A1(n536), .A2(n535), .ZN(n539) );
  AOI21_X1 U565 ( .B1(n538), .B2(n537), .A(n539), .ZN(n570) );
  INV_X1 U566 ( .A(n570), .ZN(n195) );
  NOR2_X1 U567 ( .A1(n540), .A2(n539), .ZN(n545) );
  FA_X1 U568 ( .A(n543), .B(n542), .CI(n541), .CO(n544), .S(n548) );
  XNOR2_X1 U569 ( .A(n545), .B(n544), .ZN(DP_OP_70J24_122_5612_n19) );
  AND3_X1 U570 ( .A1(DP_OP_70J24_122_5612_n4), .A2(DP_OP_70J24_122_5612_n17), 
        .A3(DP_OP_70J24_122_5612_n18), .ZN(n546) );
  XOR2_X1 U571 ( .A(n546), .B(DP_OP_70J24_122_5612_n19), .Z(
        mul_final_add_sum_gen_carry_select_int_1_S1[3]) );
  AOI21_X1 U572 ( .B1(n548), .B2(n547), .A(n546), .ZN(
        mul_final_add_sum_gen_carry_select_int_1_S1[2]) );
  NOR3_X1 U573 ( .A1(n550), .A2(n549), .A3(n553), .ZN(n551) );
  XOR2_X1 U574 ( .A(n551), .B(DP_OP_71J24_123_5612_n19), .Z(
        mul_final_add_sum_gen_carry_select_int_2_S1[3]) );
  AOI21_X1 U575 ( .B1(n553), .B2(n552), .A(n551), .ZN(
        mul_final_add_sum_gen_carry_select_int_2_S1[2]) );
  AOI21_X1 U576 ( .B1(n556), .B2(n555), .A(n554), .ZN(
        mul_final_add_sum_gen_carry_select_int_3_S1[1]) );
  NAND2_X1 U577 ( .A1(B_i[0]), .A2(A_i[1]), .ZN(n558) );
  NAND2_X1 U578 ( .A1(n590), .A2(A_i[0]), .ZN(n557) );
  XNOR2_X1 U579 ( .A(n558), .B(n557), .ZN(n226) );
  INV_X1 U580 ( .A(n559), .ZN(n560) );
  NOR2_X1 U581 ( .A1(n561), .A2(n560), .ZN(n566) );
  FA_X1 U582 ( .A(n564), .B(n563), .CI(n562), .CO(n565), .S(n221) );
  XNOR2_X1 U583 ( .A(n566), .B(n565), .ZN(n217) );
  INV_X1 U584 ( .A(n567), .ZN(n574) );
  NAND2_X1 U585 ( .A1(n574), .A2(n568), .ZN(n569) );
  AOI22_X1 U586 ( .A1(n571), .A2(n570), .B1(n572), .B2(n569), .ZN(n576) );
  INV_X1 U587 ( .A(n572), .ZN(n573) );
  AND2_X1 U588 ( .A1(n574), .A2(n573), .ZN(n575) );
  NOR2_X1 U589 ( .A1(n576), .A2(n575), .ZN(n578) );
  AOI222_X1 U590 ( .A1(n579), .A2(n578), .B1(n579), .B2(n577), .C1(n578), .C2(
        n577), .ZN(n582) );
  AOI222_X1 U591 ( .A1(n582), .A2(n581), .B1(n582), .B2(n580), .C1(n581), .C2(
        n580), .ZN(n187) );
endmodule

