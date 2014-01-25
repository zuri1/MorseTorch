//
//  ZMBTorchController.h
//  MorseTorch
//
//  Created by Zuri Biringer on 1/24/14.
//  Copyright (c) 2014 Zuri Biringer. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol sendsLetter <NSObject>

-(void)displayLetter:(NSString *)letter;

@end

@interface ZMBTorchController : NSObject

-(void)getsMessage:(NSString *)message;

@property (assign) id<sendsLetter> delegate;

@end
