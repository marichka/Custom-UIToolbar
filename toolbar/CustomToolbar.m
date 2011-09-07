//
//  CustomToolbar.m
//  toolbar
//
//  Created by Mariya Starchevska on 9/5/11.
//  Copyright 2011. All rights reserved.
//

#import "CustomToolbar.h"

#define TOP_MARGIN 5.0
#define BOTTOM_MARGIN 5.0
#define HOR_MARGIN 5.0

@implementation CustomToolbar

@synthesize ToolbarItems;

- (id)initWithFrame:(CGRect)frame AndBackgroundColor:(UIColor*)bgColor
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = bgColor;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        ToolbarItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;
{
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(void)ButtonAtIndex:(int)index SetEnabled:(BOOL)enabled
{
    [[self.ToolbarItems objectAtIndex:index] setEnabled:enabled];
}

-(void)RemoveButtonAtIndex:(int)index
{
    if (index < [self.ToolbarItems count]-1)
    {
        [[self.ToolbarItems objectAtIndex:index] removeFromSuperview];
        [self.ToolbarItems removeObjectAtIndex:index];
        [self AdjustExistingButtonsToFitWithCount:[self.ToolbarItems count]];
    }
    else if (index == [self.ToolbarItems count]-1)
    {
        [[self.ToolbarItems objectAtIndex:index] removeFromSuperview];
        [self.ToolbarItems removeObjectAtIndex:index];
    }
}

-(float)AdjustExistingButtonsToFitWithCount:(int)count
{
    if (count == 0)
        return 0;
    
    CGSize ButtonSize = CGSizeMake( (self.frame.size.width - HOR_MARGIN*(count+1))/(count), self.frame.size.height-TOP_MARGIN-BOTTOM_MARGIN);
    
    float x_coord = HOR_MARGIN;
    
    for (int i=0; i<[self.ToolbarItems count]; i++)
    {
        UIButton *ToolbarBtn = [self.ToolbarItems objectAtIndex:i];
        
        [ToolbarBtn setFrame: CGRectMake((int)x_coord, (int)TOP_MARGIN, (int)ButtonSize.width, (int)ButtonSize.height)];
        
        UIImage *ToolbarBtnImg = ToolbarBtn.imageView.image;
        if (ToolbarBtnImg.size.width > ButtonSize.width)
        {
            ToolbarBtnImg = [self imageWithImage:ToolbarBtnImg scaledToSize:CGSizeMake(ButtonSize.width, (ButtonSize.width*ToolbarBtnImg.size.height)/ToolbarBtnImg.size.width)];
            [ToolbarBtn setImage:ToolbarBtnImg forState:UIControlStateNormal];
        }
        x_coord += HOR_MARGIN + ButtonSize.width;
    }
    
    return x_coord;
}

-(void)AddToolbarItemWithImage: (UIImage*)image Target:(id)target Selector:(SEL)selector
{
    float x_coord = [self AdjustExistingButtonsToFitWithCount:[self.ToolbarItems count]+1];
    CGSize ButtonSize = CGSizeMake( (self.frame.size.width - HOR_MARGIN*([self.ToolbarItems count]+2))/([self.ToolbarItems count]+1), self.frame.size.height-TOP_MARGIN-BOTTOM_MARGIN);
    
    UIButton *NewToolbarBtn = [[UIButton alloc]initWithFrame:CGRectMake((int)x_coord, (int)TOP_MARGIN, (int)ButtonSize.width, (int)ButtonSize.height)];
    NewToolbarBtn.showsTouchWhenHighlighted = YES;
    NewToolbarBtn.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    float img_width = image.size.width;
    float img_height = image.size.height;
    
    if (img_width > ButtonSize.width)
    {
        img_height = (img_height*ButtonSize.width)/img_width;
        img_width = ButtonSize.width;
        image = [self imageWithImage:image scaledToSize:CGSizeMake(img_width, img_height)];
    }

    if (img_height > ButtonSize.height)
    {
        img_width = (img_width*ButtonSize.height)/img_height;
        img_height = ButtonSize.height;
        image = [self imageWithImage:image scaledToSize:CGSizeMake(img_width, img_height)];
    }
    
    [NewToolbarBtn setImage:image forState:UIControlStateNormal];
    [NewToolbarBtn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [self.ToolbarItems addObject:NewToolbarBtn];
    [self addSubview:NewToolbarBtn];

    [NewToolbarBtn release];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc
{
    [ToolbarItems release];
    [super dealloc];
}

@end
