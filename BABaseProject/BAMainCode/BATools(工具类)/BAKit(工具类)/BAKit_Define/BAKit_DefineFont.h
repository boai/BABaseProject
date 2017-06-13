//
//  BAKit_DefineFont.h
//  BAQMUIDemo
//
//  Created by 博爱 on 2017/2/9.
//  Copyright © 2017年 boaihome. All rights reserved.
//

#ifndef BAKit_DefineFont_h
#define BAKit_DefineFont_h

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
#define BAKit_Font_systemFontOfSize_10      BAKit_Font_systemFontOfSize(10)
#define BAKit_Font_systemFontOfSize_11      BAKit_Font_systemFontOfSize(11)
#define BAKit_Font_systemFontOfSize_12      BAKit_Font_systemFontOfSize(12)
#define BAKit_Font_systemFontOfSize_13      BAKit_Font_systemFontOfSize(13)
#define BAKit_Font_systemFontOfSize_14      BAKit_Font_systemFontOfSize(14)
#define BAKit_Font_systemFontOfSize_15      BAKit_Font_systemFontOfSize(15)
#define BAKit_Font_systemFontOfSize_16      BAKit_Font_systemFontOfSize(16)
#define BAKit_Font_systemFontOfSize_17      BAKit_Font_systemFontOfSize(17)
#define BAKit_Font_systemFontOfSize_18      BAKit_Font_systemFontOfSize(18)
#define BAKit_Font_systemFontOfSize_19      BAKit_Font_systemFontOfSize(19)
#define BAKit_Font_systemFontOfSize_20      BAKit_Font_systemFontOfSize(20)
#define BAKit_Font_systemFontOfSize_25      BAKit_Font_systemFontOfSize(25)
#define BAKit_Font_systemFontOfSize_30      BAKit_Font_systemFontOfSize(30)

#pragma mark - 常用粗体系统字体大小
#define BAKit_Font_boldSystemFontOfSize_10  BAKit_Font_boldSystemFontOfSize(10)
#define BAKit_Font_boldSystemFontOfSize_11  BAKit_Font_boldSystemFontOfSize(11)
#define BAKit_Font_boldSystemFontOfSize_12  BAKit_Font_boldSystemFontOfSize(12)
#define BAKit_Font_boldSystemFontOfSize_13  BAKit_Font_boldSystemFontOfSize(13)
#define BAKit_Font_boldSystemFontOfSize_14  BAKit_Font_boldSystemFontOfSize(14)
#define BAKit_Font_boldSystemFontOfSize_15  BAKit_Font_boldSystemFontOfSize(15)
#define BAKit_Font_boldSystemFontOfSize_16  BAKit_Font_boldSystemFontOfSize(16)
#define BAKit_Font_boldSystemFontOfSize_17  BAKit_Font_boldSystemFontOfSize(17)
#define BAKit_Font_boldSystemFontOfSize_18  BAKit_Font_boldSystemFontOfSize(18)
#define BAKit_Font_boldSystemFontOfSize_19  BAKit_Font_boldSystemFontOfSize(19)
#define BAKit_Font_boldSystemFontOfSize_20  BAKit_Font_boldSystemFontOfSize(20)
#define BAKit_Font_boldSystemFontOfSize_25  BAKit_Font_boldSystemFontOfSize(25)
#define BAKit_Font_boldSystemFontOfSize_30  BAKit_Font_boldSystemFontOfSize(30)





#endif /* BAKit_DefineFont_h */
