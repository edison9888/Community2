//
//  PostReplyOneData.m
//  Community2
//
//  Created by 赵 峰 on 13-3-27.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import "PostReplyOneData.h"

@implementation PostReplyOneData

-(id) initWithData:(NSString *)replier replyDate:(NSString *)replyDate floor:(NSString *)floor content:(NSString *)content headImg:(UIImage *)headImg contentImg:(UIImage *)contentImg;

+(id) initWithSelfData:(NSString *)replier replyDate:(NSString *)replyDate floor:(NSString *)floor content:(NSString *)content headImg:(UIImage *)headImg contentImg:(UIImage *)contentImg;
{
    return [self initWith];
}
@end
