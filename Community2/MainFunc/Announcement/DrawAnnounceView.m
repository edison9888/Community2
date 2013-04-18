//
//  DrawAnnounceView.m
//  Community2
//
//  Created by 赵 峰 on 13-4-17.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import "DrawAnnounceView.h"

@implementation DrawAnnounceView

@synthesize linesDic, color;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
       
    }
    return self;
}

-(id)initWithData:(UIColor *)tmpColor tmpFrame:(CGRect)tmpFrame tmpLineDic:(NSMutableDictionary *)tmpLineDic
{
    self = [self initWithFrame:tmpFrame];
    
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        self.color = tmpColor;
        self.linesDic = tmpLineDic;
    }
    
    return  self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    CGContextSetStrokeColorWithColor(context, self.color.CGColor);
//    CGContextMoveToPoint(context, 100, 100);
//    CGContextAddLineToPoint(context, 200, 200);

    CGContextMoveToPoint(context, [[self.linesDic objectForKey:@"bPx1"] intValue], [[self.linesDic objectForKey:@"bPy1"] intValue]);
    CGContextAddLineToPoint(context, [[self.linesDic objectForKey:@"bPx2"] intValue], [[self.linesDic objectForKey:@"bPy2"] intValue]);
    
    CGContextMoveToPoint(context, [[self.linesDic objectForKey:@"bPx3"] intValue], [[self.linesDic objectForKey:@"bPy3"] intValue]);
    CGContextAddLineToPoint(context, [[self.linesDic objectForKey:@"bPx4"] intValue], [[self.linesDic objectForKey:@"bPy4"] intValue]);
    
    
    CGContextStrokePath(context);
}

@end
