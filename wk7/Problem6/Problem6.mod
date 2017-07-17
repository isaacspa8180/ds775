/*********************************************
 * OPL 12.7.0.0 Model
 * Author: paidellguest
 * Creation Date: Jul 7, 2017 at 8:37:51 PM
 *********************************************/
using CP;

int n = 5;
int M = 1000;

// I transposed the original multi-dimensional array.
int c[1..n][1..n] =
[[13, 15, 5, 8, 0],
[16, 13, 7, 5, 0],
[12, 20, M, 9, 0],
[11, 15, 10, 11, 0],
[15, 14, 6, 4, 0]];

range R =  1..5;
dvar int x[R] in R;

minimize 

sum(r in R) c[x[r]][r];


subject to {
	allDifferent(x);
}