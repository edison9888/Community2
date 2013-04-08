//
//  MainFuncChatView.h
//  Community2
//
//  Created by 赵 峰 on 13-3-14.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MainFuncChatView : UIView <UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray		*chatArray;
	NSString			*chatFile;
    
	NSMutableDictionary	*currentChatInfo;
	NSMutableString		*currentString;
    BOOL				storingCharacters;
	
	BOOL				isMySpeaking;
	BOOL				loadingLog;
}
@end
