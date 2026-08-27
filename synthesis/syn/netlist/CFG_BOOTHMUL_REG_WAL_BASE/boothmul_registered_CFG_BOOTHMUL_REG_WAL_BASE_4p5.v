/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : W-2024.09-SP2
// Date      : Thu Aug 27 03:29:27 2026
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
         DP_OP_72J8_124_5612_n19, DP_OP_72J8_124_5612_n18,
         DP_OP_72J8_124_5612_n17, DP_OP_72J8_124_5612_n4,
         DP_OP_71J8_123_5612_n19, DP_OP_71J8_123_5612_n18,
         DP_OP_71J8_123_5612_n17, DP_OP_71J8_123_5612_n4, n358, n359, n360,
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
         n647, n648, n649, n650, n651, n652, n653, n654;
  wire   [7:0] A_i;
  wire   [7:0] B_i;
  wire   [3:1] mul_final_add_sum_gen_carry_select_int_2_S1;
  wire   [3:1] mul_final_add_sum_gen_carry_select_int_3_S1;

  DFF_X1 A_reg_Y_temp_reg_0_ ( .D(n337), .CK(CLK), .Q(A_i[0]), .QN(n643) );
  DFF_X1 A_reg_Y_temp_reg_1_ ( .D(n336), .CK(CLK), .Q(A_i[1]), .QN(n637) );
  DFF_X1 A_reg_Y_temp_reg_2_ ( .D(n335), .CK(CLK), .Q(A_i[2]), .QN(n635) );
  DFF_X1 A_reg_Y_temp_reg_3_ ( .D(n334), .CK(CLK), .Q(A_i[3]), .QN(n646) );
  DFF_X1 A_reg_Y_temp_reg_4_ ( .D(n333), .CK(CLK), .Q(A_i[4]), .QN(n638) );
  DFF_X1 A_reg_Y_temp_reg_5_ ( .D(n332), .CK(CLK), .Q(A_i[5]), .QN(n647) );
  DFF_X1 A_reg_Y_temp_reg_6_ ( .D(n331), .CK(CLK), .Q(A_i[6]), .QN(n639) );
  DFF_X1 B_reg_Y_temp_reg_2_ ( .D(n327), .CK(CLK), .Q(B_i[2]), .QN(n640) );
  DFF_X1 B_reg_Y_temp_reg_3_ ( .D(n326), .CK(CLK), .Q(B_i[3]), .QN(n645) );
  DFF_X1 B_reg_Y_temp_reg_4_ ( .D(n325), .CK(CLK), .Q(B_i[4]) );
  DFF_X1 B_reg_Y_temp_reg_5_ ( .D(n324), .CK(CLK), .Q(B_i[5]), .QN(n641) );
  DFF_X1 B_reg_Y_temp_reg_6_ ( .D(n323), .CK(CLK), .Q(B_i[6]) );
  DFF_X1 B_reg_Y_temp_reg_7_ ( .D(n322), .CK(CLK), .Q(B_i[7]), .QN(n642) );
  DFF_X1 p_reg_Y_temp_reg_0_ ( .D(n321), .CK(CLK), .Q(P[0]), .QN(n648) );
  DFF_X1 p_reg_Y_temp_reg_1_ ( .D(n320), .CK(CLK), .Q(P[1]), .QN(n649) );
  DFF_X1 p_reg_Y_temp_reg_2_ ( .D(n319), .CK(CLK), .Q(P[2]), .QN(n650) );
  DFF_X1 p_reg_Y_temp_reg_3_ ( .D(n318), .CK(CLK), .Q(P[3]), .QN(n651) );
  DFF_X1 p_reg_Y_temp_reg_4_ ( .D(n317), .CK(CLK), .Q(P[4]) );
  DFF_X1 p_reg_Y_temp_reg_5_ ( .D(n316), .CK(CLK), .Q(P[5]), .QN(n652) );
  DFF_X1 p_reg_Y_temp_reg_6_ ( .D(n315), .CK(CLK), .Q(P[6]), .QN(n653) );
  DFF_X1 p_reg_Y_temp_reg_7_ ( .D(n314), .CK(CLK), .Q(P[7]), .QN(n654) );
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
        .C1(n198), .C2(DP_OP_72J8_124_5612_n19), .ZN(n194) );
  AOI222_X1 U244 ( .A1(n197), .A2(
        mul_final_add_sum_gen_carry_select_int_3_S1[2]), .B1(n252), .B2(P[14]), 
        .C1(n198), .C2(DP_OP_72J8_124_5612_n18), .ZN(n195) );
  AOI222_X1 U246 ( .A1(n197), .A2(
        mul_final_add_sum_gen_carry_select_int_3_S1[1]), .B1(n252), .B2(P[13]), 
        .C1(n198), .C2(DP_OP_72J8_124_5612_n17), .ZN(n196) );
  AOI22_X1 U249 ( .A1(n252), .A2(P[12]), .B1(n198), .B2(DP_OP_72J8_124_5612_n4), .ZN(n199) );
  OAI21_X1 U250 ( .B1(DP_OP_72J8_124_5612_n4), .B2(n200), .A(n199), .ZN(n309)
         );
  NOR2_X1 U251 ( .A1(n266), .A2(n201), .ZN(n206) );
  NAND2_X1 U252 ( .A1(n201), .A2(n253), .ZN(n208) );
  AOI222_X1 U254 ( .A1(n252), .A2(P[11]), .B1(n206), .B2(
        DP_OP_71J8_123_5612_n19), .C1(n204), .C2(
        mul_final_add_sum_gen_carry_select_int_2_S1[3]), .ZN(n202) );
  AOI222_X1 U256 ( .A1(n252), .A2(P[10]), .B1(n206), .B2(
        DP_OP_71J8_123_5612_n18), .C1(n204), .C2(
        mul_final_add_sum_gen_carry_select_int_2_S1[2]), .ZN(n203) );
  AOI222_X1 U258 ( .A1(n252), .A2(P[9]), .B1(n206), .B2(
        DP_OP_71J8_123_5612_n17), .C1(n204), .C2(
        mul_final_add_sum_gen_carry_select_int_2_S1[1]), .ZN(n205) );
  AOI22_X1 U260 ( .A1(n252), .A2(P[8]), .B1(n206), .B2(DP_OP_71J8_123_5612_n4), 
        .ZN(n207) );
  OAI21_X1 U261 ( .B1(DP_OP_71J8_123_5612_n4), .B2(n208), .A(n207), .ZN(n313)
         );
  OAI22_X1 U266 ( .A1(n266), .A2(n210), .B1(n263), .B2(n654), .ZN(n314) );
  OAI22_X1 U269 ( .A1(n266), .A2(n212), .B1(n263), .B2(n653), .ZN(n315) );
  OAI22_X1 U272 ( .A1(n266), .A2(n215), .B1(n263), .B2(n652), .ZN(n316) );
  AOI21_X1 U273 ( .B1(mul_final_add_sum_gen_carry_select_int_1_S1_0_), .B2(
        n216), .A(n266), .ZN(n218) );
  AOI22_X1 U274 ( .A1(P[4]), .A2(n252), .B1(n218), .B2(n217), .ZN(n219) );
  OAI22_X1 U279 ( .A1(n266), .A2(n226), .B1(n263), .B2(n651), .ZN(n318) );
  OAI22_X1 U283 ( .A1(n266), .A2(n230), .B1(n263), .B2(n650), .ZN(n319) );
  OAI22_X1 U287 ( .A1(n266), .A2(n234), .B1(n263), .B2(n649), .ZN(n320) );
  OAI22_X1 U290 ( .A1(n266), .A2(n236), .B1(n263), .B2(n648), .ZN(n321) );
  AOI22_X1 U291 ( .A1(n253), .A2(B[7]), .B1(B_i[7]), .B2(n252), .ZN(n237) );
  AOI22_X1 U293 ( .A1(n253), .A2(B[6]), .B1(B_i[6]), .B2(n252), .ZN(n238) );
  OAI22_X1 U296 ( .A1(n266), .A2(n240), .B1(n641), .B2(n263), .ZN(n324) );
  AOI22_X1 U297 ( .A1(n253), .A2(B[4]), .B1(B_i[4]), .B2(n252), .ZN(n241) );
  AOI22_X1 U299 ( .A1(n253), .A2(B[3]), .B1(B_i[3]), .B2(n252), .ZN(n242) );
  AOI22_X1 U301 ( .A1(n253), .A2(B[2]), .B1(B_i[2]), .B2(n252), .ZN(n243) );
  OAI22_X1 U304 ( .A1(n266), .A2(n245), .B1(n636), .B2(n263), .ZN(n328) );
  OAI22_X1 U306 ( .A1(n266), .A2(n247), .B1(n634), .B2(n263), .ZN(n329) );
  OAI22_X1 U308 ( .A1(n266), .A2(n249), .B1(n644), .B2(n263), .ZN(n330) );
  OAI22_X1 U310 ( .A1(n266), .A2(n251), .B1(n639), .B2(n263), .ZN(n331) );
  AOI22_X1 U311 ( .A1(n253), .A2(A[5]), .B1(A_i[5]), .B2(n252), .ZN(n254) );
  OAI22_X1 U314 ( .A1(n266), .A2(n256), .B1(n638), .B2(n263), .ZN(n333) );
  OAI22_X1 U316 ( .A1(n266), .A2(n258), .B1(n646), .B2(n263), .ZN(n334) );
  OAI22_X1 U318 ( .A1(n266), .A2(n260), .B1(n635), .B2(n263), .ZN(n335) );
  OAI22_X1 U320 ( .A1(n266), .A2(n262), .B1(n637), .B2(n263), .ZN(n336) );
  OAI22_X1 U322 ( .A1(n266), .A2(n265), .B1(n643), .B2(n263), .ZN(n337) );
  DFF_X1 A_reg_Y_temp_reg_7_ ( .D(n330), .CK(CLK), .Q(A_i[7]), .QN(n644) );
  DFF_X1 B_reg_Y_temp_reg_0_ ( .D(n329), .CK(CLK), .Q(B_i[0]), .QN(n634) );
  DFF_X1 B_reg_Y_temp_reg_1_ ( .D(n328), .CK(CLK), .Q(B_i[1]), .QN(n636) );
  NOR2_X2 U240 ( .A1(LD), .A2(RST), .ZN(n252) );
  NOR2_X1 U201 ( .A1(n153), .A2(RST), .ZN(n253) );
  INV_X1 U202 ( .A(n253), .ZN(n266) );
  AND2_X1 U241 ( .A1(n193), .A2(n253), .ZN(n198) );
  INV_X1 U245 ( .A(n195), .ZN(n307) );
  INV_X1 U243 ( .A(n194), .ZN(n306) );
  INV_X1 U248 ( .A(n197), .ZN(n200) );
  INV_X1 U247 ( .A(n196), .ZN(n308) );
  INV_X1 U253 ( .A(n208), .ZN(n204) );
  INV_X1 U255 ( .A(n202), .ZN(n310) );
  INV_X1 U257 ( .A(n203), .ZN(n311) );
  INV_X1 U259 ( .A(n205), .ZN(n312) );
  INV_X1 U275 ( .A(n219), .ZN(n317) );
  INV_X1 U294 ( .A(n238), .ZN(n323) );
  INV_X1 U312 ( .A(n254), .ZN(n332) );
  INV_X1 U292 ( .A(n237), .ZN(n322) );
  INV_X1 U300 ( .A(n242), .ZN(n326) );
  INV_X1 U302 ( .A(n243), .ZN(n327) );
  INV_X1 U298 ( .A(n241), .ZN(n325) );
  AOI21_X2 U349 ( .B1(B_i[3]), .B2(B_i[4]), .A(n641), .ZN(n583) );
  INV_X1 U350 ( .A(n252), .ZN(n263) );
  INV_X1 U351 ( .A(B[1]), .ZN(n245) );
  INV_X1 U352 ( .A(A[2]), .ZN(n260) );
  INV_X1 U353 ( .A(A[1]), .ZN(n262) );
  INV_X1 U354 ( .A(B[5]), .ZN(n240) );
  INV_X1 U355 ( .A(A[3]), .ZN(n258) );
  INV_X1 U356 ( .A(A[4]), .ZN(n256) );
  INV_X1 U357 ( .A(A[0]), .ZN(n265) );
  INV_X1 U358 ( .A(A[6]), .ZN(n251) );
  INV_X1 U359 ( .A(B[0]), .ZN(n247) );
  INV_X1 U360 ( .A(A[7]), .ZN(n249) );
  NAND2_X1 U361 ( .A1(B_i[6]), .A2(B_i[5]), .ZN(n359) );
  NAND2_X1 U362 ( .A1(B_i[7]), .A2(n359), .ZN(n604) );
  NOR2_X1 U363 ( .A1(B_i[6]), .A2(B_i[5]), .ZN(n488) );
  INV_X1 U364 ( .A(n359), .ZN(n358) );
  AOI22_X1 U365 ( .A1(B_i[7]), .A2(n488), .B1(n358), .B2(n642), .ZN(n463) );
  OAI21_X1 U366 ( .B1(B_i[6]), .B2(B_i[5]), .A(n359), .ZN(n462) );
  OAI22_X1 U367 ( .A1(n463), .A2(n643), .B1(n462), .B2(n637), .ZN(n360) );
  XNOR2_X1 U368 ( .A(n604), .B(n360), .ZN(n373) );
  NOR2_X1 U369 ( .A1(n636), .A2(B_i[0]), .ZN(n529) );
  AOI22_X1 U370 ( .A1(B_i[0]), .A2(A_i[6]), .B1(A_i[5]), .B2(n529), .ZN(n387)
         );
  NOR2_X1 U371 ( .A1(n634), .A2(B_i[1]), .ZN(n570) );
  AOI22_X1 U372 ( .A1(B_i[1]), .A2(n387), .B1(n570), .B2(A_i[6]), .ZN(n366) );
  AOI22_X1 U373 ( .A1(B_i[2]), .A2(B_i[1]), .B1(n636), .B2(n640), .ZN(n531) );
  NAND2_X1 U374 ( .A1(B_i[3]), .A2(n636), .ZN(n539) );
  NAND2_X1 U375 ( .A1(B_i[2]), .A2(B_i[1]), .ZN(n361) );
  OAI22_X1 U376 ( .A1(B_i[2]), .A2(n539), .B1(B_i[3]), .B2(n361), .ZN(n530) );
  AOI22_X1 U377 ( .A1(A_i[4]), .A2(n531), .B1(A_i[3]), .B2(n530), .ZN(n386) );
  OAI21_X1 U378 ( .B1(n640), .B2(n636), .A(B_i[3]), .ZN(n568) );
  XNOR2_X1 U379 ( .A(n568), .B(n386), .ZN(n365) );
  NAND2_X1 U380 ( .A1(B_i[3]), .A2(B_i[4]), .ZN(n362) );
  OAI21_X1 U381 ( .B1(B_i[3]), .B2(B_i[4]), .A(n362), .ZN(n528) );
  OR2_X1 U382 ( .A1(B_i[3]), .A2(B_i[4]), .ZN(n446) );
  AOI22_X1 U383 ( .A1(B_i[5]), .A2(n446), .B1(n362), .B2(n641), .ZN(n441) );
  INV_X1 U384 ( .A(n441), .ZN(n382) );
  OAI22_X1 U385 ( .A1(n528), .A2(n635), .B1(n637), .B2(n382), .ZN(n388) );
  AOI22_X1 U386 ( .A1(n366), .A2(n365), .B1(n388), .B2(n583), .ZN(n363) );
  OAI21_X1 U387 ( .B1(n388), .B2(n583), .A(n363), .ZN(n364) );
  OAI21_X1 U388 ( .B1(n366), .B2(n365), .A(n364), .ZN(n372) );
  INV_X1 U389 ( .A(n568), .ZN(n522) );
  OAI21_X1 U390 ( .B1(n522), .B2(n636), .A(n539), .ZN(n534) );
  XOR2_X1 U391 ( .A(n583), .B(n534), .Z(n580) );
  INV_X1 U392 ( .A(n580), .ZN(n368) );
  INV_X1 U393 ( .A(n528), .ZN(n442) );
  AOI22_X1 U394 ( .A1(n442), .A2(A_i[3]), .B1(A_i[2]), .B2(n441), .ZN(n378) );
  INV_X1 U395 ( .A(n378), .ZN(n367) );
  AOI22_X1 U396 ( .A1(n368), .A2(n378), .B1(n367), .B2(n580), .ZN(n370) );
  AOI22_X1 U397 ( .A1(A_i[7]), .A2(B_i[0]), .B1(A_i[6]), .B2(n529), .ZN(n376)
         );
  AOI22_X1 U398 ( .A1(A_i[5]), .A2(n531), .B1(A_i[4]), .B2(n530), .ZN(n375) );
  XNOR2_X1 U399 ( .A(n376), .B(n375), .ZN(n369) );
  XNOR2_X1 U400 ( .A(n370), .B(n369), .ZN(n371) );
  FA_X1 U401 ( .A(n373), .B(n372), .CI(n371), .CO(n429), .S(n622) );
  OAI21_X1 U402 ( .B1(B_i[1]), .B2(B_i[0]), .A(A_i[7]), .ZN(n374) );
  XOR2_X1 U403 ( .A(n580), .B(n374), .Z(n423) );
  XNOR2_X1 U404 ( .A(n375), .B(n568), .ZN(n381) );
  AOI22_X1 U405 ( .A1(A_i[7]), .A2(n570), .B1(B_i[1]), .B2(n376), .ZN(n380) );
  INV_X1 U406 ( .A(n583), .ZN(n447) );
  AOI22_X1 U407 ( .A1(n381), .A2(n380), .B1(n447), .B2(n378), .ZN(n377) );
  OAI21_X1 U408 ( .B1(n447), .B2(n378), .A(n377), .ZN(n379) );
  OAI21_X1 U409 ( .B1(n381), .B2(n380), .A(n379), .ZN(n411) );
  AOI22_X1 U410 ( .A1(A_i[5]), .A2(n530), .B1(A_i[6]), .B2(n531), .ZN(n402) );
  OAI22_X1 U411 ( .A1(n382), .A2(n646), .B1(n528), .B2(n638), .ZN(n400) );
  XNOR2_X1 U412 ( .A(n402), .B(n400), .ZN(n408) );
  OAI22_X1 U413 ( .A1(n463), .A2(n637), .B1(n462), .B2(n635), .ZN(n383) );
  XNOR2_X1 U414 ( .A(n604), .B(n383), .ZN(n410) );
  XNOR2_X1 U415 ( .A(n408), .B(n410), .ZN(n384) );
  XOR2_X1 U416 ( .A(n411), .B(n384), .Z(n385) );
  XNOR2_X1 U417 ( .A(n423), .B(n385), .ZN(n431) );
  XNOR2_X1 U418 ( .A(n429), .B(n431), .ZN(n620) );
  NOR2_X1 U419 ( .A1(n462), .A2(n643), .ZN(n590) );
  XOR2_X1 U420 ( .A(n604), .B(n590), .Z(n397) );
  XOR2_X1 U421 ( .A(n387), .B(n386), .Z(n390) );
  XNOR2_X1 U422 ( .A(n580), .B(n388), .ZN(n389) );
  XNOR2_X1 U423 ( .A(n390), .B(n389), .ZN(n589) );
  AOI22_X1 U424 ( .A1(n441), .A2(A_i[0]), .B1(n442), .B2(A_i[1]), .ZN(n564) );
  XNOR2_X1 U425 ( .A(n447), .B(n564), .ZN(n394) );
  AOI22_X1 U426 ( .A1(B_i[0]), .A2(A_i[5]), .B1(A_i[4]), .B2(n529), .ZN(n563)
         );
  AOI22_X1 U427 ( .A1(B_i[1]), .A2(n563), .B1(A_i[5]), .B2(n570), .ZN(n393) );
  AOI22_X1 U428 ( .A1(A_i[3]), .A2(n531), .B1(A_i[2]), .B2(n530), .ZN(n566) );
  OAI22_X1 U429 ( .A1(n393), .A2(n394), .B1(n522), .B2(n566), .ZN(n391) );
  AOI21_X1 U430 ( .B1(n522), .B2(n566), .A(n391), .ZN(n392) );
  AOI21_X1 U431 ( .B1(n394), .B2(n393), .A(n392), .ZN(n592) );
  NOR2_X1 U432 ( .A1(n589), .A2(n592), .ZN(n396) );
  NAND2_X1 U433 ( .A1(n589), .A2(n592), .ZN(n395) );
  OAI21_X1 U434 ( .B1(n397), .B2(n396), .A(n395), .ZN(n621) );
  AND3_X1 U435 ( .A1(n622), .A2(n620), .A3(n621), .ZN(n432) );
  AOI21_X1 U436 ( .B1(n622), .B2(n621), .A(n620), .ZN(n398) );
  NOR2_X1 U437 ( .A1(n432), .A2(n398), .ZN(DP_OP_71J8_123_5612_n4) );
  AOI22_X1 U438 ( .A1(n442), .A2(A_i[5]), .B1(A_i[4]), .B2(n441), .ZN(n414) );
  AOI22_X1 U439 ( .A1(A_i[7]), .A2(n531), .B1(A_i[6]), .B2(n530), .ZN(n416) );
  XOR2_X1 U440 ( .A(n414), .B(n416), .Z(n422) );
  OAI22_X1 U441 ( .A1(n463), .A2(n635), .B1(n462), .B2(n646), .ZN(n399) );
  XNOR2_X1 U442 ( .A(n604), .B(n399), .ZN(n426) );
  XNOR2_X1 U443 ( .A(n422), .B(n426), .ZN(n406) );
  INV_X1 U444 ( .A(n423), .ZN(n412) );
  AOI22_X1 U445 ( .A1(A_i[7]), .A2(n570), .B1(B_i[1]), .B2(n644), .ZN(n439) );
  XNOR2_X1 U446 ( .A(n583), .B(n400), .ZN(n404) );
  OAI22_X1 U447 ( .A1(n404), .A2(n439), .B1(n522), .B2(n402), .ZN(n401) );
  AOI21_X1 U448 ( .B1(n522), .B2(n402), .A(n401), .ZN(n403) );
  AOI21_X1 U449 ( .B1(n439), .B2(n404), .A(n403), .ZN(n425) );
  XNOR2_X1 U450 ( .A(n412), .B(n425), .ZN(n405) );
  XNOR2_X1 U451 ( .A(n406), .B(n405), .ZN(n428) );
  AOI22_X1 U452 ( .A1(n411), .A2(n410), .B1(n423), .B2(n408), .ZN(n407) );
  OAI21_X1 U453 ( .B1(n423), .B2(n408), .A(n407), .ZN(n409) );
  OAI21_X1 U454 ( .B1(n411), .B2(n410), .A(n409), .ZN(n427) );
  NOR2_X1 U455 ( .A1(n428), .A2(n427), .ZN(n434) );
  OAI21_X1 U456 ( .B1(B_i[2]), .B2(B_i[1]), .A(n645), .ZN(n440) );
  AOI21_X1 U457 ( .B1(n440), .B2(n568), .A(n644), .ZN(n413) );
  XOR2_X1 U458 ( .A(n413), .B(n412), .Z(n451) );
  INV_X1 U459 ( .A(n451), .ZN(n474) );
  XNOR2_X1 U460 ( .A(n474), .B(n604), .ZN(n483) );
  OAI22_X1 U461 ( .A1(n463), .A2(n646), .B1(n638), .B2(n462), .ZN(n470) );
  AOI22_X1 U462 ( .A1(n442), .A2(A_i[6]), .B1(A_i[5]), .B2(n441), .ZN(n473) );
  XNOR2_X1 U463 ( .A(n414), .B(n447), .ZN(n418) );
  OAI22_X1 U464 ( .A1(n439), .A2(n418), .B1(n522), .B2(n416), .ZN(n415) );
  AOI21_X1 U465 ( .B1(n522), .B2(n416), .A(n415), .ZN(n417) );
  AOI21_X1 U466 ( .B1(n418), .B2(n439), .A(n417), .ZN(n471) );
  XNOR2_X1 U467 ( .A(n473), .B(n471), .ZN(n419) );
  XNOR2_X1 U468 ( .A(n470), .B(n419), .ZN(n420) );
  XNOR2_X1 U469 ( .A(n483), .B(n420), .ZN(n543) );
  AOI22_X1 U470 ( .A1(n426), .A2(n425), .B1(n423), .B2(n422), .ZN(n421) );
  OAI21_X1 U471 ( .B1(n423), .B2(n422), .A(n421), .ZN(n424) );
  OAI21_X1 U472 ( .B1(n426), .B2(n425), .A(n424), .ZN(n542) );
  XOR2_X1 U473 ( .A(n543), .B(n542), .Z(n433) );
  NOR2_X1 U474 ( .A1(n434), .A2(n433), .ZN(n630) );
  INV_X1 U475 ( .A(n630), .ZN(n436) );
  XOR2_X1 U476 ( .A(n428), .B(n427), .Z(n626) );
  INV_X1 U477 ( .A(n429), .ZN(n430) );
  NOR2_X1 U478 ( .A1(n431), .A2(n430), .ZN(n627) );
  OR2_X1 U479 ( .A1(n627), .A2(n432), .ZN(n437) );
  NAND2_X1 U480 ( .A1(n626), .A2(n437), .ZN(n546) );
  NAND2_X1 U481 ( .A1(n434), .A2(n433), .ZN(n628) );
  NAND3_X1 U482 ( .A1(n628), .A2(n436), .A3(n546), .ZN(n435) );
  OAI21_X1 U483 ( .B1(n436), .B2(n546), .A(n435), .ZN(DP_OP_71J8_123_5612_n18)
         );
  XNOR2_X1 U484 ( .A(n626), .B(n437), .ZN(n552) );
  INV_X1 U485 ( .A(n552), .ZN(DP_OP_71J8_123_5612_n17) );
  INV_X1 U486 ( .A(DP_OP_71J8_123_5612_n4), .ZN(n551) );
  NOR2_X1 U487 ( .A1(n552), .A2(n551), .ZN(n550) );
  NAND3_X1 U488 ( .A1(DP_OP_71J8_123_5612_n17), .A2(DP_OP_71J8_123_5612_n4), 
        .A3(DP_OP_71J8_123_5612_n18), .ZN(n549) );
  OAI21_X1 U489 ( .B1(n550), .B2(DP_OP_71J8_123_5612_n18), .A(n549), .ZN(n438)
         );
  INV_X1 U490 ( .A(n438), .ZN(mul_final_add_sum_gen_carry_select_int_2_S1[2])
         );
  INV_X1 U491 ( .A(n439), .ZN(n444) );
  AOI22_X1 U492 ( .A1(A_i[7]), .A2(n440), .B1(n568), .B2(n644), .ZN(n443) );
  NOR2_X1 U493 ( .A1(n444), .A2(n443), .ZN(n460) );
  AOI22_X1 U494 ( .A1(A_i[7]), .A2(n442), .B1(A_i[6]), .B2(n441), .ZN(n479) );
  INV_X1 U495 ( .A(n479), .ZN(n452) );
  AOI22_X1 U496 ( .A1(n583), .A2(n479), .B1(n452), .B2(n447), .ZN(n445) );
  NAND2_X1 U497 ( .A1(n444), .A2(n443), .ZN(n458) );
  OAI21_X1 U498 ( .B1(n460), .B2(n445), .A(n458), .ZN(n468) );
  NAND2_X1 U499 ( .A1(n641), .A2(n446), .ZN(n456) );
  AOI21_X1 U500 ( .B1(n447), .B2(n456), .A(n644), .ZN(n464) );
  XOR2_X1 U501 ( .A(n483), .B(n464), .Z(n461) );
  OAI22_X1 U502 ( .A1(n463), .A2(n647), .B1(n639), .B2(n462), .ZN(n448) );
  INV_X1 U503 ( .A(n448), .ZN(n466) );
  XNOR2_X1 U504 ( .A(n461), .B(n466), .ZN(n449) );
  XNOR2_X1 U505 ( .A(n468), .B(n449), .ZN(n496) );
  XOR2_X1 U506 ( .A(n583), .B(n473), .Z(n450) );
  OAI21_X1 U507 ( .B1(n450), .B2(n460), .A(n458), .ZN(n478) );
  AOI22_X1 U508 ( .A1(n474), .A2(n479), .B1(n452), .B2(n451), .ZN(n455) );
  OAI22_X1 U509 ( .A1(n463), .A2(n638), .B1(n647), .B2(n462), .ZN(n481) );
  INV_X1 U510 ( .A(n604), .ZN(n503) );
  OAI22_X1 U511 ( .A1(n455), .A2(n478), .B1(n481), .B2(n503), .ZN(n453) );
  AOI21_X1 U512 ( .B1(n481), .B2(n503), .A(n453), .ZN(n454) );
  AOI21_X1 U513 ( .B1(n478), .B2(n455), .A(n454), .ZN(n484) );
  INV_X1 U514 ( .A(n484), .ZN(n497) );
  AND2_X1 U515 ( .A1(n496), .A2(n497), .ZN(n469) );
  INV_X1 U516 ( .A(n456), .ZN(n457) );
  AOI22_X1 U517 ( .A1(A_i[7]), .A2(n457), .B1(n583), .B2(n644), .ZN(n459) );
  OAI21_X1 U518 ( .B1(n460), .B2(n459), .A(n458), .ZN(n493) );
  XNOR2_X1 U519 ( .A(n461), .B(n493), .ZN(n490) );
  OAI22_X1 U520 ( .A1(n463), .A2(n639), .B1(n644), .B2(n462), .ZN(n491) );
  XNOR2_X1 U521 ( .A(n490), .B(n491), .ZN(n500) );
  XNOR2_X1 U522 ( .A(n474), .B(n464), .ZN(n492) );
  OAI22_X1 U523 ( .A1(n492), .A2(n468), .B1(n604), .B2(n466), .ZN(n465) );
  AOI21_X1 U524 ( .B1(n604), .B2(n466), .A(n465), .ZN(n467) );
  AOI21_X1 U525 ( .B1(n468), .B2(n492), .A(n467), .ZN(n499) );
  XOR2_X1 U526 ( .A(n500), .B(n499), .Z(n495) );
  XOR2_X1 U527 ( .A(n469), .B(n495), .Z(n485) );
  XNOR2_X1 U528 ( .A(n470), .B(n503), .ZN(n477) );
  INV_X1 U529 ( .A(n471), .ZN(n476) );
  AOI22_X1 U530 ( .A1(n477), .A2(n476), .B1(n474), .B2(n473), .ZN(n472) );
  OAI21_X1 U531 ( .B1(n474), .B2(n473), .A(n472), .ZN(n475) );
  OAI21_X1 U532 ( .B1(n477), .B2(n476), .A(n475), .ZN(n544) );
  XNOR2_X1 U533 ( .A(n479), .B(n478), .ZN(n480) );
  XNOR2_X1 U534 ( .A(n481), .B(n480), .ZN(n482) );
  XOR2_X1 U535 ( .A(n483), .B(n482), .Z(n545) );
  XNOR2_X1 U536 ( .A(n496), .B(n484), .ZN(n487) );
  AND3_X1 U537 ( .A1(n544), .A2(n545), .A3(n487), .ZN(n498) );
  NOR2_X1 U538 ( .A1(n498), .A2(n485), .ZN(n516) );
  AOI21_X1 U539 ( .B1(n485), .B2(n498), .A(n516), .ZN(DP_OP_72J8_124_5612_n17)
         );
  NAND2_X1 U540 ( .A1(n544), .A2(n545), .ZN(n486) );
  XOR2_X1 U541 ( .A(n487), .B(n486), .Z(n555) );
  INV_X1 U542 ( .A(n555), .ZN(DP_OP_72J8_124_5612_n4) );
  NOR2_X1 U543 ( .A1(B_i[7]), .A2(n488), .ZN(n504) );
  OAI21_X1 U544 ( .B1(n503), .B2(n504), .A(A_i[7]), .ZN(n489) );
  XOR2_X1 U545 ( .A(n490), .B(n489), .Z(n502) );
  NOR2_X1 U546 ( .A1(n493), .A2(n492), .ZN(n506) );
  XNOR2_X1 U547 ( .A(n491), .B(n503), .ZN(n494) );
  NAND2_X1 U548 ( .A1(n493), .A2(n492), .ZN(n505) );
  OAI21_X1 U549 ( .B1(n506), .B2(n494), .A(n505), .ZN(n501) );
  NOR2_X1 U550 ( .A1(n502), .A2(n501), .ZN(n511) );
  OAI221_X1 U551 ( .B1(n498), .B2(n497), .C1(n498), .C2(n496), .A(n495), .ZN(
        n512) );
  OR2_X1 U552 ( .A1(n500), .A2(n499), .ZN(n513) );
  XOR2_X1 U553 ( .A(n502), .B(n501), .Z(n515) );
  AOI21_X1 U554 ( .B1(n512), .B2(n513), .A(n515), .ZN(n509) );
  AOI22_X1 U555 ( .A1(A_i[7]), .A2(n504), .B1(n503), .B2(n644), .ZN(n507) );
  OAI21_X1 U556 ( .B1(n507), .B2(n506), .A(n505), .ZN(n508) );
  XNOR2_X1 U557 ( .A(n509), .B(n508), .ZN(n510) );
  XNOR2_X1 U558 ( .A(n511), .B(n510), .ZN(DP_OP_72J8_124_5612_n19) );
  XOR2_X1 U559 ( .A(n513), .B(n512), .Z(n514) );
  XNOR2_X1 U560 ( .A(n515), .B(n514), .ZN(DP_OP_72J8_124_5612_n18) );
  NOR2_X1 U561 ( .A1(n516), .A2(n555), .ZN(n553) );
  NAND2_X1 U562 ( .A1(n553), .A2(DP_OP_72J8_124_5612_n18), .ZN(n517) );
  AND2_X1 U563 ( .A1(DP_OP_72J8_124_5612_n19), .A2(n517), .ZN(
        mul_final_add_sum_gen_carry_select_int_3_S1[3]) );
  AOI22_X1 U564 ( .A1(A_i[1]), .A2(n531), .B1(A_i[0]), .B2(n530), .ZN(n527) );
  AOI22_X1 U565 ( .A1(B_i[0]), .A2(A_i[3]), .B1(A_i[2]), .B2(n529), .ZN(n523)
         );
  XOR2_X1 U566 ( .A(n527), .B(n523), .Z(n518) );
  XNOR2_X1 U567 ( .A(n518), .B(n534), .ZN(n536) );
  NAND2_X1 U568 ( .A1(n531), .A2(A_i[0]), .ZN(n537) );
  INV_X1 U569 ( .A(n537), .ZN(n521) );
  NAND2_X1 U570 ( .A1(B_i[0]), .A2(A_i[2]), .ZN(n519) );
  AOI22_X1 U571 ( .A1(B_i[0]), .A2(A_i[2]), .B1(A_i[1]), .B2(n529), .ZN(n538)
         );
  NAND2_X1 U572 ( .A1(B_i[1]), .A2(n538), .ZN(n540) );
  OAI21_X1 U573 ( .B1(B_i[1]), .B2(n519), .A(n540), .ZN(n520) );
  OAI221_X1 U574 ( .B1(n522), .B2(n521), .C1(n568), .C2(n537), .A(n520), .ZN(
        n535) );
  NOR2_X1 U575 ( .A1(n536), .A2(n535), .ZN(n582) );
  AOI22_X1 U576 ( .A1(B_i[1]), .A2(n523), .B1(n570), .B2(A_i[3]), .ZN(n524) );
  INV_X1 U577 ( .A(n524), .ZN(n525) );
  OAI21_X1 U578 ( .B1(n527), .B2(n568), .A(n525), .ZN(n526) );
  AOI21_X1 U579 ( .B1(n527), .B2(n568), .A(n526), .ZN(n578) );
  NOR2_X1 U580 ( .A1(n528), .A2(n643), .ZN(n573) );
  AOI22_X1 U581 ( .A1(B_i[0]), .A2(A_i[4]), .B1(A_i[3]), .B2(n529), .ZN(n571)
         );
  AOI22_X1 U582 ( .A1(A_i[2]), .A2(n531), .B1(A_i[1]), .B2(n530), .ZN(n569) );
  XNOR2_X1 U583 ( .A(n571), .B(n569), .ZN(n532) );
  XNOR2_X1 U584 ( .A(n573), .B(n532), .ZN(n579) );
  XNOR2_X1 U585 ( .A(n578), .B(n579), .ZN(n533) );
  XNOR2_X1 U586 ( .A(n534), .B(n533), .ZN(n581) );
  XNOR2_X1 U587 ( .A(n582), .B(n581), .ZN(
        mul_final_add_sum_gen_carry_select_int_1_S1_0_) );
  AOI21_X1 U588 ( .B1(n536), .B2(n535), .A(n582), .ZN(n562) );
  XNOR2_X1 U589 ( .A(n538), .B(n537), .ZN(n560) );
  XNOR2_X1 U590 ( .A(n560), .B(n539), .ZN(n541) );
  OAI21_X1 U591 ( .B1(n637), .B2(n634), .A(n643), .ZN(n558) );
  OAI22_X1 U592 ( .A1(n568), .A2(n541), .B1(n540), .B2(n558), .ZN(n561) );
  NAND2_X1 U593 ( .A1(n562), .A2(n561), .ZN(n216) );
  OR2_X1 U594 ( .A1(mul_final_add_sum_gen_carry_select_int_1_S1_0_), .A2(n216), 
        .ZN(n217) );
  INV_X1 U595 ( .A(LD), .ZN(n153) );
  NOR2_X1 U596 ( .A1(n543), .A2(n542), .ZN(n633) );
  XOR2_X1 U597 ( .A(n545), .B(n544), .Z(n632) );
  OAI21_X1 U598 ( .B1(n546), .B2(n630), .A(n628), .ZN(n547) );
  XNOR2_X1 U599 ( .A(n632), .B(n547), .ZN(n548) );
  XNOR2_X1 U600 ( .A(n633), .B(n548), .ZN(DP_OP_71J8_123_5612_n19) );
  XNOR2_X1 U601 ( .A(n549), .B(DP_OP_71J8_123_5612_n19), .ZN(
        mul_final_add_sum_gen_carry_select_int_2_S1[3]) );
  AOI21_X1 U602 ( .B1(n552), .B2(n551), .A(n550), .ZN(
        mul_final_add_sum_gen_carry_select_int_2_S1[1]) );
  XOR2_X1 U603 ( .A(n553), .B(DP_OP_72J8_124_5612_n18), .Z(
        mul_final_add_sum_gen_carry_select_int_3_S1[2]) );
  INV_X1 U604 ( .A(DP_OP_72J8_124_5612_n17), .ZN(n554) );
  AOI21_X1 U605 ( .B1(n555), .B2(n554), .A(n553), .ZN(
        mul_final_add_sum_gen_carry_select_int_3_S1[1]) );
  NAND2_X1 U606 ( .A1(B_i[0]), .A2(A_i[0]), .ZN(n236) );
  NOR2_X1 U607 ( .A1(n634), .A2(n637), .ZN(n557) );
  NOR2_X1 U608 ( .A1(n636), .A2(n643), .ZN(n556) );
  XNOR2_X1 U609 ( .A(n557), .B(n556), .ZN(n234) );
  NAND2_X1 U610 ( .A1(n558), .A2(B_i[1]), .ZN(n559) );
  XNOR2_X1 U611 ( .A(n560), .B(n559), .ZN(n230) );
  OAI21_X1 U612 ( .B1(n562), .B2(n561), .A(n216), .ZN(n226) );
  XNOR2_X1 U613 ( .A(n564), .B(n563), .ZN(n565) );
  XNOR2_X1 U614 ( .A(n566), .B(n565), .ZN(n567) );
  XNOR2_X1 U615 ( .A(n567), .B(n580), .ZN(n594) );
  XNOR2_X1 U616 ( .A(n569), .B(n568), .ZN(n576) );
  AOI22_X1 U617 ( .A1(B_i[1]), .A2(n571), .B1(A_i[4]), .B2(n570), .ZN(n575) );
  AOI22_X1 U618 ( .A1(n576), .A2(n575), .B1(n583), .B2(n573), .ZN(n572) );
  OAI21_X1 U619 ( .B1(n583), .B2(n573), .A(n572), .ZN(n574) );
  OAI21_X1 U620 ( .B1(n576), .B2(n575), .A(n574), .ZN(n593) );
  XNOR2_X1 U621 ( .A(n594), .B(n593), .ZN(n587) );
  NAND2_X1 U622 ( .A1(n580), .A2(n579), .ZN(n577) );
  OAI211_X1 U623 ( .C1(n580), .C2(n579), .A(n578), .B(n577), .ZN(n586) );
  XOR2_X1 U624 ( .A(n587), .B(n586), .Z(n612) );
  INV_X1 U625 ( .A(n581), .ZN(n584) );
  AOI22_X1 U626 ( .A1(n584), .A2(n583), .B1(n582), .B2(n581), .ZN(n610) );
  INV_X1 U627 ( .A(n610), .ZN(n585) );
  NAND2_X1 U628 ( .A1(n612), .A2(n585), .ZN(n600) );
  OAI21_X1 U629 ( .B1(n612), .B2(n585), .A(n600), .ZN(n596) );
  XNOR2_X1 U630 ( .A(n217), .B(n596), .ZN(n215) );
  INV_X1 U631 ( .A(n600), .ZN(n588) );
  NOR2_X1 U632 ( .A1(n587), .A2(n586), .ZN(n607) );
  NOR2_X1 U633 ( .A1(n588), .A2(n607), .ZN(n595) );
  XNOR2_X1 U634 ( .A(n590), .B(n589), .ZN(n591) );
  XNOR2_X1 U635 ( .A(n592), .B(n591), .ZN(n602) );
  NAND2_X1 U636 ( .A1(n594), .A2(n593), .ZN(n603) );
  XNOR2_X1 U637 ( .A(n602), .B(n603), .ZN(n608) );
  XNOR2_X1 U638 ( .A(n595), .B(n608), .ZN(n597) );
  NOR2_X1 U639 ( .A1(n217), .A2(n596), .ZN(n598) );
  XNOR2_X1 U640 ( .A(n597), .B(n598), .ZN(n212) );
  NOR2_X1 U641 ( .A1(n598), .A2(n607), .ZN(n599) );
  NAND2_X1 U642 ( .A1(n600), .A2(n599), .ZN(n601) );
  NAND2_X1 U643 ( .A1(n601), .A2(n608), .ZN(n606) );
  MUX2_X1 U644 ( .A(n604), .B(n603), .S(n602), .Z(n616) );
  XNOR2_X1 U645 ( .A(n622), .B(n621), .ZN(n617) );
  INV_X1 U646 ( .A(n617), .ZN(n614) );
  INV_X1 U647 ( .A(n616), .ZN(n613) );
  AOI22_X1 U648 ( .A1(n616), .A2(n614), .B1(n617), .B2(n613), .ZN(n605) );
  XNOR2_X1 U649 ( .A(n606), .B(n605), .ZN(n210) );
  NAND2_X1 U650 ( .A1(n608), .A2(n607), .ZN(n615) );
  INV_X1 U651 ( .A(n608), .ZN(n609) );
  AOI21_X1 U652 ( .B1(n610), .B2(n217), .A(n609), .ZN(n611) );
  OAI211_X1 U653 ( .C1(n614), .C2(n613), .A(n612), .B(n611), .ZN(n618) );
  OAI221_X1 U654 ( .B1(n617), .B2(n616), .C1(n617), .C2(n615), .A(n618), .ZN(
        n201) );
  INV_X1 U655 ( .A(n618), .ZN(n619) );
  NAND3_X1 U656 ( .A1(n621), .A2(n619), .A3(n622), .ZN(n624) );
  OAI221_X1 U657 ( .B1(n201), .B2(n622), .C1(n201), .C2(n621), .A(n620), .ZN(
        n623) );
  NAND2_X1 U658 ( .A1(n624), .A2(n623), .ZN(n625) );
  AOI222_X1 U659 ( .A1(n627), .A2(n626), .B1(n627), .B2(n625), .C1(n626), .C2(
        n625), .ZN(n629) );
  OAI21_X1 U660 ( .B1(n630), .B2(n629), .A(n628), .ZN(n631) );
  AOI222_X1 U661 ( .A1(n633), .A2(n632), .B1(n633), .B2(n631), .C1(n632), .C2(
        n631), .ZN(n193) );
endmodule

