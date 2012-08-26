//
//  DummyModel.h
//  
//
//  Created by Ben Boral on 8/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
/*This header file defines the business logic of our app.
 Written in C++. It is wrapped by Objective-C++ file
 named DummyModelWrapper. It's important for the C++ methods
 To be declared in this header, because I'll be accessing those
 methods from this file*/



using namespace std;

class DummyModel
{
    public:
        int addTwoThings(int, int);
        double multByPiThenDivide(double, double);
        int chooseBiggest(int, int);
};

