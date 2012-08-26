//
//  DummyModel.cpp
//  
//
//  Created by Ben Boral on 8/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#include <iostream>

#include "DummyModel.h"

//for use of pi later
#include <math.h>
#define _USE_MATH_DEFINES



//adds the to arguments and returns them
int DummyModel::addTwoThings(int x, int y){
    return x+y;
}

//multiplies the first argument by pi
//then divides that value by the second argument
double DummyModel::multByPiThenDivide(double x, double y){
    return (x*M_PI)/y;
}

//returns the larger of two int arguments
int DummyModel::chooseBiggest(int x, int y) {
    if(x>=y){
        return x;
    }
    return y;
}