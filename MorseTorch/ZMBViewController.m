//
//  ZMBViewController.m
//  MorseTorch
//
//  Created by Zuri Biringer on 1/20/14.
//  Copyright (c) 2014 Zuri Biringer. All rights reserved.
//

#import "ZMBViewController.h"
#import "NSString+MorseCode.h"
#import "ZMBTorchController.h"

@interface ZMBViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *myTextField;
@property (weak, nonatomic) IBOutlet UILabel *currentLetter;


@property (weak, nonatomic) NSString *myMessage;
@property (weak, nonatomic) NSString *translatedMessage;
@property (nonatomic, strong) NSDictionary *morseDictionary;
@property (nonatomic, strong) ZMBTorchController *torchController;


@end

@implementation ZMBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.myTextField.delegate = self;
    
    self.torchController = [ZMBTorchController new];
    
    self.torchController.delegate = self;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.myMessage = textField.text;
//    self.translatedMessage = [NSString ]
    NSString *testString = @"hi";
    
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

- (IBAction)sendMessage:(id)sender {
    NSString *messageString = self.myTextField.text;
    [self.torchController getsMessage:messageString];
}

- (void)displayLetter:(NSString *)letter
{
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    [mainQueue addOperationWithBlock:^{
        self.currentLetter.text = letter;
    }];
}

@end
