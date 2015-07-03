//
//  AGTWalletTests.m
//  Wallet
//


#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AGTMoney.h"
#import "AGTBroker.h"
#import "AGTWallet.h"

@interface AGTWalletTests : XCTestCase

@end

@implementation AGTWalletTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testAdditionWithReduction{
    AGTBroker *broker = [AGTBroker new];
    [broker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    AGTWallet *wallet = [[AGTWallet alloc]initWithAmount:40 currency:@"EUR"];
    [wallet plus:[AGTMoney dollarWithAmount:20]];
    AGTMoney *reduced = [broker reduce:wallet toCurrency:@"USD"];
    XCTAssertEqualObjects(reduced, [AGTMoney dollarWithAmount:100], @"€40 + $20 = $100");
}

@end
