//
//  AnswerVC.h
//  
//
//  Created by Ben Boral on 8/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnswerVC : UIViewController

//contents of our labels
@property (strong, nonatomic) NSString *equationContents;
@property (strong, nonatomic) NSString *resultContents;

@property (strong, nonatomic) IBOutlet UILabel *equationLabel;
@property (strong, nonatomic) IBOutlet UILabel *resultLabel;
- (IBAction)goBack:(id)sender;

@end
