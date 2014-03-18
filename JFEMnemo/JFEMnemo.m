
//  JFEMnemo.m
//  Mnemo
//  This is a port of the Ruby module rufus-mnemo & the php Lib
//  Created by Jérome Freyre on 17.03.14.
//  Copyright (c) 2014 Jérome Freyre. All rights reserved.
//
//  Ruby Version
//  @link  http://github.com/jmettraux/rufus-mnemo/
//  @author John Mettraux <jmettraux@gmail.com>
//
//  PHP Version
//  @link http://github.com/aleksblendwerk/Mnemo
//  @author Alexander Seltenreich <aleks@blendwerk.net>

#import "JFEmnemo.h"

@interface JFEMnemo (private)

- (NSString *) fromIntegerInner:(long) integer;

- (long) fromString:(NSString*) word;
- (long) toIntegerInner:(NSString*) word;
- (NSString *) toSpecial:(NSString*) word;
- (NSString *) fromSpecial:(NSString*) word;
@end

@implementation JFEMnemo

+ (id)sharedManager {
    static JFEMnemo *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

-(id)init
{
    self = [super init];
    if (self) {
        _consonants = @[@"b", @"d", @"g", @"h", @"j", @"k", @"m", @"n", @"p", @"r", @"s", @"t", @"z"];
        _vowels = @[@"a", @"e", @"i", @"o", @"u"];
        _additional = @[@"wa", @"wo", @"ya", @"yo", @"yu"];
        
        _special = @{
                     @"hu" : @"fu",
                     @"si" : @"shi",
                     @"ti" : @"chi",
                     @"tu" : @"tsu",
                     @"zi" : @"tzu"
                     };
        _negative = @"wi";
        _syllables = [NSMutableArray array];
        if (_syllables.count == 0) {
            
            for (NSString * consonnant in _consonants) {
                for (NSString * vowel in _vowels) {
                    NSString * syllable = [NSString stringWithFormat:@"%@%@", consonnant, vowel];
                    [_syllables addObject:syllable];
                }
            }

            [_syllables addObjectsFromArray:_additional];
        }
    }
    return self;
}


- (NSString*) fromInteger:(long) integer
{
    
    NSString * prefix = (integer < 0) ? self.negative : @"";
    
    
    return [NSString stringWithFormat:@"%@%@", prefix, [self toSpecial:[self fromIntegerInner:ABS(integer)]]];

}



- (NSString *) toString:(long) integer
{
    return [self fromIntegerInner:integer];
}

-(long) fmodOf:(long)a with: (long)b
{
    if (b < 0) {
        return a - b * ceil(a / b);
    } else {
        return a - b * floor(a / b);
    }
    

    

}

- (NSString *) fromIntegerInner:(long) integer
{
    if (integer == 0) {
        return @"";
    }
   
    int mod = [self fmodOf:integer with:_syllables.count];
    int rest = floor(integer / _syllables.count);
    
    return [NSString stringWithFormat:@"%@%@", [self fromIntegerInner:rest], [_syllables objectAtIndex:mod]];
    
}

-(BOOL) isMnemoWord:(NSString*) word
{
    BOOL isAMnemoWord = YES;
    @try {
        int r = [self toInteger:word];
        NSLog(@"%d", r);
    }
    @catch (NSException *exception) {
        isAMnemoWord = false;
    }
    @finally {
        return isAMnemoWord;
    }
 
    
}

- (NSArray*) split:(NSString*) word
{
    NSMutableArray * my_syllables = [NSMutableArray array];
    
    if (word.length > 0) {
        word = [self fromSpecial:word];
        

        
        for (int i = 0; i < [word length]; i+=2) {
            NSString *syllable = [word substringWithRange:NSMakeRange(i, 2)];
            
            if ([_syllables containsObject:syllable]) {
                [my_syllables addObject:[self toSpecial:syllable]];
            } else {
                [NSException raise:@"Invalid syllable value" format:@"The syllable %@ was not found", syllable];
            }
            
            
        }
        

    }
    return my_syllables;
}


- (long) toInteger:(NSString*) word
{
    return [self toIntegerInner:[self fromSpecial:word]];
}

- (long) fromString:(NSString*) word
{
    return [self toInteger:word];
}


- (long) toIntegerInner:(NSString*) word
{
    if (word.length == 0) return 0;
    
    if ([[word substringToIndex:2] isEqualToString:self.negative]) {
        return -1 * [self toInteger:[word substringFromIndex:2]];
    }
    
    
    return _syllables.count
    * [self toIntegerInner:[word substringWithRange:NSMakeRange(0, word.length - 2)]]
    + [self toNumber:[word substringWithRange:NSMakeRange(word.length - 2, 2)]];

}
- (long) toNumber:(NSString*) syllable
{
    int index = [_syllables indexOfObject:syllable];
    
    if (index == NSNotFound) {
        [NSException raise:@"Invalid foo value" format:@"The syllable %@ was not found", syllable];
        return false;
    } else {
        return index;
    }
    
}



- (NSString *) toSpecial:(NSString*) word
{
    for (NSString * key in _special) {
        NSString * value = [_special objectForKey:key];
        word = [word stringByReplacingOccurrencesOfString:key withString:value];
    }
    return word;
}
- (NSString *) fromSpecial:(NSString*) word
{

    for (NSString * key in _special) {
        NSString * value = [_special objectForKey:key];
        word = [word stringByReplacingOccurrencesOfString:value withString:key];
    }
    return word;
}
@end









