//
//  PostReplyOneData.m
//  Community2
//
//  Created by 赵 峰 on 13-3-27.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import "PostReplyOneData.h"

@implementation PostReplyOneData
@synthesize replier, replyDate, floor, content, headImg, contentImg;

-(id) initWithData:(NSString *)t_replier replyDate:(NSString *)t_replyDate floor:(NSString *)t_floor content:(NSString *)t_content headImg:(UIImage *)t_headImg contentImg:(UIImage *)t_contentImg
{
    self = [self init];
    
    if (self)
    {
        self.replier = t_replier;
        self.replyDate = t_replyDate;
        self.floor = t_floor;
        self.content = t_content;
        self.headImg = t_headImg;
        self.contentImg = t_contentImg;
    }
    
    return  self;
}

+(id) initWithSelfData:(NSString *)replier replyDate:(NSString *)replyDate floor:(NSString *)floor content:(NSString *)content headImg:(UIImage *)headImg contentImg:(UIImage *)contentImg;
{
    return [[PostReplyOneData alloc] initWithData:replier replyDate:replyDate floor:floor content:content headImg:headImg contentImg:contentImg];
}

- (void)dealloc
{
    [self setReplier:nil];
    [self setReplyDate:nil];
    [self setFloor:nil];
    [self setContent:nil];
    [self setHeadImg:nil];
    [self setContentImg:nil];
}
@end
