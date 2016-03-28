//
//  ViewController.m
//  SQLITE3Test
//
//  Created by YTB on 16/3/28.
//  Copyright (c) 2016年 ZeroYang. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    [btn setTitle:@"test" forState:UIControlStateNormal];
    [btn respondsToSelector:@selector(sqlite3_test)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)sqlite3_test
{
    NSLog(@"sqlite3 test");
    
    //1首先获取iPhone上sqlite3的数据库文件的地址
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"database_name"];
    
    //2打开iPhone上的sqlite3的数据库文件
    
    sqlite3 *database;
    sqlite3_open([path UTF8String], &database);
    
    //3 准备sql文－－－sql语句
    sqlite3_stmt *stmt;
    const char *sql = "SELECT * FROM table_name WHERE pk=? and name=?";
    sqlite3_prepare_v2(database, sql, -1, &stmt, NULL);
    
    //4 邦定参数
    
    // 邦定第一个int参数
    sqlite3_bind_int(stmt, 1, 1);
    // 邦定第二个字符串参数
    NSString* title = @"name";
    sqlite3_bind_text(stmt, 2, [title UTF8String], -1, SQLITE_TRANSIENT);
    
    //5 执行sql文
    
    sqlite3_step(stmt);
    //6 释放sql文资源
    
    sqlite3_finalize(stmt);
    //7 关闭iPhone上的sqlite3的数据库
    
    sqlite3_close(database);
}

@end
