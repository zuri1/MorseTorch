//
//  NSString+MorseCode.m
//  MorseTorch
//
//  Created by Zuri Biringer on 1/20/14.
//  Copyright (c) 2014 Zuri Biringer. All rights reserved.
//

#import "NSString+MorseCode.h"

@implementation NSString (MorseCode)

//+ (NSString *)convertToMorse
//{
//    
//}

+(NSDictionary *)morseDictionary
{
    NSDictionary *dict = @{@"a" : @"-.",
                           @"b" : @"-...",
                           @"c" : @"-.-.",
                           @"d" : @"-..",
                           @"e" : @".",
                           @"f" : @"..-.",
                           @"g" : @"--.",
                           @"h" : @"....",
                           @"i" : @"..",
                           @"j" : @".---",
                           @"k" : @"-.-",
                           @"l" : @".-..",
                           @"m" : @"--",
                           @"n" : @"-.",
                           @"o" : @"---",
                           @"p" : @".--.",
                           @"q" : @"--.-",
                           @"r" : @".-.",
                           @"s" : @"...",
                           @"t" : @"-",
                           @"u" : @"..-",
                           @"v" : @"...-",
                           @"w" : @".--",
                           @"x" : @"-..-",
                           @"y" : @"-.--",
                           @"z" : @"--..",
                           @" " : @" "};
    
    return dict;
}

-(NSArray *)symbolsForString
{
    NSMutableArray *tempArray = [NSMutableArray new];
    NSString *noSpaces = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    for (int i = 0; i <noSpaces.length; i++) {
        
        [tempArray addObject:[self symbolForLetter:[noSpaces substringWithRange:NSMakeRange(i, 1)]]];
    }
    
    return [NSArray arrayWithArray:tempArray];
    
}

-(NSString *)symbolForLetter:(NSString *)letter
{
    //    if ([letter rangeOfString:@" "].location == NSNotFound)
    //    {
    //    letter = [letter uppercaseString];
    //    return letter;
    //    }
    //    else
    //    {
    //        return @"no white space";
    //    }
    letter = [letter uppercaseString];
    
    return letter;
    
}


@end
