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

@end

@implementation ZJHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    //创建dock
    ZJDockView *dockView =  [[ZJDockView alloc] init];
    [self.view addSubview:dockView];
    self.dockView = dockView;
    
    //根据屏幕方向设置dock的尺寸
    [self willRotateToInterfaceOrientation:self.interfaceOrientation duration:0];
    
}

#pragma mark - 屏幕旋转
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    
//    NSLog(@"旋转屏幕方向");
    
    if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)) {
//        NSLog(@"横屏");
        self.dockView.width = ZJDockLW;
        self.dockView.height = ZJScreenPW;
        
    }else{
//        NSLog(@"竖屏");
        self.dockView.width = ZJDockPW;
        self.dockView.height = ZJScreenLW;
    }
    
}

//- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
//
////    NSLog(@"%@",NSStringFromCGSize(size));
//    /*
//     {1024, 768}
//     {768, 1024}
//     */
//}



@end
