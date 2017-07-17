/*********************************************
 * OPL 12.7.0.0 Model
 * Author: paisurfaceguest
 * Creation Date: Jun 28, 2017 at 10:11:59 PM
 *********************************************/

//using CP;
//
//range R = 1..5;
//dvar int x[R] in 1..5;
//range Q = 1..5;
//float z1[Q] = [37.7, 43.4, 33.3, 29.2, 0];
//float z2[Q] = [32.9, 33.1, 28.5, 26.4, 0];
//float z3[Q] = [33.8, 42.2, 38.9, 29.6, 0];
//float z4[Q] = [37.0, 34.7, 30.4, 28.5, 0];
//float z5[Q] = [35.4, 41.8, 33.6, 31.1, 0];
//
//minimize 
//
//	z1[x[1]] +
//	z2[x[2]] +
//	z3[x[3]] +
//	z4[x[4]] +
//	z5[x[5]];	
//	
//subject to {
//	allDifferent(x);
//}

using CP;

range R = 1..5;
dvar int x[R] in R;
float z[R][R] = [[37.7, 43.4, 33.3, 29.2, 0],
				 [32.9, 33.1, 28.5, 26.4, 0],
				 [33.8, 42.2, 38.9, 29.6, 0],
				 [37.0, 34.7, 30.4, 28.5, 0],
				 [35.4, 41.8, 33.6, 31.1, 0]];

minimize 
	sum(r in R) z[r][x[r]];	
		
subject to {
	allDifferent(x);
}