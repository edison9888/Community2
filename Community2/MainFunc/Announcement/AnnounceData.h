//
//  AnnounceData.h
//  Community2
//
//  Created by 赵 峰 on 13-4-16.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnnounceData : NSObject

@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) NSInteger aheadOfAlarm;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, assign) NSInteger isNeedAlarm;
@property (nonatomic, assign) NSInteger isFinished;
@property (nonatomic, assign) NSInteger isExpired;
@property (nonatomic, strong) NSString *guildName;

-(id)initWithData:(NSString *)tmpDate title:(NSString *)tmpTitle aheadOfAlarm:(NSInteger)tmpAheadOfAlarm content:(NSString *)tmpContent isNeedAlarm:(NSInteger)tmpIsNeedAlarm isFinished:(NSInteger)tmpIsFinished isExpired:(NSInteger)tmpIsExpired guildName:(NSString *)tmpGuildName;

@end
