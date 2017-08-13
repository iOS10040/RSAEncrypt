//
//  UseSecretStrEncryptVC.m
//  RSA加密解密
//
//  Created by MAC on 2017/8/13.
//  Copyright © 2017年 KK. All rights reserved.
//

#import "UseSecretStrEncryptVC.h"
#import "RSAEncryptor.h"

@interface UseSecretStrEncryptVC ()

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

@implementation UseSecretStrEncryptVC

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
        //使用字符串格式的公钥私钥加密解密
        NSString *encryptStr = [RSAEncryptor encryptString:self.originalStrTextField.text publicKey:@"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCrtHbkrTcSLR9AdGnNyi1+u4Kdvo0H8KJjej0FoxIHTsiqo4eCnvijWtL4MDS9DLeu+gr7hFK4VLAgBX4TPCl7E1ySO+6MkyKnHkkuCZ3ICat3z6/QstdSazCFE0No+UXvQ7g6X95wF4qynHPjS8/WKMwxJ7PTa8xZfZJfRDgN7wIDAQAB"];
        
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
        //解密
        NSString *decryptStr = [RSAEncryptor decryptString:self.encryptTextV.text privateKey:@"MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAKu0duStNxItH0B0ac3KLX67gp2+jQfwomN6PQWjEgdOyKqjh4Ke+KNa0vgwNL0Mt676CvuEUrhUsCAFfhM8KXsTXJI77oyTIqceSS4JncgJq3fPr9Cy11JrMIUTQ2j5Re9DuDpf3nAXirKcc+NLz9YozDEns9NrzFl9kl9EOA3vAgMBAAECgYAQPmphB+IF3i7ushSwW0gijSq2Mai175XtQ0sylVLHTjS9r+rJ+LAdBCKhSC41FFbsPst7L/GDbr+ax+o9d5uU2XQhp7gvEuYtoquH+wkEYUC6JBmQScoll1+G9gGaeUwPde/AQmos6UcF10p6aokmCSQc3DWaHWY1aGuejqUEQQJBANp6k/y8kz6GE/2ycm6xgwrX4btwctpXDGRMu6j3hKoNeVG/wPUzt+a1H8wwj48EzMDk2sUcmOVX+8Fz/IZ2T20CQQDJMXj3xQRvJqCisA7n2M38TapcGtmUBhRqb5T+6xZmEsXNAcw8+1iVwCOQf2AVLCDDpQZvCpSUUJNNv6AWd01LAkBil+SGrnboRUtqNohLidHwJ8IXe0RpYdUWwkYBl0mIEDKKgLVMMj2wYFZsKBHw4aKg/eX4A9K/1Leo8nWoHGX1AkBi+vXaX5EI5eYNY7RRl7XvNH5lhcgZLMyKeI7CwwFoAkBR1VqXfchdFAPrKN8qS2VrGxsJMhlaxjFSBL5LjzH1AkEAm8dQB5VBo6sZxeNEl/cB6akGbcSSHDko6lsz8fs8xf7/G/0579S92Sw8BahVu3/nylgDMJYzmE7EP+aTGq1ovQ=="];
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
