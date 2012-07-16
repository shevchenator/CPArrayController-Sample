/*
 * AppController.j
 * CPArrayController excersice
 *
 * Created by You on July 14, 2012.
 * Copyright 2012, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>

@import "Views/PhotoView.j"
@import "Models/Photo.j"
@import "Controllers/PhotoGridController.j"

@implementation AppController : CPObject
{
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
        photoGridController = [[PhotoGridController alloc] init];

    [photoGridController setRepresentedObject:[self createContent]];

    [theWindow setContentView:[photoGridController view]];
    [theWindow orderFront:self];
}

- (CPArray)createContent
{
    var contentArray = [[CPArray alloc] init];
    contentArray = [ [[Photo alloc] initWithImageFilePath:@"Resources/sample1.jpg"],
                [[Photo alloc] initWithImageFilePath:@"Resources/sample2.jpg"] ];

    return contentArray;
}

@end
