//
//  SLPasswordInputView.m
//  SLPasswordInputView-Demo
//
//  Created by zhangsl on 16/7/29.
//  Copyright © 2016年 zhangsl. All rights reserved.
//

#import "SLPasswordInputView.h"
#import "UIImage+SLAdd.h"

@interface SLPasswordInputView ()

@property (strong, nonatomic) NSMutableString *passwordStore;

@end

@implementation SLPasswordInputView

//------------------------------------------------------------------------------
#pragma mark - Init & Dealloc
//------------------------------------------------------------------------------

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (void)commonInit {
    _passwordLength = 8;
    _passwordWidth = 17;
    _passwordColor = [UIColor blackColor];
    _showBorder = YES;
    _borderCornerRadius = 0;
    _borderWidth = 1;
    _borderColor = [UIColor lightGrayColor];
    _keyboardType = UIKeyboardTypeNumberPad;
    _returnKeyType = UIReturnKeyDefault;
    _passwordStore = [NSMutableString string];
    self.backgroundColor = [UIColor whiteColor];
}

//------------------------------------------------------------------------------
#pragma mark - Override
//------------------------------------------------------------------------------

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)drawRect:(CGRect)rect {
    CGRect drawRect = UIEdgeInsetsInsetRect(rect, self.contentInsets);
    CGFloat drawRectX = drawRect.origin.x;
    CGFloat drawRectY = drawRect.origin.y;
    CGFloat charRectWidth = drawRect.size.width / self.passwordLength;
    CGFloat charRectHeight = drawRect.size.height;
    CGFloat charNumber = self.passwordLength;
    UIImage *drawImage = self.passwordImage ? : [UIImage sl_dotImageWithColor:self.passwordColor radius:self.passwordWidth * 0.5];
    
    if (self.showBorder) {
        UIBezierPath *borderPath = [UIBezierPath bezierPathWithRoundedRect:drawRect cornerRadius:self.borderCornerRadius];
        
        for (int i = 1; i < charNumber; i++) {
            [borderPath moveToPoint:CGPointMake(drawRectX + charRectWidth * i, drawRectY)];
            [borderPath addLineToPoint:CGPointMake(drawRectX + charRectWidth * i, drawRectY + charRectHeight)];
        }
        
        borderPath.lineWidth = self.borderWidth;
        
        [self.borderColor setStroke];
        [borderPath stroke];
    }
    
    CGFloat pcX = drawRectX + charRectWidth * 0.5 - self.passwordWidth * 0.5;
    CGFloat pcY = drawRectY + charRectHeight * 0.5 - self.passwordWidth * 0.5;
    CGFloat pcW = self.passwordWidth;
    CGFloat pcH = self.passwordWidth;
    CGRect passwordCharRect = CGRectMake(pcX, pcY, pcW, pcH);
    
    passwordCharRect.origin.x -= charRectWidth;
    for (int i = 0; i < self.passwordStore.length; i++) {
        passwordCharRect.origin.x += charRectWidth;
        [drawImage drawInRect:passwordCharRect];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (!self.isFirstResponder) {
        [self becomeFirstResponder];
    }
}

- (BOOL)becomeFirstResponder {
    [self callDelegateWhenInputWillBegin];
    
    return [super becomeFirstResponder];
}

- (BOOL)resignFirstResponder {
    [self callDelegateWhenInputWillEnd];
    
    return [super resignFirstResponder];
}

//------------------------------------------------------------------------------
#pragma mark - Private Method
//------------------------------------------------------------------------------

- (void)callDelegateWhenInputWillBegin {
    if ([self.delegate respondsToSelector:@selector(passwordInputView:willBeginInputWithPassword:)]) {
        [self.delegate passwordInputView:self willBeginInputWithPassword:self.passwordText];
    }
}

- (void)callDelegateWhenInputWillEnd {
    if ([self.delegate respondsToSelector:@selector(passwordInputView:willEndInputWithPassword:)]) {
        [self.delegate passwordInputView:self willEndInputWithPassword:self.passwordText];
    }
}

- (void)callDelegateWhenInputChange {
    if ([self.delegate respondsToSelector:@selector(passwordInputView:didChangeInputWithPassword:)]) {
        [self.delegate passwordInputView:self didChangeInputWithPassword:self.passwordText];
    }
}

- (void)callDelegateWhenInputFinshed {
    if ([self.delegate respondsToSelector:@selector(passwordInputView:didFinishInputWithPassword:)]) {
        [self.delegate passwordInputView:self didFinishInputWithPassword:self.passwordText];
    }
}

//------------------------------------------------------------------------------
#pragma mark - UIKeyInput
//------------------------------------------------------------------------------

- (void)insertText:(NSString *)text {
    if (self.passwordStore.length >= self.passwordLength) {
        return;
    }
    
    [self.passwordStore appendString:text];
    
    [self setNeedsDisplay];
    
    [self callDelegateWhenInputChange];
    if (self.passwordStore.length >= self.passwordLength) {
        [self callDelegateWhenInputFinshed];
    }
}

- (void)deleteBackward {
    if (self.passwordStore.length <= 0) {
        return;
    }
    
    [self.passwordStore deleteCharactersInRange:NSMakeRange(self.passwordStore.length - 1, 1)];
    
    [self setNeedsDisplay];
    
    [self callDelegateWhenInputChange];
}

- (BOOL)hasText {
    return self.passwordStore.length;
}

//------------------------------------------------------------------------------
#pragma mark - Setter & Getter
//------------------------------------------------------------------------------

- (void)setPasswordColor:(UIColor *)passwordColor {
    _passwordColor = passwordColor;
    
    [self setNeedsDisplay];
}

- (void)setPasswordImage:(UIImage *)passwordImage {
    _passwordImage = passwordImage;
    
    [self setNeedsDisplay];
}

- (void)setPasswordWidth:(CGFloat)passwordWidth {
    _passwordWidth = passwordWidth;
    
    [self setNeedsDisplay];
}

- (void)setPasswordLength:(NSUInteger)passwordLength {
    _passwordLength = passwordLength;
    
    [self setNeedsDisplay];
}

- (void)setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
    
    [self setNeedsDisplay];
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    _borderWidth = borderWidth;
    
    [self setNeedsDisplay];
}

- (void)setBorderCornerRadius:(CGFloat)borderCornerRadius {
    _borderCornerRadius = borderCornerRadius;
    
    [self setNeedsDisplay];
}

- (void)setShowBorder:(BOOL)showBorder {
    _showBorder = showBorder;
    
    [self setNeedsDisplay];
}

- (void)setPasswordText:(NSString *)passwordText {
    if (passwordText.length > self.passwordLength) {
        self.passwordStore = [[passwordText substringToIndex:self.passwordLength] mutableCopy];
    } else {
        self.passwordStore = [passwordText mutableCopy];
    }
    
    [self setNeedsDisplay];
}

- (void)setContentInsets:(UIEdgeInsets)contentInsets {
    _contentInsets = contentInsets;
    
    [self setNeedsDisplay];
}

- (NSString *)passwordText {
    return [self.passwordStore copy];
}

@end
