//
//  BAKit_Const_Color.m
//  yunlianWIFI
//
//  Created by boai on 2017/4/12.
//  Copyright © 2017年 yunlianhui. All rights reserved.
//

#import "BAKit_Const_Color.h"

// 主题黄色
UIColor *BAKit_Color_ThemYellow;
UIColor *BAKit_Color_ThemBlue;

// 支付宝 蓝色
UIColor *BAKit_Color_AliPayBlue;

/*! 灰色 */
UIColor *BAKit_Color_Gray_1;
UIColor *BAKit_Color_Gray_2;
UIColor *BAKit_Color_Gray_3;
UIColor *BAKit_Color_Gray_4;
UIColor *BAKit_Color_Gray_5;
UIColor *BAKit_Color_Gray_6;
UIColor *BAKit_Color_Gray_7;
UIColor *BAKit_Color_Gray_8;
UIColor *BAKit_Color_Gray_9;
UIColor *BAKit_Color_Gray_10;
UIColor *BAKit_Color_Gray_11;

/*! 半透明遮罩色  */
UIColor *BAKit_Color_Translucent;
UIColor *BAKit_Color_Translucent_3;


/*! 白色 1.0 white */
UIColor *BAKit_Color_White;

/*! 红色 1.0, 0.0, 0.0 RGB */
UIColor *BAKit_Color_Red;

/*! 黄色 1.0, 1.0, 0.0 RGB */
UIColor *BAKit_Color_Yellow;

/*! 绿色 0.0, 1.0, 0.0 RGB */
UIColor *BAKit_Color_Green;

/*! 蓝色 0.0, 0.0, 1.0 RGB */
UIColor *BAKit_Color_Blue;

/*! 无色 0.0 white, 0.0 alpha */
UIColor *BAKit_Color_Clear;

/*! 橙色 1.0, 0.5, 0.0 RGB */
UIColor *BAKit_Color_Orange;

/*! 黑色 0.0 white */
UIColor *BAKit_Color_Black;

/*! 浅灰色 0.667 white */
UIColor *BAKit_Color_LightGray;

/*! 青色 0.0, 1.0, 1.0 RGB */
UIColor *BAKit_Color_Cyan;

/*! 红褐色 1.0, 0.0, 1.0 RGB */
UIColor *BAKit_Color_Magenta;

/*! 棕色 0.6, 0.4, 0.2 RGB */
UIColor *BAKit_Color_Brown;

/*! 紫色 0.5, 0.0, 0.5 RGB */
UIColor *BAKit_Color_Purple;




/** -------------------------- 基础设置颜色函数 -------------------------- */

UIColor *BAKit_Color_RandomRGB(){
    return BAKit_Color_RGBValue(arc4random_uniform(0xffffff));
}

UIColor *BAKit_Color_RandomRGBA(){
    return BAKit_Color_RGBAValue(arc4random_uniform(0xffffffff));
}

UIColor *BAKit_Color_RGBValue(UInt32 rgbValue){
    return [UIColor colorWithRed:((rgbValue & 0xff0000) >> 16) / 255.0f
                           green:((rgbValue & 0xff00) >> 8) / 255.0f
                            blue:(rgbValue  & 0xff) / 255.0f
                           alpha:1.0f];
}

UIColor *BAKit_Color_RGBAValue(UInt32 rgbaValue){
    return [UIColor colorWithRed:((rgbaValue & 0xff000000) >> 24) / 255.0f
                           green:((rgbaValue & 0xff0000) >> 16) / 255.0f
                            blue:((rgbaValue & 0xff00) >> 8) / 255.0f
                           alpha:(rgbaValue  & 0xff) / 255.0f];
}

UIColor *BAKit_Color_RGB(u_char r,u_char g, u_char b){
    return [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f];
}

UIColor *BAKit_Color_RGBA(u_char r,u_char g, u_char b, u_char a){
    return [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a/255.0f];
}

UIColor *BAKit_Color_Hex(NSString *hexString) {
    CGFloat r, g, b, a;
    if (BAKit_hexStrToRGBA(hexString, &r, &g, &b, &a)) {
        return [UIColor colorWithRed:r green:g blue:b alpha:a];
    }
    return nil;
}


/**
 加载颜色
 */
@interface NSObject(BAKit_Const_Color)

@end

@implementation NSObject(BAKit_Const_Color)

+ (void)load
{
    BAKit_Color_ThemYellow = BAKit_Color_RGB(229, 205, 139);
    BAKit_Color_ThemBlue = BAKit_Color_RGB(92, 140, 193);
    
    // 支付宝 蓝色
    BAKit_Color_AliPayBlue = BAKit_Color_RGB(0, 152, 229);

    /*! 灰色 */
    BAKit_Color_Gray_1 = BAKit_Color_RGB(53, 60, 70);
    BAKit_Color_Gray_2 = BAKit_Color_RGB(73, 80, 90);
    BAKit_Color_Gray_3 = BAKit_Color_RGB(93, 100, 110);
    BAKit_Color_Gray_4 = BAKit_Color_RGB(113, 120, 130);
    BAKit_Color_Gray_5 = BAKit_Color_RGB(133, 140, 150);
    BAKit_Color_Gray_6 = BAKit_Color_RGB(153, 160, 170);
    BAKit_Color_Gray_7 = BAKit_Color_RGB(173, 180, 190);
    BAKit_Color_Gray_8 = BAKit_Color_RGB(196, 200, 208);
    BAKit_Color_Gray_9 = BAKit_Color_RGB(216, 220, 228);
    BAKit_Color_Gray_10 = BAKit_Color_RGB(240, 240, 240);
    BAKit_Color_Gray_11 = BAKit_Color_RGB(248, 248, 248);

    /*! 半透明遮罩色  */
    BAKit_Color_Translucent = BAKit_Color_RGBA(0, 0, 0, 255/2);
    BAKit_Color_Translucent_3 = [[UIColor blackColor] colorWithAlphaComponent:0.3f];

    /*! 白色 1.0 white */
    BAKit_Color_White = [UIColor whiteColor];
    
    /*! 红色 1.0, 0.0, 0.0 RGB */
    BAKit_Color_Red = [UIColor redColor];
    
    /*! 黄色 1.0, 1.0, 0.0 RGB */
    BAKit_Color_Yellow = [UIColor yellowColor];
    
    /*! 绿色 0.0, 1.0, 0.0 RGB */
    BAKit_Color_Green = [UIColor greenColor];
    
    /*! 蓝色 0.0, 0.0, 1.0 RGB */
    BAKit_Color_Blue = [UIColor blueColor];
    
    /*! 无色 0.0 white, 0.0 alpha */
    BAKit_Color_Clear = [UIColor clearColor];
    
    /*! 橙色 1.0, 0.5, 0.0 RGB */
    BAKit_Color_Orange = [UIColor orangeColor];
    
    /*! 黑色 0.0 white */
    BAKit_Color_Black = [UIColor blackColor];
    
    /*! 浅灰色 0.667 white */
    BAKit_Color_LightGray = [UIColor lightGrayColor];
    
    /*! 青色 0.0, 1.0, 1.0 RGB */
    BAKit_Color_Cyan = [UIColor cyanColor];
    
    /*! 红褐色 1.0, 0.0, 1.0 RGB */
    BAKit_Color_Magenta = [UIColor magentaColor];
    
    /*! 棕色 0.6, 0.4, 0.2 RGB */
    BAKit_Color_Brown = [UIColor brownColor];
    
    /*! 紫色 0.5, 0.0, 0.5 RGB */
    BAKit_Color_Purple = [UIColor purpleColor];

    

}

@end
