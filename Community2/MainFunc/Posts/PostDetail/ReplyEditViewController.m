//
//  ReplyEditViewController.m
//  Community2
//
//  Created by 赵 峰 on 13-4-9.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import "ReplyEditViewController.h"
#import "FaceBoardView.h"
#import "RichTextView.h"
#import "PostDetailViewController.h"

Boolean keyboardShouldChange = TRUE;
Boolean showFaceBoard = FALSE;

@interface ReplyEditViewController ()

@end

@implementation ReplyEditViewController

@synthesize keyboardToolbar, textView, ownerDelegate;

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
    _faceBoardView = [[FaceBoardView alloc] init];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
    self.textView.layer.borderColor = UIColor.grayColor.CGColor;
    self.textView.layer.borderWidth = 2;
    [self.textView.layer setCornerRadius: 6];
    [self.textView.layer setMasksToBounds:YES];
    
    UIBarButtonItem *postBarBtn = [[UIBarButtonItem alloc] initWithTitle:@"发帖" style:UIBarButtonItemStylePlain target:self action:@selector(clickPostBarBtn:)];
    
    [self.navigationItem setRightBarButtonItem:postBarBtn];
    
    postBarBtn = nil;
    
    [self.textView becomeFirstResponder];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    self.keyboardToolbar = nil;
    self.textView = nil;
    _faceBoardView = nil;
    self.ownerDelegate = nil;
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
	[[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
}


#pragma mark -
#pragma mark UIWindow Keyboard Notifications

- (void)keyboardWillShow:(NSNotification *)notification
{
	CGFloat statusBarHeight = self.view.frame.origin.y;
	CGRect beginFrame = [[[notification userInfo] valueForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
	CGRect endFrame = [[[notification userInfo] valueForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
	UIViewAnimationCurve animationCurve	= [[[notification userInfo] valueForKey:UIKeyboardAnimationCurveUserInfoKey] intValue];
	NSTimeInterval animationDuration = [[[notification userInfo] valueForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    if (statusBarHeight == 0) {
        statusBarHeight = 64;//storyboard的坑
    }
	
	if (nil == keyboardToolbar) {
        
        keyboardToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0,0,self.view.bounds.size.width,44)];
        keyboardToolbar.barStyle = UIBarStyleBlackTranslucent;
        keyboardToolbar.tintColor = [UIColor darkGrayColor];
        
        UIButton *faceButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [faceButton setBackgroundImage:[UIImage imageNamed:@"001.png"] forState:UIControlStateNormal];
        [faceButton addTarget:self action:@selector(clickFaceBtn:) forControlEvents:UIControlEventTouchUpInside];
        faceButton.frame = CGRectMake(self.view.bounds.size.width - 30 - 7, 7, 30, 30);
        [keyboardToolbar addSubview:faceButton];
        
        keyboardToolbar.frame = CGRectMake(beginFrame.origin.x, //beginCentre.x - (keyboardBounds.size.width/2),
                                           beginFrame.origin.y - keyboardToolbar.frame.size.height - statusBarHeight, //beginCentre.y - (keyboardBounds.size.height/2) - keyboardToolbar.frame.size.height,
                                           keyboardToolbar.frame.size.width,
                                           keyboardToolbar.frame.size.height);
        
        [self.view addSubview:keyboardToolbar];
        
	}
	
	[UIView beginAnimations:@"RS_showKeyboardAnimation" context:nil];
	[UIView setAnimationCurve:animationCurve];
	[UIView setAnimationDuration:animationDuration];
	
	keyboardToolbar.alpha = 1.0;
	keyboardToolbar.frame = CGRectMake(endFrame.origin.x, //endCentre.x - (keyboardBounds.size.width/2),
									   endFrame.origin.y - keyboardToolbar.frame.size.height - statusBarHeight, //endCentre.y - (keyboardBounds.size.height/2) - keyboardToolbar.frame.size.height - self.view.frame.origin.y,
									   keyboardToolbar.frame.size.width,
									   keyboardToolbar.frame.size.height);
	
	[UIView commitAnimations];

}

- (void)keyboardWillHide:(NSNotification *)notification
{
	if (nil == keyboardToolbar || !keyboardShouldChange) {
		return;
	}
	
	CGFloat statusBarHeight = self.view.frame.origin.y;
	//CGRect beginFrame = [[[notification userInfo] valueForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
	CGRect endFrame = [[[notification userInfo] valueForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    if (statusBarHeight == 0) {
        statusBarHeight = 64;//storyboard的坑
    }
    
	UIViewAnimationCurve animationCurve	= [[[notification userInfo] valueForKey:UIKeyboardAnimationCurveUserInfoKey] intValue];
	NSTimeInterval animationDuration = [[[notification userInfo] valueForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
	
	[UIView beginAnimations:@"RS_hideKeyboardAnimation" context:nil];
	[UIView setAnimationCurve:animationCurve];
	[UIView setAnimationDuration:animationDuration];
	
	
	keyboardToolbar.alpha = 1.0;
	keyboardToolbar.frame = CGRectMake(endFrame.origin.x, //endCentre.x - (keyboardBounds.size.width/2),
									   endFrame.origin.y - statusBarHeight - keyboardToolbar.frame.size.height, //endCentre.y - (keyboardBounds.size.height/2) - keyboardToolbar.frame.size.height,
									   keyboardToolbar.frame.size.width,
									   keyboardToolbar.frame.size.height);
	
	[UIView commitAnimations];
}

- (void)keyboardDidHide:(NSNotification*)notification {
    //_faceBoard.inputTextView = self.textView;
    //self.textView.inputView = _faceBoard;
    
    [self.textView becomeFirstResponder];
    
}

#pragma mark -
#pragma mark Button Actions

- (void)clickFaceBtn:(id)sender
{
    keyboardShouldChange = FALSE;
    if (showFaceBoard)
    {
        self.textView.inputView = nil;
    }
    else
    {
        self.textView.inputView = _faceBoardView;
        _faceBoardView.inputTextView = self.textView;
    }
    showFaceBoard = !showFaceBoard;
    [self.textView resignFirstResponder];
    
}

- (void)clickPostBarBtn:(id)sender
{
    NSLog(@"post a reply");
    
    NSString *replyMessage = self.textView.text;
    [(PostDetailViewController *)ownerDelegate addNewReply:replyMessage];
    self.textView.text = @"";
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
