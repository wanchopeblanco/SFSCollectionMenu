//
//  SFSMenuCell.m
//  SFSCollectionMenu
//
//  Created by BJ Miller on 9/7/13.
//  Copyright (c) 2013 Six Five Software, LLC. All rights reserved.
//

#import "SFSMenuCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation SFSMenuCell

- (id)initWithFrame:(CGRect)frame
{
    frame.size.height +=14;
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.layer.cornerRadius = 35.0f;
        self.contentView.layer.borderWidth = 0.0f;
        self.contentView.layer.borderColor = [UIColor whiteColor].CGColor;
        self.contentView.backgroundColor = [UIColor darkGrayColor];
        
        [self setAlpha:1.0];
        CGRect rect = self.bounds;
        rect.size.height -=14;
        
        self.backgroundImageView = [[UIImageView alloc] initWithFrame:rect];
        self.imageView = [[UIImageView alloc] initWithFrame:rect];
        self.title = [[UILabel alloc]initWithFrame:CGRectMake(0, self.bounds.size.height-14, self.bounds.size.width, 14)];
        
        [self.title setTextColor:[UIColor whiteColor]];
        [self.title setTextAlignment:NSTextAlignmentCenter];
        [self.title setFont:[UIFont fontWithName:@"HelveticaNeue" size:14]];
        [self.title setMinimumScaleFactor:0.7];
        
        [self addSubview:self.backgroundImageView];
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.title];
    }
    return self;
}

- (BOOL)isAccessibilityElement {
    return YES;
}

- (UIAccessibilityTraits)accessibilityTraits {
    return UIAccessibilityTraitButton;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    
    self.backgroundImageView.image = nil;
    self.imageView.image = nil;

    [self.imageView setFrame:self.bounds];
}

- (void)setBackgroundColorForCell:(UIColor *)color {
    self.contentView.backgroundColor = color;
}

- (void)setBackgroundImageForCell:(UIImage *)image {
    [self.backgroundImageView setImage:image];
}

- (void)setImageForCell:(UIImage *)image {
    CGPoint center = CGPointMake(self.imageView.frame.size.width / 2.0, self.imageView.frame.size.height / 2.0);
    CGFloat halfWidth = image.size.width / 2.0;
    CGFloat halfHeight = image.size.height / 2.0;
    CGPoint newOrigin = CGPointMake(center.x - halfWidth, center.y - halfHeight);
    
    [self.imageView setFrame:CGRectMake(newOrigin.x, newOrigin.y, image.size.width, image.size.height)];
    [self.imageView setImage:image];
}

- (void)setTitleForCell:(NSString *)title{
    [self.title setText:title];
}


@end
