//
//  NSObject+GNUStepAddons.m
//  Wallet
//

#import <objc/runtime.h>
#import "NSObject+GNUStepAddons.h"

@implementation NSObject (GNUStepAddons)

- (id) subclassResponsibility: (SEL)aSel{
    
    char prefix = class_isMetaClass(object_getClass(self)) ? '+': '-';
    
    [NSException raise: NSInvalidArgumentException
                format:@"%@%c%@ should be overriden by its subclass",
     NSStringFromClass([self class]), prefix, NSStringFromSelector(aSel)];
    
    return self;       
}










@end
