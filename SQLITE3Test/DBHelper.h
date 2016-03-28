//
//  Sqlite3Helper.h
//  SQLITE3Test
//
//  Created by YTB on 16/3/28.
//  Copyright (c) 2016年 ZeroYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBHelper : NSObject

//获取单例对象
+(DBHelper *)getDBHelperSingleton;

+(NSString*)DBFullPath:(NSString*)database_name;

@end
