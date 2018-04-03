//
//  ViewController.m
//  CommunicationDemo
//
//  Created by WhatsXie on 2018/4/2.
//  Copyright © 2018年 WhatsXie. All rights reserved.
//

#import "ViewController.h"
#import "Communication.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)sendEmailAction:(id)sender {
    [self sendEmailFunc];
}
- (IBAction)sendEmailDetailAction:(id)sender {
    [self sendEmailDetailFunc];
}

- (IBAction)sendMessageAction:(id)sender {
    [self sendMessageFunc];
}
- (IBAction)sendMessageDetailAction:(id)sender {
    [self sendMessageDetailFunc];
}

- (IBAction)callAction:(id)sender {
    [self callFunc];
}
- (IBAction)callUseCallpromptAction:(id)sender {
    [self callTelUseCallFunc];
}
- (IBAction)callTestAction:(id)sender {
    [self callTestFunc];
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
