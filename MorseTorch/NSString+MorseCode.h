//
//  NSString+MorseCode.h
//  MorseTorch
//
//  Created by Zuri Biringer on 1/20/14.
//  Copyright (c) 2014 Zuri Biringer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MorseCode)

//+ (NSString *)convertToMorse;

-(NSArray *)symbolsForString;
-(NSString *)symbolForLetter:(NSString *)letter;

+(NSDictionary *)morseDictionary;

@end
