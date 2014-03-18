//
//  JFEMnemo.h
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

#import <Foundation/Foundation.h>

@interface JFEMnemo : NSObject


@property (nonatomic, readonly) NSArray * consonants;
@property (nonatomic, readonly) NSArray * vowels;
@property (nonatomic, readonly) NSArray * additional;
@property (nonatomic, readonly) NSDictionary * special;
@property (nonatomic, readonly) NSString * negative;

@property (nonatomic, strong) NSMutableArray * syllables;


+ (id)sharedManager;


- (NSString*) fromInteger:(long) integer;
- (long) toInteger:(NSString*) word;

- (long) toNumber:(NSString*) syllable;
- (NSString *) toString:(long) integer;


-(BOOL) isMnemoWord:(NSString*) word;

- (NSArray*) split:(NSString*) word;

@end
