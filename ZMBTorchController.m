//
//  ZMBTorchController.m
//  MorseTorch
//
//  Created by Zuri Biringer on 1/24/14.
//  Copyright (c) 2014 Zuri Biringer. All rights reserved.
//

#import "ZMBTorchController.h"
#import "NSString+MorseCode.h"
#import <AVFoundation/AVFoundation.h>

@interface ZMBTorchController ()

@property (strong, nonatomic) NSDictionary *morseDictionary;
@property (strong, nonatomic) NSOperationQueue *morseQueue;
@property (strong, nonatomic) NSMutableArray *lettersArray;

@end

@implementation ZMBTorchController

-(id)init
{
    self = [super init];
    if (self) {
        
        self.morseDictionary = [NSString morseDictionary];
        self.morseQueue = [NSOperationQueue new];
        [self.morseQueue setMaxConcurrentOperationCount:1];
        self.lettersArray = [NSMutableArray new];
    }
    return self;
}

-(void)getsMessage:(NSString *)message
{
    NSMutableArray *symbolsArray = [NSMutableArray new];
    for (int i=0; i<message.length; i++) {
        NSString *letter = [message substringWithRange:NSMakeRange(i, 1)];
        letter = [letter lowercaseString];
        NSString *symbol = [self.morseDictionary objectForKey:letter];
        if (symbol) {
            [symbolsArray addObject:symbol];
            [self.lettersArray addObject:letter];
        }
    }
    [self convertToFlashes:symbolsArray];
}

-(void)convertToFlashes:(NSMutableArray *)symbols
{
    for (NSString *letter in symbols) {
        for (int i=0; i<letter.length; i++) {
            NSString *symbol = [letter substringWithRange:NSMakeRange(i, 1)];
            [self.morseQueue addOperationWithBlock:^{
                [self.delegate displayLetter:[self.lettersArray objectAtIndex:[symbols indexOfObject:letter]]];
                if ([symbol isEqualToString:@"."]) {
                    [self shortFlash];
                } else if ([symbol isEqualToString:@"-"]) {
                    [self longFlash];
                } else if ([symbol isEqualToString:@" "]) {
                    [self pauseBetweenWords];
                }
                
            }];
        }
        
    }
}

-(void)shortFlash
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch] && [device hasFlash]) {
        [self turnOnFlash:device];
        usleep(300000);
        [self turnOffFlash:device];
        usleep(100000);
    }
    
    
}

-(void)longFlash
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch] && [device hasFlash]) {
        [self turnOnFlash:device];
        usleep(500000);
        [self turnOffFlash:device];
        usleep(100000);
    }

}

-(void)pauseBetweenWords
{
    usleep(700000);
}

-(void)turnOnFlash:(AVCaptureDevice *)device
{
    [device lockForConfiguration:nil];
    [device setTorchMode:AVCaptureTorchModeOn];
    [device setFlashMode:AVCaptureFlashModeOn];
    [device unlockForConfiguration];
}

-(void)turnOffFlash:(AVCaptureDevice *)device
{
    [device lockForConfiguration:nil];
    [device setTorchMode:AVCaptureTorchModeOff];
    [device setFlashMode:AVCaptureFlashModeOff];
    [device unlockForConfiguration];
}



@end
