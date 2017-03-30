//
//  PersonInfo+CoreDataProperties.h
//  TTCoreDataDemo
//
//  Created by zhang liangwang on 17/3/21.
//  Copyright © 2017年 zhangliangwang. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "PersonInfo+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface PersonInfo (CoreDataProperties)

+ (NSFetchRequest<PersonInfo *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *firstname;
@property (nullable, nonatomic, copy) NSString *lastname;
@property (nonatomic) double height;
@property (nullable, nonatomic, copy) NSString *imageUrl;

@end

NS_ASSUME_NONNULL_END
