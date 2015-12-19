//
//  ZJDockView.m
//  QzoneDemo
//
//  Created by 陈泽嘉 on 15/12/18.
//  Copyright (c) 2015年 dibadalu. All rights reserved.
//

#import "ZJDockView.h"
#import "ZJIconView.h"
#import "ZJTabBarView.h"
#import "ZJToolBarView.h"
#import "ZJConst.h"

@interface ZJDockView ()

@property(nonatomic,weak) ZJIconView *icon;
@property(nonatomic,weak) ZJTabBarView *tabBar;
@property(nonatomic,weak) ZJToolBarView *toolBar;

@end

@implementation ZJDockView


- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
//        self.backgroundColor = [UIColor redColor];
        
        
        [self setupChirdView];
        
    }
    return self;
}

- (void)setupChirdView{
    
    //头像
    ZJIconView *icon = [[ZJIconView alloc] init];
//    icon.backgroundColor = [UIColor yellowColor];
    [self addSubview:icon];
    self.icon = icon;
    
    //tabbar
    ZJTabBarView *tabBar = [[ZJTabBarView alloc] init];
//    tabBar.backgroundColor = [UIColor orangeColor];
    [self addSubview:tabBar];
    self.tabBar = tabBar;
    
    //toolbar
    ZJToolBarView *toolBar = [[ZJToolBarView alloc] init];
//    toolBar.backgroundColor = [UIColor blueColor];
    [self addSubview:toolBar];
    self.toolBar = toolBar;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
//    NSLog(@"%@",NSStringFromCGSize([UIScreen mainScreen].bounds.size));

    /**-------- toolBar-----  */
    //设置tabBar的宽度
    self.toolBar.width = self.width;
    if (Lanscape) {//横屏
        //toolBar的高度等于dock宽度的1/3
        self.toolBar.height = self.width / self.toolBar.subviews.count;
    }else{//竖屏
        //toolBar的高度等于dock宽度的3倍
        self.toolBar.height = self.width * self.toolBar.subviews.count;
    }
    //设置toolBar的y值
    self.toolBar.y = self.height - self.toolBar.height;
    
    /**---------- tabBar-------- */
    self.tabBar.width = self.width;
    self.tabBar.height = ZJDockPW * self.tabBar.subviews.count;
    self.tabBar.y = self.toolBar.y - self.tabBar.height;
    
    /**------- icon-------- */
    if (Portrait) {//竖屏
        self.icon.height = self.width;
        self.icon.width = self.icon.height;
        self.icon.x = (self.width - self.icon.width) * 0.5;
        self.icon.y = 50;
    }else{
        self.icon.width = self.width / 5 * 3;
        self.icon.height = self.icon.width + 40;
        self.icon.x = (self.width - self.icon.width ) / 2;
        self.icon.y = 70;
    }
    
}

@end
