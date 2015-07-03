//
//  AGTWalletTableViewController.h
//  Wallet
//
//  Created by Bruno Domínguez on 30/06/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AGTWallet;

@interface AGTWalletTableViewController : UITableViewController
-(id)initWithModel:(AGTWallet *)model;
@end
