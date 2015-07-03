//
//  AGTWallet.h
//  Wallet
//


#import <Foundation/Foundation.h>
#import "AGTMoney.h"

@interface AGTWallet : NSObject<AGTMoney>

@property(nonatomic, readonly)NSUInteger count;
@property(strong, nonatomic)NSMutableSet *currencies;
@property(strong, nonatomic)NSMutableArray *moneys;

-(NSUInteger)moneyForCurrency:(NSString*)currency;
-(NSUInteger)numberOfCurrencies;
-(NSUInteger)amountForCurrency:(NSString*)currency;
-(NSArray*)moneyArrayForCurrency:(NSString*)currency;

@end
