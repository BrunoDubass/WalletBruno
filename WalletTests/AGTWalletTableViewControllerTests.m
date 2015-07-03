//
//  AGTWalletTableViewControllerTests.m
//  Wallet
//
//  Created by Bruno Domínguez on 30/06/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AGTWalletTableViewController.h"
#import "AGTWallet.h"


@interface AGTWalletTableViewControllerTests : XCTestCase
@property(strong, nonatomic)AGTWalletTableViewController *walletVC;
@property(strong, nonatomic)AGTWallet *wallet;
@end

@implementation AGTWalletTableViewControllerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.wallet = [[AGTWallet alloc]initWithAmount:1 currency:@"USD"];
    [self.wallet plus:[AGTMoney euroWithAmount:1]];
    self.walletVC = [[AGTWalletTableViewController alloc]initWithModel:self.wallet];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testNumberOfSectionsPlusOne{
    NSInteger sections = [self.walletVC numberOfSectionsInTableView:nil];
    XCTAssertEqual(sections, [self.wallet count]+1, @"Number of sections");
}

-(void)testOfMoneysInSectionPlusOne{
    XCTAssertEqual([self.wallet moneyForCurrency:@"EUR"]+1, [self.walletVC tableView:nil numberOfRowsInSection:0], @"Number of money for currency must be plus one");
}

@end
