//
//  AnswerVC.m
//  
//
//  Created by Ben Boral on 8/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AnswerVC.h"

@interface AnswerVC ()

@end

@implementation AnswerVC
@synthesize equationLabel = _equationLabel;
@synthesize resultLabel = _resultLabel;
@synthesize equationContents = _equationContents;
@synthesize resultContents = _resultContents;

-(void)viewDidLoad{
    [super viewDidLoad];
    
    //we initialized the contents in ViewController's prepare for segue method
    //now that the view's been loaded, we can populate the labels
    self.equationLabel.text=self.equationContents;
    self.resultLabel.text=self.resultContents;
}

//pop back to ViewController
- (IBAction)goBack:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

-(void)dealloc{
    [self setResultLabel:nil];
    [self setEquationLabel:nil];
}

@end
