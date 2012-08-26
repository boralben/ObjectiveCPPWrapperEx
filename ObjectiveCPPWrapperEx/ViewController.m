//
//  ViewController.m
//  
//
//  Created by Ben Boral on 8/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "AnswerVC.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize calculationsModel=_calculationsModel;
@synthesize intOneTF = _intOneTF;
@synthesize intTwoTF = _intTwoTF;
@synthesize doubleOneTF = _doubleOneTF;
@synthesize doubleTwoTF = _doubleTwoTF;
@synthesize integerPicker = _integerPicker;
@synthesize selectBar = _selectBar;
@synthesize numsOnly = _numsOnly;
@synthesize currentTF = _currentTF;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.calculationsModel=[[DummyModelWrapper alloc] init];
    
    //integer picker is the casino slot machine looking UI element
    self.integerPicker=[[UIPickerView alloc] init];
    self.integerPicker.delegate=self;
    self.integerPicker.dataSource=self;
    [self.integerPicker sizeToFit];
    [self.integerPicker setShowsSelectionIndicator:YES];
    
    //Add a toolbar and done button to the integerPicker
    //without done button, integerPicker will stay on screen
    self.selectBar=[[UIToolbar alloc] init];
    [self.selectBar sizeToFit];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Select"
                                                                   style:UIBarButtonItemStyleBordered target:self
                                                                  action:@selector(pickerDoneClicked:)];
    [self.selectBar setItems:[NSArray arrayWithObject:doneButton]];
    
    //Assigning the integerPicker to the appropriate TextFields
    self.intOneTF.inputView=self.integerPicker;
    self.intOneTF.inputAccessoryView=self.selectBar;
    self.intTwoTF.inputView=self.integerPicker;
    self.intTwoTF.inputAccessoryView=self.selectBar;
    
    //We'll only allow these characters in our double textFields
    self.numsOnly=[[NSCharacterSet characterSetWithCharactersInString:@".0987654321"]invertedSet];
    
}

//TextField Delegate Methods

//We'll only allow these characters in our double textFields
- (BOOL)textField:(UITextField *)field shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)characters
{
    //only let number and period in
    if (field==self.doubleOneTF||field==self.doubleTwoTF) {
        return ([characters rangeOfCharacterFromSet:self.numsOnly].location == NSNotFound);
    }
    return YES;
}

//get rid of keyboard when user taps "Done" button
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

//keep track of currently used textField so that our
//UIPickerView puts its content into the appropriate textField
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    self.currentTF=textField;
}

//PickerView Delegate/Datasource Methods
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"pickerDidSelectRow");
    
    self.currentTF.text=[self pickerView:self.integerPicker titleForRow:row forComponent:0];
}


// 11 rows: 0-10
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return 11;
}

//we just want one component (for ex. a slot machine has 3 components)
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

//row titles are 0,1,2..10
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [NSString stringWithFormat:@"%d", row];
}



//push the answer view controller on screen. 
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //prevents keyboard from popping back up when we go back to this viewcontroller
    //from the AnswerVC
    [self.currentTF resignFirstResponder];
    
    AnswerVC *vc = [segue destinationViewController];
    
    //customize content of Answer view controller based on which segue is happenning (segue defines which C++ function to use)
    //this is also where we're using our wrapper class
    //These NSStrings will get loaded into UILabels in AnswerVC
    if([[segue identifier] isEqualToString:@"bigSegue"]){
        NSLog(@"bigSegue");
        vc.equationContents=[[NSString alloc] initWithFormat:@"Which is bigger: %@ or %@?", self.intOneTF.text, self.intTwoTF.text];
        
        vc.resultContents=([self.intOneTF.text intValue]==[self.intTwoTF.text intValue])?[[NSString alloc] initWithString:@"They're the same!!!!"]:[[NSString alloc] initWithFormat:@"%d is bigger", [self.calculationsModel findBiggerNumberBetweenThis:[self.intOneTF.text intValue] AndThat:[self.intTwoTF.text intValue]]];
    }
    else if([[segue identifier] isEqualToString:@"sumSegue"]){
        NSLog(@"sumSegue");
        vc.equationContents=[[NSString alloc] initWithFormat:@"%@ + %@ =", self.intOneTF.text, self.intTwoTF.text];
        
        vc.resultContents=[[NSString alloc] initWithFormat:@"%d", [self.calculationsModel addThis:[self.intOneTF.text intValue] ToThis:[self.intTwoTF.text intValue]]];
    }
    else if([[segue identifier] isEqualToString:@"piSegue"]){
        NSLog(@"piSegue");
        vc.equationContents=[[NSString alloc] initWithFormat:@"(%@*pi)/%@=", self.doubleOneTF.text, self.doubleTwoTF.text];
        
        vc.resultContents=[[NSString alloc] initWithFormat:@"%f", [self.calculationsModel piTimes:[self.doubleOneTF.text doubleValue] DividedBy:[self.doubleTwoTF.text doubleValue]]];
    }
    else {
        NSLog(@"no segue found!");
    }
}

//resign the UIPickerView
-(IBAction)pickerDoneClicked:(id)sender{
    BOOL whatev=[self textFieldShouldReturn:self.currentTF];
    NSLog(@"%d",whatev);
}

- (void)viewDidUnload {
    [self setIntOneTF:nil];
    [self setIntTwoTF:nil];
    [self setDoubleOneTF:nil];
    [self setDoubleTwoTF:nil];
    [super viewDidUnload];
}
@end
