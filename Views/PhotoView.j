@import <AppKit/CPView.j>

@implementation PhotoView : CPView
{
    CPImageView imageView @accessors(readonly);
    CPTextField title @accessors(readonly);
}

- (id)initWithFrame:(CGRect)aFrame
{
    self = [super initWithFrame:aFrame];

    if (self)
    {
        imageView = [[CPImageView alloc] init];
        [self addSubview:imageView];
        title = [[CPTextField alloc] init];
        [self addSubview:title];
    }

    return self;
}

- (void)layoutSubviews
{
    var bounds = [self bounds];
    [imageView setFrame:CGRectMake(CGRectGetMinX(bounds) + 5,
                                    CGRectGetMinY(bounds) + 5,
                                    CGRectGetWidth(bounds) - 10,
                                    CGRectGetHeight(bounds) - 20)];
    [imageView setImageScaling:CPScaleProportionally];

    [title setFrame:CGRectMake(CGRectGetMinX(bounds),
                                CGRectGetMaxY(bounds) - 15,
                                CGRectGetWidth(bounds),
                                15)];
    [title setAlignment:CPCenterTextAlignment];

}

@end
