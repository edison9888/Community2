//
//  RichTextView.h
//  Community2
//
//  Created by 赵 峰 on 13-4-9.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RichTextView : UIView

- (id)initWithRichMessage:(NSString *)richMessage;

- (NSArray *)createFaceArray:(NSDictionary *)faceDic;

@end
