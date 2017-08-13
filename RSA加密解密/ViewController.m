//
//  ViewController.m
//  RSA加密解密
//
//  Created by MAC on 2017/8/13.
//  Copyright © 2017年 KK. All rights reserved.
//

#import "ViewController.h"
#import "UseDerAndP12EncryptVC.h"
#import "UseSecretStrEncryptVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"RSA加密";
    
}
- (IBAction)btnClick:(UIButton *)sender {
    
    if (sender.tag == 100) {
        UseDerAndP12EncryptVC *vc = [[UseDerAndP12EncryptVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (sender.tag == 101) {
        UseSecretStrEncryptVC *vc = [[UseSecretStrEncryptVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
