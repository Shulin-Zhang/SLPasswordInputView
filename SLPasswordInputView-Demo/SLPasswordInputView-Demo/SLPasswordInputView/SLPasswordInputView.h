//
//  SLPasswordInputView.h
//  SLPasswordInputView-Demo
//
//  Created by zhangsl on 16/7/29.
//  Copyright © 2016年 zhangsl. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SLPasswordInputView;

NS_ASSUME_NONNULL_BEGIN

@protocol SLPasswordInputViewDelegate <NSObject>

@optional

- (void)passwordInputView:(SLPasswordInputView *)inputView willBeginInputWithPassword:(NSString *)password;
- (void)passwordInputView:(SLPasswordInputView *)inputView willEndInputWithPassword:(NSString *)password;
- (void)passwordInputView:(SLPasswordInputView *)inputView didChangedInputWithPassword:(NSString *)password;
- (void)passwordInputView:(SLPasswordInputView *)inputView didFinishedInputWithPassword:(NSString *)password;

@end

@interface SLPasswordInputView : UIView <UIKeyInput>

/** 密码长度 */
@property (assign, nonatomic) NSUInteger passwordLength;
/** 密码字符大小 */
@property (assign, nonatomic) CGFloat passwordWidth;
/** 密码字符颜色（只在使用默认密码字符图片时有效） */
@property (strong, nonatomic) UIColor *passwordColor;
/** 密码字符图片（正方形图片，默认为黑色圆点） */
@property (strong, nonatomic) UIImage *passwordImage;

/** 显示边框 */
@property (assign, nonatomic) BOOL showBorder;
/** 边框圆角大小 */
@property (assign, nonatomic) CGFloat borderCornerRadius;
/** 边框线宽 */
@property (assign, nonatomic) CGFloat borderWidth;
/** 边框颜色 */
@property (strong, nonatomic) UIColor *borderColor;

/** 键盘类型 */
@property (assign, nonatomic) UIKeyboardType keyboardType;
/** 返回按钮类型 */
@property (assign, nonatomic) UIReturnKeyType returnKeyType;

/** 密码文本 */
@property (copy, nonatomic, nullable) NSString *passwordText;

/** 代理 */
@property (weak, nonatomic) id<SLPasswordInputViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
