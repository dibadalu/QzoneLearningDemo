//
//  ZJTabBarButton.m
//  QzoneDemo
//
//  Created by 陈泽嘉 on 15/12/19.
//  Copyright (c) 2015年 dibadalu. All rights reserved.
//

#import "ZJTabBarButton.h"
#import "ZJConst.h"

@implementation ZJTabBarButton

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateDisabled];
        //设置图片居中显示
        self.imageView.contentMode = UIViewContentModeCenter;
        
        //设置按钮的内容水平方向的对齐方式
//        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//        CGFloat leftInsert = 10;
//        self.contentEdgeInsets = UIEdgeInsetsMake(0, leftInsert, 0, 0);
//        self.titleEdgeInsets = UIEdgeInsetsMake(0, leftInsert, 0, 0);
        
    }
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    if (Lanscape) {//横屏
        self.imageView.width = self.width * 0.5;
        self.imageView.height = self.height;
        self.imageView.x = 0;
        self.imageView.y = 0;
        
        self.titleLabel.hidden = NO;
        self.titleLabel.x = self.imageView.width;
        self.titleLabel.y = 0;
        self.titleLabel.width = self.width - self.imageView.width;
        self.titleLabel.height = self.height;
    }else{
        self.imageView.width = self.width;
        self.imageView.height = self.height;
        self.imageView.x = 0;
        self.imageView.y = 0;
        
        self.titleLabel.hidden = YES;
    }
    
    
}

@end
