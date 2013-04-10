//
//  PostDetailData.h
//  Community2
//
//  Created by 赵 峰 on 13-3-27.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PostDetailData : NSObject

@property (nonatomic, strong)NSMutableDictionary *postDetailDic;

- (int)addNewReplyData:(NSString *)replayMessage;
@end
