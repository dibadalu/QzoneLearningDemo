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

extern NSString *const ZJTabBarDidSelectNotification;
extern NSString *const ZJTabBarSelectIndex;


//横屏
#define Lanscape ([UIScreen mainScreen].bounds.size.width == ZJScreenLW)
//竖屏
#define Portrait ([UIScreen mainScreen].bounds.size.width == ZJScreenPW)

#define ZJColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define ZJRandomColor ZJColor(arc4random_uniform(256),arc4random_uniform(256),arc4random_uniform(256))