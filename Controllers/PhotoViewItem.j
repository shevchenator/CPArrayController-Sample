@import <AppKit/CPCollectionViewItem.j>

@import "../Views/PhotoView.j"
@import "../Models/Photo.j"

@implementation PhotoViewItem : CPCollectionViewItem
{
}

- (void)loadView
{
    var photoView = [[PhotoView alloc] init];
    [self setView:photoView];
}

- (void)setSelected:(BOOL)isSelected
{
    [[self view] setBackgroundColor:isSelected ? [CPColor blueColor] : nil];
}

- (void)setRepresentedObject:(Photo)aPhoto
{
    var photoView = [self view],
        imageView = [photoView imageView];
    [imageView setImage:[[CPImage alloc] initWithContentsOfFile:[aPhoto imageFilePath]]];
    [[[self view] title] setStringValue:[aPhoto name]];
}

@end
