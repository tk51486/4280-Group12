
`timescale 1ns/1ns

module primenums_tb();

reg [9:0] NumMax_s;
reg Reset_s, SysClk_s;
wire [9:0] NumberChecked_s;
wire [7:0] NumberofPrimesFound_s;
wire Prime_s;	//defining all inputs and outputs for primenums

//calling module
//primenums(NumMax, Reset, SysClk, Prime, NumberChecked, NumberofPrimesFound);
primenums primetest(NumMax_s, Reset_s, SysClk_s, Prime_s, NumberChecked_s, NumberofPrimesFound_s);

reg [9:0] arr [0:167];	//array with 168 10-bit indexes. will hold all prime numbers under 1000
integer j; //iterator used for self-checking

//clock
always begin
	SysClk_s <= 0;
	#10;
	SysClk_s <= 1;
	#10;
end

//test inputs
initial begin
	$dumpvars(0, primenums_tb);
	arr[0] = 2;
	arr[1] = 3;
	arr[2] = 5;
	arr[3] = 7;
	arr[4] = 11;
	arr[5] = 13;
	arr[6] = 17;
	arr[7] = 19;
	arr[8] = 23;
	arr[9] = 29;
	arr[10] = 31;
	arr[11] = 37;
	arr[12] = 41;
	arr[13] = 43;
	arr[14] = 47;
	arr[15] = 53;
	arr[16] = 59;
	arr[17] = 61;
	arr[18] = 67;
	arr[19] = 71;
	arr[20] = 73;
	arr[21] = 79;
	arr[22] = 83;
	arr[23] = 89;
	arr[24] = 97;
	arr[25] = 101;
	arr[26] = 103;
	arr[27] = 107;
	arr[28] = 109;
	arr[29] = 113;
	arr[30] = 127;
	arr[31] = 131;
	arr[32] = 137;
	arr[33] = 139;
	arr[34] = 149;
	arr[35] = 151;
	arr[36] = 157;
	arr[37] = 163;
	arr[38] = 167;
	arr[39] = 173;
	arr[40] = 179;
	arr[41] = 181;
	arr[42] = 191;
	arr[43] = 193;
	arr[44] = 197;
	arr[45] = 199;
	arr[46] = 211;
	arr[47] = 223;
	arr[48] = 227;
	arr[49] = 229;
	arr[50] = 233;
	arr[51] = 239;
	arr[52] = 241;
	arr[53] = 251;
	arr[54] = 257;
	arr[55] = 263;
	arr[56] = 269;
	arr[57] = 271;
	arr[58] = 277;
	arr[59] = 281;
	arr[60] = 283;
	arr[61] = 293;
	arr[62] = 307;
	arr[63] = 311;
	arr[64] = 313;
	arr[65] = 317;
	arr[66] = 331;
	arr[67] = 337;
	arr[68] = 347;
	arr[69] = 349;
	arr[70] = 353;
	arr[71] = 359;
	arr[72] = 367;
	arr[73] = 373;
	arr[74] = 379;
	arr[75] = 383;
	arr[76] = 389;
	arr[77] = 397;
	arr[78] = 401;
	arr[79] = 409;
	arr[80] = 419;
	arr[81] = 421;
	arr[82] = 431;
	arr[83] = 433;
	arr[84] = 439;
	arr[85] = 443;
	arr[86] = 449;
	arr[87] = 457;
	arr[88] = 461;
	arr[89] = 463;
	arr[90] = 467;
	arr[91] = 479;
	arr[92] = 487;
	arr[93] = 491;
	arr[94] = 499;
	arr[95] = 503;
	arr[96] = 509;
	arr[97] = 521;
	arr[98] = 523;
	arr[99] = 541;
	arr[100] = 547;
	arr[101] = 557;
	arr[102] = 563;
	arr[103] = 569;
	arr[104] = 571;
	arr[105] = 577;
	arr[106] = 587;
	arr[107] = 593;
	arr[108] = 599;
	arr[109] = 601;
	arr[110] = 607;
	arr[111] = 613;
	arr[112] = 617;
	arr[113] = 619;
	arr[114] = 631;
	arr[115] = 641;
	arr[116] = 643;
	arr[117] = 647;
	arr[118] = 653;
	arr[119] = 659;
	arr[120] = 661;
	arr[121] = 673;
	arr[122] = 677;
	arr[123] = 683;
	arr[124] = 691;
	arr[125] = 701;
	arr[126] = 709;
	arr[127] = 719;
	arr[128] = 727;
	arr[129] = 733;
	arr[130] = 739;
	arr[131] = 743;
	arr[132] = 751;
	arr[133] = 757;
	arr[134] = 761;
	arr[135] = 769;
	arr[136] = 773;
	arr[137] = 787;
	arr[138] = 797;
	arr[139] = 809;
	arr[140] = 811;
	arr[141] = 821;
	arr[142] = 823;
	arr[143] = 827;
	arr[144] = 829;
	arr[145] = 839;
	arr[146] = 853;
	arr[147] = 857;
	arr[148] = 859;
	arr[149] = 863;
	arr[150] = 877;
	arr[151] = 881;
	arr[152] = 883;
	arr[153] = 887;
	arr[154] = 907;
	arr[155] = 911;
	arr[156] = 919;
	arr[157] = 929;
	arr[158] = 937;
	arr[159] = 941;
	arr[160] = 947;
	arr[161] = 953;
	arr[162] = 967;
	arr[163] = 971;
	arr[164] = 977;
	arr[165] = 983;
	arr[166] = 991;
	arr[167] = 997;	//initializing lookup table
	j = 0;	//initializing iterator

	NumMax_s <= 505;	//setting NumMax
	#100000		//wait an arbitrary amount of time

	while (arr[j] <= NumMax_s & j < 168) begin	//finding primes up to NumMax with lookup table
	 	j = j + 1;	//j is one less than the number of primes up to arr[j]
	end

	if (j == NumberofPrimesFound_s) begin	//compares iterator to primes found
		$display("Correct Number of Primes found.\n");	//pass message
	end
	else begin
		$display("Wrong Number of Primes found.\n");	//error message
	end
$finish;
end
endmodule