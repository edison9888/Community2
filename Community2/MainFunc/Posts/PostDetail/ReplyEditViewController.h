//
//  ReplyEditViewController.h
//  Community2
//
//  Created by 赵 峰 on 13-4-9.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "FaceBoardView.h"

@interface ReplyEditViewController : UIViewController
{
    UIToolbar *keyboardToolbar;
    FaceBoardView *_faceBoardView;
}

@property (nonatomic, retain) UIToolbar *keyboardToolbar;
@property (nonatomic, retain) IBOutlet UITextView *textView;

@end
