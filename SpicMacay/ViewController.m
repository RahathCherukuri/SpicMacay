//
//  ViewController.m
//  SpicMacay
//
//  Created by rahath on 9/6/14.
//  Copyright (c) 2014 Green. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize outletName;

@synthesize degree_one;
@synthesize degree_two;
@synthesize degree_three;

@synthesize school_one;
@synthesize school_two;
@synthesize school_three;
@synthesize school_four;
@synthesize school_five;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self SingleTap];
	// Do any additional setup after loading the view, typically from a nib.
    [self resetView];
}

//This method is to resign the keyboard when the name is entered.
//The method tapSingleHandler is implemented in the UIView
-(void)SingleTap
{
    UIView *tapView= self.view;
    UITapGestureRecognizer *tapSingleGR= [[UITapGestureRecognizer alloc] initWithTarget:tapView action: @selector(tapSingleHandler:)];
    
    tapSingleGR.numberOfTapsRequired=1;
    [tapView addGestureRecognizer:tapSingleGR];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//This method is called when any of the degree buttons are pressed.
- (IBAction)degreeSet:(UIButton *)sender
{
    [self resetDegreeButtons];
    NSString * buttonLabel = sender.titleLabel.text;
//    NSLog(@"%@",buttonLabel);
    
    UIImage * image = [UIImage imageNamed:@"Red.png"];
    [sender setBackgroundImage:image forState:UIControlStateNormal];
    
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:buttonLabel forKey:@"degreeTitle"];
    [defaults synchronize];
}

//This method is called when any of the school buttons are pressed.
- (IBAction)schoolSet:(UIButton *)sender
{
    [self resetSchoolButtons];
    NSString * schoolLabel = sender.titleLabel.text;
//    NSLog(@"%@",schoolLabel);
    
    UIImage * image = [UIImage imageNamed:@"Red.png"];
    [sender setBackgroundImage:image forState:UIControlStateNormal];
    
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:schoolLabel forKey:@"schoolTitle"];
    [defaults synchronize];
}

// This button ensures that there are values for each name, degree and school.
// If every one has a value then the values are stored into a CSV.

- (IBAction)submitButtonPressed:(id)sender
{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    
    NSString * name = self.outletName.text;
    NSLog(@"name: %@",name);
    
    NSString * degreeName = [defaults objectForKey:@"degreeTitle"];
    NSLog(@"%@",degreeName);
    
    NSString * schoolName = [defaults objectForKey:@"schoolTitle"];
    NSLog(@"%@",schoolName);
    
    UIAlertView * alertMessage = [[UIAlertView alloc]init];
    if(name == nil|| [name isEqualToString:@""])
    {
        alertMessage = [[UIAlertView alloc]initWithTitle:@"Alert Message"
                                                 message:@"Name cant be null"
                                                delegate:nil
                                       cancelButtonTitle:nil
                                       otherButtonTitles:@"OK", nil];
        [alertMessage show];
    }
    else if([degreeName isEqualToString:@""]|| degreeName == nil)
    {
        alertMessage = [[UIAlertView alloc]initWithTitle:@"Alert Message"
                                                 message:@"Degree cant be null"
                                                delegate:nil
                                       cancelButtonTitle:nil
                                       otherButtonTitles:@"OK", nil];
        [alertMessage show];
    }
    else
    {

        self.outletName.text = @"";
        
        NSString * str = @"";
        
        str = [str stringByAppendingFormat:@"\n%@,%@,%@",name,degreeName,schoolName];
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docDirectory = [paths objectAtIndex:0];
        
        NSString *outputFileName = [docDirectory stringByAppendingPathComponent:@"data.csv"];
        NSFileHandle * fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:outputFileName];
        
        NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
        
        
        // This is only for the first time it has to execute the required method
        // which gives headings to the rows.
        BOOL boolValue = [defaults boolForKey:@"boolValue"];
        
        if(boolValue == NO)
        {
            [defaults setBool:YES forKey:@"boolValue"];
            [defaults synchronize];
            [self requiredMethod];
        }
        
        // Get the file handle to endoffile and then write the data.
        [fileHandle seekToEndOfFile];
        
        NSData* data = [str dataUsingEncoding:NSUTF8StringEncoding];
        [fileHandle writeData:data];
        
        [fileHandle closeFile];
        
        [self resetView];
        
        alertMessage = [[UIAlertView alloc]initWithTitle:@"Data Saved Successfully..!!"
                                                 message:@""
                                                delegate:nil
                                       cancelButtonTitle:nil
                                       otherButtonTitles:@"OK", nil];
        [alertMessage show];

        
        [defaults removeObjectForKey:@"degreeTitle"];
        [defaults removeObjectForKey:@"schoolTitle"];
        [defaults synchronize];
        
    }
}

// This method reset's the complete view setting the buttons to the usual color.
-(void) resetView
{
    UIImage *image = [UIImage imageNamed:@"Aqua.png"];
    
    [self.degree_one setBackgroundImage:image forState:UIControlStateNormal];
    [self.degree_two setBackgroundImage:image forState:UIControlStateNormal];
    [self.degree_three setBackgroundImage:image forState:UIControlStateNormal];
    
    [self.school_one setBackgroundImage:image forState:UIControlStateNormal];
    [self.school_two setBackgroundImage:image forState:UIControlStateNormal];
    [self.school_three setBackgroundImage:image forState:UIControlStateNormal];
    [self.school_four setBackgroundImage:image forState:UIControlStateNormal];
    [self.school_five setBackgroundImage:image forState:UIControlStateNormal];

}

// This method reset's the buttons in the Degree to the usual color.
-(void)resetDegreeButtons
{
    UIImage *image = [UIImage imageNamed:@"Aqua.png"];
    
    [self.degree_one setBackgroundImage:image forState:UIControlStateNormal];
    [self.degree_two setBackgroundImage:image forState:UIControlStateNormal];
    [self.degree_three setBackgroundImage:image forState:UIControlStateNormal];
}

// This method reset's the buttons in the School to the usual color.
-(void)resetSchoolButtons
{
    UIImage *image = [UIImage imageNamed:@"Aqua.png"];
    
    [self.school_one setBackgroundImage:image forState:UIControlStateNormal];
    [self.school_two setBackgroundImage:image forState:UIControlStateNormal];
    [self.school_three setBackgroundImage:image forState:UIControlStateNormal];
    [self.school_four setBackgroundImage:image forState:UIControlStateNormal];
    [self.school_five setBackgroundImage:image forState:UIControlStateNormal];
}

// This method is executed at the first to have a row with Name, Degree, School.
-(void)requiredMethod
{
    NSString * outputString = @"Name,Degree,School";
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDirectory = [paths objectAtIndex:0];
    
    NSString *outputFileName = [docDirectory stringByAppendingPathComponent:@"data.csv"];
    
    //Create an error incase something goes wrong
    NSError *csvError = NULL;
    
    //We write the string to a file and assign it's return to a boolean
    BOOL written = [outputString writeToFile:outputFileName atomically:YES encoding:NSUTF8StringEncoding error:&csvError];
    
    //If there was a problem saving we show the error if not show success and file path
    if (!written)
        NSLog(@"write failed, error=%@", csvError);
    else
        NSLog(@"Saved! File path");
}

@end
