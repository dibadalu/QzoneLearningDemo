//
//  ZJToolBarView.m
//  QzoneDemo
//
//  Created by 陈泽嘉 on 15/12/18.
//  Copyright (c) 2015年 dibadalu. All rights reserved.
//

#import "ZJToolBarView.h"
#import "ZJConst.h"


@implementation ZJToolBarView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
    
        //创建按钮
        [self setupButton:@"tabbar_photo"];
        [self setupButton:@"tabbar_mood"];
        [self setupButton:@"tabbar_blog"];

    }
    return self;
}

/**
 *  创建按钮
 */
- (void)setupButton:(NSString *)icon{
    
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateNormal];
    [self addSubview:button];
    
}

/**
 *  设置子控件的frame
 */
- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    int count = self.subviews.count;
    if (Lanscape) {//横屏
        for (int i = 0; i< count; i++) {
            //取出按钮
            UIButton *button = self.subviews[i];
            button.height = self.height;
            button.width = self.width / 3;
            button.y = 0;
            button.x = button.width * i;
        }
    }else{
        for (int i = 0; i< count; i++) {
            UIButton *button = self.subviews[i];
            button.height = self.height / 3;
            button.width = self.width;
            button.x = 0;
            button.y = button.height * i;
        }
    }
    
}

@end
