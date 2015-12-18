//
//  ZJIconView.m
//  QzoneDemo
//
//  Created by 陈泽嘉 on 15/12/18.
//  Copyright (c) 2015年 dibadalu. All rights reserved.
//

#import "ZJIconView.h"
#import "ZJConst.h"

@implementation ZJIconView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        //设置icon
        [self setImage:[UIImage imageNamed:@"lufy"] forState:UIControlStateNormal];
        [self setTitle:@"路飞" forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;//设置文字中间对齐
        self.imageView.layer.cornerRadius = 10;//设置圆角
        
    }
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    if (Portrait) {//竖屏
        self.imageView.frame = self.bounds;
        self.titleLabel.hidden = YES;
        
    }else{
        self.imageView.width = self.width;
        self.imageView.height = self.width;
        self.imageView.y = 0;
        self.imageView.x = 0;
        
        self.titleLabel.hidden = NO;
        self.titleLabel.x = 0;
        self.titleLabel.y = self.imageView.height;
        self.titleLabel.width = self.width;
        self.titleLabel.height = self.height - self.imageView.height;
    }
}

@end
