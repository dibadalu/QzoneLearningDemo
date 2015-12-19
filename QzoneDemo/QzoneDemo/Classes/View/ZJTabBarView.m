//
//  ZJTabBarView.m
//  QzoneDemo
//
//  Created by 陈泽嘉 on 15/12/18.
//  Copyright (c) 2015年 dibadalu. All rights reserved.
//

#import "ZJTabBarView.h"
#import "ZJConst.h"
#import "ZJTabBarButton.h"

@interface ZJTabBarView ()

@property(nonatomic,weak) ZJTabBarButton *selectedButton;//被选中的按钮

@end

@implementation ZJTabBarView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        //创建按钮
        [self setupButton:@"tab_bar_feed_icon" title:@"全部动态"];
        [self setupButton:@"tab_bar_passive_feed_icon" title:@"与我相关"];
        [self setupButton:@"tab_bar_pic_wall_icon" title:@"照片墙"];
        [self setupButton:@"tab_bar_e_album_icon" title:@"电子相框"];
        [self setupButton:@"tab_bar_friend_icon" title:@"好友"];
        [self setupButton:@"tab_bar_e_more_icon" title:@"更多"];
        
    }
    return self;
}

/**
 *  创建按钮
 */
- (void)setupButton:(NSString *)icon title:(NSString *)title{
    
    ZJTabBarButton *button = [[ZJTabBarButton alloc] init];
    [button setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    //监听事件
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:button];

}

- (void)btnClick:(ZJTabBarButton *)button{
    
//    NSLog(@"btnClick");
    self.selectedButton.enabled = YES;//恢复可以被选择状态
    button.enabled = NO;//被点击按钮变成disabled
    self.selectedButton = button;
    
    //发出通知
    [[NSNotificationCenter defaultCenter] postNotificationName:ZJTabBarDidSelectNotification object:nil userInfo:@{ZJTabBarSelectIndex : @(button.tag)}];
    
}

/**
 *  设置子控件的frame
 */
- (void)layoutSubviews{
    [super layoutSubviews];
    
    int count = self.subviews.count;
    for (int i = 0; i< count; i++) {
        //取出按钮
        ZJTabBarButton *button = self.subviews[i];
        button.width = self.width;
        button.height = self.height / count;
        button.x = 0;
        button.y = button.height * i;
        
        //设置tag
        button.tag = i;
    }
}


@end
