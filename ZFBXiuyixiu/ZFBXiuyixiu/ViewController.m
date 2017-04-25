//
//  ViewController.m
//  ZFBXiuyixiu
//
//  Created by Arvin on 17/4/25.
//  Copyright © 2017年 Arvin. All rights reserved.
//

#import "ViewController.h"
@interface ViewController()

@property (nonatomic,weak)UIButton *zfbBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置背景图片颜色 (27	29	47	)
    self.view.backgroundColor = [UIColor colorWithRed:27/255.0 green:29/255.0 blue:47/255.0 alpha:1];
    
    //添加支付宝Botton按钮
    UIButton *zfbButton = [[UIButton alloc]init];
    
    //设置支付宝按钮图片
    [zfbButton setImage:[UIImage imageNamed:@"alipay_msp_op_success"] forState:UIControlStateNormal];
    
    //让按钮的大小根据里面的图片自动调整
    [zfbButton sizeToFit];
    
    //让支付宝按钮在屏幕中间显示
    zfbButton.center = self.view.center;
    
    //将支付宝添加到父控件上
    [self.view addSubview:zfbButton];
    
    //给按钮添加监听方法实现功能
    [zfbButton addTarget:self action:@selector(startXiuXiu) forControlEvents:UIControlEventTouchUpInside];
    
    //给属性赋值
    self.zfbBtn = zfbButton;
}

-(void)startXiuXiu
{
    for(NSInteger i=0;i<10;i++)
    {
        //创建表示圆的视图
        UIView *circleView = [[UIView alloc]init];
        
        //设置背景图片(28	171	235	)
        circleView.backgroundColor = [UIColor colorWithRed:28/255.0 green:171/255.0 blue:235/255.0 alpha:1];
        //设置和支付宝图片大小一样的frame
        circleView.frame = self.zfbBtn.frame;
        
        //设置圆角半径
        circleView.layer.cornerRadius = circleView.bounds.size.width*0.5;
        
        //超出边界裁剪掉
        circleView.layer.masksToBounds = YES;
        
        //把设置好的视图添加成为控制器view的子控件并且放在支付宝按钮的下面
        // 控件要添加到谁身上就用谁去调用此方法,第1个参数表示要添加的子控件,第二个参数表示放在谁的下面
        [self.view insertSubview:circleView belowSubview:_zfbBtn];
        
        //设置延迟效果
        /**
         1. Duration 动画时间
         2. delay 延时
         3. Damping:阻尼系数(弹性) 越小越弹
         4. SpringVelocity: 速度 速率
         5. options: 动画选项
         6. animations: 执行动画的代码
         7. completion:动画执行完成之后要做的操作
         */
        
        [UIView animateWithDuration:2.0 delay:i*0.2  options:0 animations:^{
            //放大
            circleView.transform = CGAffineTransformMakeScale(17, 17);
            //慢慢透明
            circleView.alpha = 0;
        } completion:^(BOOL finished) {
            [circleView removeFromSuperview];//删除每次循环产生的视图
        }];
        
    }
}


@end
