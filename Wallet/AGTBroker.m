//
//  AGTBroker.m
//  Wallet
//


#import "AGTBroker.h"


@implementation AGTBroker

-(id)init{
    if (self=[super init]) {
        _rates=[@{}mutableCopy];
    }
    return self;
}

-(AGTMoney*)reduce:(id<AGTMoney>)money toCurrency:(NSString*)currency{
    
    //double dispatch
    return [money reduceToCurrency:currency withBroker:self];
    
}

-(void)addRate:(NSInteger)rate fromCurrency:(NSString*)fromCurrency toCurrency:(NSString*)toCurrency{
    
    [self.rates setObject:@(rate) forKey:[self keyFromCurrency:fromCurrency toCurrency:toCurrency]];
    [self.rates setObject:@(1.0/rate) forKey:[self keyFromCurrency:toCurrency toCurrency:fromCurrency]];
    
}

#pragma mark - utils

-(NSString*)keyFromCurrency:(NSString*)fromCurrency toCurrency:(NSString*)toCurrency{
    return [NSString stringWithFormat:@"%@-%@",fromCurrency, toCurrency];
}
@end
