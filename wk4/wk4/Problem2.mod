/*********************************************
 * OPL 12.7.0.0 Model
 * Author: paidellguest
 * Creation Date: Jun 18, 2017 at 3:20:08 PM
 *********************************************/

dvar float+ x[1..2];
dvar boolean y[1..2];
float M = 1000000;

maximize 3000*x[1] + 5000*x[2];

subject to{
	ct1:
		x[1] <= M*y[1];

	ct2:
		x[2] <= M*y[2];
		
	ct3:
		y[1] + y[2] == 1;

	ct4:
		1*x[1] + 0*x[2] <= 4;
		
	ct5:
		0*x[1] + 2*x[2] <= 12;
		
	ct6:
		3*x[1] + 2*x[2] <= 18;				
		
	ct10:
		x[1] >= 0;	
	ct11:
		x[2] >= 0;	
}