//
//  ZJHomeViewController.m
//  QzoneDemo
//
//  Created by 陈泽嘉 on 15/12/18.
//  Copyright (c) 2015年 dibadalu. All rights reserved.
//

#import "ZJHomeViewController.h"
#import "ZJDockView.h"
#import "ZJConst.h"

@interface ZJHomeViewController ()

@property(nonatomic,weak) ZJDockView *dockView;

/** 正在显示的子控制器 */
@property(nonatomic,weak) UIViewController *showingChirdVc;
@end

@implementation ZJHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = ZJColor(55, 55, 55);
    
    //初始化dock
    [self setupDockView];
    
    //初始化子控制器
    [self setupChirdVcs];
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
    
}

/**
 *  初始化dock
 */
- (void)setupDockView{
    
    //创建dock
    ZJDockView *dockView =  [[ZJDockView alloc] init];
    [self.view addSubview:dockView];
    self.dockView = dockView;
    
    //根据屏幕方向设置dock的尺寸
    [self willRotateToInterfaceOrientation:self.interfaceOrientation duration:0];
    
    //监听通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tabBarDidSelect:) name:ZJTabBarDidSelectNotification object:nil];
}

- (void)tabBarDidSelect:(NSNotification *)notification{
    
    int index = [notification.userInfo[ZJTabBarSelectIndex] intValue];
    
//    NSLog(@"=---%d",index);
    
    //移除正在显示的子控制器
    [self.showingChirdVc.view removeFromSuperview];
    
    //取出index对应的子控制器并显示
    UIViewController *chirdVc = self.childViewControllers[index];
    chirdVc.view.x = self.dockView.width;
    chirdVc.view.y = 0;
    chirdVc.view.width = 600;
    chirdVc.view.height = self.view.height;
    //将chirdVc的view显示在homeVc的view上
    [self.view addSubview:chirdVc.view];
    self.showingChirdVc = chirdVc;
    
    
}

#pragma mark - 屏幕旋转
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
    self.showingChirdVc.view.autoresizingMask = UIViewAutoresizingNone;//不要更随伸缩
    self.showingChirdVc.view.x = self.dockView.width;
    self.showingChirdVc.view.y = 0;
    self.showingChirdVc.view.height = self.dockView.height;
    self.showingChirdVc.view.width = 600;
    
    
}





@end
