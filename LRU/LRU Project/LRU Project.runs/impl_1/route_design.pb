
?
Command: %s
53*	vivadotcl2
route_designZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
Implementation2

xc7a100tZ17-347h px� 
p
0Got license for feature '%s' and/or device '%s'
310*common2
Implementation2

xc7a100tZ17-349h px� 
D

Starting %s Task
103*constraints2	
RoutingZ18-103h px� 
k
BMultithreading enabled for route_design using a maximum of %s CPUs17*	routeflow2
2Z35-254h px� 
L

Phase %s%s
101*constraints2
1 2
Build RT DesignZ18-101h px� 
I
%s*common20
.Phase 1 Build RT Design | Checksum: 2bc030455
h px� 


%s
*constraints2_
]Time (s): cpu = 00:00:22 ; elapsed = 00:00:17 . Memory (MB): peak = 2199.141 ; gain = 132.945h px� 
R

Phase %s%s
101*constraints2
2 2
Router InitializationZ18-101h px� 
W

Phase %s%s
101*constraints2
2.1 2
Fix Topology ConstraintsZ18-101h px� 
T
%s*common2;
9Phase 2.1 Fix Topology Constraints | Checksum: 2bc030455
h px� 


%s
*constraints2_
]Time (s): cpu = 00:00:22 ; elapsed = 00:00:17 . Memory (MB): peak = 2199.141 ; gain = 132.945h px� 
P

Phase %s%s
101*constraints2
2.2 2
Pre Route CleanupZ18-101h px� 
M
%s*common24
2Phase 2.2 Pre Route Cleanup | Checksum: 2bc030455
h px� 


%s
*constraints2_
]Time (s): cpu = 00:00:22 ; elapsed = 00:00:17 . Memory (MB): peak = 2199.141 ; gain = 132.945h px� 
L

Phase %s%s
101*constraints2
2.3 2
Update TimingZ18-101h px� 
I
%s*common20
.Phase 2.3 Update Timing | Checksum: 2ce2a5e6a
h px� 


%s
*constraints2_
]Time (s): cpu = 00:00:29 ; elapsed = 00:00:22 . Memory (MB): peak = 2271.535 ; gain = 205.340h px� 
{
Intermediate Timing Summary %s164*route2:
8| WNS=-2.660 | TNS=-5.232 | WHS=-1.359 | THS=-1166.314|
Z35-416h px� 
O
%s*common26
4Phase 2 Router Initialization | Checksum: 2264d7872
h px� 


%s
*constraints2_
]Time (s): cpu = 00:00:32 ; elapsed = 00:00:23 . Memory (MB): peak = 2365.805 ; gain = 299.609h px� 
K

Phase %s%s
101*constraints2
3 2
Global RoutingZ18-101h px� 
H
%s*common2/
-Phase 3 Global Routing | Checksum: 2264d7872
h px� 


%s
*constraints2_
]Time (s): cpu = 00:00:32 ; elapsed = 00:00:23 . Memory (MB): peak = 2365.805 ; gain = 299.609h px� 
L

Phase %s%s
101*constraints2
4 2
Initial RoutingZ18-101h px� 
W

Phase %s%s
101*constraints2
4.1 2
Initial Net Routing PassZ18-101h px� 
T
%s*common2;
9Phase 4.1 Initial Net Routing Pass | Checksum: 266dd657a
h px� 


%s
*constraints2_
]Time (s): cpu = 00:00:48 ; elapsed = 00:00:32 . Memory (MB): peak = 2390.656 ; gain = 324.461h px� 
I
%s*common20
.Phase 4 Initial Routing | Checksum: 266dd657a
h px� 


%s
*constraints2_
]Time (s): cpu = 00:00:48 ; elapsed = 00:00:32 . Memory (MB): peak = 2390.656 ; gain = 324.461h px� 
�	
>Design has %s pins with tight setup and hold constraints.

%s
244*route2
7072�
�The top 5 pins with tight setup and hold constraints:

+====================+===================+===============================================================+
| Launch Setup Clock | Launch Hold Clock | Pin                                                           |
+====================+===================+===============================================================+
| clk_pll_i          | clk_cpu_pll       | u_DirectLRU/FSM_sequential_lru_state_reg[0]/D                 |
| clk_pll_i          | clk_cpu_pll       | u_DirectLRU/FSM_sequential_lru_state_reg[1]/D                 |
| clk_cpu_pll        | clk_cpu_pll       | u_DirectLRU/FSM_sequential_lru_state_reg[2]/D                 |
| clk_cpu_pll        | clk_cpu_pll       | u_DirectLRU/u_MemController/mem_ex/rs_sync/flag_sync_reg[0]/D |
| clk_cpu_pll        | clk_cpu_pll       | u_DirectLRU/u_MemController/mem_ex/ws_sync/flag_sync_reg[0]/D |
+--------------------+-------------------+---------------------------------------------------------------+

File with complete list of pins: tight_setup_hold_pins.txt
Z35-580h px� 
O

Phase %s%s
101*constraints2
5 2
Rip-up And RerouteZ18-101h px� 
Q

Phase %s%s
101*constraints2
5.1 2
Global Iteration 0Z18-101h px� 
y
Intermediate Timing Summary %s164*route28
6| WNS=-2.818 | TNS=-98.870| WHS=N/A    | THS=N/A    |
Z35-416h px� 
�
�Congestion is preventing the router from routing all nets. The router will prioritize the successful completion of routing all nets over timing optimizations.177*routeZ35-447h px� 
N
%s*common25
3Phase 5.1 Global Iteration 0 | Checksum: 22952a03c
h px� 


%s
*constraints2_
]Time (s): cpu = 00:05:38 ; elapsed = 00:03:22 . Memory (MB): peak = 3056.688 ; gain = 990.492h px� 
Q

Phase %s%s
101*constraints2
5.2 2
Global Iteration 1Z18-101h px� 
y
Intermediate Timing Summary %s164*route28
6| WNS=-2.818 | TNS=-98.267| WHS=N/A    | THS=N/A    |
Z35-416h px� 
N
%s*common25
3Phase 5.2 Global Iteration 1 | Checksum: 2376a982e
h px� 


%s
*constraints2_
]Time (s): cpu = 00:06:26 ; elapsed = 00:03:52 . Memory (MB): peak = 3056.688 ; gain = 990.492h px� 
Q

Phase %s%s
101*constraints2
5.3 2
Global Iteration 2Z18-101h px� 
y
Intermediate Timing Summary %s164*route28
6| WNS=-2.818 | TNS=-98.282| WHS=N/A    | THS=N/A    |
Z35-416h px� 
N
%s*common25
3Phase 5.3 Global Iteration 2 | Checksum: 27c4fddf8
h px� 


%s
*constraints2_
]Time (s): cpu = 00:06:30 ; elapsed = 00:03:55 . Memory (MB): peak = 3056.688 ; gain = 990.492h px� 
L
%s*common23
1Phase 5 Rip-up And Reroute | Checksum: 27c4fddf8
h px� 


%s
*constraints2_
]Time (s): cpu = 00:06:30 ; elapsed = 00:03:55 . Memory (MB): peak = 3056.688 ; gain = 990.492h px� 
X

Phase %s%s
101*constraints2
6 2
Delay and Skew OptimizationZ18-101h px� 
L

Phase %s%s
101*constraints2
6.1 2
Delay CleanUpZ18-101h px� 
N

Phase %s%s
101*constraints2
6.1.1 2
Update TimingZ18-101h px� 
K
%s*common22
0Phase 6.1.1 Update Timing | Checksum: 1cada3776
h px� 


%s
*constraints2_
]Time (s): cpu = 00:06:31 ; elapsed = 00:03:55 . Memory (MB): peak = 3056.688 ; gain = 990.492h px� 
y
Intermediate Timing Summary %s164*route28
6| WNS=-2.818 | TNS=-92.176| WHS=N/A    | THS=N/A    |
Z35-416h px� 
I
%s*common20
.Phase 6.1 Delay CleanUp | Checksum: 25121e70d
h px� 


%s
*constraints2_
]Time (s): cpu = 00:06:33 ; elapsed = 00:03:57 . Memory (MB): peak = 3056.688 ; gain = 990.492h px� 
V

Phase %s%s
101*constraints2
6.2 2
Clock Skew OptimizationZ18-101h px� 
S
%s*common2:
8Phase 6.2 Clock Skew Optimization | Checksum: 25121e70d
h px� 


%s
*constraints2_
]Time (s): cpu = 00:06:33 ; elapsed = 00:03:57 . Memory (MB): peak = 3056.688 ; gain = 990.492h px� 
U
%s*common2<
:Phase 6 Delay and Skew Optimization | Checksum: 25121e70d
h px� 


%s
*constraints2_
]Time (s): cpu = 00:06:33 ; elapsed = 00:03:57 . Memory (MB): peak = 3056.688 ; gain = 990.492h px� 
J

Phase %s%s
101*constraints2
7 2
Post Hold FixZ18-101h px� 
L

Phase %s%s
101*constraints2
7.1 2
Hold Fix IterZ18-101h px� 
y
Intermediate Timing Summary %s164*route28
6| WNS=-2.818 | TNS=-73.148| WHS=-0.824 | THS=-4.816 |
Z35-416h px� 
I
%s*common20
.Phase 7.1 Hold Fix Iter | Checksum: 1e4a3bf9b
h px� 


%s
*constraints2_
]Time (s): cpu = 00:06:35 ; elapsed = 00:03:58 . Memory (MB): peak = 3056.688 ; gain = 990.492h px� 
^

Phase %s%s
101*constraints2
7.2 2!
Non Free Resource Hold Fix IterZ18-101h px� 
[
%s*common2B
@Phase 7.2 Non Free Resource Hold Fix Iter | Checksum: 213715721
h px� 


%s
*constraints2_
]Time (s): cpu = 00:06:35 ; elapsed = 00:03:58 . Memory (MB): peak = 3056.688 ; gain = 990.492h px� 
�
�The router encountered %s pins that are both setup-critical and hold-critical and tried to fix hold violations at the expense of setup slack. Such pins are:
%s201*route2
1812�
�	u_IO_Management/u_vga_demo/square_unit/numBuffer[100][306]_i_7/I3
	u_IO_Management/u_vga_demo/square_unit/numBuffer[101][308]_i_4/I4
	u_IO_Management/u_vga_demo/square_unit/numBuffer[64][320]_i_4/I2
	u_IO_Management/u_vga_demo/square_unit/numBuffer[47][314]_i_8/I2
	u_IO_Management/u_vga_demo/square_unit/numBuffer[37][317]_i_4/I3
	u_IO_Management/u_vga_demo/square_unit/numBuffer[48][313]_i_7/I0
	u_IO_Management/u_vga_demo/square_unit/numBuffer[48][313]_i_7/I1
	u_IO_Management/u_vga_demo/square_unit/numBuffer[47][314]_i_8/I3
	u_IO_Management/u_vga_demo/square_unit/numBuffer[47][314]_i_8/I1
	u_IO_Management/u_vga_demo/square_unit/numBuffer[48][313]_i_7/I2
	.. and 171 more pins.
Z35-468h px� 
G
%s*common2.
,Phase 7 Post Hold Fix | Checksum: 213715721
h px� 


%s
*constraints2_
]Time (s): cpu = 00:06:35 ; elapsed = 00:03:58 . Memory (MB): peak = 3056.688 ; gain = 990.492h px� 
K

Phase %s%s
101*constraints2
8 2
Route finalizeZ18-101h px� 
H
%s*common2/
-Phase 8 Route finalize | Checksum: 213715721
h px� 


%s
*constraints2_
]Time (s): cpu = 00:06:35 ; elapsed = 00:03:58 . Memory (MB): peak = 3056.688 ; gain = 990.492h px� 
R

Phase %s%s
101*constraints2
9 2
Verifying routed netsZ18-101h px� 
O
%s*common26
4Phase 9 Verifying routed nets | Checksum: 213715721
h px� 


%s
*constraints2_
]Time (s): cpu = 00:06:35 ; elapsed = 00:03:58 . Memory (MB): peak = 3056.688 ; gain = 990.492h px� 
O

Phase %s%s
101*constraints2
10 2
Depositing RoutesZ18-101h px� 
L
%s*common23
1Phase 10 Depositing Routes | Checksum: 2377721a8
h px� 


%s
*constraints2_
]Time (s): cpu = 00:06:37 ; elapsed = 00:03:59 . Memory (MB): peak = 3056.688 ; gain = 990.492h px� 
R

Phase %s%s
101*constraints2
11 2
Post Process RoutingZ18-101h px� 
O
%s*common26
4Phase 11 Post Process Routing | Checksum: 2377721a8
h px� 


%s
*constraints2_
]Time (s): cpu = 00:06:37 ; elapsed = 00:03:59 . Memory (MB): peak = 3056.688 ; gain = 990.492h px� 
P

Phase %s%s
101*constraints2
12 2
Post Router TimingZ18-101h px� 
M

Phase %s%s
101*constraints2
12.1 2
Update TimingZ18-101h px� 
J
%s*common21
/Phase 12.1 Update Timing | Checksum: 2377721a8
h px� 


%s
*constraints2_
]Time (s): cpu = 00:06:38 ; elapsed = 00:04:00 . Memory (MB): peak = 3056.688 ; gain = 990.492h px� 
u
Estimated Timing Summary %s
57*route28
6| WNS=-2.818 | TNS=-74.037| WHS=0.051  | THS=0.000  |
Z35-57h px� 
B
!Router estimated timing not met.
128*routeZ35-328h px� 
M
%s*common24
2Phase 12 Post Router Timing | Checksum: 2377721a8
h px� 


%s
*constraints2_
]Time (s): cpu = 00:06:38 ; elapsed = 00:04:00 . Memory (MB): peak = 3056.688 ; gain = 990.492h px� 
Y

Phase %s%s
101*constraints2
13 2
Post-Route Event ProcessingZ18-101h px� 
V
%s*common2=
;Phase 13 Post-Route Event Processing | Checksum: 10834b90c
h px� 


%s
*constraints2_
]Time (s): cpu = 00:06:39 ; elapsed = 00:04:00 . Memory (MB): peak = 3056.688 ; gain = 990.492h px� 
@
Router Completed Successfully
2*	routeflowZ35-16h px� 
E
%s*common2,
*Ending Routing Task | Checksum: 10834b90c
h px� 


%s
*constraints2_
]Time (s): cpu = 00:06:39 ; elapsed = 00:04:00 . Memory (MB): peak = 3056.688 ; gain = 990.492h px� 
H
Releasing license: %s
83*common2
ImplementationZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1072
782
142
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
route_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
route_design: 2

00:06:392

00:04:002

3056.6882	
990.492Z17-268h px� 
�
Executing command : %s
56330*	planAhead2b
`report_drc -file supertop_drc_routed.rpt -pb supertop_drc_routed.pb -rpx supertop_drc_routed.rpxZ12-24828h px� 
�
Command: %s
53*	vivadotcl2b
`report_drc -file supertop_drc_routed.rpt -pb supertop_drc_routed.pb -rpx supertop_drc_routed.rpxZ4-113h px� 
>
IP Catalog is up to date.1232*coregenZ19-1839h px� 
>
Running DRC with %s threads
24*drc2
2Z23-27h px� 
�
#The results of DRC are in file %s.
586*	vivadotcl2�
oC:/Users/aam08331/Documents/GitHub/4280-Group12/LRU/LRU Project/LRU Project.runs/impl_1/supertop_drc_routed.rptoC:/Users/aam08331/Documents/GitHub/4280-Group12/LRU/LRU Project/LRU Project.runs/impl_1/supertop_drc_routed.rpt8Z2-168h px� 
J
%s completed successfully
29*	vivadotcl2

report_drcZ4-42h px� 
�
Executing command : %s
56330*	planAhead2�
�report_methodology -file supertop_methodology_drc_routed.rpt -pb supertop_methodology_drc_routed.pb -rpx supertop_methodology_drc_routed.rpxZ12-24828h px� 
�
Command: %s
53*	vivadotcl2�
�report_methodology -file supertop_methodology_drc_routed.rpt -pb supertop_methodology_drc_routed.pb -rpx supertop_methodology_drc_routed.rpxZ4-113h px� 
�
�%s: no pin(s)/port(s)/net(s) specified as objects, only virtual clock '%s' will be created. If you don't want this, please specify pin(s)/ports(s)/net(s) as objects to the command.
483*constraints2
create_clock2
tck2u
qC:/Users/aam08331/Documents/GitHub/4280-Group12/LRU/LRU Project/LRU Project.srcs/constrs_1/new/mfp_nexys4_ddr.xdc2
2668@Z18-483h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
G
$Running Methodology with %s threads
74*drc2
2Z23-133h px� 
�
2The results of Report Methodology are in file %s.
609*	vivadotcl2�
{C:/Users/aam08331/Documents/GitHub/4280-Group12/LRU/LRU Project/LRU Project.runs/impl_1/supertop_methodology_drc_routed.rpt{C:/Users/aam08331/Documents/GitHub/4280-Group12/LRU/LRU Project/LRU Project.runs/impl_1/supertop_methodology_drc_routed.rpt8Z2-1520h px� 
R
%s completed successfully
29*	vivadotcl2
report_methodologyZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
report_drc: 2

00:00:122

00:00:072

3056.6882
0.000Z17-268h px� 
�
Executing command : %s
56330*	planAhead2�
�report_timing_summary -max_paths 10 -file supertop_timing_summary_routed.rpt -pb supertop_timing_summary_routed.pb -rpx supertop_timing_summary_routed.rpx -warn_on_violation Z12-24828h px� 
�
�%s: no pin(s)/port(s)/net(s) specified as objects, only virtual clock '%s' will be created. If you don't want this, please specify pin(s)/ports(s)/net(s) as objects to the command.
483*constraints2
create_clock2
tck2u
qC:/Users/aam08331/Documents/GitHub/4280-Group12/LRU/LRU Project/LRU Project.srcs/constrs_1/new/mfp_nexys4_ddr.xdc2
2668@Z18-483h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
`
UpdateTimingParams:%s.
91*timing2'
% Speed grade: -1, Delay Type: min_maxZ38-91h px� 
j
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
2Z38-191h px� 
�
rThe design failed to meet the timing requirements. Please see the %s report for details on the timing violations.
188*timing2
timing summaryZ38-282h px� 
�
)Running report commands "%s" in parallel.56334*	planAhead2/
-report_incremental_reuse, report_route_statusZ12-24838h px� 
Y
+Running report generation with %s threads.
56333*	planAhead2
2Z12-24831h px� 
�
Executing command : %s
56330*	planAhead2F
Dreport_incremental_reuse -file supertop_incremental_reuse_routed.rptZ12-24828h px� 
g
BIncremental flow is disabled. No incremental reuse Info to report.423*	vivadotclZ4-1062h px� 
�
Executing command : %s
56330*	planAhead2R
Preport_route_status -file supertop_route_status.rpt -pb supertop_route_status.pbZ12-24828h px� 
�
Executing command : %s
56330*	planAhead2r
preport_power -file supertop_power_routed.rpt -pb supertop_power_summary_routed.pb -rpx supertop_power_routed.rpxZ12-24828h px� 
�
Command: %s
53*	vivadotcl2r
preport_power -file supertop_power_routed.rpt -pb supertop_power_summary_routed.pb -rpx supertop_power_routed.rpxZ4-113h px� 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px� 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1262
782
152
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
report_powerZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
report_power: 2

00:00:122

00:00:082

3056.6882
0.000Z17-268h px� 
�
Executing command : %s
56330*	planAhead2F
Dreport_clock_utilization -file supertop_clock_utilization_routed.rptZ12-24828h px� 
�
Executing command : %s
56330*	planAhead2�
�report_bus_skew -warn_on_violation -file supertop_bus_skew_routed.rpt -pb supertop_bus_skew_routed.pb -rpx supertop_bus_skew_routed.rpxZ12-24828h px� 
`
UpdateTimingParams:%s.
91*timing2'
% Speed grade: -1, Delay Type: min_maxZ38-91h px� 
j
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
2Z38-191h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
generate_parallel_reports: 2

00:00:342

00:00:222

3056.6882
0.000Z17-268h px� 
H
&Writing timing data to binary archive.266*timingZ38-480h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:012
00:00:00.0432

3056.6882
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote PlaceDB: 2

00:00:032

00:00:012

3056.6882
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote PulsedLatchDB: 2

00:00:002

00:00:002

3056.6882
0.000Z17-268h px� 
=
Writing XDEF routing.
211*designutilsZ20-211h px� 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px� 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote RouteStorage: 2

00:00:002
00:00:00.1892

3056.6882
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote Netlist Cache: 2

00:00:002
00:00:00.0282

3056.6882
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote Device Cache: 2

00:00:002
00:00:00.0032

3056.6882
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write Physdb Complete: 2

00:00:032

00:00:022

3056.6882
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2m
kC:/Users/aam08331/Documents/GitHub/4280-Group12/LRU/LRU Project/LRU Project.runs/impl_1/supertop_routed.dcpZ17-1381h px� 


End Record