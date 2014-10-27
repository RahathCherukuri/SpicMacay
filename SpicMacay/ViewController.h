//
//  ViewController.h
//  SpicMacay
//
//  Created by rahath on 9/6/14.
//  Copyright (c) 2014 Green. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "View.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *outletName;

@property (weak, nonatomic) IBOutlet UIButton *degree_one;

@property (weak, nonatomic) IBOutlet UIButton *degree_two;

@property (weak, nonatomic) IBOutlet UIButton *degree_three;

@property (weak, nonatomic) IBOutlet UIButton *school_one;

@property (weak, nonatomic) IBOutlet UIButton *school_two;

@property (weak, nonatomic) IBOutlet UIButton *school_three;

@property (weak, nonatomic) IBOutlet UIButton *school_four;

@property (weak, nonatomic) IBOutlet UIButton *school_five;

- (IBAction)degreeSet:(id)sender;

- (IBAction)schoolSet:(id)sender;

- (IBAction)submitButtonPressed:(id)sender;

@end