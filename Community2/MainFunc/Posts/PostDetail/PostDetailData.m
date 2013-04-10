//
//  PostDetailData.m
//  Community2
//
//  Created by 赵 峰 on 13-3-27.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import "PostDetailData.h"
#import "PostReplyOneData.h"

@implementation PostDetailData
@synthesize postDetailDic;

- (id)init
{
    self = [super init];
    if (self) {
        self.postDetailDic = nil;
        self.postDetailDic = [[NSMutableDictionary alloc] init];
        [self.postDetailDic setObject:@"Title1" forKey:@"title"];
        [self.postDetailDic setObject:@"zhaofeng" forKey:@"author"];
        [self.postDetailDic setObject:@"2013-03-27 16:09" forKey:@"date"];
        [self.postDetailDic setObject:@"1楼" forKey:@"floor"];
        [self.postDetailDic setObject:@"一楼祝进来回答的男的娶个美腻的妹纸,女的嫁个好老公!Q请壮我武吧。顺便围观混脸熟。笑摸楼下狗头.1.女生答: 喜欢平凡的日子吗.2.男生答: 喜欢黑丝袜吗.3.男女生答: 喜欢一个人只看外貌吗?5.爆出你的外号.(都要说.大荒芜碑镇压异魔王的时间已经超过三年，即使有冰主的一些压制，但还是让异魔王反噬的不堪，即使林动现在得到了两道祖符，但是异魔王的实力也得到了很强大的回复，林动现在真的还能凭借两道祖符之力抹杀异魔王吗？（转）放下手中的卫生纸，我来教你做一个男神！乱七八糟的一天，白痴的春游！" forKey:@"content"];
        [self.postDetailDic setObject:[UIImage imageNamed:@"guildImg.jpg"] forKey:@"headImg"];
        [self.postDetailDic setObject:[UIImage imageNamed:@"guildImg2.jpg"] forKey:@"contentImg"];
        NSMutableArray *replyArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < 5; i++)
        {
//            PostReplyOneData *postReply = [PostReplyOneData initWithSelfData:@"赵峰" replyDate:@"2013-03-27 18:11" floor:[[NSString alloc] initWithFormat:@"%i楼", i+2] content:@"十五字，经验到手，你妈没到。。。。。fjdsakljflkasjfl;kasjflk;sdajflkjasdlkfjsdalkfjsadlkjfsdal;" headImg:[UIImage imageNamed:@"guildImg.jpg"] contentImg:[UIImage imageNamed:@"guildImg2.jpg"]];
            
            PostReplyOneData *postReply = [PostReplyOneData initWithSelfData:@"赵峰" replyDate:@"2013-03-27 18:11" floor:[[NSString alloc] initWithFormat:@"%i楼", i+2] content:@"十五字" headImg:[UIImage imageNamed:@"guildImg.jpg"] contentImg:[UIImage imageNamed:@"guildImg2.jpg"]];
            [replyArray addObject:postReply];
        }
        [self.postDetailDic setObject:replyArray forKey:@"replys"];

    }
    return self;
}

- (int)addNewReplyData:(NSString *)replayMessage
{
    NSMutableArray *replyArray = [self.postDetailDic objectForKey:@"replys"];
    
    PostReplyOneData *postReply = [PostReplyOneData initWithSelfData:@"赵峰" replyDate:@"2013-03-27 18:11" floor:[[NSString alloc] initWithFormat:@"%i楼", [replyArray count]+2] content:replayMessage headImg:[UIImage imageNamed:@"guildImg.jpg"] contentImg:[UIImage imageNamed:@"guildImg2.jpg"]];
    
    [replyArray addObject:postReply];
    
    [self.postDetailDic setObject:replyArray forKey:@"replys"];
    
    return 0;
}

@end
