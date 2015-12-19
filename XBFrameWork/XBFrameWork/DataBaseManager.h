//
//  DataBaseManager.h
//  XBFrameWork
//
//  Created by 杨小波 on 15/12/12.
//  Copyright © 2015年 杨小波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabaseQueue.h"
@interface DataBaseManager : NSObject
{
    BOOL _isInitializeSuccess;
    BOOL _isDataBaseOpened;
    
}
@property(nonatomic,strong)NSString*writeablePath;
@property(nonatomic,strong)FMDatabaseQueue*databaseQueue;
+(DataBaseManager*)currentManager;
-(BOOL)isDatabaseOpened;
-(void)openDataBase;
-(void)closeDataBase;
+(void)releaseManager;
@end
