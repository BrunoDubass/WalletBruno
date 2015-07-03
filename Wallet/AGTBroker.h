//
//  AGTBroker.h
//  Wallet
//


#import <Foundation/Foundation.h>
#import "AGTMoney.h"

@interface AGTBroker : NSObject

@property (strong, nonatomic)NSMutableDictionary *rates;

-(AGTMoney*)reduce:(id<AGTMoney>)money toCurrency:(NSString*)currency;
-(void)addRate:(NSInteger)rate fromCurrency:(NSString*)fromCurrency toCurrency:(NSString*)toCurrency;
-(NSString*)keyFromCurrency:(NSString*)fromCurrency toCurrency:(NSString*)toCurrency;

@end
