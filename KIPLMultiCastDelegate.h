//
//  KIPLMultiCastDelegate.h
//  ChatApp
//
//  Created by Ghanshyam on 9/4/15.
//  Copyright (c) 2015 Ghanshyam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KIPLMultiCastDelegate : NSObject{
    NSMutableArray  *delegateNodes;
}

/**
 *  Used to add delegate as multi-cast delegate
 *
 *  @param delegate : context which is to be added
 */
-(void)addDelegate:(id)delegate;


/**
 *  Used to remove delegate as multi-cast delegate
 *
 *  @param delegate : context which is to be added
 */
-(void)removeDelegate:(id)delegate;

@end
