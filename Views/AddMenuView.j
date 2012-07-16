@import <AppKit/CPView.j>

@implementation AddMenuView : CPView
{
    CPTextField textField @accessors(readonly);
    CPButton    button @accessors(readonly);
}

- (id)initWithFrame:(CGRect)aFrame
{
    self = [super initWithFrame:aFrame];

    if (self)
    {
        textField = [[CPTextField alloc] init];
        [self addSubview:textField];
        button = [[CPButton alloc] init];
        [self addSubview:button];
    }

    return self;
}

- (void)layoutSubviews
{
    var bounds = [self bounds];
    [textField setFrame:CGRectMake(CGRectGetMinX(bounds) + 10,
                                    CGRectGetMinY(bounds) + 10,
                                    CGRectGetWidth(bounds) - 20,
                                    20)];
    [textField setEditable:YES];
    [textField setBackgroundColor:[CPColor whiteColor]];

    [button setFrame:CGRectMake(CGRectGetMaxX(bounds) - 50,
                                CGRectGetMaxY(bounds) - 30,
                                40,
                                20)];
    [button setTitle:@"Add"];
    [button sizeToFit];
}
