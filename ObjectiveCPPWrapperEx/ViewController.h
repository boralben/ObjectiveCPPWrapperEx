//
//  ViewController.h
//  
//
//  Created by Ben Boral on 8/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DummyModelWrapper.h"

@interface ViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>

//wrapper class for data model
@property (strong, nonatomic) DummyModelWrapper *calculationsModel;

//number input UI elements
@property (strong, nonatomic) IBOutlet UITextField *intOneTF;
@property (strong, nonatomic) IBOutlet UITextField *intTwoTF;
@property (strong, nonatomic) IBOutlet UITextField *doubleOneTF;
@property (strong, nonatomic) IBOutlet UITextField *doubleTwoTF;
@property (strong, nonatomic) UIPickerView *integerPicker;
@property (strong, nonatomic) UIToolbar *selectBar;

//We keep track of the currently selected textField
//so that we're able to put the pickerView content
//into the correct textField.
@property (strong, nonatomic) UITextField *currentTF;

//Ensure that user can only enter numbers into the double textfields
@property (strong, nonatomic) NSCharacterSet *numsOnly;


@end
