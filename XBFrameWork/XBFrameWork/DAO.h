//
//  DAO.h
//  XBFrameWork
//
//  Created by 杨小波 on 15/12/12.
//  Copyright © 2015年 杨小波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabaseQueue.h"

@interface DAO : NSObject
@property (nonatomic,strong) FMDatabaseQueue *databaseQueue;
+ (void)createTablesNeeded;

@end
