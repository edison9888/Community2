//
//  DrawAnnounceView.h
//  Community2
//
//  Created by 赵 峰 on 13-4-17.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawAnnounceView : UIView

@property (nonatomic, strong) NSMutableDictionary *linesDic;
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) NSMutableArray *lineArray;

-(id)initWithData:(UIColor *)tmpColor tmpFrame:(CGRect)tmpFrame tmpLineDic:(NSMutableDictionary *)tmpLineDic;

@end
