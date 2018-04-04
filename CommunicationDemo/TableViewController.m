//
//  TableViewController.m
//  CommunicationDemo
//
//  Created by WhatsXie on 2018/4/4.
//  Copyright © 2018年 WhatsXie. All rights reserved.
//

#import "TableViewController.h"
#import "Communication.h"
@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            [self sendEmailFunc];
        } else {
            [self sendEmailDetailFunc];
        }
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            [self sendMessageFunc];
        } else {
            [self sendMessageDetailFunc];
        }
    } else {
        if (indexPath.row == 0) {
            [self callFunc];
        } else if (indexPath.row == 1) {
            [self callTelUseCallFunc];
        } else {
            [self callTestFunc];
        }
    }
}

#pragma mark - 调用工具类
// 发短信
- (void)sendMessageFunc {
    [Communication messageToReceiver:@"10010"];
}

- (void)sendMessageDetailFunc {
    [Communication messageToReceivers:@[@"10010", @"10086"] content:@"查询话费" delegateVc:self];
}

// 发邮件
- (void)sendEmailFunc {
    [Communication mailToReceiver:@"hello@icloud.com"];
}

- (void)sendEmailDetailFunc {
    NSData *attachmentData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Background" ofType:@"png"]];
    
    [Communication mailToReceivers:@[@"marry@qq.com", @"jack@qq.com"] copyers:@[@"tom@qq.com", @"bob@qq.com"] secretors:@[@"john@qq.com", @"gousheng@qq.com"] theme:@"周末请你吃饭" content:@"周末有空不，请你吃饭" contentIsHTML:NO attachment:attachmentData attachmentName:@"SunOddman" attachmentType:@"image/jpg" showInViewController:self];
}

// 打电话
- (void)callFunc {
    // iOS8之后功能正常
    [Communication callToTel:@"10086"];
}

- (void)callTelUseCallFunc {
    // 越狱可用
    [Communication callToTelUseCallprompt:@"10086" ];
}

- (void)callTestFunc {
    // 这个方法功能需要测试
    [Communication callToTelUseWebView:@"10086" inViewController:self];
}

@end
