//
//  AGTMoney.h
//  Wallet
//


#import <Foundation/Foundation.h>
@class AGTMoney;
@class AGTBroker;

@protocol AGTMoney <NSObject>

-(id)initWithAmount:(NSInteger) amount
           currency: (NSString *) currency;

-(id<AGTMoney>) times:(NSInteger) multiplier;

-(id<AGTMoney>) plus:(AGTMoney *) other;

-(id<AGTMoney>) reduceToCurrency:(NSString*)currency withBroker:(AGTBroker*)broker;

@end
@interface AGTMoney : NSObject<AGTMoney>

@property (nonatomic, readonly) NSString *currency;
@property (nonatomic, strong, readonly) NSNumber *amount;

+(id) euroWithAmount:(NSInteger) amount;
+(id) dollarWithAmount:(NSInteger) amount;

@end














