//
//  KIPLMultiCastDelegate.m
//  ChatApp
//
//  Created by Ghanshyam on 9/4/15.
//  Copyright (c) 2015 Ghanshyam. All rights reserved.
//

#import "KIPLMultiCastDelegate.h"

@implementation KIPLMultiCastDelegate


#pragma mark - Super Class Methods
-(id)init{
    self = [super init];
    if (self) {
        delegateNodes = [[NSMutableArray alloc] init];
    }
    return self;
}


-(void)dealloc{
    [delegateNodes removeAllObjects];
    delegateNodes = nil;
}

#pragma  mark - Instance Methods

/**
 *  Used to add delegate as multi-cast delegate
 *
 *  @param delegate : context which is to be added
 */
-(void)addDelegate:(id)delegate{
    if ([delegateNodes containsObject:delegate]) {
        return;
    }
    
    [delegateNodes addObject:delegate];
}

/**
 *  Used to remove delegate as multi-cast delegate
 *
 *  @param delegate : context which is to be added
 */
-(void)removeDelegate:(id)delegate{
    if (![delegateNodes containsObject:delegate]) {
        return;
    }
    
    [delegateNodes removeObject:delegate];
}

-(void)doNothing{
    
};

#pragma mark - Invocation Methods

-(void)forwardInvocation:(NSInvocation *)anInvocation{
    if (anInvocation) {
        for (id delegate in delegateNodes) {
            if ([delegate respondsToSelector:[anInvocation selector]]) {
                [anInvocation invokeWithTarget:delegate];
            }
        }
    }
}


-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    
    NSMethodSignature *methodSignature = [super methodSignatureForSelector:aSelector];
    
    if (!methodSignature) {
        for (id delegate in delegateNodes) {
            if ([delegate respondsToSelector:aSelector]) {
                return [delegate methodSignatureForSelector:aSelector];
            }
        }
    }
    
    return [[self class] instanceMethodSignatureForSelector:@selector(doNothing)];
}

@end
