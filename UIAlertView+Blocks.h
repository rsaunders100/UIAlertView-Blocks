//
//  UIAlertView+Blocks.h
//  Shibui
//
//  Created by Jiva DeVoe on 12/28/10.
//  Copyright 2010 Random Ideas, LLC. All rights reserved.
//  Modified by Robert Saunders on 20/01/12
//

#import <Foundation/Foundation.h>

@interface UIAlertView (Blocks)


-(id)initWithTitle:(NSString *)inTitle 
           message:(NSString *)inMessage
  cancelButtonTitle:(NSString *)inCancelButtonTitle
cancelButtonAction:(void (^)(void))inCancelAction;

-(id)initWithTitle:(NSString *)inTitle 
           message:(NSString *)inMessage
  cancelButtonTitle:(NSString *)inCancelButtonTitle
cancelButtonAction:(void (^)(void))inCancelAction
  otherButtonTitle:(NSString*)inOtherButtonTitle
otherButtonAction:(void (^)(void))inOtherButtonAction;


@end
