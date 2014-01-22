//
//  ZMBTorchController.m
//  MorseTorch
//
//  Created by Zuri Biringer on 1/21/14.
//  Copyright (c) 2014 Zuri Biringer. All rights reserved.
//

#import "ZMBTorchController.h"

@interface ZMBTorchController ()

@property (nonatomic, strong) NSOperationQueue *morseCodeQueue;
@property useconds_t unitDuration;

@end

@implementation ZMBTorchController
@import AVFoundation;

+ (ZMBTorchController *)sharedTorch
{
    static dispatch_once_t pred;
    static ZMBTorchController *singleton = nil;
    
    dispatch_once(&pred, ^{
        singleton = [[ZMBTorchController alloc] init];
        singleton.morseCodeQueue = [NSOperationQueue new];
        [singleton.morseCodeQueue setMaxConcurrentOperationCount:1];
        singleton.unitDuration = 100000;
    });
    
    return singleton;
}

- (void)turnOnFlash:(AVCaptureDevice *)device
{
    [device lockForConfiguration:nil];
    
}

//- (void)sendMorse

//- (void)sendMorseArrayToTorch:(NSArray *)morseAray
//{
//    // Loop through the codes in the message
//    for (NSString *code in m) {
//        <#statements#>
//    }
//}

//- (void)shortFlash
//{
//    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
//    
//    if ([device ]) {
//        <#statements#>
//    }
//}

- (void)cancelMessage
{
    [_morseCodeQueue setSuspended:YES];
    
}

- (void)pauseBetweenWords
{
    usleep(1.5);
}

//- (void)resume

@end
