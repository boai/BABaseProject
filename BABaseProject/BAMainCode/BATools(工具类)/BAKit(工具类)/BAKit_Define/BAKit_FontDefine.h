//
//  BAKit_FontDefine.h
//  BAQMUIDemo
//
//  Created by 博爱 on 2017/2/9.
//  Copyright © 2017年 boaihome. All rights reserved.
//

#ifndef BAKit_FontDefine_h
#define BAKit_FontDefine_h

#pragma mark - 自定义系统字体大小
CG_INLINE UIFont *
BAKit_Font_systemFontOfSize(CGFloat fontSize){
    return [UIFont systemFontOfSize:fontSize];
}

#pragma mark - 粗体
CG_INLINE UIFont *
BAKit_Font_boldSystemFontOfSize(CGFloat fontSize){
    return [UIFont boldSystemFontOfSize:fontSize];
}

#pragma mark - 斜体
CG_INLINE UIFont *
BAKit_Font_italicSystemFontOfSize(CGFloat fontSize){
    return [UIFont italicSystemFontOfSize:fontSize];
}

#pragma mark - 自定义系统字体大小和粗细
CG_INLINE UIFont *
BAKit_Font_systemFontOfSizeAndWeight(CGFloat fontSize, CGFloat weight){
    return [UIFont systemFontOfSize:fontSize weight:weight];
}

#pragma mark - 自定义等宽字体大小和粗细
CG_INLINE UIFont *
BAKit_Font_monospacedDigitSystemFontOfSizeAndWeight(CGFloat fontSize, CGFloat weight){
    return [UIFont monospacedDigitSystemFontOfSize:fontSize weight:weight];
}


#pragma mark - 常用系统字体大小
#define BAKit_FontSystem_10    BAKit_Font_systemFontOfSize(10)
#define BAKit_FontSystem_11    BAKit_Font_systemFontOfSize(11)
#define BAKit_FontSystem_12    BAKit_Font_systemFontOfSize(12)
#define BAKit_FontSystem_13    BAKit_Font_systemFontOfSize(13)
#define BAKit_FontSystem_14    BAKit_Font_systemFontOfSize(14)
#define BAKit_FontSystem_15    BAKit_Font_systemFontOfSize(15)
#define BAKit_FontSystem_16    BAKit_Font_systemFontOfSize(16)
#define BAKit_FontSystem_17    BAKit_Font_systemFontOfSize(17)
#define BAKit_FontSystem_18    BAKit_Font_systemFontOfSize(18)
#define BAKit_FontSystem_19    BAKit_Font_systemFontOfSize(19)
#define BAKit_FontSystem_20    BAKit_Font_systemFontOfSize(20)
#define BAKit_FontSystem_25    BAKit_Font_systemFontOfSize(25)
#define BAKit_FontSystem_30    BAKit_Font_systemFontOfSize(30)






#endif /* BAKit_FontDefine_h */
