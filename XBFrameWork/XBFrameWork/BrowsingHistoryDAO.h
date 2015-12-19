//
//  BrowsingHistoryDAO.h
//  XBFrameWork
//
//  Created by 杨小波 on 15/12/12.
//  Copyright © 2015年 杨小波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DAO.h"
//浏览历史
@interface BrowsingHistoryDAO : DAO
-(void)deleteAllHistorysFromDB;
- (NSArray *)getAllBrowsingHistorysFromDB;

- (BOOL)writeProductToDB:(id)data;

- (BOOL)deleteProductByData:(id)data;

@end
