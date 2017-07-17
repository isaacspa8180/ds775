/*********************************************
 * OPL 12.7.0.0 Model
 * Author: paisurfaceguest
 * Creation Date: Jun 28, 2017 at 9:32:27 PM
 *********************************************/

 using CP;
 
 //range i = 1..5;
 dvar int x[1..5];
 
 maximize 5*x[1] - x[1]^2 + 8*x[2] - x[2]^2 + 10*x[3] 
 			- x[3]^2 + 15*x[4] - x[4]^2 + 20*x[5] - x[5]^2;
 
 subject to {
 	ct1:
 		allDifferent(x);
	ct2:
		x[1] + x[3] + x[4] <= 25;
	ct3:
		x[1] in {3, 6, 12};
	ct4:
		x[2] in {3, 6};
	ct5:
		x[3] in {3, 6, 9, 12};
	ct6:
		x[4] in {6, 12};
	ct7:
		x[5] in {9, 12, 15, 18};
  
 }