#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#import "UIView+ZJExtension.h"

//dock竖屏下的宽度
extern const CGFloat ZJDockPW;
//dock横屏下的宽度
extern const CGFloat ZJDockLW;
//dock竖屏时的宽度
extern const CGFloat ZJScreenPW;
//dock横屏时的宽度
extern const CGFloat ZJScreenLW;

//横屏
#define Lanscape ([UIScreen mainScreen].bounds.size.width == ZJScreenLW)
//竖屏
#define Portrait ([UIScreen mainScreen].bounds.size.width == ZJScreenPW)