//
//  AlertViewHelper.m
//  AlertViewHelper
//
//  Created by admin on 16/6/21.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "AlertViewHelper.h"

@interface AlertViewHelper ()
@property(strong,nonatomic)UILabel *titleLabel;//标题
@property(strong,nonatomic)UILabel *contentLabel;//内容
@property(strong,nonatomic)UIButton *cancelBtn;//取消按钮
@property(strong,nonatomic)UIButton *sureBtn;//确定按钮



@end

@implementation AlertViewHelper

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        //标题
        _titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 50)];
        _titleLabel.textAlignment=NSTextAlignmentCenter;
        _titleLabel.textColor=[UIColor blackColor];
        [self addSubview:_titleLabel];
        //内容
        _contentLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_titleLabel.frame), self.bounds.size.width, 50)];
        _contentLabel.textAlignment=NSTextAlignmentCenter;
        _contentLabel.numberOfLines = 0;
        _contentLabel.textColor=[UIColor redColor];
        [self addSubview:_contentLabel];
        //取消按钮
        _cancelBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_contentLabel.frame), self.bounds.size.width/2, 50)];
        _cancelBtn.layer.borderColor=[UIColor grayColor].CGColor;
        _cancelBtn.layer.borderWidth=0.5;
        [_cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_cancelBtn addTarget:self action:@selector(cancelBtClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_cancelBtn];
        //确定按钮
        _sureBtn=[[UIButton alloc]initWithFrame:CGRectMake(self.bounds.size.width/2, CGRectGetMaxY(_contentLabel.frame), self.bounds.size.width/2, 50)];
        _sureBtn.layer.borderColor=[UIColor grayColor].CGColor;
        _sureBtn.layer.borderWidth=0.5;
        [_sureBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_sureBtn addTarget:self action:@selector(sureBtClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_sureBtn];
    }
    return self;
}
#pragma mark----实现类方法
+(instancetype)alterViewWithTitle:(NSString *)title
                          content:(NSString *)content
                           cancel:(NSString *)cancel
                             sure:(NSString *)sure
                    cancelBtnClick:(CancelBlock)cancelBlock
                      sureBtnClick:(SureBlock)sureBlock
{
    AlertViewHelper *alterView=[[AlertViewHelper alloc]initWithFrame:CGRectMake(0, 0, 250, 150)];
    alterView.backgroundColor=[UIColor whiteColor];
    alterView.center=CGPointMake(kSrceenWidth/2, kSrceenHeight/2-kSrceenWidth/4);
    alterView.layer.cornerRadius=5;
    alterView.layer.masksToBounds=YES;
    alterView.title=title;
    alterView.content=content;
    alterView.cancel=cancel;
    alterView.sure=sure;
    alterView.cancelBlock=cancelBlock;
    alterView.sureBlock=sureBlock;
    return alterView;
}
#pragma mark--给属性重新赋值
-(void)setTitle:(NSString *)title
{
    _titleLabel.text=title;
}
-(void)setContent:(NSString *)content
{
    _contentLabel.text=content;
}
-(void)setSure:(NSString *)sure
{
    [_sureBtn setTitle:sure forState:UIControlStateNormal];
}
-(void)setCancel:(NSString *)cancel
{
    [_cancelBtn setTitle:cancel forState:UIControlStateNormal];
}
#pragma mark----取消按钮点击事件
-(void)cancelBtClick
{
    [self removeFromSuperview];
    self.cancelBlock();
}
#pragma mark----确定按钮点击事件
-(void)sureBtClick
{
    [self removeFromSuperview];
    self.sureBlock();
}

@end
