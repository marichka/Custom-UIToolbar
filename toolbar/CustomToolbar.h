//
//  CustomToolbar.h
//  toolbar
//
//  Created by Mariya Starchevska on 9/5/11.
//  Copyright 2011. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CustomToolbar : UIView {
    
    NSMutableArray *ToolbarItems;
}

@property (readonly) NSMutableArray *ToolbarItems;

- (id)initWithFrame:(CGRect)frame AndBackgroundColor:(UIColor*)bgColor;
- (void)AddToolbarItemWithImage: (UIImage*)image Target:(id)target Selector:(SEL)selector;
- (void)ButtonAtIndex:(int)index SetEnabled:(BOOL)enabled;
- (void)RemoveButtonAtIndex:(int)index;

- (float)AdjustExistingButtonsToFitWithCount:(int)count;

@end
