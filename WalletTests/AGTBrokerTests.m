//
//  AGTBrokerTests.m
//  Wallet
//


#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AGTMoney.h"
#import "AGTBroker.h"

@interface AGTBrokerTests : XCTestCase
@property (strong, nonatomic)AGTBroker *emptyBroker;
@property (strong, nonatomic)AGTMoney *oneDollar;
@end

@implementation AGTBrokerTests

- (void)setUp {
    [super setUp];
    self.emptyBroker = [AGTBroker new];
    self.oneDollar = [AGTMoney dollarWithAmount:1];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.emptyBroker = nil;
    self.oneDollar = nil;
}

-(void)testSimpleReduction{
    
    AGTMoney *sum = [[AGTMoney dollarWithAmount:5]plus:[AGTMoney dollarWithAmount:5]];
    AGTMoney *reduced = [self.emptyBroker reduce: sum toCurrency: @"USD"];
    XCTAssertEqualObjects(sum, reduced, @"Conbersion to same currency should be a NOP");
}

-(void)testReduction{
    
    [self.emptyBroker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    AGTMoney *dollars = [AGTMoney dollarWithAmount:10];
    AGTMoney *euros = [AGTMoney euroWithAmount:5];
    AGTMoney *converted = [self.emptyBroker reduce:dollars toCurrency:@"EUR"];
    XCTAssertEqualObjects(converted, euros, @"$10 = €5 2:1");
}

-(void)testThatNoRateRaisesException{
    XCTAssertThrows([self.emptyBroker reduce:self.oneDollar toCurrency:@"EUR"], @"No rates should cause exception");
}
-(void)testThatNilConversionDoesNotChangeMoney{
    XCTAssertEqualObjects(self.oneDollar, [self.emptyBroker reduce:self.oneDollar toCurrency:@"USD"], @"A nil conversion should not have been effect");
}

@end
