//
//  PostReplyOneData.h
//  Community2
//
//  Created by 赵 峰 on 13-3-27.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PostReplyOneData : NSObject

@property (nonatomic, strong) NSString *replier;
@property (nonatomic, strong) NSString *replyDate;
@property (nonatomic, strong) NSString *floor;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) UIImage  *headImg;
@property (nonatomic, strong) UIImage  *contentImg;

-(id) initWithData:(NSString *)t_replier replyDate:(NSString *)t_replyDate floor:(NSString *)t_floor content:(NSString *)t_content headImg:(UIImage *)t_headImg contentImg:(UIImage *)t_contentImg;

+(id) initWithSelfData:(NSString *)replier replyDate:(NSString *)replyDate floor:(NSString *)floor content:(NSString *)content headImg:(UIImage *)headImg contentImg:(UIImage *)contentImg;
@end
