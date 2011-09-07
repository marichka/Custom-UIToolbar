//
//  MainViewController.m
//  toolbar
//
//  Created by Mariya Starchevska on 9/5/11.
//  Copyright 2011. All rights reserved.
//

#import "MainViewController.h"


@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

-(void)DisplayAlertWithText:(NSString*)text
{
    [[[[UIAlertView alloc]initWithTitle:@"Test" message:[NSString stringWithFormat:@"%@ selected", text] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil]autorelease]show];
}

-(void)FirstButtonPressed
{
    [self DisplayAlertWithText:@"grapefruit"];
}

-(void)SecondButtonPressed
{
    [self DisplayAlertWithText:@"kiwi"];
}

-(void)ThirdButtonPressed
{
    [self DisplayAlertWithText:@"watermelon"];
}

-(void)FourthButtonPressed
{
    [self DisplayAlertWithText:@"lime"];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    float toolbarHeight = 44.0;
    
    //Create custom toolbar with given frame and custom background color
    
    myToolbar = [[CustomToolbar alloc]initWithFrame:CGRectMake(0.0, self.view.frame.size.height - toolbarHeight, self.view.frame.size.width, toolbarHeight) 
                                                AndBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"toolbar_bg.png"]]];
    [self.view addSubview:myToolbar];
    
    //Add toolbar buttons
    
    [myToolbar AddToolbarItemWithImage:[UIImage imageNamed:@"grapefruit.png"] Target:self Selector:@selector(FirstButtonPressed)];
    [myToolbar AddToolbarItemWithImage:[UIImage imageNamed:@"kiwi.png"] Target:self Selector:@selector(SecondButtonPressed)];
    [myToolbar AddToolbarItemWithImage:[UIImage imageNamed:@"watermelon.png"] Target:self Selector:@selector(ThirdButtonPressed)];
    [myToolbar AddToolbarItemWithImage:[UIImage imageNamed:@"lime.png"] Target:self Selector:@selector(FourthButtonPressed)];
    
    
    //enable/disable buttons:
    //[myToolbar ButtonAtIndex:1 SetEnabled:NO];
    
    //remove button:
    //[myToolbar RemoveButtonAtIndex:1];
    
    [myToolbar release];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;//(interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation) interfaceOrientation duration:(NSTimeInterval)duration 
{
    [myToolbar AdjustExistingButtonsToFitWithCount:[myToolbar.ToolbarItems count]];
}
@end
