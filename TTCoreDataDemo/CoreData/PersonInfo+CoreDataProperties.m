//
//  PersonInfo+CoreDataProperties.m
//  TTCoreDataDemo
//
//  Created by zhang liangwang on 17/3/21.
//  Copyright © 2017年 zhangliangwang. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "PersonInfo+CoreDataProperties.h"

@implementation PersonInfo (CoreDataProperties)

+ (NSFetchRequest<PersonInfo *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"PersonInfo"];
}

@dynamic firstname;
@dynamic lastname;
@dynamic height;
@dynamic imageUrl;

@end
