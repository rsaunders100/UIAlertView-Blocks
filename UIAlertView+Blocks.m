//
//  UIAlertView+Blocks.m
//  Shibui
//
//  Created by Jiva DeVoe on 12/28/10.
//  Copyright 2010 Random Ideas, LLC. All rights reserved.
//  Modified by Robert Saunders on 20/01/12
//

#import "UIAlertView+Blocks.h"
#import <objc/runtime.h>

static NSString *CANCEL_ACTION_ASS_KEY = @"com.robsaunders.cancelbuttonaction";
static NSString *OTHER_ACTION_ASS_KEY = @"com.robsaunders.otherbuttonaction";

@implementation UIAlertView (Blocks)

-(id)initWithTitle:(NSString *)inTitle 
           message:(NSString *)inMessage
 cancelButtonTitle:(NSString *)inCancelButtonTitle
cancelButtonAction:(void (^)(void))inCancelAction
{
    if((self = [self initWithTitle:inTitle 
                           message:inMessage 
                          delegate:self
                 cancelButtonTitle:inCancelButtonTitle
                  otherButtonTitles:nil]))
    {
      objc_setAssociatedObject(self, CANCEL_ACTION_ASS_KEY, inCancelAction, OBJC_ASSOCIATION_COPY_NONATOMIC);
      [self setDelegate:self];
      [self retain]; // keep yourself around!
    }
    return self;
}

-(id)initWithTitle:(NSString *)     inTitle 
           message:(NSString *)     inMessage
 cancelButtonTitle:(NSString *)     inCancelButtonTitle
cancelButtonAction:(void (^)(void)) inCancelButtonAction
  otherButtonTitle:(NSString*)      inOtherButtonTitle
 otherButtonAction:(void (^)(void)) inOtherButtonAction 
{
  if((self = [self initWithTitle:inTitle 
                         message:inMessage 
                        delegate:self
               cancelButtonTitle:inCancelButtonTitle
               otherButtonTitles:inOtherButtonTitle,nil]))
  {
    objc_setAssociatedObject(self, CANCEL_ACTION_ASS_KEY, inCancelButtonAction, OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, OTHER_ACTION_ASS_KEY, inOtherButtonAction, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self setDelegate:self];
    [self retain]; // keep yourself around!
  }
  return self;
}



- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
  void (^action)(void);
  
  if (buttonIndex == 0) 
  {
    action  = objc_getAssociatedObject(self, CANCEL_ACTION_ASS_KEY);
  } 
  else if (buttonIndex == 1)
  {
    action  = objc_getAssociatedObject(self, OTHER_ACTION_ASS_KEY);
  }
  if (action) action();
  
  objc_setAssociatedObject(self, CANCEL_ACTION_ASS_KEY, nil, OBJC_ASSOCIATION_COPY);
  objc_setAssociatedObject(self, OTHER_ACTION_ASS_KEY, nil, OBJC_ASSOCIATION_COPY);
  
  [self release]; // and release yourself!
}

@end
