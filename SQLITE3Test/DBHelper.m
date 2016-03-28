//
//  Sqlite3Helper.m
//  SQLITE3Test
//
//  Created by YTB on 16/3/28.
//  Copyright (c) 2016年 ZeroYang. All rights reserved.
//

#import "DBHelper.h"
#import <sqlite3.h>


#if defined(__cplusplus)
extern "C" {
#endif
    
    sqlite3* OpenDataBase(const char* name)
    {
        sqlite3 *database;
        NSString *path = [DBHelper DBFullPath:[NSString stringWithUTF8String:name]];
        sqlite3_open([path UTF8String], &database);
        return database;
    }
    
    int CloseDataBase(sqlite3 *batabase)
    {
        return sqlite3_close(batabase);
    }

#if defined(__cplusplus)
}
#endif

static DBHelper *dbHelper = nil;
@implementation DBHelper

+(DBHelper *)getDBHelperSingleton{
    
    @synchronized(self){  //为了确保多线程情况下，仍然确保实体的唯一性
        if (!dbHelper) {
            [[self alloc] init]; //该方法会调用 allocWithZone
        }
    }
    return dbHelper;
}

+(NSString*)DBFullPath:(NSString*)database_name
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:database_name];
    return path;
}

@end
