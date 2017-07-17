/*********************************************
 * OPL 12.7.0.0 Model
 * Author: paisurfaceguest
 * Creation Date: Jun 29, 2017 at 9:38:32 PM
 *********************************************/
 

 using CP;
 
 int n = 7;
 int M = 1000;
 int c[1..n][1..n] = 
 [ [ 0, 12, 10,  M,  M,  M, 12],
   [12,  0,  8, 12,  M,  M,  M],
   [10,  8,  0, 11,  3,  M,  9],
   [ M, 12, 11,  0, 11, 10,  M],
   [ M,  M,  3, 11,  0,  6,  7],
   [ M,  M,  M, 10,  6,  0,  9],
   [12,  M,  9,  M,  7,  9,  0]];
   
  range R = 2..n;
  dvar int x[R] in R;
  
  minimize 
//	  c[1][x[2]] +
//	  c[x[2]][x[3]] +
//	  c[x[3]][x[4]] +
//	  c[x[4]][x[5]] +
//	  c[x[5]][x[6]] +
//	  c[x[6]][x[7]] +
//	  c[x[7]][1];
	  
	  c[1][x[2]] +
	  sum(r in 2..n-1) c[x[r]][x[r + 1]] +
	  c[x[n]][1];
  
  subject to {
  
  	allDifferent(x);  
  	
  }
  
  
 