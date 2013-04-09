//
//  PostDetailViewController.m
//  Community2
//
//  Created by 赵 峰 on 13-3-26.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import "PostDetailViewController.h"
#import "PostReplyOneData.h"
#import "ReplyEditViewController.h"


#define TABLEVIEW_TAG     101
#define POSTCELLVIEW_TAG  102
#define REPLYCELLVIEW_TAG 103

#define REPLY_SEGMENT_NUM   0

@interface PostDetailViewController ()

@end

@implementation PostDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UITableView *postDetailTable = (UITableView *)[self.view viewWithTag:TABLEVIEW_TAG];
    postDetailTable.delegate = self;
    postDetailTable.dataSource = self;
    
    _postDetailData = [[PostDetailData alloc] init];
    _repliesArray   = [_postDetailData.postDetailDic objectForKey:@"replys"];
    
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:[UIImage imageNamed:@"reply2.png"], [UIImage imageNamed:@"shortMessage1.png"], nil]];
    [segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    segmentedControl.frame = CGRectMake(0, 0, 90, 30);
	segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
	segmentedControl.momentary = YES;
    segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    UIBarButtonItem *segmentBarItem = [[UIBarButtonItem alloc] initWithCustomView:segmentedControl];
    self.navigationItem.rightBarButtonItem = segmentBarItem;
    segmentBarItem = nil;
    
}

- (void)segmentAction:(id)sender
{
    UISegmentedControl *sementedControl = (UISegmentedControl *)sender;
    if (sementedControl.selectedSegmentIndex == REPLY_SEGMENT_NUM) {
       
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        ReplyEditViewController *replyEditViewController = [storyboard instantiateViewControllerWithIdentifier:@"ReplyEditViewController"];
        
        [self.navigationController pushViewController:replyEditViewController animated:YES];
    }
    
    sementedControl = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {

    [super viewDidUnload];
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    if ([_repliesArray count] == 0)
    {
        return 1;
    }
    else
    {
        return 2;
    }
    
}

- (void)dealloc
{
    _postDetailData = nil;
    _repliesArray = nil;
    
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 1;
    }
    else if (section == 1)
    {
        return [_repliesArray count];
    }
    return 0;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *postCellIdentifier  = @"postDetailCellIdentifier";
    static NSString *replyCellIdentifier = @"postReplyCellIdentifier";
    
    if (indexPath.section == 0) {
        PostDetailTableViewCell *cell = (PostDetailTableViewCell *)[tableView dequeueReusableCellWithIdentifier:postCellIdentifier];
        if (cell == nil)
        {
            cell = (PostDetailTableViewCell *)[self.view viewWithTag:POSTCELLVIEW_TAG];
        }
        cell.postDetailTitleLabel.text = [_postDetailData.postDetailDic objectForKey:@"title"];
        cell.postDetailFloorLabel.text = [_postDetailData.postDetailDic objectForKey:@"floor"];
        cell.postDetailAuthorLabel.text = [_postDetailData.postDetailDic objectForKey:@"author"];
        cell.postDetailDateLabel.text = [_postDetailData.postDetailDic objectForKey:@"date"];
        cell.postDetailContentLabel.text = [_postDetailData.postDetailDic objectForKey:@"content"];
        cell.postDetailHeadImgView.image = [_postDetailData.postDetailDic objectForKey:@"headImg"];
        cell.postDetailImgView.image = [_postDetailData.postDetailDic objectForKey:@"contentImg"];
        UIFont *font = [UIFont systemFontOfSize:12];
        CGSize size = [cell.postDetailContentLabel.text sizeWithFont:font constrainedToSize:CGSizeMake(280.0f, 2000.0f) lineBreakMode:UILineBreakModeWordWrap];
        [cell.postDetailContentLabel setFont:[UIFont systemFontOfSize:12]];
        [cell.postDetailContentLabel setFrame:CGRectMake(20, 98, size.width + 10, size.height)];
        
        [cell.postDetailImgView setFrame:CGRectMake(20, 98 + 8 + size.height, 280, 80)];
        [cell setFrame:CGRectMake(cell.frame.origin.x, cell.frame.origin.y, cell.frame.size.width, cell.postDetailImgView.frame.origin.y + cell.postDetailImgView.frame.size.height + 8)];
        
        return cell;
        
    }
    else if (indexPath.section == 1)
    {
        PostReplyTableViewCell *cell = (PostReplyTableViewCell *)[tableView dequeueReusableCellWithIdentifier:replyCellIdentifier];
        if (cell == nil)
        {
            cell = (PostReplyTableViewCell *)[self.view viewWithTag:REPLYCELLVIEW_TAG];
        }
        PostReplyOneData *replyData = [_repliesArray objectAtIndex:indexPath.row];
        cell.postReplyAuthorLabel.text = replyData.replier;
        cell.postReplyContentLabel.text = replyData.content;
        cell.postReplyDateLabel.text = replyData.replyDate;
        cell.postReplyFloorLabel.text = replyData.floor;
        cell.postReplyHeadImgView.image = replyData.headImg;
        cell.postReplyImgView.image = replyData.contentImg;
        
        UIFont *font = [UIFont systemFontOfSize:12];
        CGSize size = [cell.postReplyContentLabel.text sizeWithFont:font constrainedToSize:CGSizeMake(280.0f, 2000.0f) lineBreakMode:UILineBreakModeWordWrap];
        [cell.postReplyContentLabel setFont:[UIFont systemFontOfSize:12]];
        [cell.postReplyContentLabel setFrame:CGRectMake(20, 56, size.width + 10, size.height)];
        cell.postReplyContentLabel.numberOfLines = 0;
        
        [cell.postReplyImgView setFrame:CGRectMake(20, 56 + 8 + size.height, 280, 80)];
        [cell setFrame:CGRectMake(cell.frame.origin.x, cell.frame.origin.y, cell.frame.size.width, cell.postReplyImgView.frame.origin.y + cell.postReplyImgView.frame.size.height + 8)];
        
        return cell;
    }
    
    return nil;
}



@end
