Custom UIToolbar
================

This is fully customizable analog of UIToolbar where you can use any toolbar background, and icons of any color.

Usage
-----

1. Copy CustomToolbar.h and CustomToolbar.m files to your project

2. Use the following functions:

    - `(id)initWithFrame:(CGRect)frame AndBackgroundColor:(UIColor*)bgColor;`
        
        creates toolbar of given size with custom background color

    - `(void)AddToolbarItemWithImage: (UIImage*)image Target:(id)target Selector:(SEL)selector;`
        
        adds button to toolbar

    - `(void)RemoveButtonAtIndex:(int)index;`
        
        removes button

    - `(void)ButtonAtIndex:(int)index SetEnabled:(BOOL)enabled;`
        
        enables/disables toolbar button

3. Call `AdjustExistingButtonsToFitWithCount:` function in willAnimateRotationToInterfaceOrientation to adjust buttons placement