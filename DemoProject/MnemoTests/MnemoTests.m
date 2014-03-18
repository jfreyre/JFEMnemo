//
//  MnemoTests.m
//  MnemoTests
//
//  Created by Jérome Freyre on 17.03.14.
//  Copyright (c) 2014 Jérome Freyre. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JFEMnemo.h"

@interface MnemoTests : XCTestCase

@end

@implementation MnemoTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFromInteger
{
    
     JFEMnemo * tool = [JFEMnemo sharedManager];
    
    
    XCTAssertTrue([@"nada" isEqualToString:[tool fromInteger:2455]], @"nada is not equal to %@", [tool fromInteger:2455]);
    XCTAssertTrue([@"haruka" isEqualToString:[tool fromInteger:76955]], @"haruka is not equal to %@", [tool fromInteger:76955]);
    XCTAssertTrue([@"karasu" isEqualToString:[tool fromInteger:125704]], @"karasu is not equal to %@", [tool fromInteger:125704]);
    XCTAssertTrue([@"kazuma" isEqualToString:[tool fromInteger:127010]], @"kazuma is not equal to %@", [tool fromInteger:127010]);
    XCTAssertTrue([@"kotoba" isEqualToString:[tool fromInteger:141260]], @"kotoba is not equal to %@", [tool fromInteger:141260]);
    XCTAssertTrue([@"takeshimaya" isEqualToString:[tool fromInteger:1329724967]], @"takeshimaya is not equal to %@", [tool fromInteger:1329724967]);
    XCTAssertTrue([@"winamote" isEqualToString:[tool fromInteger:-173866]], @"winamote is not equal to %@", [tool fromInteger:-173866]);
    XCTAssertTrue([@"wina" isEqualToString:[tool fromInteger:-35]], @"wina is not equal to %@", [tool fromInteger:-35]);

}


- (void) testToInteger
{
    JFEMnemo * tool = [JFEMnemo sharedManager];
    
    XCTAssertEqual(2455, [tool toInteger:@"nada"], @"nada should equal 2455 instead of %ld", [tool toInteger:@"nada"]);
    XCTAssertEqual(76955, [tool toInteger:@"haruka"], @"haruka should equal 76955 instead of %ld", [tool toInteger:@"haruka"]);
    XCTAssertEqual(125704, [tool toInteger:@"karasu"], @"karasu should equal 125704 instead of %ld", [tool toInteger:@"karasu"]);
    XCTAssertEqual(127010, [tool toInteger:@"kazuma"], @"kazuma should equal 127010 instead of %ld", [tool toInteger:@"kazuma"]);
    XCTAssertEqual(141260, [tool toInteger:@"kotoba"], @"kotoba should equal 141260 instead of %ld", [tool toInteger:@"kotoba"]);
    XCTAssertEqual(1329724967, [tool toInteger:@"takeshimaya"], @"takeshimaya should equal 1329724967 instead of %ld", [tool toInteger:@"takeshimaya"]);
    XCTAssertEqual(-173866, [tool toInteger:@"winamote"], @"winamote should equal -173866 instead of %ld", [tool toInteger:@"winamote"]);
    XCTAssertEqual(-35, [tool toInteger:@"wina"], @"wina should equal -35 instead of %ld", [tool toInteger:@"wina"]);
}

- (void) testInvalid
{
    JFEMnemo * tool = [JFEMnemo sharedManager];
    XCTAssertThrows([tool toInteger:@"rstuvwxyz"], @"Should throws an exception");
}

- (void) testSplit
{
     JFEMnemo * tool = [JFEMnemo sharedManager];
    
    NSArray * result = @[@"tsu", @"na", @"shi", @"ma"];
    NSArray * split = [tool split:@"tsunashima"];
    
    for(int i = 0; i < split.count; i++) {
        BOOL test = [[result objectAtIndex:i] isEqualToString:[split objectAtIndex:i]];
        XCTAssertTrue(test, @"%@ and %@ are not equal", [result objectAtIndex:i], [result objectAtIndex:i]);
    }
    
}

- (void) testIsMnemoWord
{
    JFEMnemo * tool = [JFEMnemo sharedManager];
    XCTAssertTrue([tool isMnemoWord:@"fugu"], @"fugu is not a mnemo word...");
    XCTAssertTrue([tool isMnemoWord:@"kazuma"], @"kazuma is not a mnemo word...");
    XCTAssertTrue([tool isMnemoWord:@"toriyamanobashi"], @"toriyamanobashi is not a mnemo word...");
    XCTAssertFalse([tool isMnemoWord:@"George"], @"George is not a mnemo word...");
    XCTAssertFalse([tool isMnemoWord:@"abcdefgh"], @"abcdefgh is not a mnemo word...");
    XCTAssertFalse([tool isMnemoWord:@"ijklmnopq"], @"ijklmnopq is not a mnemo word...");
}


- (void)testZero
{
    JFEMnemo * tool = [JFEMnemo sharedManager];
    XCTAssertTrue([@"" isEqualToString:[tool fromInteger:0]], @" 0 is not equal to 0");
    XCTAssertEqual(0, [tool toInteger:@""], @" 0 is not equal to 0");
}

@end
