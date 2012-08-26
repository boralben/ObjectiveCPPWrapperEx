//
//  DummyModelWrapper.m
//  
//
//  Created by Ben Boral on 8/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DummyModelWrapper.h"
#import "DummyModel.h"

@interface DummyModelWrapper ()
//C++ class from DummyModel.cpp
@property (nonatomic, assign) DummyModel *wrappedModel;
@end

@implementation DummyModelWrapper
@synthesize wrappedModel=_wrappedModel;

- (id)init
{
    self = [super init];
    if (self)
    {
        _wrappedModel = new DummyModel();
    }
    return self;
}
//Wrapper for: addTwoThings
-(int)addThis: (int) firstInteger ToThis:(int) secondInteger{
    return (int)self.wrappedModel->addTwoThings(firstInteger, secondInteger);
}
//Wrapper for: multByPiThenDivide
-(double)piTimes:(double) firstDouble DividedBy:(double) secondDouble{
    return (double)self.wrappedModel->multByPiThenDivide(firstDouble, secondDouble);
}
//Wrapper for: chooseBiggest
-(int)findBiggerNumberBetweenThis:(int)firstInteger AndThat:(int)secondInteger{
    return (int)self.wrappedModel->chooseBiggest(firstInteger, secondInteger);
}

- (void)dealloc
{
    delete _wrappedModel;
}


@end
