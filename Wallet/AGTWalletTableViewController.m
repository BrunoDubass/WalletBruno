//
//  AGTWalletTableViewController.m
//  Wallet
//
//  Created by Bruno Domínguez on 30/06/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import "AGTWalletTableViewController.h"
#import "AGTWallet.h"
#import "AGTMoney.h"
#import "AGTBroker.h"

@interface AGTWalletTableViewController ()
@property(strong, nonatomic)AGTWallet *model;
@property(strong, nonatomic)AGTBroker *broker;
@end

@implementation AGTWalletTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.broker addRate:2 fromCurrency:@"USD" toCurrency:@"EUR"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(id)initWithModel:(AGTWallet *)model{
    if (self = [super initWithStyle:UITableViewStylePlain]) {
        _model = model;
        _broker = [[AGTBroker alloc]init];
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return [self.model numberOfCurrencies]+1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    if (section == [self.model.currencies count]) {
        return 1;
    }else{
        return [[self.model moneyArrayForCurrency:[[self.model.currencies allObjects]objectAtIndex:section]]count]+1;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cellName";
    AGTMoney *money;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
 
    // Configure the cell...
    if (indexPath.section == [self.model.currencies count]) {
        AGTMoney *result = [self.model reduceToCurrency:@"EUR" withBroker:self.broker];
        cell.textLabel.text = [NSString stringWithFormat:@"%@", [result amount]];
        cell.detailTextLabel.text = @"EUR";
        return cell;
    }
    NSString *currency = [[self.model.currencies allObjects]objectAtIndex:indexPath.section];
    NSArray *array = [self.model moneyArrayForCurrency:currency];
    if (indexPath.row == [self.model moneyForCurrency:[[[self.model currencies]allObjects]objectAtIndex:indexPath.section]]) {
        cell.textLabel.text = [NSString stringWithFormat:@"SUBTOTAL: %lu", (unsigned long)[self.model amountForCurrency:currency]];
        cell.detailTextLabel.text = currency;
        return cell;
    }else{
        money = [array objectAtIndex:indexPath.row];
        cell.textLabel.text = money.amount.stringValue;
        cell.detailTextLabel.text = currency;
        return cell;
    }
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == [[self.model.currencies allObjects]count]) {
        return @"TOTAL ADD";
    }
        return [[self.model.currencies allObjects]objectAtIndex:section];
}

@end
