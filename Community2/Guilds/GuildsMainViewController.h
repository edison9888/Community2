//
//  GuildsMainViewController.h
//  Community2
//
//  Created by 赵 峰 on 13-3-11.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuildsMainViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *guildsMainTableView;

@end
