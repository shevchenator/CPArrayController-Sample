@import <AppKit/CPView.j>

@import "../Controllers/PhotoViewItem.j"
@import "AddMenuView.j"

@implementation PhotoGridView : CPView
{
    CPCollectionView    collectionView @accessors(readonly);
    CPButton            addButton @accessors(readonly);
    CPButton            deleteButton @accessors(readonly);
    CPWindow            dialogWindow @accessors(readonly);
}

- (id)initWithFrame:(CGRect)aFrame
{
    self = [super initWithFrame:aFrame];

    if (self)
    {
        collectionView = [[CPCollectionView alloc] init];
        [self addSubview:collectionView];
        addButton = [[CPButton alloc] init];
        [self addSubview:addButton];
        deleteButton = [[CPButton alloc] init];
        [self addSubview:deleteButton];
        dialogWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPClosableWindowMask];
    }

    return self;
}

- (void)layoutSubviews
{
    var bounds = [self bounds];

    [collectionView setFrame:bounds];
    [collectionView setAutoresizingMask:CPViewWidthSizable];
    [collectionView setMinItemSize:CGSizeMake(200, 200)];
    [collectionView setMaxItemSize:CGSizeMake(200, 200)];

    var itemPrototype = [[PhotoViewItem alloc] init];

    [collectionView setItemPrototype:itemPrototype];

    var scrollView = [[CPScrollView alloc] initWithFrame:bounds];

    [scrollView setDocumentView:collectionView];
    [scrollView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
    [scrollView setAutohidesScrollers:YES];

    [[scrollView contentView] setBackgroundColor:[CPColor whiteColor]];

    [self addSubview:scrollView];

    [addButton setFrame:CGRectMake(CGRectGetMinX(bounds) + 10,
                                    CGRectGetMaxY(bounds) - 30,
                                    0,
                                    0)];
    [addButton setTitle:@"Add Image"];
    [addButton sizeToFit];
    [self addSubview:addButton];

    [deleteButton setFrame:CGRectMake(CGRectGetMaxX([addButton frame]) + 10,
                                        CGRectGetMinY([addButton frame]),
                                        0,
                                        0)];
    [deleteButton setTitle:@"Delete Image"];
    [deleteButton sizeToFit];

    [dialogWindow setFrame:CGRectMake(CGRectGetWidth(bounds) / 2 - 150,
                                        CGRectGetHeight(bounds) / 2 - 50,
                                        300,
                                        100)];

    [dialogWindow setContentView:[[AddMenuView alloc] init]];

    [self addSubview:deleteButton];
}

@end

