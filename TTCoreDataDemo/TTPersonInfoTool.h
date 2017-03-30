//
//  TTPersonInfoTool.h
//  TTCoreDataDemo
//
//  Created by zhang liangwang on 17/3/21.
//  Copyright © 2017年 zhangliangwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTPersonInfoModel.h"

@interface TTPersonInfoTool : NSObject


// 增加一条用户数据
+ (void)addPersonInfo:(TTPersonInfoModel *)model completion:(void (^)(BOOL))completion;

// 删除所有数据
+ (void)deletePersonInfoCompletion:(void (^)(BOOL))completion;

// 删除一条数据
+ (void)deleteOnePersonInfo:(NSString *)whereStr completion:(void (^)(BOOL))completion;

// 根据条件查询数据
+ (void)sortPersonInfo:(NSString *)sortStr completion:(void (^)(NSArray<TTPersonInfoModel *> *array))completion;

// 修改数据
+ (void)modifyPersonInfo:(NSString *)uuidStr model:(TTPersonInfoModel *)model completion:(void (^)(BOOL))completion;

@end
