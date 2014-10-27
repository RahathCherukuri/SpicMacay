//
//  View.h
//  SpicMacay
//
//  Created by rahath on 10/26/14.
//  Copyright (c) 2014 Green. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface View : UIView

@property (weak, nonatomic) IBOutlet UITextField *outletName;

- (void) tapSingleHandler: (UITapGestureRecognizer *) sender;

@end
