/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : W-2024.09-SP2
// Date      : Thu Aug 27 03:28:50 2026
/////////////////////////////////////////////////////////////


module boothmul_registered ( CLK, LD, RST, A, B, P );
  input [7:0] A;
  input [7:0] B;
  output [15:0] P;
  input CLK, LD, RST;
  wire   mul_final_add_sum_gen_carry_select_int_1_S1_0_, n153, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n210, n212, n215, n216, n217, n218, n219, n226,
         n230, n234, n236, n237, n238, n240, n241, n242, n243, n245, n247,
         n249, n251, n252, n253, n254, n256, n258, n260, n262, n263, n265,
         n266, n306, n307, n308, n309, n310, n311, n312, n313, n314, n315,
         n316, n317, n318, n319, n320, n321, n322, n323, n324, n325, n326,
         n327, n328, n329, n330, n331, n332, n333, n334, n335, n336, n337,
         DP_OP_72J3_124_5612_n19, DP_OP_72J3_124_5612_n18,
         DP_OP_72J3_124_5612_n17, DP_OP_72J3_124_5612_n4,
         DP_OP_71J3_123_5612_n19, DP_OP_71J3_123_5612_n18,
         DP_OP_71J3_123_5612_n17, DP_OP_71J3_123_5612_n4, n358, n359, n360,
         n361, n362, n363, n364, n365, n366, n367, n368, n369, n370, n371,
         n372, n373, n374, n375, n376, n377, n378, n379, n380, n381, n382,
         n383, n384, n385, n386, n387, n388, n389, n390, n391, n392, n393,
         n394, n395, n396, n397, n398, n399, n400, n401, n402, n403, n404,
         n405, n406, n407, n408, n409, n410, n411, n412, n413, n414, n415,
         n416, n417, n418, n419, n420, n421, n422, n423, n424, n425, n426,
         n427, n428, n429, n430, n431, n432, n433, n434, n435, n436, n437,
         n438, n439, n440, n441, n442, n443, n444, n445, n446, n447, n448,
         n449, n450, n451, n452, n453, n454, n455, n456, n457, n458, n459,
         n460, n461, n462, n463, n464, n465, n466, n467, n468, n469, n470,
         n471, n472, n473, n474, n475, n476, n477, n478, n479, n480, n481,
         n482, n483, n484, n485, n486, n487, n488, n489, n490, n491, n492,
         n493, n494, n495, n496, n497, n498, n499, n500, n501, n502, n503,
         n504, n505, n506, n507, n508, n509, n510, n511, n512, n513, n514,
         n515, n516, n517, n518, n519, n520, n521, n522, n523, n524, n525,
         n526, n527, n528, n529, n530, n531, n532, n533, n534, n535, n536,
         n537, n538, n539, n540, n541, n542, n543, n544, n545, n546, n547,
         n548, n549, n550, n551, n552, n553, n554, n555, n556, n557, n558,
         n559, n560, n561, n562, n563, n564, n565, n566, n567, n568, n569,
         n570, n571, n572, n573, n574, n575, n576, n577, n578, n579, n580,
         n581, n582, n583, n584, n585, n586, n587, n588, n589, n590, n591,
         n592, n593, n594, n595, n596, n597, n598, n599, n600, n601, n602,
         n603, n604, n605, n606, n607, n608, n609, n610, n611, n612, n613,
         n614, n615, n616, n617, n618, n619, n620, n621, n622, n623, n624,
         n625, n626, n627, n628, n629, n630, n631, n632, n633, n634, n635,
         n636, n637, n638, n639, n640, n641, n642, n643, n644, n645, n646,
         n647, n648, n649, n650, n651, n652, n653, n654, n655;
  wire   [7:0] A_i;
  wire   [7:0] B_i;
  wire   [3:1] mul_final_add_sum_gen_carry_select_int_2_S1;
  wire   [3:1] mul_final_add_sum_gen_carry_select_int_3_S1;

  DFF_X1 A_reg_Y_temp_reg_0_ ( .D(n337), .CK(CLK), .Q(A_i[0]), .QN(n644) );
  DFF_X1 A_reg_Y_temp_reg_1_ ( .D(n336), .CK(CLK), .Q(A_i[1]), .QN(n638) );
  DFF_X1 A_reg_Y_temp_reg_2_ ( .D(n335), .CK(CLK), .Q(A_i[2]), .QN(n637) );
  DFF_X1 A_reg_Y_temp_reg_3_ ( .D(n334), .CK(CLK), .Q(A_i[3]), .QN(n647) );
  DFF_X1 A_reg_Y_temp_reg_4_ ( .D(n333), .CK(CLK), .Q(A_i[4]), .QN(n639) );
  DFF_X1 A_reg_Y_temp_reg_5_ ( .D(n332), .CK(CLK), .Q(A_i[5]), .QN(n648) );
  DFF_X1 A_reg_Y_temp_reg_6_ ( .D(n331), .CK(CLK), .Q(A_i[6]), .QN(n640) );
  DFF_X1 B_reg_Y_temp_reg_2_ ( .D(n327), .CK(CLK), .Q(B_i[2]), .QN(n641) );
  DFF_X1 B_reg_Y_temp_reg_3_ ( .D(n326), .CK(CLK), .Q(B_i[3]), .QN(n646) );
  DFF_X1 B_reg_Y_temp_reg_4_ ( .D(n325), .CK(CLK), .Q(B_i[4]) );
  DFF_X1 B_reg_Y_temp_reg_5_ ( .D(n324), .CK(CLK), .Q(B_i[5]), .QN(n642) );
  DFF_X1 B_reg_Y_temp_reg_6_ ( .D(n323), .CK(CLK), .Q(B_i[6]) );
  DFF_X1 B_reg_Y_temp_reg_7_ ( .D(n322), .CK(CLK), .Q(B_i[7]), .QN(n643) );
  DFF_X1 p_reg_Y_temp_reg_0_ ( .D(n321), .CK(CLK), .Q(P[0]), .QN(n649) );
  DFF_X1 p_reg_Y_temp_reg_1_ ( .D(n320), .CK(CLK), .Q(P[1]), .QN(n650) );
  DFF_X1 p_reg_Y_temp_reg_2_ ( .D(n319), .CK(CLK), .Q(P[2]), .QN(n651) );
  DFF_X1 p_reg_Y_temp_reg_3_ ( .D(n318), .CK(CLK), .Q(P[3]), .QN(n652) );
  DFF_X1 p_reg_Y_temp_reg_4_ ( .D(n317), .CK(CLK), .Q(P[4]) );
  DFF_X1 p_reg_Y_temp_reg_5_ ( .D(n316), .CK(CLK), .Q(P[5]), .QN(n653) );
  DFF_X1 p_reg_Y_temp_reg_6_ ( .D(n315), .CK(CLK), .Q(P[6]), .QN(n654) );
  DFF_X1 p_reg_Y_temp_reg_7_ ( .D(n314), .CK(CLK), .Q(P[7]), .QN(n655) );
  DFF_X1 p_reg_Y_temp_reg_8_ ( .D(n313), .CK(CLK), .Q(P[8]) );
  DFF_X1 p_reg_Y_temp_reg_9_ ( .D(n312), .CK(CLK), .Q(P[9]) );
  DFF_X1 p_reg_Y_temp_reg_10_ ( .D(n311), .CK(CLK), .Q(P[10]) );
  DFF_X1 p_reg_Y_temp_reg_11_ ( .D(n310), .CK(CLK), .Q(P[11]) );
  DFF_X1 p_reg_Y_temp_reg_12_ ( .D(n309), .CK(CLK), .Q(P[12]) );
  DFF_X1 p_reg_Y_temp_reg_13_ ( .D(n308), .CK(CLK), .Q(P[13]) );
  DFF_X1 p_reg_Y_temp_reg_14_ ( .D(n307), .CK(CLK), .Q(P[14]) );
  DFF_X1 p_reg_Y_temp_reg_15_ ( .D(n306), .CK(CLK), .Q(P[15]) );
  NOR2_X1 U239 ( .A1(n266), .A2(n193), .ZN(n197) );
  AOI222_X1 U242 ( .A1(n197), .A2(
        mul_final_add_sum_gen_carry_select_int_3_S1[3]), .B1(n252), .B2(P[15]), 
        .C1(n198), .C2(DP_OP_72J3_124_5612_n19), .ZN(n194) );
  INV_X1 U243 ( .A(n194), .ZN(n306) );
  AOI222_X1 U244 ( .A1(mul_final_add_sum_gen_carry_select_int_3_S1[2]), .A2(
        n197), .B1(n252), .B2(P[14]), .C1(n198), .C2(DP_OP_72J3_124_5612_n18), 
        .ZN(n195) );
  INV_X1 U245 ( .A(n195), .ZN(n307) );
  AOI222_X1 U246 ( .A1(n197), .A2(
        mul_final_add_sum_gen_carry_select_int_3_S1[1]), .B1(n252), .B2(P[13]), 
        .C1(n198), .C2(DP_OP_72J3_124_5612_n17), .ZN(n196) );
  INV_X1 U247 ( .A(n196), .ZN(n308) );
  INV_X1 U248 ( .A(n197), .ZN(n200) );
  AOI22_X1 U249 ( .A1(n252), .A2(P[12]), .B1(n198), .B2(DP_OP_72J3_124_5612_n4), .ZN(n199) );
  OAI21_X1 U250 ( .B1(DP_OP_72J3_124_5612_n4), .B2(n200), .A(n199), .ZN(n309)
         );
  NOR2_X1 U251 ( .A1(n266), .A2(n201), .ZN(n206) );
  NAND2_X1 U252 ( .A1(n201), .A2(n253), .ZN(n208) );
  AOI222_X1 U254 ( .A1(n252), .A2(P[11]), .B1(n206), .B2(
        DP_OP_71J3_123_5612_n19), .C1(n204), .C2(
        mul_final_add_sum_gen_carry_select_int_2_S1[3]), .ZN(n202) );
  INV_X1 U255 ( .A(n202), .ZN(n310) );
  AOI222_X1 U256 ( .A1(n252), .A2(P[10]), .B1(n206), .B2(
        DP_OP_71J3_123_5612_n18), .C1(n204), .C2(
        mul_final_add_sum_gen_carry_select_int_2_S1[2]), .ZN(n203) );
  INV_X1 U257 ( .A(n203), .ZN(n311) );
  AOI222_X1 U258 ( .A1(n252), .A2(P[9]), .B1(n206), .B2(
        DP_OP_71J3_123_5612_n17), .C1(n204), .C2(
        mul_final_add_sum_gen_carry_select_int_2_S1[1]), .ZN(n205) );
  AOI22_X1 U260 ( .A1(n252), .A2(P[8]), .B1(n206), .B2(DP_OP_71J3_123_5612_n4), 
        .ZN(n207) );
  OAI21_X1 U261 ( .B1(DP_OP_71J3_123_5612_n4), .B2(n208), .A(n207), .ZN(n313)
         );
  OAI22_X1 U266 ( .A1(n266), .A2(n210), .B1(n263), .B2(n655), .ZN(n314) );
  OAI22_X1 U269 ( .A1(n266), .A2(n212), .B1(n263), .B2(n654), .ZN(n315) );
  OAI22_X1 U272 ( .A1(n266), .A2(n215), .B1(n263), .B2(n653), .ZN(n316) );
  AOI21_X1 U273 ( .B1(mul_final_add_sum_gen_carry_select_int_1_S1_0_), .B2(
        n216), .A(n266), .ZN(n218) );
  AOI22_X1 U274 ( .A1(P[4]), .A2(n252), .B1(n218), .B2(n217), .ZN(n219) );
  OAI22_X1 U279 ( .A1(n266), .A2(n226), .B1(n263), .B2(n652), .ZN(n318) );
  OAI22_X1 U283 ( .A1(n266), .A2(n230), .B1(n263), .B2(n651), .ZN(n319) );
  OAI22_X1 U287 ( .A1(n266), .A2(n234), .B1(n263), .B2(n650), .ZN(n320) );
  OAI22_X1 U290 ( .A1(n266), .A2(n236), .B1(n263), .B2(n649), .ZN(n321) );
  AOI22_X1 U291 ( .A1(n253), .A2(B[7]), .B1(B_i[7]), .B2(n252), .ZN(n237) );
  AOI22_X1 U293 ( .A1(n253), .A2(B[6]), .B1(B_i[6]), .B2(n252), .ZN(n238) );
  OAI22_X1 U296 ( .A1(n266), .A2(n240), .B1(n642), .B2(n263), .ZN(n324) );
  AOI22_X1 U297 ( .A1(n253), .A2(B[4]), .B1(B_i[4]), .B2(n252), .ZN(n241) );
  AOI22_X1 U299 ( .A1(n253), .A2(B[3]), .B1(B_i[3]), .B2(n252), .ZN(n242) );
  AOI22_X1 U301 ( .A1(n253), .A2(B[2]), .B1(B_i[2]), .B2(n252), .ZN(n243) );
  OAI22_X1 U304 ( .A1(n266), .A2(n245), .B1(n358), .B2(n263), .ZN(n328) );
  OAI22_X1 U306 ( .A1(n266), .A2(n247), .B1(n636), .B2(n263), .ZN(n329) );
  OAI22_X1 U308 ( .A1(n266), .A2(n249), .B1(n645), .B2(n263), .ZN(n330) );
  OAI22_X1 U310 ( .A1(n266), .A2(n251), .B1(n640), .B2(n263), .ZN(n331) );
  AOI22_X1 U311 ( .A1(n253), .A2(A[5]), .B1(A_i[5]), .B2(n252), .ZN(n254) );
  OAI22_X1 U314 ( .A1(n266), .A2(n256), .B1(n639), .B2(n263), .ZN(n333) );
  OAI22_X1 U316 ( .A1(n266), .A2(n258), .B1(n647), .B2(n263), .ZN(n334) );
  OAI22_X1 U318 ( .A1(n266), .A2(n260), .B1(n637), .B2(n263), .ZN(n335) );
  OAI22_X1 U320 ( .A1(n266), .A2(n262), .B1(n638), .B2(n263), .ZN(n336) );
  OAI22_X1 U322 ( .A1(n266), .A2(n265), .B1(n644), .B2(n263), .ZN(n337) );
  DFF_X1 A_reg_Y_temp_reg_7_ ( .D(n330), .CK(CLK), .Q(A_i[7]), .QN(n645) );
  DFF_X1 B_reg_Y_temp_reg_0_ ( .D(n329), .CK(CLK), .Q(B_i[0]), .QN(n636) );
  NOR2_X2 U240 ( .A1(LD), .A2(RST), .ZN(n252) );
  INV_X1 U259 ( .A(n205), .ZN(n312) );
  INV_X1 U202 ( .A(n253), .ZN(n266) );
  AND2_X1 U241 ( .A1(n193), .A2(n253), .ZN(n198) );
  INV_X1 U253 ( .A(n208), .ZN(n204) );
  INV_X1 U275 ( .A(n219), .ZN(n317) );
  INV_X1 U294 ( .A(n238), .ZN(n323) );
  INV_X1 U312 ( .A(n254), .ZN(n332) );
  INV_X1 U292 ( .A(n237), .ZN(n322) );
  INV_X1 U300 ( .A(n242), .ZN(n326) );
  INV_X1 U302 ( .A(n243), .ZN(n327) );
  INV_X1 U298 ( .A(n241), .ZN(n325) );
  DFF_X1 B_reg_Y_temp_reg_1_ ( .D(n328), .CK(CLK), .Q(B_i[1]), .QN(n358) );
  INV_X1 U349 ( .A(n502), .ZN(n413) );
  NOR2_X1 U350 ( .A1(n153), .A2(RST), .ZN(n253) );
  AOI21_X2 U351 ( .B1(B_i[3]), .B2(B_i[4]), .A(n642), .ZN(n585) );
  INV_X1 U352 ( .A(n398), .ZN(n382) );
  XNOR2_X1 U353 ( .A(n367), .B(n464), .ZN(n398) );
  XOR2_X1 U354 ( .A(n585), .B(n533), .Z(n582) );
  XNOR2_X1 U355 ( .A(n501), .B(n500), .ZN(n412) );
  AND3_X1 U356 ( .A1(n546), .A2(n547), .A3(n497), .ZN(n542) );
  XNOR2_X1 U357 ( .A(n413), .B(n412), .ZN(DP_OP_72J3_124_5612_n18) );
  INV_X1 U358 ( .A(n252), .ZN(n263) );
  NOR2_X1 U359 ( .A1(B_i[6]), .A2(B_i[5]), .ZN(n405) );
  NAND2_X1 U360 ( .A1(B_i[6]), .A2(B_i[5]), .ZN(n360) );
  INV_X1 U361 ( .A(n360), .ZN(n359) );
  AOI22_X1 U362 ( .A1(B_i[7]), .A2(n405), .B1(n359), .B2(n643), .ZN(n456) );
  OAI21_X1 U363 ( .B1(B_i[6]), .B2(B_i[5]), .A(n360), .ZN(n455) );
  OAI22_X1 U364 ( .A1(n456), .A2(n647), .B1(n639), .B2(n455), .ZN(n475) );
  NAND2_X1 U365 ( .A1(B_i[7]), .A2(n360), .ZN(n606) );
  INV_X1 U366 ( .A(n606), .ZN(n503) );
  XNOR2_X1 U367 ( .A(n475), .B(n503), .ZN(n371) );
  NAND2_X1 U368 ( .A1(B_i[3]), .A2(B_i[4]), .ZN(n361) );
  OAI21_X1 U369 ( .B1(B_i[3]), .B2(B_i[4]), .A(n361), .ZN(n527) );
  INV_X1 U370 ( .A(n527), .ZN(n442) );
  OR2_X1 U371 ( .A1(B_i[3]), .A2(B_i[4]), .ZN(n379) );
  AOI22_X1 U372 ( .A1(B_i[5]), .A2(n379), .B1(n361), .B2(n642), .ZN(n443) );
  AOI22_X1 U373 ( .A1(n442), .A2(A_i[5]), .B1(A_i[4]), .B2(n443), .ZN(n454) );
  INV_X1 U374 ( .A(n585), .ZN(n444) );
  XNOR2_X1 U375 ( .A(n454), .B(n444), .ZN(n365) );
  NOR2_X1 U376 ( .A1(n636), .A2(B_i[1]), .ZN(n572) );
  AOI22_X1 U377 ( .A1(A_i[7]), .A2(n572), .B1(B_i[1]), .B2(n645), .ZN(n463) );
  OAI21_X2 U378 ( .B1(n641), .B2(n358), .A(B_i[3]), .ZN(n570) );
  INV_X1 U379 ( .A(n570), .ZN(n521) );
  AOI22_X1 U380 ( .A1(B_i[2]), .A2(B_i[1]), .B1(n358), .B2(n641), .ZN(n530) );
  NAND2_X1 U381 ( .A1(B_i[3]), .A2(n358), .ZN(n538) );
  NAND2_X1 U382 ( .A1(B_i[2]), .A2(B_i[1]), .ZN(n362) );
  OAI22_X1 U383 ( .A1(B_i[2]), .A2(n538), .B1(B_i[3]), .B2(n362), .ZN(n529) );
  AOI22_X1 U384 ( .A1(A_i[7]), .A2(n530), .B1(A_i[6]), .B2(n529), .ZN(n453) );
  OAI22_X1 U385 ( .A1(n463), .A2(n365), .B1(n521), .B2(n453), .ZN(n363) );
  AOI21_X1 U386 ( .B1(n521), .B2(n453), .A(n363), .ZN(n364) );
  AOI21_X1 U387 ( .B1(n365), .B2(n463), .A(n364), .ZN(n472) );
  INV_X1 U388 ( .A(n472), .ZN(n370) );
  OAI21_X1 U389 ( .B1(B_i[2]), .B2(B_i[1]), .A(n646), .ZN(n372) );
  AOI21_X1 U390 ( .B1(n372), .B2(n570), .A(n645), .ZN(n367) );
  OAI21_X1 U391 ( .B1(n521), .B2(n358), .A(n538), .ZN(n533) );
  INV_X1 U392 ( .A(n582), .ZN(n420) );
  OAI21_X1 U393 ( .B1(B_i[1]), .B2(B_i[0]), .A(A_i[7]), .ZN(n366) );
  XOR2_X1 U394 ( .A(n420), .B(n366), .Z(n464) );
  AOI22_X1 U395 ( .A1(n442), .A2(A_i[6]), .B1(A_i[5]), .B2(n443), .ZN(n473) );
  AOI22_X1 U396 ( .A1(n371), .A2(n370), .B1(n398), .B2(n473), .ZN(n368) );
  OAI21_X1 U397 ( .B1(n398), .B2(n473), .A(n368), .ZN(n369) );
  OAI21_X1 U398 ( .B1(n371), .B2(n370), .A(n369), .ZN(n546) );
  XNOR2_X1 U399 ( .A(n398), .B(n606), .ZN(n477) );
  OAI22_X1 U400 ( .A1(n456), .A2(n639), .B1(n648), .B2(n455), .ZN(n386) );
  AOI22_X1 U401 ( .A1(A_i[7]), .A2(n442), .B1(A_i[6]), .B2(n443), .ZN(n384) );
  XOR2_X1 U402 ( .A(n585), .B(n473), .Z(n375) );
  INV_X1 U403 ( .A(n463), .ZN(n374) );
  AOI22_X1 U404 ( .A1(A_i[7]), .A2(n372), .B1(n570), .B2(n645), .ZN(n373) );
  NOR2_X1 U405 ( .A1(n374), .A2(n373), .ZN(n396) );
  NAND2_X1 U406 ( .A1(n374), .A2(n373), .ZN(n394) );
  OAI21_X1 U407 ( .B1(n375), .B2(n396), .A(n394), .ZN(n389) );
  XNOR2_X1 U408 ( .A(n384), .B(n389), .ZN(n376) );
  XNOR2_X1 U409 ( .A(n386), .B(n376), .ZN(n377) );
  XOR2_X1 U410 ( .A(n477), .B(n377), .Z(n547) );
  INV_X1 U411 ( .A(n384), .ZN(n383) );
  AOI22_X1 U412 ( .A1(n585), .A2(n384), .B1(n383), .B2(n444), .ZN(n378) );
  OAI21_X1 U413 ( .B1(n396), .B2(n378), .A(n394), .ZN(n402) );
  NAND2_X1 U414 ( .A1(n642), .A2(n379), .ZN(n392) );
  AOI21_X1 U415 ( .B1(n444), .B2(n392), .A(n645), .ZN(n397) );
  XOR2_X1 U416 ( .A(n477), .B(n397), .Z(n391) );
  OAI22_X1 U417 ( .A1(n456), .A2(n648), .B1(n640), .B2(n455), .ZN(n380) );
  INV_X1 U418 ( .A(n380), .ZN(n400) );
  XNOR2_X1 U419 ( .A(n391), .B(n400), .ZN(n381) );
  XNOR2_X1 U420 ( .A(n402), .B(n381), .ZN(n513) );
  AOI22_X1 U421 ( .A1(n398), .A2(n384), .B1(n383), .B2(n382), .ZN(n388) );
  OAI22_X1 U422 ( .A1(n388), .A2(n389), .B1(n386), .B2(n503), .ZN(n385) );
  AOI21_X1 U423 ( .B1(n386), .B2(n503), .A(n385), .ZN(n387) );
  AOI21_X1 U424 ( .B1(n389), .B2(n388), .A(n387), .ZN(n390) );
  XNOR2_X1 U425 ( .A(n513), .B(n390), .ZN(n497) );
  INV_X1 U426 ( .A(n390), .ZN(n512) );
  INV_X1 U427 ( .A(n392), .ZN(n393) );
  AOI22_X1 U428 ( .A1(A_i[7]), .A2(n393), .B1(n585), .B2(n645), .ZN(n395) );
  OAI21_X1 U429 ( .B1(n396), .B2(n395), .A(n394), .ZN(n410) );
  XNOR2_X1 U430 ( .A(n391), .B(n410), .ZN(n407) );
  OAI22_X1 U431 ( .A1(n456), .A2(n640), .B1(n645), .B2(n455), .ZN(n408) );
  XNOR2_X1 U432 ( .A(n407), .B(n408), .ZN(n404) );
  XNOR2_X1 U433 ( .A(n398), .B(n397), .ZN(n409) );
  OAI22_X1 U434 ( .A1(n409), .A2(n402), .B1(n606), .B2(n400), .ZN(n399) );
  AOI21_X1 U435 ( .B1(n606), .B2(n400), .A(n399), .ZN(n401) );
  AOI21_X1 U436 ( .B1(n402), .B2(n409), .A(n401), .ZN(n403) );
  XOR2_X1 U437 ( .A(n404), .B(n403), .Z(n514) );
  OAI221_X1 U438 ( .B1(n542), .B2(n512), .C1(n542), .C2(n513), .A(n514), .ZN(
        n502) );
  OR2_X1 U439 ( .A1(n404), .A2(n403), .ZN(n501) );
  NOR2_X1 U440 ( .A1(B_i[7]), .A2(n405), .ZN(n504) );
  OAI21_X1 U441 ( .B1(n503), .B2(n504), .A(A_i[7]), .ZN(n406) );
  XOR2_X1 U442 ( .A(n407), .B(n406), .Z(n499) );
  NOR2_X1 U443 ( .A1(n410), .A2(n409), .ZN(n506) );
  XNOR2_X1 U444 ( .A(n408), .B(n503), .ZN(n411) );
  NAND2_X1 U445 ( .A1(n410), .A2(n409), .ZN(n505) );
  OAI21_X1 U446 ( .B1(n506), .B2(n411), .A(n505), .ZN(n498) );
  XOR2_X1 U447 ( .A(n499), .B(n498), .Z(n500) );
  INV_X1 U448 ( .A(B[1]), .ZN(n245) );
  INV_X1 U449 ( .A(A[2]), .ZN(n260) );
  INV_X1 U450 ( .A(A[1]), .ZN(n262) );
  INV_X1 U451 ( .A(B[5]), .ZN(n240) );
  INV_X1 U452 ( .A(A[3]), .ZN(n258) );
  INV_X1 U453 ( .A(A[4]), .ZN(n256) );
  INV_X1 U454 ( .A(A[0]), .ZN(n265) );
  INV_X1 U455 ( .A(A[6]), .ZN(n251) );
  INV_X1 U456 ( .A(B[0]), .ZN(n247) );
  INV_X1 U457 ( .A(A[7]), .ZN(n249) );
  OAI22_X1 U458 ( .A1(n456), .A2(n644), .B1(n455), .B2(n638), .ZN(n414) );
  XNOR2_X1 U459 ( .A(n606), .B(n414), .ZN(n425) );
  NOR2_X1 U460 ( .A1(n358), .A2(B_i[0]), .ZN(n528) );
  AOI22_X1 U461 ( .A1(B_i[0]), .A2(A_i[6]), .B1(A_i[5]), .B2(n528), .ZN(n438)
         );
  AOI22_X1 U462 ( .A1(B_i[1]), .A2(n438), .B1(n572), .B2(A_i[6]), .ZN(n418) );
  AOI22_X1 U463 ( .A1(A_i[4]), .A2(n530), .B1(A_i[3]), .B2(n529), .ZN(n437) );
  XNOR2_X1 U464 ( .A(n437), .B(n570), .ZN(n417) );
  INV_X1 U465 ( .A(n443), .ZN(n433) );
  OAI22_X1 U466 ( .A1(n527), .A2(n637), .B1(n638), .B2(n433), .ZN(n439) );
  AOI22_X1 U467 ( .A1(n418), .A2(n417), .B1(n439), .B2(n585), .ZN(n415) );
  OAI21_X1 U468 ( .B1(n439), .B2(n585), .A(n415), .ZN(n416) );
  OAI21_X1 U469 ( .B1(n418), .B2(n417), .A(n416), .ZN(n424) );
  AOI22_X1 U470 ( .A1(n442), .A2(A_i[3]), .B1(A_i[2]), .B2(n443), .ZN(n429) );
  INV_X1 U471 ( .A(n429), .ZN(n419) );
  AOI22_X1 U472 ( .A1(n420), .A2(n429), .B1(n419), .B2(n582), .ZN(n422) );
  AOI22_X1 U473 ( .A1(A_i[7]), .A2(B_i[0]), .B1(A_i[6]), .B2(n528), .ZN(n427)
         );
  AOI22_X1 U474 ( .A1(A_i[5]), .A2(n530), .B1(A_i[4]), .B2(n529), .ZN(n426) );
  XNOR2_X1 U475 ( .A(n427), .B(n426), .ZN(n421) );
  XNOR2_X1 U476 ( .A(n422), .B(n421), .ZN(n423) );
  FA_X1 U477 ( .A(n425), .B(n424), .CI(n423), .CO(n486), .S(n624) );
  INV_X1 U478 ( .A(n464), .ZN(n480) );
  XNOR2_X1 U479 ( .A(n426), .B(n570), .ZN(n432) );
  AOI22_X1 U480 ( .A1(A_i[7]), .A2(n572), .B1(B_i[1]), .B2(n427), .ZN(n431) );
  AOI22_X1 U481 ( .A1(n432), .A2(n431), .B1(n444), .B2(n429), .ZN(n428) );
  OAI21_X1 U482 ( .B1(n444), .B2(n429), .A(n428), .ZN(n430) );
  OAI21_X1 U483 ( .B1(n432), .B2(n431), .A(n430), .ZN(n471) );
  AOI22_X1 U484 ( .A1(A_i[5]), .A2(n529), .B1(A_i[6]), .B2(n530), .ZN(n460) );
  OAI22_X1 U485 ( .A1(n433), .A2(n647), .B1(n527), .B2(n639), .ZN(n458) );
  XNOR2_X1 U486 ( .A(n460), .B(n458), .ZN(n468) );
  OAI22_X1 U487 ( .A1(n456), .A2(n638), .B1(n455), .B2(n637), .ZN(n434) );
  XNOR2_X1 U488 ( .A(n606), .B(n434), .ZN(n470) );
  XNOR2_X1 U489 ( .A(n468), .B(n470), .ZN(n435) );
  XOR2_X1 U490 ( .A(n471), .B(n435), .Z(n436) );
  XNOR2_X1 U491 ( .A(n480), .B(n436), .ZN(n488) );
  XNOR2_X1 U492 ( .A(n486), .B(n488), .ZN(n622) );
  NOR2_X1 U493 ( .A1(n455), .A2(n644), .ZN(n592) );
  XOR2_X1 U494 ( .A(n606), .B(n592), .Z(n451) );
  XOR2_X1 U495 ( .A(n438), .B(n437), .Z(n441) );
  XNOR2_X1 U496 ( .A(n582), .B(n439), .ZN(n440) );
  XNOR2_X1 U497 ( .A(n441), .B(n440), .ZN(n591) );
  AOI22_X1 U498 ( .A1(n443), .A2(A_i[0]), .B1(n442), .B2(A_i[1]), .ZN(n566) );
  XNOR2_X1 U499 ( .A(n444), .B(n566), .ZN(n448) );
  AOI22_X1 U500 ( .A1(B_i[0]), .A2(A_i[5]), .B1(A_i[4]), .B2(n528), .ZN(n565)
         );
  AOI22_X1 U501 ( .A1(B_i[1]), .A2(n565), .B1(A_i[5]), .B2(n572), .ZN(n447) );
  AOI22_X1 U502 ( .A1(A_i[3]), .A2(n530), .B1(A_i[2]), .B2(n529), .ZN(n568) );
  OAI22_X1 U503 ( .A1(n447), .A2(n448), .B1(n521), .B2(n568), .ZN(n445) );
  AOI21_X1 U504 ( .B1(n521), .B2(n568), .A(n445), .ZN(n446) );
  AOI21_X1 U505 ( .B1(n448), .B2(n447), .A(n446), .ZN(n594) );
  NOR2_X1 U506 ( .A1(n591), .A2(n594), .ZN(n450) );
  NAND2_X1 U507 ( .A1(n591), .A2(n594), .ZN(n449) );
  OAI21_X1 U508 ( .B1(n451), .B2(n450), .A(n449), .ZN(n623) );
  AND3_X1 U509 ( .A1(n624), .A2(n622), .A3(n623), .ZN(n489) );
  AOI21_X1 U510 ( .B1(n624), .B2(n623), .A(n622), .ZN(n452) );
  NOR2_X1 U511 ( .A1(n489), .A2(n452), .ZN(DP_OP_71J3_123_5612_n4) );
  XOR2_X1 U512 ( .A(n454), .B(n453), .Z(n479) );
  OAI22_X1 U513 ( .A1(n456), .A2(n637), .B1(n455), .B2(n647), .ZN(n457) );
  XNOR2_X1 U514 ( .A(n606), .B(n457), .ZN(n483) );
  XNOR2_X1 U515 ( .A(n479), .B(n483), .ZN(n466) );
  XNOR2_X1 U516 ( .A(n585), .B(n458), .ZN(n462) );
  OAI22_X1 U517 ( .A1(n462), .A2(n463), .B1(n521), .B2(n460), .ZN(n459) );
  AOI21_X1 U518 ( .B1(n521), .B2(n460), .A(n459), .ZN(n461) );
  AOI21_X1 U519 ( .B1(n463), .B2(n462), .A(n461), .ZN(n482) );
  XNOR2_X1 U520 ( .A(n464), .B(n482), .ZN(n465) );
  XNOR2_X1 U521 ( .A(n466), .B(n465), .ZN(n485) );
  AOI22_X1 U522 ( .A1(n471), .A2(n470), .B1(n480), .B2(n468), .ZN(n467) );
  OAI21_X1 U523 ( .B1(n480), .B2(n468), .A(n467), .ZN(n469) );
  OAI21_X1 U524 ( .B1(n471), .B2(n470), .A(n469), .ZN(n484) );
  NOR2_X1 U525 ( .A1(n485), .A2(n484), .ZN(n491) );
  XNOR2_X1 U526 ( .A(n473), .B(n472), .ZN(n474) );
  XNOR2_X1 U527 ( .A(n475), .B(n474), .ZN(n476) );
  XNOR2_X1 U528 ( .A(n477), .B(n476), .ZN(n545) );
  AOI22_X1 U529 ( .A1(n483), .A2(n482), .B1(n480), .B2(n479), .ZN(n478) );
  OAI21_X1 U530 ( .B1(n480), .B2(n479), .A(n478), .ZN(n481) );
  OAI21_X1 U531 ( .B1(n483), .B2(n482), .A(n481), .ZN(n544) );
  XOR2_X1 U532 ( .A(n545), .B(n544), .Z(n490) );
  NOR2_X1 U533 ( .A1(n491), .A2(n490), .ZN(n632) );
  INV_X1 U534 ( .A(n632), .ZN(n493) );
  XOR2_X1 U535 ( .A(n485), .B(n484), .Z(n628) );
  INV_X1 U536 ( .A(n486), .ZN(n487) );
  NOR2_X1 U537 ( .A1(n488), .A2(n487), .ZN(n629) );
  OR2_X1 U538 ( .A1(n629), .A2(n489), .ZN(n494) );
  NAND2_X1 U539 ( .A1(n628), .A2(n494), .ZN(n548) );
  NAND2_X1 U540 ( .A1(n491), .A2(n490), .ZN(n630) );
  NAND3_X1 U541 ( .A1(n630), .A2(n493), .A3(n548), .ZN(n492) );
  OAI21_X1 U542 ( .B1(n493), .B2(n548), .A(n492), .ZN(DP_OP_71J3_123_5612_n18)
         );
  XNOR2_X1 U543 ( .A(n628), .B(n494), .ZN(n554) );
  INV_X1 U544 ( .A(n554), .ZN(DP_OP_71J3_123_5612_n17) );
  INV_X1 U545 ( .A(DP_OP_71J3_123_5612_n4), .ZN(n553) );
  NOR2_X1 U546 ( .A1(n554), .A2(n553), .ZN(n552) );
  NAND3_X1 U547 ( .A1(DP_OP_71J3_123_5612_n17), .A2(DP_OP_71J3_123_5612_n4), 
        .A3(DP_OP_71J3_123_5612_n18), .ZN(n551) );
  OAI21_X1 U548 ( .B1(n552), .B2(DP_OP_71J3_123_5612_n18), .A(n551), .ZN(n495)
         );
  INV_X1 U549 ( .A(n495), .ZN(mul_final_add_sum_gen_carry_select_int_2_S1[2])
         );
  NAND2_X1 U550 ( .A1(n546), .A2(n547), .ZN(n496) );
  XOR2_X1 U551 ( .A(n497), .B(n496), .Z(n557) );
  INV_X1 U552 ( .A(n557), .ZN(DP_OP_72J3_124_5612_n4) );
  NOR2_X1 U553 ( .A1(n499), .A2(n498), .ZN(n511) );
  AOI21_X1 U554 ( .B1(n502), .B2(n501), .A(n500), .ZN(n509) );
  AOI22_X1 U555 ( .A1(A_i[7]), .A2(n504), .B1(n503), .B2(n645), .ZN(n507) );
  OAI21_X1 U556 ( .B1(n507), .B2(n506), .A(n505), .ZN(n508) );
  XNOR2_X1 U557 ( .A(n509), .B(n508), .ZN(n510) );
  XNOR2_X1 U558 ( .A(n511), .B(n510), .ZN(DP_OP_72J3_124_5612_n19) );
  AND2_X1 U559 ( .A1(n513), .A2(n512), .ZN(n515) );
  XOR2_X1 U560 ( .A(n515), .B(n514), .Z(n543) );
  NOR2_X1 U561 ( .A1(n542), .A2(n543), .ZN(n541) );
  NOR2_X1 U562 ( .A1(n541), .A2(n557), .ZN(n555) );
  NAND2_X1 U563 ( .A1(n555), .A2(DP_OP_72J3_124_5612_n18), .ZN(n516) );
  AND2_X1 U564 ( .A1(DP_OP_72J3_124_5612_n19), .A2(n516), .ZN(
        mul_final_add_sum_gen_carry_select_int_3_S1[3]) );
  AOI22_X1 U565 ( .A1(A_i[1]), .A2(n530), .B1(A_i[0]), .B2(n529), .ZN(n526) );
  AOI22_X1 U566 ( .A1(B_i[0]), .A2(A_i[3]), .B1(A_i[2]), .B2(n528), .ZN(n522)
         );
  XOR2_X1 U567 ( .A(n526), .B(n522), .Z(n517) );
  XNOR2_X1 U568 ( .A(n517), .B(n533), .ZN(n535) );
  NAND2_X1 U569 ( .A1(n530), .A2(A_i[0]), .ZN(n536) );
  INV_X1 U570 ( .A(n536), .ZN(n520) );
  NAND2_X1 U571 ( .A1(B_i[0]), .A2(A_i[2]), .ZN(n518) );
  AOI22_X1 U572 ( .A1(B_i[0]), .A2(A_i[2]), .B1(A_i[1]), .B2(n528), .ZN(n537)
         );
  NAND2_X1 U573 ( .A1(B_i[1]), .A2(n537), .ZN(n539) );
  OAI21_X1 U574 ( .B1(B_i[1]), .B2(n518), .A(n539), .ZN(n519) );
  OAI221_X1 U575 ( .B1(n521), .B2(n520), .C1(n570), .C2(n536), .A(n519), .ZN(
        n534) );
  NOR2_X1 U576 ( .A1(n535), .A2(n534), .ZN(n584) );
  AOI22_X1 U577 ( .A1(B_i[1]), .A2(n522), .B1(n572), .B2(A_i[3]), .ZN(n523) );
  INV_X1 U578 ( .A(n523), .ZN(n524) );
  OAI21_X1 U579 ( .B1(n526), .B2(n570), .A(n524), .ZN(n525) );
  AOI21_X1 U580 ( .B1(n526), .B2(n570), .A(n525), .ZN(n580) );
  NOR2_X1 U581 ( .A1(n527), .A2(n644), .ZN(n575) );
  AOI22_X1 U582 ( .A1(B_i[0]), .A2(A_i[4]), .B1(A_i[3]), .B2(n528), .ZN(n573)
         );
  AOI22_X1 U583 ( .A1(A_i[2]), .A2(n530), .B1(A_i[1]), .B2(n529), .ZN(n571) );
  XNOR2_X1 U584 ( .A(n573), .B(n571), .ZN(n531) );
  XNOR2_X1 U585 ( .A(n575), .B(n531), .ZN(n581) );
  XNOR2_X1 U586 ( .A(n580), .B(n581), .ZN(n532) );
  XNOR2_X1 U587 ( .A(n533), .B(n532), .ZN(n583) );
  XNOR2_X1 U588 ( .A(n584), .B(n583), .ZN(
        mul_final_add_sum_gen_carry_select_int_1_S1_0_) );
  AOI21_X1 U589 ( .B1(n535), .B2(n534), .A(n584), .ZN(n564) );
  XNOR2_X1 U590 ( .A(n537), .B(n536), .ZN(n562) );
  XNOR2_X1 U591 ( .A(n562), .B(n538), .ZN(n540) );
  OAI21_X1 U592 ( .B1(n638), .B2(n636), .A(n644), .ZN(n560) );
  OAI22_X1 U593 ( .A1(n570), .A2(n540), .B1(n539), .B2(n560), .ZN(n563) );
  NAND2_X1 U594 ( .A1(n564), .A2(n563), .ZN(n216) );
  OR2_X1 U595 ( .A1(mul_final_add_sum_gen_carry_select_int_1_S1_0_), .A2(n216), 
        .ZN(n217) );
  AOI21_X1 U596 ( .B1(n543), .B2(n542), .A(n541), .ZN(DP_OP_72J3_124_5612_n17)
         );
  INV_X1 U597 ( .A(LD), .ZN(n153) );
  NOR2_X1 U598 ( .A1(n545), .A2(n544), .ZN(n635) );
  XOR2_X1 U599 ( .A(n547), .B(n546), .Z(n634) );
  OAI21_X1 U600 ( .B1(n548), .B2(n632), .A(n630), .ZN(n549) );
  XNOR2_X1 U601 ( .A(n634), .B(n549), .ZN(n550) );
  XNOR2_X1 U602 ( .A(n635), .B(n550), .ZN(DP_OP_71J3_123_5612_n19) );
  XNOR2_X1 U603 ( .A(n551), .B(DP_OP_71J3_123_5612_n19), .ZN(
        mul_final_add_sum_gen_carry_select_int_2_S1[3]) );
  AOI21_X1 U604 ( .B1(n554), .B2(n553), .A(n552), .ZN(
        mul_final_add_sum_gen_carry_select_int_2_S1[1]) );
  XOR2_X1 U605 ( .A(n555), .B(DP_OP_72J3_124_5612_n18), .Z(
        mul_final_add_sum_gen_carry_select_int_3_S1[2]) );
  INV_X1 U606 ( .A(DP_OP_72J3_124_5612_n17), .ZN(n556) );
  AOI21_X1 U607 ( .B1(n557), .B2(n556), .A(n555), .ZN(
        mul_final_add_sum_gen_carry_select_int_3_S1[1]) );
  NAND2_X1 U608 ( .A1(B_i[0]), .A2(A_i[0]), .ZN(n236) );
  NOR2_X1 U609 ( .A1(n636), .A2(n638), .ZN(n559) );
  NOR2_X1 U610 ( .A1(n358), .A2(n644), .ZN(n558) );
  XNOR2_X1 U611 ( .A(n559), .B(n558), .ZN(n234) );
  NAND2_X1 U612 ( .A1(n560), .A2(B_i[1]), .ZN(n561) );
  XNOR2_X1 U613 ( .A(n562), .B(n561), .ZN(n230) );
  OAI21_X1 U614 ( .B1(n564), .B2(n563), .A(n216), .ZN(n226) );
  XNOR2_X1 U615 ( .A(n566), .B(n565), .ZN(n567) );
  XNOR2_X1 U616 ( .A(n568), .B(n567), .ZN(n569) );
  XNOR2_X1 U617 ( .A(n569), .B(n582), .ZN(n596) );
  XNOR2_X1 U618 ( .A(n571), .B(n570), .ZN(n578) );
  AOI22_X1 U619 ( .A1(B_i[1]), .A2(n573), .B1(A_i[4]), .B2(n572), .ZN(n577) );
  AOI22_X1 U620 ( .A1(n578), .A2(n577), .B1(n585), .B2(n575), .ZN(n574) );
  OAI21_X1 U621 ( .B1(n585), .B2(n575), .A(n574), .ZN(n576) );
  OAI21_X1 U622 ( .B1(n578), .B2(n577), .A(n576), .ZN(n595) );
  XNOR2_X1 U623 ( .A(n596), .B(n595), .ZN(n589) );
  NAND2_X1 U624 ( .A1(n582), .A2(n581), .ZN(n579) );
  OAI211_X1 U625 ( .C1(n582), .C2(n581), .A(n580), .B(n579), .ZN(n588) );
  XOR2_X1 U626 ( .A(n589), .B(n588), .Z(n614) );
  INV_X1 U627 ( .A(n583), .ZN(n586) );
  AOI22_X1 U628 ( .A1(n586), .A2(n585), .B1(n584), .B2(n583), .ZN(n612) );
  INV_X1 U629 ( .A(n612), .ZN(n587) );
  NAND2_X1 U630 ( .A1(n614), .A2(n587), .ZN(n602) );
  OAI21_X1 U631 ( .B1(n614), .B2(n587), .A(n602), .ZN(n598) );
  XNOR2_X1 U632 ( .A(n217), .B(n598), .ZN(n215) );
  INV_X1 U633 ( .A(n602), .ZN(n590) );
  NOR2_X1 U634 ( .A1(n589), .A2(n588), .ZN(n609) );
  NOR2_X1 U635 ( .A1(n590), .A2(n609), .ZN(n597) );
  XNOR2_X1 U636 ( .A(n592), .B(n591), .ZN(n593) );
  XNOR2_X1 U637 ( .A(n594), .B(n593), .ZN(n604) );
  NAND2_X1 U638 ( .A1(n596), .A2(n595), .ZN(n605) );
  XNOR2_X1 U639 ( .A(n604), .B(n605), .ZN(n610) );
  XNOR2_X1 U640 ( .A(n597), .B(n610), .ZN(n599) );
  NOR2_X1 U641 ( .A1(n217), .A2(n598), .ZN(n600) );
  XNOR2_X1 U642 ( .A(n599), .B(n600), .ZN(n212) );
  NOR2_X1 U643 ( .A1(n600), .A2(n609), .ZN(n601) );
  NAND2_X1 U644 ( .A1(n602), .A2(n601), .ZN(n603) );
  NAND2_X1 U645 ( .A1(n603), .A2(n610), .ZN(n608) );
  MUX2_X1 U646 ( .A(n606), .B(n605), .S(n604), .Z(n618) );
  XNOR2_X1 U647 ( .A(n624), .B(n623), .ZN(n619) );
  INV_X1 U648 ( .A(n619), .ZN(n616) );
  INV_X1 U649 ( .A(n618), .ZN(n615) );
  AOI22_X1 U650 ( .A1(n618), .A2(n616), .B1(n619), .B2(n615), .ZN(n607) );
  XNOR2_X1 U651 ( .A(n608), .B(n607), .ZN(n210) );
  NAND2_X1 U652 ( .A1(n610), .A2(n609), .ZN(n617) );
  INV_X1 U653 ( .A(n610), .ZN(n611) );
  AOI21_X1 U654 ( .B1(n612), .B2(n217), .A(n611), .ZN(n613) );
  OAI211_X1 U655 ( .C1(n616), .C2(n615), .A(n614), .B(n613), .ZN(n620) );
  OAI221_X1 U656 ( .B1(n619), .B2(n618), .C1(n619), .C2(n617), .A(n620), .ZN(
        n201) );
  INV_X1 U657 ( .A(n620), .ZN(n621) );
  NAND3_X1 U658 ( .A1(n623), .A2(n621), .A3(n624), .ZN(n626) );
  OAI221_X1 U659 ( .B1(n201), .B2(n624), .C1(n201), .C2(n623), .A(n622), .ZN(
        n625) );
  NAND2_X1 U660 ( .A1(n626), .A2(n625), .ZN(n627) );
  AOI222_X1 U661 ( .A1(n629), .A2(n628), .B1(n629), .B2(n627), .C1(n628), .C2(
        n627), .ZN(n631) );
  OAI21_X1 U662 ( .B1(n632), .B2(n631), .A(n630), .ZN(n633) );
  AOI222_X1 U663 ( .A1(n635), .A2(n634), .B1(n635), .B2(n633), .C1(n634), .C2(
        n633), .ZN(n193) );
endmodule

