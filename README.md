How to use:
------------

    [UIAlertView displayAlertWithTitle:@"Example Alert View With Blocks"
                             message:@"What is the meaning of life?"
                     leftButtonTitle:@"41"
                    leftButtonAction:^{
                                      NSLog(@"Incorrect");
                                     } 
                    rightButtonTitle:@"42"
                   rightButtonAction:^{
                                       [UIAlertView displayAlertWithTitle:@"Result"
                                                                  message:@"You chose wisely"
                                                          leftButtonTitle:@"Ok"
                                                         leftButtonAction:nil
                                                         rightButtonTitle:nil
                                                        rightButtonAction:nil];
                                      }];


Thats it.

 * No `UIAlertView* alert = ...`
 * No `[alert show];`
 * No `[alert release];`
 * No need for a delegate.
 * Inline blocks
 
To have one button only, set the right button title to `nil`.  

Actions are optional.  To not have one, set it to `nil`.



**LIMITATIONS**


**You can only have one or two buttons in the alert view**.  If you want three or more buttons you will have to revert back to the old ways.


==================================



Based on a project by [jivadevoe](https://github.com/jivadevoe/UIAlertView-Blocks).


**ORIGINAL LICENSE**

Copyright (C) 2011 by Random Ideas, LLC

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.