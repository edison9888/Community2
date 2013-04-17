//
//  remindTableView.h
//  Community2
//
//  Created by 赵 峰 on 13-4-15.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface remindTableView : UITableView <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *_remindTitleArray;
    NSMutableArray *_remindTimeArray;
    NSMutableArray *_isAlarmArray;
    
    IBOutlet UITableViewCell *_remindTableCell;
}

-(void) secondInit;

@end
