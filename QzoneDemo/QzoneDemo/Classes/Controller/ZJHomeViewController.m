//
//  ZJHomeViewController.m
//  QzoneDemo
//
//  Created by 陈泽嘉 on 15/12/18.
//  Copyright (c) 2015年 dibadalu. All rights reserved.
//

/*
 masonry框架
 使用masonry报错：
 reason: 'couldn't find a common superview for <UIView: 0x7b09ad10; frame = (0 0; 768 1024); autoresize = W+H; layer = <CALayer: 0x7b09ada0>> and <UIView: 0x7ae5c940; frame = (0 0; 768 1024); autoresize = W+H; layer = <CALayer: 0x7ae5c200>>'
 需要把"chirdView添加到父控件"的代码放在masonry代码之前
 */


#import "ZJHomeViewController.h"
#import "ZJDockView.h"
#import "ZJConst.h"
#import "Masonry.h"//第三方autoLayout框架

@interface ZJHomeViewController ()

@property(nonatomic,weak) ZJDockView *dockView;

/** 正在显示的子控制器 */
@property(nonatomic,weak) UIViewController *showingChirdVc;
@end

@implementation ZJHomeViewController
- (ZJDockView *)dockView{
    if (!_dockView) {
        ZJDockView *dockView =  [[ZJDockView alloc] init];
        [self.view addSubview:dockView];
        self.dockView = dockView;
    }
    return _dockView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = ZJColor(55, 55, 55);
    
    //初始化子控制器
    [self setupChirdVcs];

    //根据屏幕方向设置dock的尺寸
    [self willRotateToInterfaceOrientation:self.interfaceOrientation duration:0];
    
    
    //监听通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tabBarDidSelect:) name:ZJTabBarDidSelectNotification object:nil];

}

- (void)dealloc{
    
    //移除通知的观察者
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/**
 *  初始化子控制器
 */
- (void)setupChirdVcs{
    
#warning 在这里为了演示，简单的用UIViewController,实际应用要用自定义控制器并用nav将其包装起来加入homeVc中
    for (int i = 0; i< 6; i++) {
        
        UIViewController *chirdVc = [[UIViewController alloc] init];
        chirdVc.view.backgroundColor = ZJRandomColor;
        //添加子控制器
        [self addChildViewController:chirdVc];
    }
    
    //默认选中tabBar第0个按钮
    [self switchChirdVcWithIndex:0];
    
}

/**
 *  切换子控制器
 *
 *  @param index 对应的索引
 */
- (void)switchChirdVcWithIndex:(int)index{
    
    //移除正在显示的子控制器
    [self.showingChirdVc.view removeFromSuperview];
    
    //取出index对应的子控制器并显示
    UIViewController *newChirdVc = self.childViewControllers[index];
    //将chirdVc的view显示在homeVc的view上
    [self.view addSubview:newChirdVc.view];
    self.showingChirdVc = newChirdVc;
    
#warning 通过masonry设置autolayout
    //添加约束
    [newChirdVc.view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //        make.width.mas_equalTo(600);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.dockView.mas_right);
        
    }];
    
}

- (void)tabBarDidSelect:(NSNotification *)notification{
    
    int index = [notification.userInfo[ZJTabBarSelectIndex] intValue];
    
    //切换子控制器
    [self switchChirdVcWithIndex:index];
}


#pragma mark - 监听屏幕方向
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{

    if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)) {
//        NSLog(@"横屏");
        self.dockView.width = ZJDockLW;
        self.dockView.height = ZJScreenPW;
        
    }else{
//        NSLog(@"竖屏");
        self.dockView.width = ZJDockPW;
        self.dockView.height = ZJScreenLW;
    }
    
#warning 默认情况下，所有子控制器的view.autoresizingMask都包含UIViewAutoresizingFlexibleWidth与UIViewAutoresizingFlexibleHeight，会跟随夫控件改变
    //旋转后重新设置子控制器的frame
//    self.showingChirdVc.view.autoresizingMask = UIViewAutoresizingNone;//不要更随伸缩
        
}


@end
