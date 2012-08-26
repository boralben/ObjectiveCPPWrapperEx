//
//  DummyModelWrapper.h
//  
//
//  Created by Ben Boral on 8/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

//DummyModelWrapper is an objective-c++ wrapper for the C++
//data model in this project, called DummyModel

#import <Foundation/Foundation.h>

@interface DummyModelWrapper : NSObject



//Wrapper for: addTwoThings
-(int)addThis: (int) firstInteger ToThis:(int) secondInteger;
//Wrapper for: multByPiThenDivide
-(double)piTimes:(double) firstDouble DividedBy:(double) secondDouble;
//Wrapper for: chooseBiggest
-(int)findBiggerNumberBetweenThis:(int)firstInteger AndThat:(int)secondInteger;


@end
