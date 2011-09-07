//
//  toolbarAppDelegate.h
//  toolbar
//
//  Created by Mariya Starchevska on 9/5/11.
//  Copyright 2011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface toolbarAppDelegate : NSObject <UIApplicationDelegate> {
    MainViewController *mainViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
