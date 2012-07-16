@import <AppKit/CPViewController.j>

@import "../Views/PhotoGridView.j"
@import "../Models/Photo.j"

@implementation PhotoGridController : CPViewController
{
    CPArrayController arrayController @accessors(readonly);
}

- (id)init
{
    self = [super init];

    if (self)
    {
        arrayController = [CPArrayController new];
    }

    return self;
}

- (void)loadView
{
    var photoGrid = [[PhotoGridView alloc] init],
        collectionView = [photoGrid collectionView];

    [arrayController bind:@"contentArray" toObject:self withKeyPath:@"representedObject" options:nil];

    [collectionView bind:@"content" toObject:arrayController withKeyPath:@"arrangedObjects" options:nil];

    [arrayController bind:@"selectionIndexes" toObject:collectionView withKeyPath:@"selectionIndexes" options:nil];

    [[photoGrid addButton] setTarget:self];
    [[photoGrid addButton] setAction:@selector(showAddPhotoDialog:)];

    [[photoGrid deleteButton] setTarget:self];
    [[photoGrid deleteButton] setAction:@selector(removePhoto:)];

    [self setView:photoGrid];
}

- (void)removePhoto:(id)sender
{
    [arrayController removeObjectsAtArrangedObjectIndexes:[arrayController selectionIndexes]];
}

- (void)showAddPhotoDialog:(id)sender
{
    var addDialogWindow = [[self view] dialogWindow];
    [addDialogWindow setContentView:[[AddMenuView alloc] init]];

    [[[addDialogWindow contentView] button] setTarget:self];
    [[[addDialogWindow contentView] button] setAction:@selector(addPhoto:)];

    [addDialogWindow orderFront:self];
}

- (void)addPhoto:(id)sender
{
    [[[self view] dialogWindow] close];

    var imagePath = [[[[[self view] dialogWindow] contentView] textField] stringValue];
    [arrayController addObject:[[Photo alloc] initWithImageFilePath:imagePath]];
}

@end
