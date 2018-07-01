//
//  ViewController.m
//  EncryptionDemo
//
//  Created by 新闻 on 2018/6/24.
//  Copyright © 2018年 新闻. All rights reserved.
//

#import "ViewController.h"
#import "RSACryptor.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 加载公钥
    [[RSACryptor sharedRSACryptor] loadPublicKey:[[NSBundle mainBundle] pathForResource:@"rsacert.der" ofType:nil]];
    // 加载私钥 - P12的文件  password : 生成P12 的时候设置的密码
    [[RSACryptor sharedRSACryptor] loadPrivateKey:[[NSBundle mainBundle] pathForResource:@"p.p12" ofType:nil] password:@"123456"];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSData * reault = [[RSACryptor sharedRSACryptor] encryptData:[@"hello" dataUsingEncoding:NSUTF8StringEncoding]];
    NSString * base64 = [reault base64EncodedStringWithOptions:0];
    NSLog(@"加密的信息: %@",base64);
    
    // 解密
    NSData * jiemi = [[RSACryptor sharedRSACryptor] decryptData:reault];
    NSLog(@"%@",[[NSString alloc]initWithData:jiemi encoding:NSUTF8StringEncoding]);
    
}


@end
