//
//  PostsListData.h
//  Community2
//
//  Created by 赵 峰 on 13-3-25.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PostsListData : NSObject

@property (nonatomic, copy)NSString *postTitle;
@property (nonatomic, copy)NSString *postInfoBrief;
@property (nonatomic, copy)NSString *postAuth;
@property (nonatomic, assign)NSInteger likeNum;
@property (nonatomic, assign)NSInteger replyNum;

+(id)dataWithText:(NSString *)postTitle postInfoBrief:(NSString *)postInfoBrief postAuth:(NSString *)postAuth likeNum:(NSInteger) likeNum replyNum:(NSInteger)replyNum;

-(id)initWithData:(NSString *)postTitle postInfoBrief:(NSString *)postInfoBrief postAuth:(NSString *)postAuth likeNum:(NSInteger) likeNum replyNum:(NSInteger)replyNum;

@end
