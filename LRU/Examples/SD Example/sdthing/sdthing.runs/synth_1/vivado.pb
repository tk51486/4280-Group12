
d
Command: %s
53*	vivadotcl23
1synth_design -top fpga_top -part xc7a100tcsg324-1Z4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
{
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2

xc7a100tZ17-347h px� 
k
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2

xc7a100tZ17-349h px� 
E
Loading part %s157*device2
xc7a100tcsg324-1Z21-403h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
N
#Helper process launched with PID %s4824*oasys2
28088Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:05 ; elapsed = 00:00:05 . Memory (MB): peak = 1019.398 ; gain = 467.238
h px� 
�
synthesizing module '%s'%s4497*oasys2

fpga_top2
 28
4C:/Users/Amr/Downloads/Wang/sdcard/ex/RTL/fpga_top.v2
118@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
	clk_wiz_02
 2�
~C:/Users/Amr/Downloads/Wang/sdcard/ex/Nexys4-ReadFile.runs/synth_1/.Xil/Vivado-18480-DESKTOP-O22QL9I/realtime/clk_wiz_0_stub.v2
68@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	clk_wiz_02
 2
02
12�
~C:/Users/Amr/Downloads/Wang/sdcard/ex/Nexys4-ReadFile.runs/synth_1/.Xil/Vivado-18480-DESKTOP-O22QL9I/realtime/clk_wiz_0_stub.v2
68@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
sd_file_reader2
 2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
128@Z8-6157h px� 
Q
%s
*synth29
7	Parameter FILE_NAME_LEN bound to: 11 - type: integer 
h p
x
� 
U
%s
*synth2=
;	Parameter FILE_NAME bound to: example.txt - type: string 
h p
x
� 
?
%s
*synth2'
%	Parameter CLK_DIV bound to: 3'b010 
h p
x
� 
�
-case statement is not full and has no default155*oasys2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
2028@Z8-155h px� 
�
-case statement is not full and has no default155*oasys2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
3068@Z8-155h px� 
�
synthesizing module '%s'%s4497*oasys2
	sd_reader2
 26
2C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_reader.v2
108@Z8-6157h px� 
?
%s
*synth2'
%	Parameter CLK_DIV bound to: 3'b010 
h p
x
� 
K
%s
*synth23
1	Parameter SIMULATE bound to: 0 - type: integer 
h p
x
� 
�
synthesizing module '%s'%s4497*oasys2

sdcmd_ctrl2
 27
3C:/Users/Amr/Downloads/Wang/sdcard/RTL/sdcmd_ctrl.v2
108@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

sdcmd_ctrl2
 2
02
127
3C:/Users/Amr/Downloads/Wang/sdcard/RTL/sdcmd_ctrl.v2
108@Z8-6155h px� 
�
-case statement is not full and has no default155*oasys26
2C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_reader.v2
1548@Z8-155h px� 
�
-case statement is not full and has no default155*oasys26
2C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_reader.v2
2278@Z8-155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	sd_reader2
 2
02
126
2C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_reader.v2
108@Z8-6155h px� 
�
-case statement is not full and has no default155*oasys2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
4298@Z8-155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
sd_file_reader2
 2
02
12;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
128@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2	
sd_test2
 2V
RC:/Users/Amr/Downloads/Wang/sdcard/ex/Nexys4-ReadFile.srcs/sources_1/new/sd_test.v2
238@Z8-6157h px� 
�
evariable '%s' is written by both blocking and non-blocking assignments, entire logic could be removed4426*oasys2	
counter2V
RC:/Users/Amr/Downloads/Wang/sdcard/ex/Nexys4-ReadFile.srcs/sources_1/new/sd_test.v2
768@Z8-6090h px� 
�
evariable '%s' is written by both blocking and non-blocking assignments, entire logic could be removed4426*oasys2
	nintcount2V
RC:/Users/Amr/Downloads/Wang/sdcard/ex/Nexys4-ReadFile.srcs/sources_1/new/sd_test.v2
858@Z8-6090h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2	
sd_test2
 2
02
12V
RC:/Users/Amr/Downloads/Wang/sdcard/ex/Nexys4-ReadFile.srcs/sources_1/new/sd_test.v2
238@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

fpga_top2
 2
02
128
4C:/Users/Amr/Downloads/Wang/sdcard/ex/RTL/fpga_top.v2
118@Z8-6155h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[1]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[2]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[3]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[4]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[5]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[6]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[7]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[8]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[9]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[10]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[19]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[20]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[21]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[24]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[25]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[26]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[27]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[28]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[29]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[30]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[31]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[32]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[33]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[34]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[35]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[40]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[41]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[42]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[43]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[48]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[49]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[50]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[51]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[52]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[53]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[54]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[55]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[56]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[57]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[58]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[59]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[60]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[61]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[62]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[63]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[64]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[65]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[66]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[67]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[68]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[69]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[70]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[71]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[72]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[73]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[74]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[75]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[76]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[77]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[78]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[79]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[80]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[81]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[82]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[83]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[84]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[85]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[87]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[88]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[89]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[90]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[91]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[92]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[93]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[94]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[95]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[96]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[97]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[98]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[99]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[100]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[101]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[102]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[103]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[104]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[105]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[106]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[107]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[108]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[109]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[110]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[111]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[112]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[113]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[114]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[115]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[116]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[117]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[118]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
sector_content_reg[119]2;
7C:/Users/Amr/Downloads/Wang/sdcard/RTL/sd_file_reader.v2
1388@Z8-6014h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2
Synth 8-60142
100Z17-14h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2	
uart_tx2

fpga_top28
4C:/Users/Amr/Downloads/Wang/sdcard/ex/RTL/fpga_top.v2
268@Z8-3848h px� 
n
+design %s has port %s driven by constant %s3447*oasys2

fpga_top2
sdcard_pwr_n2
0Z8-3917h px� 
h
+design %s has port %s driven by constant %s3447*oasys2

fpga_top2
sddat12
1Z8-3917h px� 
h
+design %s has port %s driven by constant %s3447*oasys2

fpga_top2
sddat22
1Z8-3917h px� 
h
+design %s has port %s driven by constant %s3447*oasys2

fpga_top2
sddat32
1Z8-3917h px� 
q
9Port %s in module %s is either unconnected or has no load4866*oasys2	
led[11]2	
sd_testZ8-7129h px� 
q
9Port %s in module %s is either unconnected or has no load4866*oasys2	
led[10]2	
sd_testZ8-7129h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2
led[9]2	
sd_testZ8-7129h px� 
r
9Port %s in module %s is either unconnected or has no load4866*oasys2	
uart_tx2

fpga_topZ8-7129h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:07 ; elapsed = 00:00:07 . Memory (MB): peak = 1177.188 ; gain = 625.027
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:07 ; elapsed = 00:00:08 . Memory (MB): peak = 1177.188 ; gain = 625.027
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:07 ; elapsed = 00:00:08 . Memory (MB): peak = 1177.188 ; gain = 625.027
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0342

1177.1882
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2Y
Uc:/Users/Amr/Downloads/Wang/sdcard/ex/IP/clk_wiz_0/clk_wiz_0/clk_wiz_0_in_context.xdc2
u_clk_wiz_0	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2Y
Uc:/Users/Amr/Downloads/Wang/sdcard/ex/IP/clk_wiz_0/clk_wiz_0/clk_wiz_0_in_context.xdc2
u_clk_wiz_0	8Z20-847h px� 
�
Parsing XDC File [%s]
179*designutils2V
RC:/Users/Amr/Downloads/Wang/sdcard/ex/example-vivado-readfile/Nexys-4-DDR-pins.xdc8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2V
RC:/Users/Amr/Downloads/Wang/sdcard/ex/example-vivado-readfile/Nexys-4-DDR-pins.xdc8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2T
RC:/Users/Amr/Downloads/Wang/sdcard/ex/example-vivado-readfile/Nexys-4-DDR-pins.xdc2
.Xil/fpga_top_propImpl.xdcZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1262.3872
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
 Constraint Validation Runtime : 2

00:00:002
00:00:00.0122

1262.3872
0.000Z17-268h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:15 ; elapsed = 00:00:15 . Memory (MB): peak = 1262.387 ; gain = 710.227
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Loading part: xc7a100tcsg324-1
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:15 ; elapsed = 00:00:15 . Memory (MB): peak = 1262.387 ; gain = 710.227
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
%s
*synth20
.Start Applying 'set_property' XDC Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:15 ; elapsed = 00:00:15 . Memory (MB): peak = 1262.387 ; gain = 710.227
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
r
3inferred FSM for state register '%s' in module '%s'802*oasys2
sddat_stat_reg2
	sd_readerZ8-802h px� 
}
3inferred FSM for state register '%s' in module '%s'802*oasys2
filesystem_state_reg2
sd_file_readerZ8-802h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_                   RWAIT |                            00001 |                              000
h p
x
� 
y
%s
*synth2a
_                 RDURING |                            00010 |                              001
h p
x
� 
y
%s
*synth2a
_                   RTAIL |                            00100 |                              010
h p
x
� 
y
%s
*synth2a
_                  iSTATE |                            01000 |                              011
h p
x
� 
y
%s
*synth2a
_                 iSTATE0 |                            10000 |                              100
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
sddat_stat_reg2	
one-hot2
	sd_readerZ8-3354h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:16 ; elapsed = 00:00:17 . Memory (MB): peak = 1262.387 ; gain = 710.227
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
(
%s
*synth2
+---Adders : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   39 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   33 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   32 Bit       Adders := 11    
h p
x
� 
F
%s
*synth2.
,	   3 Input   32 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   4 Input   32 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   17 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    8 Bit       Adders := 6     
h p
x
� 
F
%s
*synth2.
,	   2 Input    6 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    3 Bit       Adders := 1     
h p
x
� 
&
%s
*synth2
+---XORs : 
h p
x
� 
H
%s
*synth20
.	   2 Input      7 Bit         XORs := 1     
h p
x
� 
H
%s
*synth20
.	   2 Input      1 Bit         XORs := 1     
h p
x
� 
+
%s
*synth2
+---Registers : 
h p
x
� 
H
%s
*synth20
.	               39 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	               32 Bit    Registers := 15    
h p
x
� 
H
%s
*synth20
.	               18 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	               17 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	               16 Bit    Registers := 7     
h p
x
� 
H
%s
*synth20
.	                9 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                8 Bit    Registers := 60    
h p
x
� 
H
%s
*synth20
.	                7 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                6 Bit    Registers := 5     
h p
x
� 
H
%s
*synth20
.	                4 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                3 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                2 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                1 Bit    Registers := 22    
h p
x
� 
-
%s
*synth2
+---Multipliers : 
h p
x
� 
F
%s
*synth2.
,	               8x32  Multipliers := 5     
h p
x
� 
&
%s
*synth2
+---RAMs : 
h p
x
� 
Y
%s
*synth2A
?	             390K Bit	(50001 X 8 bit)          RAMs := 1     
h p
x
� 
'
%s
*synth2
+---Muxes : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   32 Bit        Muxes := 32    
h p
x
� 
F
%s
*synth2.
,	   4 Input   32 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	  10 Input   32 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   8 Input   32 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   6 Input   32 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input   25 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   16 Bit        Muxes := 8     
h p
x
� 
F
%s
*synth2.
,	  10 Input   16 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   7 Input   16 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input   16 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    9 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	   4 Input    9 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    8 Bit        Muxes := 112   
h p
x
� 
F
%s
*synth2.
,	   4 Input    8 Bit        Muxes := 13    
h p
x
� 
F
%s
*synth2.
,	   8 Input    8 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   6 Input    8 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    7 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    6 Bit        Muxes := 9     
h p
x
� 
F
%s
*synth2.
,	   6 Input    5 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    5 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	   8 Input    5 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	   8 Input    4 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    3 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  12 Input    3 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   3 Input    2 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 128   
h p
x
� 
F
%s
*synth2.
,	   8 Input    1 Bit        Muxes := 7     
h p
x
� 
F
%s
*synth2.
,	  10 Input    1 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   4 Input    1 Bit        Muxes := 4     
h p
x
� 
F
%s
*synth2.
,	   3 Input    1 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   7 Input    1 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   6 Input    1 Bit        Muxes := 8     
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
q
%s
*synth2Y
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
_
%s
*synth2G
EDSP Report: Generating DSP read_sector_no1, operation Mode is: A*B2.
h p
x
� 
e
%s
*synth2M
KDSP Report: register read_sector_no1 is absorbed into DSP read_sector_no1.
h p
x
� 
e
%s
*synth2M
KDSP Report: operator read_sector_no1 is absorbed into DSP read_sector_no1.
h p
x
� 
e
%s
*synth2M
KDSP Report: operator read_sector_no1 is absorbed into DSP read_sector_no1.
h p
x
� 
j
%s
*synth2R
PDSP Report: Generating DSP read_sector_no1, operation Mode is: (PCIN>>17)+A*B2.
h p
x
� 
e
%s
*synth2M
KDSP Report: register read_sector_no1 is absorbed into DSP read_sector_no1.
h p
x
� 
e
%s
*synth2M
KDSP Report: operator read_sector_no1 is absorbed into DSP read_sector_no1.
h p
x
� 
e
%s
*synth2M
KDSP Report: operator read_sector_no1 is absorbed into DSP read_sector_no1.
h p
x
� 
_
%s
*synth2G
EDSP Report: Generating DSP read_sector_no1, operation Mode is: A*B2.
h p
x
� 
e
%s
*synth2M
KDSP Report: register read_sector_no1 is absorbed into DSP read_sector_no1.
h p
x
� 
e
%s
*synth2M
KDSP Report: operator read_sector_no1 is absorbed into DSP read_sector_no1.
h p
x
� 
e
%s
*synth2M
KDSP Report: operator read_sector_no1 is absorbed into DSP read_sector_no1.
h p
x
� 
j
%s
*synth2R
PDSP Report: Generating DSP read_sector_no1, operation Mode is: (PCIN>>17)+A*B2.
h p
x
� 
e
%s
*synth2M
KDSP Report: register read_sector_no1 is absorbed into DSP read_sector_no1.
h p
x
� 
e
%s
*synth2M
KDSP Report: operator read_sector_no1 is absorbed into DSP read_sector_no1.
h p
x
� 
e
%s
*synth2M
KDSP Report: operator read_sector_no1 is absorbed into DSP read_sector_no1.
h p
x
� 
^
%s
*synth2F
DDSP Report: Generating DSP read_sector_no1, operation Mode is: A*B.
h p
x
� 
e
%s
*synth2M
KDSP Report: operator read_sector_no1 is absorbed into DSP read_sector_no1.
h p
x
� 
e
%s
*synth2M
KDSP Report: operator read_sector_no1 is absorbed into DSP read_sector_no1.
h p
x
� 
i
%s
*synth2Q
ODSP Report: Generating DSP read_sector_no1, operation Mode is: (PCIN>>17)+A*B.
h p
x
� 
e
%s
*synth2M
KDSP Report: operator read_sector_no1 is absorbed into DSP read_sector_no1.
h p
x
� 
e
%s
*synth2M
KDSP Report: operator read_sector_no1 is absorbed into DSP read_sector_no1.
h p
x
� 
^
%s
*synth2F
DDSP Report: Generating DSP read_sector_no2, operation Mode is: A*B.
h p
x
� 
e
%s
*synth2M
KDSP Report: operator read_sector_no2 is absorbed into DSP read_sector_no2.
h p
x
� 
e
%s
*synth2M
KDSP Report: operator read_sector_no2 is absorbed into DSP read_sector_no2.
h p
x
� 
i
%s
*synth2Q
ODSP Report: Generating DSP read_sector_no2, operation Mode is: (PCIN>>17)+A*B.
h p
x
� 
e
%s
*synth2M
KDSP Report: operator read_sector_no2 is absorbed into DSP read_sector_no2.
h p
x
� 
e
%s
*synth2M
KDSP Report: operator read_sector_no2 is absorbed into DSP read_sector_no2.
h p
x
� 
^
%s
*synth2F
DDSP Report: Generating DSP read_sector_no1, operation Mode is: A*B.
h p
x
� 
e
%s
*synth2M
KDSP Report: operator read_sector_no1 is absorbed into DSP read_sector_no1.
h p
x
� 
e
%s
*synth2M
KDSP Report: operator read_sector_no1 is absorbed into DSP read_sector_no1.
h p
x
� 
i
%s
*synth2Q
ODSP Report: Generating DSP read_sector_no1, operation Mode is: (PCIN>>17)+A*B.
h p
x
� 
e
%s
*synth2M
KDSP Report: operator read_sector_no1 is absorbed into DSP read_sector_no1.
h p
x
� 
e
%s
*synth2M
KDSP Report: operator read_sector_no1 is absorbed into DSP read_sector_no1.
h p
x
� 
`
%s
*synth2H
FDSP Report: Generating DSP read_sector_no0, operation Mode is: C+A*B.
h p
x
� 
e
%s
*synth2M
KDSP Report: operator read_sector_no0 is absorbed into DSP read_sector_no0.
h p
x
� 
e
%s
*synth2M
KDSP Report: operator read_sector_no1 is absorbed into DSP read_sector_no0.
h p
x
� 
n
+design %s has port %s driven by constant %s3447*oasys2

fpga_top2
sdcard_pwr_n2
0Z8-3917h px� 
h
+design %s has port %s driven by constant %s3447*oasys2

fpga_top2
sddat12
1Z8-3917h px� 
h
+design %s has port %s driven by constant %s3447*oasys2

fpga_top2
sddat22
1Z8-3917h px� 
h
+design %s has port %s driven by constant %s3447*oasys2

fpga_top2
sddat32
1Z8-3917h px� 
r
9Port %s in module %s is either unconnected or has no load4866*oasys2	
led[11]2

fpga_topZ8-7129h px� 
r
9Port %s in module %s is either unconnected or has no load4866*oasys2	
led[10]2

fpga_topZ8-7129h px� 
q
9Port %s in module %s is either unconnected or has no load4866*oasys2
led[9]2

fpga_topZ8-7129h px� 
r
9Port %s in module %s is either unconnected or has no load4866*oasys2	
uart_tx2

fpga_topZ8-7129h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:29 ; elapsed = 00:00:30 . Memory (MB): peak = 1336.914 ; gain = 784.754
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
]
%s
*synth2E
C Sort Area is  read_sector_no1_0 : 0 0 : 1632 3217 : Used 1 time 0
h p
x
� 
]
%s
*synth2E
C Sort Area is  read_sector_no1_0 : 0 1 : 1585 3217 : Used 1 time 0
h p
x
� 
]
%s
*synth2E
C Sort Area is  read_sector_no1_a : 0 0 : 1632 3217 : Used 1 time 0
h p
x
� 
]
%s
*synth2E
C Sort Area is  read_sector_no1_a : 0 1 : 1585 3217 : Used 1 time 0
h p
x
� 
]
%s
*synth2E
C Sort Area is  read_sector_no1_8 : 0 0 : 1623 3199 : Used 1 time 0
h p
x
� 
]
%s
*synth2E
C Sort Area is  read_sector_no1_8 : 0 1 : 1576 3199 : Used 1 time 0
h p
x
� 
]
%s
*synth2E
C Sort Area is  read_sector_no1_9 : 0 0 : 1623 3199 : Used 1 time 0
h p
x
� 
]
%s
*synth2E
C Sort Area is  read_sector_no1_9 : 0 1 : 1576 3199 : Used 1 time 0
h p
x
� 
]
%s
*synth2E
C Sort Area is  read_sector_no2_3 : 0 0 : 1623 3199 : Used 1 time 0
h p
x
� 
]
%s
*synth2E
C Sort Area is  read_sector_no2_3 : 0 1 : 1576 3199 : Used 1 time 0
h p
x
� 
[
%s
*synth2C
A Sort Area is  read_sector_no0_6 : 0 0 : 973 973 : Used 1 time 0
h p
x
� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
h px� 
l
%s*synth2T
R---------------------------------------------------------------------------------
h px� 
R
%s*synth2:
8
Block RAM: Preliminary Mapping Report (see note below)
h px� 
�
%s*synth2�
�+------------+--------------------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+
h px� 
�
%s*synth2�
�|Module Name | RTL Object               | PORT A (Depth x Width) | W | R | PORT B (Depth x Width) | W | R | Ports driving FF | RAMB18 | RAMB36 | 
h px� 
�
%s*synth2�
�+------------+--------------------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+
h px� 
�
%s*synth2�
�|fpga_top    | nolabel_line101/buff_reg | 48 K x 8(READ_FIRST)   | W |   | 48 K x 4(WRITE_FIRST)  |   | R | Port A and B     | 0      | 16     | 
h px� 
�
%s*synth2�
�+------------+--------------------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+

h px� 
�
%s*synth2�
�Note: The table above is a preliminary report that shows the Block RAMs at the current stage of the synthesis flow. Some Block RAMs may be reimplemented as non Block RAM primitives later in the synthesis flow. Multiple instantiated Block RAMs are reported only once. 
h px� 
v
%s*synth2^
\
DSP: Preliminary Mapping Report (see note below. The ' indicates corresponding REG is set)
h px� 
�
%s*synth2�
�+---------------+-----------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
h px� 
�
%s*synth2�
�|Module Name    | DSP Mapping     | A Size | B Size | C Size | D Size | P Size | AREG | BREG | CREG | DREG | ADREG | MREG | PREG | 
h px� 
�
%s*synth2�
�+---------------+-----------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
h px� 
�
%s*synth2�
�|sd_file_reader | A*B2            | 18     | 9      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�|sd_file_reader | (PCIN>>17)+A*B2 | 16     | 9      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�|sd_file_reader | A*B2            | 18     | 9      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�|sd_file_reader | (PCIN>>17)+A*B2 | 16     | 9      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�|sd_file_reader | A*B             | 18     | 9      | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�|sd_file_reader | (PCIN>>17)+A*B  | 16     | 9      | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�|sd_file_reader | A*B             | 18     | 9      | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�|sd_file_reader | (PCIN>>17)+A*B  | 16     | 9      | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�|sd_file_reader | A*B             | 18     | 9      | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�|sd_file_reader | (PCIN>>17)+A*B  | 16     | 9      | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�|sd_file_reader | C+A*B           | 16     | 8      | 32     | -      | 32     | 0    | 0    | 0    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�+---------------+-----------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+

h px� 
�
%s*synth2�
�Note: The table above is a preliminary report that shows the DSPs inferred at the current stage of the synthesis flow. Some DSP may be reimplemented as non DSP primitives later in the synthesis flow. Multiple instantiated DSPs are reported only once.
h px� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
h px� 
l
%s*synth2T
R---------------------------------------------------------------------------------
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
@
%s
*synth2(
&Start Applying XDC Timing Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:37 ; elapsed = 00:00:39 . Memory (MB): peak = 1407.730 ; gain = 855.570
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2
}Finished Timing Optimization : Time (s): cpu = 00:00:44 ; elapsed = 00:00:46 . Memory (MB): peak = 1539.746 ; gain = 987.586
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s
*synth2�
�---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!
Block RAM: Final Mapping Report
h p
x
� 
�
%s
*synth2�
�+------------+--------------------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+
h p
x
� 
�
%s
*synth2�
�|Module Name | RTL Object               | PORT A (Depth x Width) | W | R | PORT B (Depth x Width) | W | R | Ports driving FF | RAMB18 | RAMB36 | 
h p
x
� 
�
%s
*synth2�
�+------------+--------------------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+
h p
x
� 
�
%s
*synth2�
�|fpga_top    | nolabel_line101/buff_reg | 48 K x 8(READ_FIRST)   | W |   | 48 K x 4(WRITE_FIRST)  |   | R | Port A and B     | 0      | 16     | 
h p
x
� 
�
%s
*synth2�
�+------------+--------------------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+

h p
x
� 
�
%s
*synth2�
�---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2
nolabel_line101/buff_reg_1_02
BlockZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2
nolabel_line101/buff_reg_1_12
BlockZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2
nolabel_line101/buff_reg_1_22
BlockZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2
nolabel_line101/buff_reg_1_32
BlockZ8-7052h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2
}Finished Technology Mapping : Time (s): cpu = 00:00:45 ; elapsed = 00:00:47 . Memory (MB): peak = 1557.812 ; gain = 1005.652
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2y
wFinished IO Insertion : Time (s): cpu = 00:00:48 ; elapsed = 00:00:50 . Memory (MB): peak = 1666.066 ; gain = 1113.906
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:48 ; elapsed = 00:00:51 . Memory (MB): peak = 1666.066 ; gain = 1113.906
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:49 ; elapsed = 00:00:51 . Memory (MB): peak = 1666.066 ; gain = 1113.906
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:49 ; elapsed = 00:00:51 . Memory (MB): peak = 1666.066 ; gain = 1113.906
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:49 ; elapsed = 00:00:51 . Memory (MB): peak = 1669.074 ; gain = 1116.914
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:49 ; elapsed = 00:00:51 . Memory (MB): peak = 1669.074 ; gain = 1116.914
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
W
%s
*synth2?
=
DSP Final Report (the ' indicates corresponding REG is set)
h p
x
� 
�
%s
*synth2�
�+---------------+---------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
h p
x
� 
�
%s
*synth2�
�|Module Name    | DSP Mapping   | A Size | B Size | C Size | D Size | P Size | AREG | BREG | CREG | DREG | ADREG | MREG | PREG | 
h p
x
� 
�
%s
*synth2�
�+---------------+---------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
h p
x
� 
�
%s
*synth2�
�|sd_file_reader | A*B'          | 17     | 8      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
�|sd_file_reader | PCIN>>17+A*B' | 15     | 8      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
�|sd_file_reader | A*B'          | 17     | 8      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
�|sd_file_reader | PCIN>>17+A*B' | 15     | 8      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
�|sd_file_reader | A*B           | 16     | 8      | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
�|sd_file_reader | PCIN>>17+A*B  | 0      | 8      | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
�|sd_file_reader | A*B           | 17     | 8      | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
�|sd_file_reader | PCIN>>17+A*B  | 15     | 8      | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
�|sd_file_reader | A*B           | 17     | 8      | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
�|sd_file_reader | PCIN>>17+A*B  | 15     | 8      | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
�|sd_file_reader | C+A*B         | 16     | 8      | 32     | -      | 32     | 0    | 0    | 0    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
�+---------------+---------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+

h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
=
%s
*synth2%
#+------+--------------+----------+
h p
x
� 
=
%s
*synth2%
#|      |BlackBox name |Instances |
h p
x
� 
=
%s
*synth2%
#+------+--------------+----------+
h p
x
� 
=
%s
*synth2%
#|1     |clk_wiz_0     |         1|
h p
x
� 
=
%s
*synth2%
#+------+--------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
4
%s*synth2
+------+---------+------+
h px� 
4
%s*synth2
|      |Cell     |Count |
h px� 
4
%s*synth2
+------+---------+------+
h px� 
4
%s*synth2
|1     |clk_wiz  |     1|
h px� 
4
%s*synth2
|2     |CARRY4   |   170|
h px� 
4
%s*synth2
|3     |DSP48E1  |    11|
h px� 
4
%s*synth2
|6     |LUT1     |     6|
h px� 
4
%s*synth2
|7     |LUT2     |   509|
h px� 
4
%s*synth2
|8     |LUT3     |   318|
h px� 
4
%s*synth2
|9     |LUT4     |   293|
h px� 
4
%s*synth2
|10    |LUT5     |   375|
h px� 
4
%s*synth2
|11    |LUT6     |   481|
h px� 
4
%s*synth2
|12    |MUXF7    |    36|
h px� 
4
%s*synth2
|13    |RAMB36E1 |     8|
h px� 
4
%s*synth2
|15    |FDCE     |   936|
h px� 
4
%s*synth2
|16    |FDPE     |    21|
h px� 
4
%s*synth2
|17    |FDRE     |   300|
h px� 
4
%s*synth2
|18    |IBUF     |     2|
h px� 
4
%s*synth2
|19    |IOBUF    |     1|
h px� 
4
%s*synth2
|20    |OBUF     |    18|
h px� 
4
%s*synth2
|21    |OBUFT    |     4|
h px� 
4
%s*synth2
+------+---------+------+
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:49 ; elapsed = 00:00:51 . Memory (MB): peak = 1669.074 ; gain = 1116.914
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
`
%s
*synth2H
FSynthesis finished with 0 errors, 0 critical warnings and 9 warnings.
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Runtime : Time (s): cpu = 00:00:40 ; elapsed = 00:00:49 . Memory (MB): peak = 1669.074 ; gain = 1031.715
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:49 ; elapsed = 00:00:51 . Memory (MB): peak = 1669.074 ; gain = 1116.914
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0292

1678.2812
0.000Z17-268h px� 
U
-Analyzing %s Unisim elements for replacement
17*netlist2
226Z29-17h px� 
X
2Unisim Transformation completed in %s CPU seconds
28*netlist2
0Z29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0012

1681.8012
0.000Z17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2Y
W  A total of 1 instances were transformed.
  IOBUF => IOBUF (IBUF, OBUFT): 1 instance 
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

94424a73Z4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
402
1202
02
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:00:532

00:00:572

1681.8012

1337.074Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0062

1681.8012
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2Q
OC:/Users/Amr/Downloads/Wang/sdcard/ex/Nexys4-ReadFile.runs/synth_1/fpga_top.dcpZ17-1381h px� 
�
Executing command : %s
56330*	planAhead2[
Yreport_utilization -file fpga_top_utilization_synth.rpt -pb fpga_top_utilization_synth.pbZ12-24828h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Mon Apr  7 02:00:22 2025Z17-206h px� 


End Record