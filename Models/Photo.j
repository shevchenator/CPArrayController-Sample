@import <Foundation/CPObject.j>

@implementation Photo : CPObject
{
    CPString    name @accessors;
    CPString    imageFilePath @accessors;
}

- (id)initWithImageFilePath:(CPString)aFilePath
{
    self = [super init];

    if (self)
    {

        [self setImageFilePath:aFilePath];
        [self setName:[self getImageNameFromPath:aFilePath]];
    }

    return self;
}

-  (CPString)getImageNameFromPath:(CPString)aPath
{
    return [[aPath lastPathComponent] stringByDeletingPathExtension];
}

@end
