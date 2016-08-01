//
//  ViewController.m
//  SLPasswordInputView-Demo
//
//  Created by zhangsl on 16/7/29.
//  Copyright © 2016年 zhangsl. All rights reserved.
//

#import "ViewController.h"
#import "SLPasswordInputView.h"

#define kSLScreenWidth [UIScreen mainScreen].bounds.size.width

@interface ViewController () <SLPasswordInputViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SLPasswordInputView *inputView1 = [[SLPasswordInputView alloc]
                                       initWithFrame:CGRectMake(10, 30, kSLScreenWidth - 20, 54)];
    inputView1.backgroundColor = [UIColor whiteColor];
    inputView1.delegate = self;
    [self.view addSubview:inputView1];
    
    SLPasswordInputView *inputView2 = [[SLPasswordInputView alloc]
                                       initWithFrame:CGRectMake(10, 104, kSLScreenWidth - 20, 54)];
    inputView2.backgroundColor = [UIColor whiteColor];
    inputView2.showBorder = NO;
    inputView2.backgroundColor = [UIColor yellowColor];
    inputView2.passwordColor = [UIColor cyanColor];
    inputView2.passwordWidth = 15;
    inputView2.delegate = self;
    inputView2.keyboardType = UIKeyboardTypeAlphabet;
    [self.view addSubview:inputView2];
    
    SLPasswordInputView *inputView3 = [[SLPasswordInputView alloc] initWithFrame:CGRectMake(10, 178, kSLScreenWidth - 20, 88)];
    inputView3.backgroundColor = [UIColor cyanColor];
    inputView3.passwordColor = [UIColor yellowColor];
    inputView3.passwordLength = 5;
    inputView3.borderColor = [UIColor grayColor];
    inputView3.contentInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    inputView3.borderCornerRadius = 10;
    inputView3.delegate = self;
    [self.view addSubview:inputView3];
    
    SLPasswordInputView *inputView4 = [[SLPasswordInputView alloc] initWithFrame:CGRectMake(10, 286, kSLScreenWidth - 20, 88)];
    inputView4.passwordImage = [UIImage imageNamed:@"cat.jpg"];
    inputView4.passwordLength = 5;
    inputView4.passwordWidth = 30;
    inputView4.borderCornerRadius = 10;
    inputView4.borderColor = [UIColor orangeColor];
    inputView4.borderWidth = 3;
    inputView4.keyboardType = UIKeyboardTypeAlphabet;
    inputView4.delegate = self;
    [self.view addSubview:inputView4];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)passwordInputView:(SLPasswordInputView *)inputView willBeginInputWithPassword:(NSString *)password {
    NSLog(@"inputBegin");
}

- (void)passwordInputView:(SLPasswordInputView *)inputView willEndInputWithPassword:(NSString *)password {
    NSLog(@"inputEnd");
}

- (void)passwordInputView:(SLPasswordInputView *)inputView didChangeInputWithPassword:(NSString *)password {
    NSLog(@"inputChanged, passwd:%@", password);
}

- (void)passwordInputView:(SLPasswordInputView *)inputView didFinishInputWithPassword:(NSString *)password {
    NSLog(@"inputFinished, passwd:%@", password);
}

@end
