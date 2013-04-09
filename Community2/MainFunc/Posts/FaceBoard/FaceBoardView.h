//
//  FaceBoardView.h
//  Community2
//
//  Created by 赵 峰 on 13-4-9.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FaceBoardPageControl.h"

@interface FaceBoardView : UIView<UIScrollViewDelegate>
{
    UIScrollView *_faceBoardScrollView;
    NSDictionary *_faceDic;
    FaceBoardPageControl *_facePageControl;
}

@property (nonatomic, strong) UITextView *inputTextView;

@end
