#  Prototype Model
# (Units mm, N, MPa)
# Needhi K Singh
set number 1;
set name [concat Outputs/Data_$number]
file mkdir $name; # create data directory
set LastNode 104;
# Create ModelBuilder 
model  BasicBuilder  -ndm  2  -ndf  3 

#     Node	xCrd	  yCrd
node	101	  0	      0
			
node	102	  0	      3429                   
node	1021	0	      3200.4
node	1022	152.4	  3429
node	1023	0	      3657.6	
			
node	103	  0	      7086.6
node	1031	0	      6858
node	1032	152.4	  7086.6
node	1033	0	      7315.2			
			
node	104 	0	      10744.2
node	1041	0	      10515.6
node	1042	152.4	  10744.2						
			
node	105	  5486.4	0
			
node	106	  5486.4	3429
node	1061	5486.4	3200.4
node	1062	5638.8	3429
node	1063	5486.4	3657.6
node	1064	5334	  3429
			
node	107	  5486.4	7086.6
node	1071	5486.4	6858
node	1072	5638.8	7086.6
node	1073	5486.4	7315.2
node	1074	5334	  7086.6
			
node	108	  5486.4	10744.2
node	1081	5486.4	10515.6
node	1082	5638.8	10744.2			
node	1084	5334	  10744.2
			
node	109	  10972.8	0
			
node	110	  10972.8	3429
node	1101	10972.8	3200.4
node	1102	11125.2	3429
node	1103	10972.8	3657.6
node	1104	10820.4	3429
			
node	111	  10972.8	7086.6
node	1111	10972.8	6858
node	1112	11125.2	7086.6
node	1113	10972.8	7315.2
node	1114	10820.4	7086.6
			
node	112	  10972.8	10744.2
node	1121	10972.8	10515.6
node	1122	11125.2	10744.2			
node	1124	10820.4	10744.2
			
node	113	  16459.2	0
			
node	114	  16459.2	3429
node	1141	16459.2	3200.4			
node	1143	16459.2	3657.6
node	1144	16306.8	3429
			
node	115	  16459.2	7086.6
node	1151	16459.2	6858			
node	1153	16459.2	7315.2
node	1154	16306.8	7086.6
			
node	116	  16459.2	10744.2
node	1161	16459.2	10515.6						
node	1164	16306.8	10744.2

# Define Single Point Constraints 
# SPC tag Dx Dy Rz 
fix	101	1	1	1
fix	105	1	1	1
fix	109	1	1	1
fix	113	1	1	1

# Define nodal masses 
# Node	tag	    mx	    my   mIz
mass	  102    13.77	  13.77 	0
mass	  103	  13.77	  13.77	  0
mass	  104	  13.77	  13.77	  0
mass	  106	  13.77	  13.77	  0
mass	  107	  13.77	  13.77	  0
mass	  108	  13.77	  13.77	  0
mass	  110	  13.77	  13.77	  0
mass	  111	  13.77	  13.77	  0
mass	  112	  13.77	  13.77	  0
mass	  114	  13.77	  13.77	  0
mass	  115	  13.77	  13.77	  0
mass	  116	  13.77	  13.77	  0
   
#####################################################################################################################################################################################################							   
# Define materials

# Material  Concrete02        matTag     fc'     epsc0    fcu'   epsu   lambda     ft     Ets 
uniaxialMaterial  Concrete02   	2  	   -24.81  -0.0025   -7.44  -0.05    0.05      0.0    0.5
uniaxialMaterial  Concrete02   	3  	   -30.13  -0.0021   -9.04  -0.05    0.05      0.0    0.5
uniaxialMaterial  Concrete02   	4  	   -31.58  -0.0029  -11.15  -0.05    0.05      0.0    0.5
uniaxialMaterial  Concrete02   	5  	   -34.60  -0.0022   -6.50  -0.05    0.05      0.0    0.5

uniaxialMaterial  Concrete02   	6  	   -27.68  -0.00235  -6.53  -0.05    0.05      0.0    0.5


# Material   Steel02          matTag     Fy    	   E    	  b    	   R0    cR1   cR2   <a1 	a2   a3  a4>  <sig0> 
uniaxialMaterial  Steel02       10  	 276.00   214080.4   0.004175  18.5  0.925  0.15  0.0  1.0  0.0  1.0   0.0 
# Material   Steel01          matTag     Fy 	     E  		  b    	   a1   a2   a3   a4 
uniaxialMaterial  Steel01      	11  	 276.00   214080.4   0.003     0.0  1.0  0.0  1.0
uniaxialMaterial  Steel01       12  	 276.00   214080.4   0.003     0.0  1.0  0.0  1.0 


# Material Hysteretic         matTag     s1p     e1p     s2p     e2p    	s1n    	 e1n 	   	 s2n    	e2n   pinchX   pinchY 	damage1 	damage2		 <$beta>                               
uniaxialMaterial  Hysteretic    20 		 276.00  0.00129  364.23	 0.100  373.16  0.11 	-276.00  -0.00129  -364.23  -0.100	-373.16  -0.11	 0.0	   0.0	     0		     0    		  0
uniaxialMaterial  Hysteretic    21 		 276.00  0.00129  339.40	 0.100	345.82  0.11   -276.00  -0.00129  -339.40	-0.100	-345.82  -0.11  0.4	   0.6	     0	       0 		      0.8
uniaxialMaterial  Hysteretic    22 		 276.00  0.00129  339.40	 0.100	345.82  0.11   -276.00  -0.00129  -339.40	-0.100	-345.82  -0.11  0.2	   0.6	     0	       0 		      0
uniaxialMaterial  Hysteretic    23 		 276.00  0.00129  339.40	 0.100	345.82  0.11   -276.00  -0.00129  -339.40	-0.100	-345.82  -0.11  0.0	   0.6	     0	       0 		      0
uniaxialMaterial  Hysteretic    24 		 276.00  0.00129  339.40	 0.100	345.82  0.11   -276.00  -0.00129  -339.40	-0.100	-345.82  -0.11	 0.0	   0.3	     0		     0    		  0

#####################################################################################################################################################################################################							   

# Define section(s) 
						
#	Section	             secTag											
section	Fiber	           2	{										
	  patch	quad	      6	  120	     1    	-152.4	-152.4	 152.4	-152.4	152.4	152.4	-152.4	152.4
	  layer	straight	  23	 2	   283.87	   114.3	 114.3	 114.3	-114.3	
	  layer	straight	  23	 2	   283.87	  -114.3	 114.3	-114.3	-114.3	
}								

#	Section	            secTag											
section	Fiber	           3	{										
	  patch	quad	      6	  120   	1	      -228.6	-114.3	228.6	-114.3	228.6	 114.3	-228.6 	 114.3
	  patch	quad	      6	  40	    1	       76.2	   114.3	228.6	 114.3	228.6	 1828.8	 76.2	   1828.8
	  patch	quad	      6	  40	    1	       76.2	  -1828.8	228.6	-1828.8	228.6	-114.3	 76.2	  -114.3

	  layer	straight	  23	 3    	283.87	190.5	76.2	190.5	-76.2				
	  layer	straight	  23	 2	    141.94	-190.5	76.2	-190.5	-76.2				
													
	  layer	straight	  20	 8	    70.97	  190.5	 1798.8	190.5	 144.3				
	  layer	straight	  20	 8	    70.97	  190.5	-144.3	190.5	-1798.8				
	  layer	straight	  20	 8	    35.48	  114.3	 1798.8	114.3	 144.3				
	  layer	straight	  20	 8	    35.48	  114.3	-144.3	114.3	-1798.8				
}													

#	Section	            secTag											
section	Fiber	           4	{										
	  patch	quad	      6	  120   	1	      -228.6	-114.3	228.6	-114.3	228.6	 114.3	-228.6 	 114.3
	  patch	quad	      6	  40	    1	       76.2	   114.3	228.6	 114.3	228.6	 1828.8	 76.2	   1828.8
	  patch	quad	      6	  40	    1	       76.2	  -1828.8	228.6	-1828.8	228.6	-114.3	 76.2	  -114.3

	  layer	straight	  24	 2    	283.87	190.5	76.2	190.5	-76.2				
	  layer	straight	  23	 2	    141.94	-190.5	76.2	-190.5	-76.2				
													
	  layer	straight	  20	 8	    70.97	  190.5	 1798.8	190.5	 144.3				
	  layer	straight	  20	 8	    70.97	  190.5	-144.3	190.5	-1798.8				
	  layer	straight	  20	 8	    35.48	  114.3	 1798.8	114.3	 144.3				
	  layer	straight	  20	 8	    35.48	  114.3	-144.3	114.3	-1798.8				
}													
#####################################################################################################################################################################################################							      

# Define geometric transformation(s) 
# GeoTran    type    tag 
geomTransf  Linear       1 
geomTransf  PDelta       2 

set Econc_el  24178;   
set Acolumns  92880;
set Abeams    627093;

set IzBeams   425250572.6	;	

# Define element(s) 
# Element 				    eleTag   NodeI NodeJ  secTagI  	Lpi   secTagJ    Lpj     E           A    	     Iz    		geoTranTag    <-mass massDens>    <-iter maxIters tol> 
# Columns
element  beamWithHinges   1     101  1021     2     192.024    2    192.024 $Econc_el  $Acolumns   305874278.97  	1  		-mass +0.000000E+000  -iter   25  +1.000000E-008 
element  beamWithHinges   2     105  1061     2     192.024    2    192.024 $Econc_el  $Acolumns   381202475.60  	1  		-mass +0.000000E+000  -iter   25  +1.000000E-008 
element  beamWithHinges   3     109  1101     2     192.024    2    192.024 $Econc_el  $Acolumns   381202475.60  	1  		-mass +0.000000E+000  -iter   25  +1.000000E-008 
element  beamWithHinges   4     113  1141     2     192.024    2    192.024 $Econc_el  $Acolumns   305874278.97  	1  		-mass +0.000000E+000  -iter   25  +1.000000E-008 

element  beamWithHinges   5     1023 1031     2     192.024    2    192.024 $Econc_el  $Acolumns   283830488.14  	1  		-mass +0.000000E+000  -iter   25  +1.000000E-008 
element  beamWithHinges   6     1063 1071     2     192.024    2    192.024 $Econc_el  $Acolumns   336029788.41  	1  		-mass +0.000000E+000  -iter   25  +1.000000E-008 
element  beamWithHinges   7     1103 1111     2     192.024    2    192.024 $Econc_el  $Acolumns   336029788.41  	1  		-mass +0.000000E+000  -iter   25  +1.000000E-008 
element  beamWithHinges   8     1143 1151     2     192.024    2    192.024 $Econc_el  $Acolumns   283830488.14  	1  		-mass +0.000000E+000  -iter   25  +1.000000E-008 

element  beamWithHinges   9     1033 1041     2     192.024    2    192.024 $Econc_el  $Acolumns   258044546.66  	1  		-mass +0.000000E+000  -iter   25  +1.000000E-008 
element  beamWithHinges  10     1073 1081     2     192.024    2    192.024 $Econc_el  $Acolumns   293582234.48   1  		-mass +0.000000E+000  -iter   25  +1.000000E-008 
element  beamWithHinges  11     1113 1121     2     192.024    2    192.024 $Econc_el  $Acolumns   293582234.48   1  		-mass +0.000000E+000  -iter   25  +1.000000E-008 
element  beamWithHinges  12     1153 1161     2     192.024    2    192.024 $Econc_el  $Acolumns   258044546.66   1  		-mass +0.000000E+000  -iter   25  +1.000000E-008 
# Beams
element  beamWithHinges  13     1022 1064     4     283.464    3    283.464 $Econc_el  $Abeams     $IzBeams       	1  		-mass +0.000000E+000  -iter   25  +1.000000E-008 
element  beamWithHinges  14     1062 1104     3     283.464    3    283.464 $Econc_el  $Abeams     $IzBeams       	1  		-mass +0.000000E+000  -iter   25  +1.000000E-008 
element  beamWithHinges  15     1102 1144     3     283.464    4    283.464 $Econc_el  $Abeams     $IzBeams       	1  		-mass +0.000000E+000  -iter   25  +1.000000E-008 

element  beamWithHinges  16     1032 1074     4     283.464    3    283.464 $Econc_el  $Abeams     $IzBeams       	1  		-mass +0.000000E+000  -iter   25  +1.000000E-008 
element  beamWithHinges  17     1072 1114     3     283.464    3    283.464 $Econc_el  $Abeams     $IzBeams       	1  		-mass +0.000000E+000  -iter   25  +1.000000E-008 
element  beamWithHinges  18     1112 1154     3     283.464    4    283.464 $Econc_el  $Abeams     $IzBeams       	1  		-mass +0.000000E+000  -iter   25  +1.000000E-008 

element  beamWithHinges  19     1042 1084     4     283.464    3    283.464 $Econc_el  $Abeams     $IzBeams       	1  		-mass +0.000000E+000  -iter   25  +1.000000E-008 
element  beamWithHinges  20     1082 1124     3     283.464    3    283.464 $Econc_el  $Abeams     $IzBeams       	1  		-mass +0.000000E+000  -iter   25  +1.000000E-008 
element  beamWithHinges  21     1122 1164     3     283.464    4    283.464 $Econc_el  $Abeams     $IzBeams       	1  		-mass +0.000000E+000  -iter   25  +1.000000E-008 



set ARigid   1.00E+09;
set ERigid   34000;
set IzRigid  1.00E+15;

# Element		             eleTag	NodeI	NodeJ	   A	      E	    Iz	   geoTranTag	<alpha d> <-mass massDens>
# Rigid
element	elasticBeamColumn	1021	1021	102	  $ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0
element	elasticBeamColumn	1022	102	  1022	$ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0
element	elasticBeamColumn	1023	102	  1023	$ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0

element	elasticBeamColumn	1031	1031	103	  $ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0
element	elasticBeamColumn	1032	103	  1032	$ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0
element	elasticBeamColumn	1033	103	  1033	$ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0
									
element	elasticBeamColumn	1041	1041	104	  $ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0
element	elasticBeamColumn	1042	104	  1042	$ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0
									
element	elasticBeamColumn	1061	1061	106	  $ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0
element	elasticBeamColumn	1062	106	  1062	$ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0
element	elasticBeamColumn	1063	106	  1063	$ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0
element	elasticBeamColumn	1064	1064	106	  $ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0

element	elasticBeamColumn	1071	1071	107	  $ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0
element	elasticBeamColumn	1072	107	  1072	$ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0
element	elasticBeamColumn	1073	107	  1073	$ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0
element	elasticBeamColumn	1074	1074	107	  $ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0
									
element	elasticBeamColumn	1081	1081	108	  $ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0
element	elasticBeamColumn	1082	108	  1082	$ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0
element	elasticBeamColumn	1084	1084	108	  $ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0

element	elasticBeamColumn	1101	1101	110	  $ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0
element	elasticBeamColumn	1102	110	  1102	$ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0
element	elasticBeamColumn	1103	110	  1103	$ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0
element	elasticBeamColumn	1104	1104	110	  $ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0

element	elasticBeamColumn	1111	1111	111	  $ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0
element	elasticBeamColumn	1112	111	  1112	$ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0
element	elasticBeamColumn	1113	111	  1113	$ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0
element	elasticBeamColumn	1114	1114	111	  $ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0

element	elasticBeamColumn	1121	1121	112	  $ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0
element	elasticBeamColumn	1122	112	  1122	$ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0
element	elasticBeamColumn	1124	1124	112	  $ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0
									
element	elasticBeamColumn	1141	1141	114	  $ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0
element	elasticBeamColumn	1143	114	  1143	$ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0
element	elasticBeamColumn	1144	1144	114	  $ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0
									
element	elasticBeamColumn	1151	1151	115	  $ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0
element	elasticBeamColumn	1153	115	  1153	$ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0
element	elasticBeamColumn	1154	1154	115	  $ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0
									
element	elasticBeamColumn	1161	1161	116	  $ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0
element	elasticBeamColumn	1164	1164	116	  $ARigid $ERigid	$IzRigid	1	0.0     0.0        -mass     0.0

# ###############################################################################################################
# Recorders
# ##############################################################################################################
# Define RECORDERS -------------------------------------------------------------
recorder Node -file [concat $name/DFree_top.out] -time -node 104 108 112 116 -dof 1 disp;		# displacements of free nodes
recorder Node -file [concat $name/DFree_104_103_102.out] -time -node 104 103 102 -dof 1 disp;		# displacements of free nodes
recorder Node -file [concat $name/RBase_All.out] -time -node 101 105 109 113 -dof 1 2 3 reaction;

#####################################################################################################################################################################################################					           
# Define time series 
# TimeSeries "LinearDefault":     cFactor 
set  LinearDefault  "Linear  -factor  +1.0E+00"

# Start of anaysis generation 
# =========================== 

# Get Initial Stiffness 
initialize 

# Analysis: PushGrav 
# +++++++++++++++++++++ 

# Define load pattern 
# LoadPattern "Carichi_Vert":    patternTag    TimeSeries 
pattern  Plain       				         2  		 $LinearDefault  { 
     # eleLoad      eleTags    beamUniform        Wy    <Wx> 
    eleLoad  -ele      13  -type  -beamUniform  -32.82  0.00
    eleLoad  -ele      14  -type  -beamUniform  -32.82  0.00 
    eleLoad  -ele      15  -type  -beamUniform  -32.82  0.00 
    
    eleLoad  -ele      16  -type  -beamUniform  -32.82  0.00
    eleLoad  -ele      17  -type  -beamUniform  -32.82  0.00
    eleLoad  -ele      18  -type  -beamUniform  -32.82  0.00
    
    eleLoad  -ele      19  -type  -beamUniform  -32.82  0.00
    eleLoad  -ele      20  -type  -beamUniform  -32.82  0.00
    eleLoad  -ele      21  -type  -beamUniform  -32.82  0.00
} 

# Constraint Handler 
constraints  Plain 
# Convergence Test 
test  NormDispIncr  +1.000000E-006   100     
# Integrator 
integrator  LoadControl  +0.1 
# Solution Algorithm 
algorithm  Newton 
set NstepGravity 10;  		# apply gravity in 10 steps
# DOF Numberer 
numberer  RCM 
# System of Equations 
system  ProfileSPD 
# Analysis Type 
analysis  Static 

analyze     $NstepGravity

# Reset for next analysis case 
loadConst -time 0.0 


puts "Model Built"

# STATIC PUSHOVER ANALYSIS --------------------------------------------------------------------------------------------------
set IDctrlNode $LastNode;			# node where displacement is read for displacement control
set IDctrlDOF 1;			# degree of freedom of displacement read for displacement control
set Hbldg [expr 423.0*25.4];   #Total ht of bldg
set Dmax [expr 0.04*$Hbldg];		# maximum displacement of pushover. push to 10% drift.
set Dincr [expr 0.0001*$Hbldg];		# displacement increment for pushover. you want this to be very small, but not too small to slow down the analysis

# create load pattern for lateral pushover load - Total gravity load of bldg
# set Hload 363.01;				# define the lateral load as a proportion of the weight so that the pseudo time equals the lateral-load coefficient when using linear load pattern

# define load pattern -- generalized

pattern Plain 200 Linear {
	  load     102     +78402.57  +0.0  +0.0 
      load     103     +180570.48  +0.0  +0.0 
      load     104     +245008.05   +0.0  +0.0 
}


constraints Plain;# Plain Constraints -- Removes constrained degrees of freedom from the system of equations (only for homogeneous equations)		
numberer Plain; #Plain -- Uses the numbering provided by the user
system BandGeneral; #BandGeneral -- Direct solver for banded unsymmetric matrices



set Tol 1.e-6;                        # Convergence Test: tolerance
set maxNumIter 1000;                # Convergence Test: maximum number of iterations that will be performed before "failure to converge" is returned
set printFlag 0;                # Convergence Test: flag used to print information on convergence (optional)        # 1: print information on each step; 
set TestType EnergyIncr ;	# Convergence-test type #          EnergyIncr-- Specifies a tolerance on the inner product of the unbalanced load and displacement increments at the current iteration 
test $TestType $Tol $maxNumIter $printFlag;

set algorithmType Newton
algorithm $algorithmType; #Newton -- Uses the tangent at the current iteration to iterate to convergence    
    
integrator DisplacementControl  $IDctrlNode   $IDctrlDOF $Dincr;#DisplacementControl -- Specifies the incremental displacement at a specified DOF in the domain 
analysis Static;#Static Analysis -- solves the KU=R problem, without the mass or damping matrices. 

#  ---------------------------------    perform Static Pushover Analysis
set Nsteps [expr int($Dmax/$Dincr)];        # number of pushover analysis steps
set ok [analyze $Nsteps];                # this will return zero if no convergence problems were encountered

# ---------------------------------- in case of convergence problems
if {$ok != 0} {      
# change some analysis parameters to achieve convergence
# performance is slower inside this loop
	set ok 0;
	set controlDisp 0.0;		# start from zero
	set D0 0.0;		# start from zero
	set Dstep [expr ($controlDisp-$D0)/($Dmax-$D0)]
	while {$Dstep < 1.0 && $ok == 0} {	
		set controlDisp [nodeDisp $IDctrlNode $IDctrlDOF ]
		puts "controlDisp is $controlDisp"
		
		set Dstep [expr ($controlDisp-$D0)/($Dmax-$D0)]
		puts "Dstep is $Dstep"
		set ok [analyze 1 ]
		if {$ok != 0} {
			puts "Trying Newton with Initial Tangent .."
			test NormDispIncr   $Tol 2000  0
			algorithm Newton -initial
			set ok [analyze 1 ]
			test $TestType $Tol $maxNumIter  0
			algorithm $algorithmType
		}
		if {$ok != 0} {
			puts "Trying Broyden .."
			algorithm Broyden 8
			set ok [analyze 1 ]
			algorithm $algorithmType
		}
		if {$ok != 0} {
			puts "Trying NewtonWithLineSearch .."
			algorithm NewtonLineSearch .8
			set ok [analyze 1 ]
			algorithm $algorithmType
		}
	}
	};      # end if ok !0

puts "Pushover Done. Control Disp=[nodeDisp $IDctrlNode $IDctrlDOF]"