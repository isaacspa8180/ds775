/*********************************************
 * OPL 12.7.0.0 Model
 * Author: paidellguest
 * Creation Date: Jul 16, 2017 at 12:15:50 PM
 *********************************************/
range R = 1..2;
dvar float x[R];

maximize
  200*x[1] - 100*x[1]^2 + 300*x[2] - 100*x[2]^2;
  
subject to {

  x[1] + x[2] <= 2;

}
