//
//  MainFuncPostsView.m
//  Community2
//
//  Created by 赵 峰 on 13-3-14.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import "MainFuncPostsView.h"
#import "PostsListData.h"
#import "PostsListTableViewCell.h"
#import "PostDetailViewController.h"
#import "MainFuncViewController.h"

#define TEXTFIELDTAG	100
#define TOOLBARTAG		200
#define TABLEVIEWTAG	300
#define LOADINGVIEWTAG	400

@implementation MainFuncPostsView

- (void)setNavigationController:(UINavigationController *)naviCtler
{
    _navigationController = naviCtler;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self = [self init];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    return [self init];
}

- (id)init {
        
    //postsArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    postsArray = [[NSMutableArray alloc] initWithObjects:
                  [PostsListData dataWithText:@"今天上午十点开新区！？光明之龙，一起玩的进坑" postInfoBrief:@"小贝镇楼来挖坑" postAuth:@"蓝的蓝色的蓝" likeNum:100 replyNum:100],
                  [PostsListData dataWithText:@"熊人武士这个卡怎么样~" postInfoBrief:@"就是这个货…" postAuth:@"夜天使の瞬" likeNum:100 replyNum:100],
                  [PostsListData dataWithText:@"冥河与邪灵哪个好用？" postInfoBrief:@"我有个冥河和邪灵女巫，哪个好用些" postAuth:@"驭风and枫茗" likeNum:100 replyNum:100],
                  [PostsListData dataWithText:@"【直播贴】今日怒刷初始，不出天使不罢休。。。" postInfoBrief:@"一楼喂度娘" postAuth:@"晓美焰1026" likeNum:100 replyNum:100],
                  [PostsListData dataWithText:@"金属的进来交流通关技巧，妹子在线交流" postInfoBrief:@"我二十现在除了一张剑圣，其他都是三星，国王，森林，地狱的杂牌组合，卡在六一了" postAuth:@"宫娅莉" likeNum:100 replyNum:100],
                  [PostsListData dataWithText:@"我这到底算脸黑不黑来？" postInfoBrief:@"完了魔卡一个月了。。现在32级，只有一张4星的卫队将领，五星一张木有~推图推到6图全完，我到底算是人品如何啊~" postAuth:@"towaever" likeNum:100 replyNum:100],
                  [PostsListData dataWithText:@"掩耳盗铃(金属区怒喷屌丝大联盟团长肥仔）" postInfoBrief:@"题诗一首 感谢屌丝大联盟装逼的辛苦。\r\n" postAuth:@"ok想来" likeNum:100 replyNum:100],
                  [PostsListData dataWithText:@"求教同台苹果手机上可以登录多个帐号吗" postInfoBrief:@"目前有个直接登录的大号，想去新区开个注册帐号的小号，求救在一个手机上可以吗？" postAuth:@"sy870404" likeNum:100 replyNum:100],
                  [PostsListData dataWithText:@"完不成险中求胜的进 我帮你们配卡" postInfoBrief:@"有谁完不成险中求胜" postAuth:@"suoyingshuai" likeNum:100 replyNum:100],
                  nil];
    
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, self.frame.size.height) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    //tableView.backgroundColor = [UIColor colorWithRed:0.859f green:0.886f blue:0.929f alpha:1.0f];
    tableView.backgroundColor = [UIColor clearColor];
    tableView.tag = TABLEVIEWTAG;
    [self addSubview:tableView];
	
	return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [postsArray count];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//	UIView *chatView = [[postsArray objectAtIndex:[indexPath row]] objectForKey:@"view"];
//	return chatView.frame.size.height+10.0f;
    return 85;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"PostsListTableViewCellIdentifier";
    
    PostsListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
//        cell = [[PostsListTableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier];
//        
//		cell.backgroundColor = [UIColor colorWithRed:0.859f green:0.886f blue:0.929f alpha:1.0f];
		//cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [[NSBundle mainBundle] loadNibNamed:@"PostsListTableViewCell" owner:self options:nil];
        cell = postsListCell;
    }
    
    // Set up the cell...
//	NSDictionary *chatInfo = [postsArray objectAtIndex:[indexPath row]];
//	for(UIView *subview in [cell.contentView subviews])
//		[subview removeFromSuperview];
//	[cell.contentView addSubview:[chatInfo objectForKey:@"view"]];
    cell.postListTitleLabel.text = ((PostsListData *)[postsArray objectAtIndex:[indexPath row]]).postTitle;
    cell.postListInfoBriefLabel.text = ((PostsListData *)[postsArray objectAtIndex:[indexPath row]]).postInfoBrief;
    cell.postListAuth.text = ((PostsListData *)[postsArray objectAtIndex:[indexPath row]]).postAuth;
    cell.likeNumLabel.text = [NSString stringWithFormat:@"%d", ((PostsListData *)[postsArray objectAtIndex:[indexPath row]]).likeNum];
    cell.replayNumLabel.text = [NSString stringWithFormat:@"%d", ((PostsListData *)[postsArray objectAtIndex:[indexPath row]]).replyNum];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    PostDetailViewController *postDetailViewController = [storyboard instantiateViewControllerWithIdentifier:@"PostDetailView"];
    
    // ...
    // Pass the selected object to the new view controller.
    [_navigationController pushViewController:postDetailViewController animated:YES];
    
    
}



@end
