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
    // We might get nil for one or both block inputs.  To 
    
    
    // Since this is a catogory, we cant add properties in the usual way.
    // Instead we bind the delegate block to the pointer to self.
    // We use copy to invoke block_copy() to ensure the block is copied off the stack to the heap
    // so that it stays around.
    if (inCancelButtonAction) 
    {
      objc_setAssociatedObject(self, CANCEL_ACTION_ASS_KEY, inCancelButtonAction, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    
    if (inOtherButtonAction) 
    {
      objc_setAssociatedObject(self, OTHER_ACTION_ASS_KEY, inOtherButtonAction, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    
    if (inCancelButtonAction || inOtherButtonAction) 
    {
      // We want to get the delegate callback so that we can invoke the given block
      self.delegate = self;
      
      // We retain ouself because we want to keep this object alive until its dismissed.
      // We will call release when we get the delegate callback.
      [self retain];
    } 
    else 
    {
      // No blocks have been given so dont set the delegate
      self.delegate = nil;
    }
  }
  return self;
}


// This is a convenience wrapper for the constructor above
+ (void) displayAlertWithTitle:(NSString *)title 
                       message:(NSString *)message
               leftButtonTitle:(NSString *)leftButtonTitle
              leftButtonAction:(void (^)(void))leftButtonAction
              rightButtonTitle:(NSString*)rightButtonTitle
             rightButtonAction:(void (^)(void))rightButtonAction
{
  UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:title 
                                                      message:message
                                            cancelButtonTitle:leftButtonTitle
                                           cancelButtonAction:leftButtonAction
                                             otherButtonTitle:rightButtonTitle
                                            otherButtonAction:rightButtonAction];
  [alertView show];
  [alertView release];
}



- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
  // Decalare the block variable
  void (^action)(void) = nil;
  
  // Get the block using the correct key 
  // depending on the index of the buttom that was tapped
  if (buttonIndex == 0) 
  {
    action  = objc_getAssociatedObject(self, CANCEL_ACTION_ASS_KEY);
  } 
  else if (buttonIndex == 1)
  {
    action  = objc_getAssociatedObject(self, OTHER_ACTION_ASS_KEY);
  }
  
  // Invoke the block if we have it.
  if (action) action();
  
  // Unbind both blocks from ourself so they are released
  // We assign nil to the objects wich will release them automatically
  objc_setAssociatedObject(self, CANCEL_ACTION_ASS_KEY, nil, OBJC_ASSOCIATION_COPY);
  objc_setAssociatedObject(self, OTHER_ACTION_ASS_KEY, nil, OBJC_ASSOCIATION_COPY);
  
  // We can now release ourselfs, since we retained it eariler.
  [self release]; 
}

@end
