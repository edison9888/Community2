//
//  MainFuncChatView.m
//  Community2
//
//  Created by 赵 峰 on 13-3-14.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import "MainFuncChatView.h"

#define TEXTFIELDTAG	100
#define TOOLBARTAG		200
#define TABLEVIEWTAG	300
#define LOADINGVIEWTAG	400

#define SCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height
#define SCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width
#define TOOLBAR_HEIGHT  44
#define NAVBAR_HEIGHT   44
#define SEGBAR_HEIGHT   44
#define SYSBAR_HEIGHT   20
#define KEYPAD_HEIGHT   216

@implementation MainFuncChatView

//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        // Initialization code
//
//    }
//    return self;
//}

#pragma mark Table view methods
- (UIView *)bubbleView:(NSString *)text from:(BOOL)fromSelf {
	// build single chat bubble cell with given text
	UIView *returnView = [[UIView alloc] initWithFrame:CGRectZero];
	returnView.backgroundColor = [UIColor clearColor];
    
	UIImage *bubble = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:fromSelf?@"bubbleMine":@"bubbleSomeone" ofType:@"png"]];
	UIImageView *bubbleImageView = [[UIImageView alloc] initWithImage:[bubble stretchableImageWithLeftCapWidth:21 topCapHeight:14]];
    
	UIFont *font = [UIFont systemFontOfSize:12];
	CGSize size = [text sizeWithFont:font constrainedToSize:CGSizeMake(150.0f, 1000.0f) lineBreakMode:UILineBreakModeCharacterWrap];
    
    //the size not usefule, reset latter
	UILabel *bubbleText = [[UILabel alloc] initWithFrame:CGRectMake(21.0f, 14.0f, size.width+10, size.height+10)];
	bubbleText.backgroundColor = [UIColor clearColor];
	bubbleText.font = font;
	bubbleText.numberOfLines = 0;
	bubbleText.lineBreakMode = UILineBreakModeCharacterWrap;
	bubbleText.text = text;
	
	bubbleImageView.frame = CGRectMake(0.0f, 0.0f, 200.0f, size.height+40.0f);
	if(fromSelf)
    {
        float x = self.frame.size.width - 20 - size.width;
        float y = 5;
        [bubbleText setFrame:CGRectMake(x, y, size.width, size.height)];
        
        [bubbleImageView.image stretchableImageWithLeftCapWidth:15 topCapHeight:14];
        bubbleImageView.frame = CGRectMake(x - 9, y - 4, size.width + 26, size.height + 15);
        returnView.frame = CGRectMake(0, 0, size.width + 26, size.height + 15);
        
        //returnView.frame = CGRectMake(120.0f, 10.0f, 200.0f, size.height+50.0f);
    }
	else
    {
        float x = 20;
        float y = 5;
        [bubbleText setFrame:CGRectMake(x, y, size.width, size.height)];
        
        [bubbleImageView.image stretchableImageWithLeftCapWidth:21 topCapHeight:14];
        bubbleImageView.frame = CGRectMake(x - 18, y - 4, size.width + 30, size.height + 15);
        returnView.frame = CGRectMake(x - 18, y - 4, size.width + 30, size.height + 15);
        
        //returnView.frame = CGRectMake(0.0f, 10.0f, 200.0f, size.height+50.0f);
    }
		
	
	[returnView addSubview:bubbleImageView];
	[returnView addSubview:bubbleText];
    
	return returnView;
}

#pragma mark text file methods
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
	// return NO to disallow editing.
	if(loadingLog)
		return NO;
    
	//self.navigationItem.rightBarButtonItem.title = @"hidde keyboard";
	UIToolbar *toolbar = (UIToolbar *)[self viewWithTag:TOOLBARTAG];
	toolbar.frame = CGRectMake(0.0f, toolbar.frame.origin.y - KEYPAD_HEIGHT, 320.0f, 44.0f);
	UITableView *tableView = (UITableView *)[self viewWithTag:TABLEVIEWTAG];
	tableView.frame = CGRectMake(0.0f, 0.0f, 320.0f, tableView.frame.size.height - KEYPAD_HEIGHT);
	if([chatArray count])
		[tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[chatArray count]-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
	
	return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
	// return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
	//self.navigationItem.rightBarButtonItem.title = @"clear chat log";
	UIToolbar *toolbar = (UIToolbar *)[self viewWithTag:TOOLBARTAG];
	toolbar.frame = CGRectMake(0.0f, self.frame.size.height - TOOLBAR_HEIGHT, 320.0f, 44.0f);
	UITableView *tableView = (UITableView *)[self viewWithTag:TABLEVIEWTAG];
	tableView.frame = CGRectMake(0.0f, 0.0f, 320.0f, self.frame.size.height - TOOLBAR_HEIGHT);
	
	return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	// called when 'return' key pressed. return NO to ignore.
//	self.navigationItem.leftBarButtonItem.title = @"save chat log";
//	self.navigationItem.leftBarButtonItem.enabled = YES;
	UIView *chatView = [self bubbleView:[NSString stringWithFormat:@"%@: %@", isMySpeaking?@"self":@"other", textField.text]
								   from:isMySpeaking];
	[chatArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:textField.text, @"text", isMySpeaking?@"self":@"other", @"speaker", chatView, @"view", nil]];
	isMySpeaking = !isMySpeaking;
	UITableView *tableView = (UITableView *)[self viewWithTag:TABLEVIEWTAG];
	[tableView reloadData];
	[tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[chatArray count]-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:NO];
	textField.text = @"";
	return YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

#pragma mark view controller methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];

    return [self init];
}

//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    return [self init];
//}

//- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
//{
//    self = [super initWithFrame:frame style:UITableViewStylePlain];
//    return [self init];
//}
- (id)init {
	if(self = [super init]) {
		//self = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
        
		chatArray = [[NSMutableArray alloc] initWithCapacity:0];
		isMySpeaking = YES;
		loadingLog = NO;
        
		currentString = [[NSMutableString alloc] initWithCapacity:0];
		currentChatInfo = [[NSMutableDictionary alloc] initWithCapacity:3];
		
		UITextField *textfield = [[UITextField alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 300.0f, 31.0f)];
		textfield.tag = TEXTFIELDTAG;
		textfield.delegate = self;
		textfield.autocorrectionType = UITextAutocorrectionTypeNo;
		textfield.autocapitalizationType = UITextAutocapitalizationTypeNone;
		textfield.enablesReturnKeyAutomatically = YES;
		textfield.borderStyle = UITextBorderStyleRoundedRect;
		textfield.returnKeyType = UIReturnKeySend;
		textfield.clearButtonMode = UITextFieldViewModeWhileEditing;
		UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, self.frame.size.height - TOOLBAR_HEIGHT, 320.0f, 44.0f)];
		toolBar.tag = TOOLBARTAG;
		NSMutableArray* allitems = [[NSMutableArray alloc] init];
		[allitems addObject:[[UIBarButtonItem alloc] initWithCustomView:textfield]];
		[toolBar setItems:allitems];

		[self addSubview:toolBar];

		
		UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, self.frame.size.height - TOOLBAR_HEIGHT) style:UITableViewStylePlain];
		tableView.delegate = self;
		tableView.dataSource = self;
		tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
		tableView.backgroundColor = [UIColor colorWithRed:0.859f green:0.886f blue:0.929f alpha:1.0f];
		tableView.tag = TABLEVIEWTAG;
		[self addSubview:tableView];

		
		UIView *loadingView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, self.frame.size.height - TOOLBAR_HEIGHT)];
		loadingView.backgroundColor = [UIColor darkGrayColor];
		UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
		activityView.center = CGPointMake(loadingView.frame.size.width/2, loadingView.frame.size.height/2);
		[activityView startAnimating];
		[loadingView addSubview:activityView];

		loadingView.hidden = YES;
		loadingView.tag = LOADINGVIEWTAG;
		[self addSubview:loadingView];

	}
	
	return self;
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [chatArray count];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	UIView *chatView = [[chatArray objectAtIndex:[indexPath row]] objectForKey:@"view"];
	return chatView.frame.size.height+10.0f;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier];
        
		cell.backgroundColor = [UIColor colorWithRed:0.859f green:0.886f blue:0.929f alpha:1.0f];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    // Set up the cell...
	NSDictionary *chatInfo = [chatArray objectAtIndex:[indexPath row]];
	for(UIView *subview in [cell.contentView subviews])
		[subview removeFromSuperview];
	[cell.contentView addSubview:[chatInfo objectForKey:@"view"]];
    return cell;
}





@end
