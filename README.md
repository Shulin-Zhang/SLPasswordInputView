# SLPasswordInputView

### 代理：
- - (void)passwordInputView:(SLPasswordInputView *)inputView willBeginInputWithPassword:(NSString *)password;
- - (void)passwordInputView:(SLPasswordInputView *)inputView willEndInputWithPassword:(NSString *)password;
- - (void)passwordInputView:(SLPasswordInputView *)inputView didChangedInputWithPassword:(NSString *)password;
- -(void)passwordInputView:(SLPasswordInputView *)inputView didFinishedInputWithPassword:(NSString *)password;

### 属性
- 密码长度
- @property (assign, nonatomic) NSUInteger passwordLength;
- 密码字符大小
- @property (assign, nonatomic) CGFloat passwordWidth;
- 密码字符颜色（只在使用默认密码字符图片时有效
- @property (strong, nonatomic) UIColor *passwordColor;
- 密码字符图片（正方形图片，默认为黑色圆点）
- @property (strong, nonatomic) UIImage *passwordImage;
- 显示边框
- @property (assign, nonatomic) BOOL showBorder;
- 边框圆角大小
- @property (assign, nonatomic) CGFloat borderCornerRadius;
- 边框线宽
- @property (assign, nonatomic) CGFloat borderWidth;
- 边框颜色
- @property (strong, nonatomic) UIColor *borderColor;
- 键盘类型
- @property (assign, nonatomic) UIKeyboardType keyboardType;
- 返回按钮类型
- @property (assign, nonatomic) UIReturnKeyType returnKeyType;
- 密码文本
- @property (copy, nonatomic, nullable) NSString *passwordText;

![picture](https://github.com/Coderzhangsl/SLPasswordInputView/blob/master/Pictures/Simulator%20Screen%20Shot%202016%E5%B9%B47%E6%9C%8829%E6%97%A5%20%E4%B8%8B%E5%8D%883.47.37.png)
