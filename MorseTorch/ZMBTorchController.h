//
//  ZMBTorchController.h
//  MorseTorch
//
//  Created by Zuri Biringer on 1/21/14.
//  Copyright (c) 2014 Zuri Biringer. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZMBTorchControllerDelegate <NSObject>

- (void)didSendMessage:(BOOL)success;
- (void)sendingCharacter:(NSString *)character;

@end

@interface ZMBTorchController : NSObject

//@property (unsafe_unretained)

@end
