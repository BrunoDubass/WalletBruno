//
//  AGTWallet.m
//  Wallet
//


#import "AGTWallet.h"

@interface AGTWallet ()


@end

@implementation AGTWallet

-(NSUInteger)count{
    return [self.moneys count];
}

-(id)initWithAmount:(NSInteger) amount
           currency: (NSString *) currency{
    
    if (self = [super init]) {
        AGTMoney *money = [[AGTMoney alloc]initWithAmount:amount currency:currency];
        _currencies = [[NSMutableSet alloc]init];
        _moneys = [[NSMutableArray alloc]init];
        [_currencies addObject:money.currency];
        [_moneys addObject:money];
    }
    return self;
    
}

-(id<AGTMoney>) times:(NSInteger) multiplier{
    
    NSMutableArray *newMoneys = [[NSMutableArray alloc]initWithCapacity:self.moneys.count];
    for (AGTMoney *each in self.moneys) {
        AGTMoney *newMoney = [each times:multiplier];
        [newMoneys addObject:newMoney];
    }
    self.moneys = newMoneys;
    return self;
}

-(id<AGTMoney>) plus:(AGTMoney *) other{
    
    [self.moneys addObject:other];
    [self.currencies addObject:other.currency];
    return self;
    
}

-(id<AGTMoney>) reduceToCurrency:(NSString*)currency withBroker:(AGTBroker*)broker{
    
    AGTMoney *result = [[AGTMoney alloc]initWithAmount:0 currency:currency];
    for (AGTMoney *each in self.moneys) {
        result = [result plus:[each reduceToCurrency:currency withBroker:broker]];
    }
    return result;
}

-(NSUInteger)moneyForCurrency:(NSString*)currency{
    NSUInteger total = 0;
    for (AGTMoney *each in self.moneys) {
        if ([each.currency isEqualToString:currency]) {
            total+=1;
        }
    }
    return total;
}

-(NSArray*)moneyArrayForCurrency:(NSString*)currency{
    NSMutableArray *arrayMoney = [[NSMutableArray alloc]init];
    
    for (AGTMoney *each in self.moneys) {
        if ([each.currency isEqualToString:currency]) {
            [arrayMoney addObject:each];
        }
    }
    return arrayMoney;
}

-(NSUInteger)numberOfCurrencies{
    return [self.currencies count];
}

-(NSUInteger)amountForCurrency:(NSString*)currency{
    __block NSInteger total = 0;
    [self.moneys enumerateObjectsUsingBlock:^(AGTMoney* obj, NSUInteger idx, BOOL *stop) {
        if ([obj.currency isEqualToString:currency]) {
            total+= [obj.amount integerValue];
        }
    }];
    return total;
}

@end
