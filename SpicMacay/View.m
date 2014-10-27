//
//  View.m
//  SpicMacay
//
//  Created by rahath on 10/26/14.
//  Copyright (c) 2014 Green. All rights reserved.
//

#import "View.h"

@implementation View

@synthesize outletName;


// Just handles the Single Tap- which lets u resign the keyboard.
- (void) tapSingleHandler: (UITapGestureRecognizer *) sender
{
    [self.outletName resignFirstResponder];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
