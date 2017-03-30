//
//  TTPersonInfoModel.h
//  TTCoreDataDemo
//
//  Created by zhang liangwang on 17/3/21.
//  Copyright © 2017年 zhangliangwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTPersonInfoModel : NSObject

@property (nonatomic, copy) NSString *firstname;
@property (nonatomic, copy) NSString *lastname;
@property (nonatomic,assign) NSNumber *height;
@property (nonatomic, copy) NSString *imageUrl;

@end
