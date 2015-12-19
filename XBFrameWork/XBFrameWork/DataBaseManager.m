//
//  DataBaseManager.m
//  XBFrameWork
//
//  Created by 杨小波 on 15/12/12.
//  Copyright © 2015年 杨小波. All rights reserved.
//

#import "DataBaseManager.h"
#import "FMDatabase.h"
#define kDatabaseFileName       @"XBFrameWork.sqlite"
static DataBaseManager *manager = nil;
@implementation DataBaseManager
-(id)init{
    if(self=[super init]){
        _isDataBaseOpened=NO;
        [self openDataBase];
    }
    return self;
}
+ (DataBaseManager*)currentManager {
    
    @synchronized(self) {
        
        if(!manager) {
            
            manager = [[DataBaseManager alloc] init];
            
        }
    }
    
    return manager;
}
- (BOOL)isDatabaseOpened
{
    return _isDataBaseOpened;
}

+ (void)releaseManager{
    
    if(manager){
        
        manager = nil;
    }
}


-(void)dealloc{
    
    [self closeDataBase];
}
-(void)openDataBase{
    _databaseQueue=[FMDatabaseQueue databaseQueueWithPath:self.writeablePath];
    if(_databaseQueue==0x00){
        _isDataBaseOpened=NO;
        return;
    }
    _isDataBaseOpened = YES;
    NSLog(@"成功打开数据库");
    [_databaseQueue inDatabase:^(FMDatabase *db) {
        [db setShouldCacheStatements:YES];
    }];
}
- (void)closeDataBase{
    if(!_isDataBaseOpened){
        NSLog(@"请求关闭数据库失败。");
        return;
    }
    
    [_databaseQueue close];
    _isDataBaseOpened = NO;
    NSLog(@"关闭数据库成功。");
}

-(NSString*)writeablePath{
    if(!_writeablePath){
        NSString* cachesDirectory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        _writeablePath = [[[cachesDirectory stringByAppendingPathComponent:[[NSProcessInfo processInfo] processName]] stringByAppendingPathComponent:@"Database"] copy];
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        BOOL isDir = YES;
        BOOL isExist = [fileManager fileExistsAtPath:_writeablePath isDirectory:&isDir];
        if (!isExist)
        {
            [fileManager createDirectoryAtPath:_writeablePath withIntermediateDirectories:YES attributes:nil error:NULL];
        }

    }
    _writeablePath=[_writeablePath stringByAppendingPathComponent:kDatabaseFileName];
    NSLog(@"_writeablePath_writeablePath_writeablePath=====%@",_writeablePath);
    return _writeablePath;
}


@end
