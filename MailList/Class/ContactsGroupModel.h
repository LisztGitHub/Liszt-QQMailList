//
//  ContactsGroupModel.h
//  QQProject
//
//  Created by Lester on 16/9/8.
//  Copyright © 2016年 Lester-iOS开发:98787555. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactsGroupModel : NSObject
/** 分组名称*/
@property (nonatomic, copy) NSString *name;
/** 在线人数*/
@property (nonatomic, copy) NSString *personNumber;
/** 好友数组*/
@property (nonatomic, strong) NSArray *friends;
/** 点击展开或者关闭状态*/
@property (nonatomic, assign) BOOL isOpen;

@end
