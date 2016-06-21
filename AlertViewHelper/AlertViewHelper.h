//
//  AlertViewHelper.h
//  AlertViewHelper
//
//  Created by admin on 16/6/21.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kSrceenWidth    [[UIScreen mainScreen] bounds].size.width
#define kSrceenHeight    [[UIScreen mainScreen] bounds].size.height



//取消按钮点击事件
typedef void(^CancelBlock)();
//确定按钮点击事件
typedef void(^SureBlock)();



@interface AlertViewHelper : UIView

@property(nonatomic,copy)CancelBlock cancelBlock;
@property(nonatomic,copy)SureBlock sureBlock;


//初始化
+(instancetype)alterViewWithTitle:(NSString *)title
                          content:(NSString *)content
                           cancel:(NSString *)cancel
                             sure:(NSString *)sure
                    cancelBtnClick:(CancelBlock)cancelBlock
                      sureBtnClick:(SureBlock)sureBlock;


@end
