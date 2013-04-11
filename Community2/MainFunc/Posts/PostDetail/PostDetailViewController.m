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
#import "RichTextView.h"
#import "PostDetailPopContentViewController.h"


#define TABLEVIEW_TAG     101
#define POSTCELLVIEW_TAG  102
#define REPLYCELLVIEW_TAG 103

#define REPLY_SEGMENT_NUM   0
#define POPUP_SEGMENT_NUM   1

@interface PostDetailViewController ()

@end

@implementation PostDetailViewController

@synthesize popoverController;

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

/**
 Thanks to Paul Solt for supplying these background images and container view properties
 */
- (WEPopoverContainerViewProperties *)improvedContainerViewProperties {
	
	WEPopoverContainerViewProperties *props = [WEPopoverContainerViewProperties alloc];
	NSString *bgImageName = nil;
	CGFloat bgMargin = 0.0;
	CGFloat bgCapSize = 0.0;
	CGFloat contentMargin = 4.0;
	
	bgImageName = @"popoverBg.png";
	
	// These constants are determined by the popoverBg.png image file and are image dependent
	bgMargin = 13; // margin width of 13 pixels on all sides popoverBg.png (62 pixels wide - 36 pixel background) / 2 == 26 / 2 == 13
	bgCapSize = 31; // ImageSize/2  == 62 / 2 == 31 pixels
	
	props.leftBgMargin = bgMargin;
	props.rightBgMargin = bgMargin;
	props.topBgMargin = bgMargin;
	props.bottomBgMargin = bgMargin;
	props.leftBgCapSize = bgCapSize;
	props.topBgCapSize = bgCapSize;
	props.bgImageName = bgImageName;
	props.leftContentMargin = contentMargin;
	props.rightContentMargin = contentMargin - 1; // Need to shift one pixel for border to look correct
	props.topContentMargin = contentMargin;
	props.bottomContentMargin = contentMargin;
	
	props.arrowMargin = 4.0;
	
	props.upArrowImageName = @"popoverArrowUp.png";
	props.downArrowImageName = @"popoverArrowDown.png";
	props.leftArrowImageName = @"popoverArrowLeft.png";
	props.rightArrowImageName = @"popoverArrowRight.png";
	return props;
}

- (void)segmentAction:(id)sender
{
    UISegmentedControl *sementedControl = (UISegmentedControl *)sender;
    if (sementedControl.selectedSegmentIndex == REPLY_SEGMENT_NUM) {
       
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        ReplyEditViewController *replyEditViewController = [storyboard instantiateViewControllerWithIdentifier:@"ReplyEditViewController"];
        
        replyEditViewController.ownerDelegate = self;
        
        [self.navigationController pushViewController:replyEditViewController animated:YES];
    }
    else if(sementedControl.selectedSegmentIndex == POPUP_SEGMENT_NUM)
    {
        if (!self.popoverController)
        {
            
            UIViewController *contentViewController = [[PostDetailPopContentViewController alloc] initWithStyle:UITableViewStylePlain];
            self.popoverController = [[WEPopoverController alloc] initWithContentViewController:contentViewController];
            self.popoverController.delegate = self;
            self.popoverController.passthroughViews = [NSArray arrayWithObject:self.navigationController.navigationBar];
            
            CGRect frame = sementedControl.frame;
            CGRect rect = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width / sementedControl.numberOfSegments, frame.size.height);
            
            rect.origin.x = rect.origin.x + frame.size.width / sementedControl.numberOfSegments * sementedControl.selectedSegmentIndex;
            
            if ([self.popoverController respondsToSelector:@selector(setContainerViewProperties:)]) {
                [self.popoverController setContainerViewProperties:[self improvedContainerViewProperties]];
            }
            
            [self.popoverController presentPopoverFromRect:rect
                                                    inView:sementedControl
                                  permittedArrowDirections:(UIPopoverArrowDirectionUp|UIPopoverArrowDirectionDown)
                                                  animated:YES];
            
            contentViewController = nil;
        }
        else
        {
            [self.popoverController dismissPopoverAnimated:YES];
            self.popoverController = nil;
        }
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

- (void)dealloc
{
    _postDetailData = nil;
    _repliesArray = nil;
    self.popoverController = nil;
}

- (int)addNewReply:(NSString *)replayMessage
{
    [_postDetailData addNewReplyData:replayMessage];
    _repliesArray = [_postDetailData.postDetailDic objectForKey:@"replys"];
    
    UITableView *postDetailTable = (UITableView *)[self.view viewWithTag:TABLEVIEW_TAG];
    [postDetailTable reloadData];
    postDetailTable = nil;
    
    return 0;
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
        
//        UIFont *font = [UIFont systemFontOfSize:12];
//        CGSize size = [cell.postReplyContentLabel.text sizeWithFont:font constrainedToSize:CGSizeMake(280.0f, 2000.0f) lineBreakMode:UILineBreakModeWordWrap];
//        [cell.postReplyContentLabel setFont:[UIFont systemFontOfSize:12]];
//        [cell.postReplyContentLabel setFrame:CGRectMake(20, 56, size.width + 10, size.height)];
        
        RichTextView *richTextView = [[RichTextView alloc] initWithRichMessage:replyData.content];
        [cell setContentRichView:richTextView];
        CGSize size = richTextView.frame.size;
        [cell.postReplyContentLabel setFrame:CGRectMake(20, 56, size.width + 10, size.height)];
        cell.postReplyContentLabel.text = @"";
        cell.postReplyContentLabel.numberOfLines = 0;
        
        [cell.postReplyImgView setFrame:CGRectMake(20, 56 + 8 + size.height, 280, 80)];
        [cell setFrame:CGRectMake(cell.frame.origin.x, cell.frame.origin.y, cell.frame.size.width, cell.postReplyImgView.frame.origin.y + cell.postReplyImgView.frame.size.height + 8)];
        
        return cell;
    }
    
    return nil;
}

#pragma mark -
#pragma mark WEPopoverControllerDelegate implementation

- (void)popoverControllerDidDismissPopover:(WEPopoverController *)thePopoverController {
	//Safe to release the popover here
	self.popoverController = nil;
}

- (BOOL)popoverControllerShouldDismissPopover:(WEPopoverController *)thePopoverController {
	//The popover is automatically dismissed if you click outside it, unless you return NO here
	return YES;
}



@end
