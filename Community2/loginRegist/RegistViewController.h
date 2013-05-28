//
//  RegistViewController.h
//  Community2
//
//  Created by 赵 峰 on 13-5-10.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *confirmPWTextField;
@property (strong, nonatomic) IBOutlet UITextField *nickNameTextField;

@end
