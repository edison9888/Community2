//
//  PostsListData.m
//  Community2
//
//  Created by 赵 峰 on 13-3-25.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import "PostsListData.h"

@implementation PostsListData

+(id)dataWithText:(NSString *)postTitle postInfoBrief:(NSString *)postInfoBrief postAuth:(NSString *)postAuth likeNum:(NSInteger) likeNum replyNum:(NSInteger)replyNum
{
    return [[PostsListData alloc] initWithData:postTitle postInfoBrief:postInfoBrief postAuth:postAuth likeNum:likeNum replyNum:replyNum];
}

-(id)initWithData:(NSString *)postTitle postInfoBrief:(NSString *)postInfoBrief postAuth:(NSString *)postAuth likeNum:(NSInteger) likeNum replyNum:(NSInteger)replyNum
{
    self = [super init];
    if (self)
    {
        self.postTitle = postTitle;
        self.postInfoBrief = postInfoBrief;
        self.postAuth = postAuth;
        self.likeNum = likeNum;
        self.replyNum = replyNum;
    }
    
    return self;
}

-(void) dealloc
{
    [self setLikeNum:0];
    [self setReplyNum:0];
    [self setPostAuth:nil];
    [self setPostInfoBrief:nil];
    [self setPostTitle:nil];

}


@end
