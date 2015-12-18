//
//  ZJTabBarView.m
//  QzoneDemo
//
//  Created by 陈泽嘉 on 15/12/18.
//  Copyright (c) 2015年 dibadalu. All rights reserved.
//

#import "ZJTabBarView.h"
#import "ZJConst.h"

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
    
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateDisabled];
    [button setTitle:title forState:UIControlStateNormal];

    //设置按钮的内容水平方向的对齐方式
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    CGFloat leftInsert = 10;
    button.contentEdgeInsets = UIEdgeInsetsMake(0, leftInsert, 0, 0);
    button.titleEdgeInsets = UIEdgeInsetsMake(0, leftInsert, 0, 0);
    
    [self addSubview:button];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    int count = self.subviews.count;
    for (int i = 0; i< count; i++) {
        //取出按钮
        UIButton *button = self.subviews[i];
        button.width = self.width;
        button.height = self.height / count;
        button.x = 0;
        button.y = button.height * i;
    }
}


@end
