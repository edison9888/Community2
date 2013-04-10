//
//  PostReplyTableViewCell.m
//  Community2
//
//  Created by 赵 峰 on 13-3-27.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import "PostReplyTableViewCell.h"

@implementation PostReplyTableViewCell

@synthesize contentRichTextView, postReplyAuthorLabel, postReplyContentLabel, postReplyDateLabel, postReplyFloorLabel, postReplyHeadImgView, postReplyImgView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (int)setContentRichView:(RichTextView *)contentView
{
    self.contentRichTextView = nil;
    NSArray *subViewsArray = [self.postReplyContentLabel subviews];
    for (id subView in subViewsArray) {
        
        if ([subView isKindOfClass:[RichTextView class]])
        {
            [subView removeFromSuperview];
        }
    }
    self.contentRichTextView = contentView;
    [self.postReplyContentLabel addSubview:self.contentRichTextView];
    
    return 0;
}

-(void)dealloc
{
    self.postReplyAuthorLabel = nil;
    self.postReplyDateLabel = nil;
    self.postReplyContentLabel = nil;
    self.postReplyFloorLabel = nil;
    self.postReplyHeadImgView = nil;
    self.postReplyImgView = nil;
    self.contentRichTextView = nil;
}

@end
