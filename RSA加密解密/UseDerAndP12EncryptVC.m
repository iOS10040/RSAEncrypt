//
//  UseDerAndP12EncryptVC.m
//  RSA加密解密
//
//  Created by MAC on 2017/8/13.
//  Copyright © 2017年 KK. All rights reserved.
//

#import "UseDerAndP12EncryptVC.h"
#import "RSAEncryptor.h"

@interface UseDerAndP12EncryptVC ()

/**
 原字符串
 */
@property (weak, nonatomic) IBOutlet UITextField *originalStrTextField;

/**
 加密后的字符串
 */
@property (weak, nonatomic) IBOutlet UITextView *encryptTextV;

/**
 解密后的字符串
 */
@property (weak, nonatomic) IBOutlet UITextView *decryptTextV;

@end

@implementation UseDerAndP12EncryptVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.originalStrTextField resignFirstResponder];
    [self.encryptTextV resignFirstResponder];
    [self.decryptTextV resignFirstResponder];
}
#pragma mark - 加密
- (IBAction)encryptBtn:(id)sender {
    if (self.originalStrTextField.text.length > 0) {
        //使用.der和.p12中的公钥私钥加密解密
        NSString *public_key_path = [[NSBundle mainBundle]
            pathForResource:@"public_key.der" ofType:nil];
    
        //加密
        NSString *encryptStr = [RSAEncryptor encryptString:self.originalStrTextField.text publicKeyWithContentsOfFile:public_key_path];
        if (encryptStr.length > 0) {
            self.encryptTextV.text = encryptStr;
        }
    }else{
        NSLog(@"请输入要加密的字符串！");
    }
}
#pragma mark - 解密
- (IBAction)decryptBtn:(id)sender {
    
    if (self.encryptTextV.text.length > 0) {
        NSString *private_key_path = [[NSBundle mainBundle] pathForResource:@"private_key.p12" ofType:nil];
        //解密
        NSString *decryptStr = [RSAEncryptor decryptString:self.encryptTextV.text privateKeyWithContentsOfFile:private_key_path password:@"123456"];
        if (decryptStr.length > 0) {
            self.decryptTextV.text = decryptStr;
        }
    }else{
        NSLog(@"解密前请先对原字符串进行加密！");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
