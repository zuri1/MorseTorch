//
//  ZMBViewController.m
//  MorseTorch
//
//  Created by Zuri Biringer on 1/20/14.
//  Copyright (c) 2014 Zuri Biringer. All rights reserved.
//

#import "ZMBViewController.h"

@interface ZMBViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *myTextField;

@property (weak, nonatomic) NSString *myMessage;


@end

@implementation ZMBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.myTextField.delegate = self;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.myMessage = textField.text;
    NSLog(@"%@", self.myMessage);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField) {
        [textField resignFirstResponder];
    }
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
