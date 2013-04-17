//
//  AnnounceData.m
//  Community2
//
//  Created by 赵 峰 on 13-4-16.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import "AnnounceData.h"

@implementation AnnounceData
@synthesize date, title, aheadOfAlarm, content, isExpired, isFinished, isNeedAlarm, guildName;

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(id)initWithData:(NSString *)tmpDate title:(NSString *)tmpTitle aheadOfAlarm:(NSInteger)tmpAheadOfAlarm content:(NSString *)tmpContent isNeedAlarm:(NSInteger)tmpIsNeedAlarm isFinished:(NSInteger)tmpIsFinished isExpired:(NSInteger)tmpIsExpired guildName:(NSString *)tmpGuildName
{
    self = [super init];
    if (self) {
        
        self.date = tmpDate;
        self.title = tmpTitle;
        self.aheadOfAlarm = tmpAheadOfAlarm;
        self.content = tmpContent;
        self.isNeedAlarm = tmpIsNeedAlarm;
        self.isFinished = tmpIsFinished;
        self.isExpired = tmpIsExpired;
        self.guildName = tmpGuildName;
    }
    return self;    
}

-(void)dealloc
{
    self.date = nil;
    self.title = nil;
    self.content = nil;
}


@end
