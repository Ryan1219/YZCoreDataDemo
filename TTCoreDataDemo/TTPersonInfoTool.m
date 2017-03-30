//
//  TTPersonInfoTool.m
//  TTCoreDataDemo
//
//  Created by zhang liangwang on 17/3/21.
//  Copyright © 2017年 zhangliangwang. All rights reserved.
//

#import "TTPersonInfoTool.h"
#import "AppDelegate.h"

@interface TTPersonInfoTool()


@end

@implementation TTPersonInfoTool

//MARK:- 增加一条数据
+ (void)addPersonInfo:(TTPersonInfoModel *)model completion:(void (^)(BOOL))completion {
    
    // 获取协议
    AppDelegate *appdelegate = [UIApplication sharedApplication].delegate;
    // 获取上下文
    NSManagedObjectContext *context = appdelegate.persistentContainer.viewContext;
    
    [context performBlock:^{
        // 定义一个实体
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"PersonInfo" inManagedObjectContext:context];
        // 根据实体指定对象
        NSManagedObject *object =  [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
        
        if (model != nil) { // 数据实体不为空
            
            [object setValue:model.firstname forKey:@"firstname"];
            [object setValue:model.lastname forKey:@"lastname"];
            [object setValue:model.height forKey:@"height"];
            [object setValue:model.imageUrl forKey:@"imageUrl"];
            
            if (context.hasChanges) {
                
                [context save:nil];
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion(true);
                });
            } else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion(false);
                });
            }

        }
        
    }];
    
   
}

//MARK:- 删除所有数据
+ (void)deletePersonInfoCompletion:(void (^)(BOOL))completion{
    
    // 获取协议
    AppDelegate *appdelegate = [UIApplication sharedApplication].delegate;
    // 获取上下文
    NSManagedObjectContext *context = appdelegate.persistentContainer.viewContext;
    
    [context performBlock:^{
        
        NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"PersonInfo"];
        
        NSArray *array = [context executeFetchRequest:fetchRequest error:nil];
        
        if (array.count != 0) {
            for (NSManagedObject *model in array) {
                
                [context deleteObject:model];
            }
        }
        
        if (context.hasChanges) {
            
            [context save:nil];
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(true);
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(false);
            });
        }
        
    }];
    
}


//MARK:- 删除一条数据
+ (void)deleteOnePersonInfo:(NSString *)whereStr completion:(void (^)(BOOL))completion {
    
    // 获取协议
    AppDelegate *appdelegate = [UIApplication sharedApplication].delegate;
    // 获取上下文
    NSManagedObjectContext *context = appdelegate.persistentContainer.viewContext;
    
    [context performBlock:^{
        
        NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"PersonInfo"];
        //指定删除的条件
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"firstname = %@",whereStr];
        fetchRequest.predicate = predicate;
        
        NSArray *array = [context executeFetchRequest:fetchRequest error:nil];
        
        if (array.count != 0) {
            for (NSManagedObject *model in array) {
                
                [context deleteObject:(NSManagedObject *)model];
            }
        }
        
        if (context.hasChanges) {
            
            [context save:nil];
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(true);
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(false);
            });
        }
        
    }];

    
}

//MARK:-根据条件查询数据
+ (void)sortPersonInfo:(NSString *)sortStr completion:(void (^)(NSArray<TTPersonInfoModel *> *))completion {
    
    // 获取协议
    AppDelegate *appdelegate = [UIApplication sharedApplication].delegate;
    // 获取上下文
    NSManagedObjectContext *context = appdelegate.persistentContainer.viewContext;
    
    [context performBlock:^{
        
        if (sortStr != nil) {
            
            NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"PersonInfo"];
            //指定查询条件
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"firstname = %@",sortStr];
            fetchRequest.predicate = predicate;
            
            NSArray *array = [context executeFetchRequest:fetchRequest error:nil];
            
            if (array.count != 0) {
                NSMutableArray *tempArr = [NSMutableArray array];
                for (NSManagedObject *object in array) {
                    
                    TTPersonInfoModel *model = [[TTPersonInfoModel alloc] init];
                    model.firstname = [object valueForKey:@"firstname"];
                    model.lastname = [object valueForKey:@"lastname"];
                    model.imageUrl = [object valueForKey:@"imageUrl"];
                    model.height = [object valueForKey:@"height"];
                    
                    [tempArr addObject:model];
                }
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion(tempArr);
                });
            } else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion(nil);
                });
            }
            
        }
        
    }];
}


//MARK:- 修改数据
+ (void)modifyPersonInfo:(NSString *)uuidStr model:(TTPersonInfoModel *)model completion:(void (^)(BOOL))completion {
    
    // 获取协议
    AppDelegate *appdelegate = [UIApplication sharedApplication].delegate;
    // 获取上下文
    NSManagedObjectContext *context = appdelegate.persistentContainer.viewContext;
    
    [context performBlock:^{
        
        if (uuidStr != nil) {
            
            NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"PersonInfo"];
            //查询条件
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"uuid = %@",uuidStr];
            fetchRequest.predicate = predicate;
            
            NSArray *array = [context executeFetchRequest:fetchRequest error:nil];
            
            if (array.count != 0) {
                
                for (NSManagedObject *object in array) {
                    // 改变数据库里的对象
                    [object setValue:model.firstname forKey:@"firstname"];
                }
                
                if (context.hasChanges) {
                    [context save:nil];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        completion(true);
                        NSLog(@"modify success");
                    });
                } else {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        completion(false);
                        NSLog(@"modify fail");
                    });
                }
            }
        }
    }];
}

@end

















