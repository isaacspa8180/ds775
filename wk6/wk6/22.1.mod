/*********************************************
 * OPL 12.7.0.0 Model
 * Author: paisurfaceguest
 * Creation Date: Jul 5, 2017 at 6:16:05 PM
 *********************************************/
// --------------------------------------------------------------------------
// Licensed Materials - Property of IBM
//
// 5725-A06 5725-A29 5724-Y48 5724-Y49 5724-Y54 5724-Y55
// Copyright IBM Corporation 1998, 2013. All Rights Reserved.
//
// Note to U.S. Government Users Restricted Rights:
// Use, duplication or disclosure restricted by GSA ADP Schedule
// Contract with IBM Corp.
// --------------------------------------------------------------------------

/* ------------------------------------------------------------

Problem Description
-------------------

This is a basic problem that involves building a house. The masonry,
roofing, painting, etc.  must be scheduled. Some tasks must
necessarily take place before others, and these requirements are
expressed through precedence constraints.

------------------------------------------------------------ */

using CP;


dvar interval A size 2;
dvar interval B size 4;
dvar interval C size 10;
dvar interval D size 6;
dvar interval E size 4;
dvar interval F size 5;
dvar interval G size 7;
dvar interval H size 9;
dvar interval I size 7;
dvar interval J size 8;
dvar interval K size 4;
dvar interval L size 5;
dvar interval M size 2;
dvar interval N size 6;

//minimize startOf(A) + startOf(B) + startOf(C) + startOf(D) + startOf(E) + startOf(F) + startOf(G) + startOf(H) + startOf(I) + startOf(J) + startOf(K) + startOf(L) + startOf(M) + startOf(N); 

subject to {
  endBeforeStart(A, B);
  endBeforeStart(B, C);
  endBeforeStart(C, D);
  endBeforeStart(C, E);
  endBeforeStart(E, F);
  endBeforeStart(D, G);
  endBeforeStart(E, H);
  endBeforeStart(G, H);
  endBeforeStart(C, I);
  endBeforeStart(F, J);
  endBeforeStart(I, J);
  endBeforeStart(J, K);
  endBeforeStart(J, L);
  endBeforeStart(H, M);
  endBeforeStart(K, N);
  endBeforeStart(L, N);
}

execute {
  writeln("A : " + A.start   + ".." + A.end);
  writeln("B : " + B.start   + ".." + B.end);
  writeln("C : " + C.start   + ".." + C.end);
  writeln("D : " + D.start   + ".." + D.end);
  writeln("E : " + E.start   + ".." + E.end);
  writeln("F : " + F.start   + ".." + F.end);
  writeln("G : " + G.start   + ".." + G.end);
  writeln("H : " + H.start   + ".." + H.end);
  writeln("I : " + I.start   + ".." + I.end);
  writeln("J : " + J.start   + ".." + J.end);
  writeln("K : " + K.start   + ".." + K.end);
  writeln("L : " + L.start   + ".." + L.end);
  writeln("M : " + M.start   + ".." + M.end);
  writeln("N : " + N.start   + ".." + N.end);
  
  }
