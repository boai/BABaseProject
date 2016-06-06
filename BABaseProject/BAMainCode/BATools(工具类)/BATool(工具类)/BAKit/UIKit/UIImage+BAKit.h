
/*!
 *  @header BAKit
 *          demoTest
 *
 *  @brief  BAKit
 *
 *  @author 博爱
 *  @copyright    Copyright © 2016年 博爱. All rights reserved.
 *  @version    V1.0
 */

/*!
 *
 *          ┌─┐       ┌─┐
 *       ┌──┘ ┴───────┘ ┴──┐
 *       │                 │
 *       │       ───       │
 *       │  ─┬┘       └┬─  │
 *       │                 │
 *       │       ─┴─       │
 *       │                 │
 *       └───┐         ┌───┘
 *           │         │
 *           │         │
 *           │         │
 *           │         └──────────────┐
 *           │                        │
 *           │                        ├─┐
 *           │                        ┌─┘
 *           │                        │
 *           └─┐  ┐  ┌───────┬──┐  ┌──┘
 *             │ ─┤ ─┤       │ ─┤ ─┤
 *             └──┴──┘       └──┴──┘
 *                 神兽保佑
 *                 代码无BUG!
 */

/*
 
 *********************************************************************************
 *
 * 在使用BAKit的过程中如果出现bug请及时以以下任意一种方式联系我，我会及时修复bug
 *
 * QQ     : 可以添加SDAutoLayout群 497140713 在这里找到我(博爱1616【137361770】)
 * 微博    : 博爱1616
 * Email  : 137361770@qq.com
 * GitHub : https://github.com/boai
 * 博客园  : http://www.cnblogs.com/boai/
 *********************************************************************************
 
 */

#import <UIKit/UIKit.h>
#import <CoreImage/CoreImage.h>
#import <Accelerate/Accelerate.h>

/**
 *  给UIImage类添加许多有用的方法
 */
@interface UIImage (BAKit)

/**
 *  Apply the Blend Mode Overlay应用混合模式覆盖
 *
 *  @return Return the image
 */
- (UIImage *)blendOverlay;

/**
 *  使用另外的图片及尺寸遮盖自己
 *
 *  @param image Mask image
 *  @param size  Mask size
 *
 *  @return Return the masked image
 */
- (UIImage *)maskWithImage:(UIImage *)image
                   andSize:(CGSize)size;

/**
 *  使用另外的图片遮盖自己
 *
 *  @param image Mask image
 *
 *  @return Return the masked image
 */
- (UIImage *)maskWithImage:(UIImage *)image;

/**
 *  从给定的矩形创建图像
 *
 *  @param rect Rect to take the image
 *
 *  @return Return the image from a given rect
 */
- (UIImage *)imageAtRect:(CGRect)rect;

/**
 *  Scale the image proportionally to the given size
 *
 *  @param targetSize The site to scale to
 *
 *  @return Return the scaled image
 */
- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;

/**
 *  Scale the image to the minimum given size
 *
 *  @param targetSize The site to scale to
 *
 *  @return Return the scaled image
 */
- (UIImage *)imageByScalingProportionallyToMinimumSize:(CGSize)targetSize;

/**
 *  Scale the image to the maxinum given size
 *
 *  @param maxSize The site to scale to
 *
 *  @return Return the scaled image
 */
- (UIImage *)imageByScalingProportionallyToMaximumSize:(CGSize)targetSize;

/**
 *  Scele the iamge to the given size
 *
 *  @param targetSize The site to scale to
 *
 *  @return Return the scaled image
 */
- (UIImage *)imageByScalingToSize:(CGSize)targetSize;

/**
 *  Rotate the image to the given radians
 *
 *  @param radians Radians to rotate to
 *
 *  @return Return the rotated image
 */
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;

/**
 *  Rotate the image to the given degrees
 *
 *  @param radians Degrees to rotate to
 *
 *  @return Return the rotated image
 */
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;

/**
 *  Check if the image has alpha
 *
 *  @return Return YES if has alpha, NO if not
 */
- (BOOL)hasAlpha;

/**
 *  Remove the alpha of the image
 *
 *  @return Return the image without alpha
 */
- (UIImage *)removeAlpha;

/**
 *  Fill the alpha with the white color
 *
 *  @return Return the filled image
 */
- (UIImage *)fillAlpha;

/**
 *  Fill the alpha with the given color
 *
 *  @param color Color to fill
 *
 *  @return Return the filled image
 */
- (UIImage *)fillAlphaWithColor:(UIColor *)color;

/**
 *  Check if the image is in grayscale
 *
 *  @return Return YES if is in grayscale, NO if not
 */
- (BOOL)isGrayscale;

/**
 *  Transform the image to grayscale
 *
 *  @return Return the transformed image
 */
- (UIImage *)imageToGrayscale;

/**
 *  Transform the image to black and white
 *
 *  @return Return the transformed image
 */
- (UIImage *)imageToBlackAndWhite;

/**
 *  Invert the color of the image
 *
 *  @return Return the transformed image
 */
- (UIImage *)invertColors;


/**
 *  Apply the bloom effect to the image
 *
 *  @param radius    Radius of the bloom
 *  @param intensity Intensity of the bloom
 *
 *  @return Return the transformed image
 */
- (UIImage *)bloom:(float)radius
         intensity:(float)intensity;

/**
 *  Apply the blur effect to the image
 *
 *  @param blur Radius of the blur
 *
 *  @return Return the transformed image
 */
- (UIImage *)boxBlurImageWithBlur:(CGFloat)blur;

/**
 *  Apply the bump distortion effect to the image
 *
 *  @param center Vector of the distortion. Use [CIVector vectorWithX:Y:]
 *  @param radius Radius of the effect
 *  @param scale  Scale of the effect
 *
 *  @return Return the transformed image
 */
- (UIImage *)bumpDistortion:(CIVector *)center
                     radius:(float)radius
                      scale:(float)scale;

/**
 *  Apply the bump distortion linear effect to the image
 *
 *  @param center Vector of the distortion, use [CIVector vectorWithX:Y:]
 *  @param radius Radius of the effect
 *  @param angle  Angle of the effect in radians
 *  @param scale  Scale of the effect
 *
 *  @return Return the transformed image
 */
- (UIImage *)bumpDistortionLinear:(CIVector *)center
                           radius:(float)radius
                            angle:(float)angle
                            scale:(float)scale;

/**
 *  Apply the circular splash distortion effect to the image
 *
 *  @param center Vector of the distortion, use [CIVector vectorWithX:Y:]
 *  @param radius Radius of the effect
 *
 *  @return Return the transformed image
 */
- (UIImage *)circleSplashDistortion:(CIVector *)center
                             radius:(float)radius;

/**
 *  Apply the circular wrap effect to the image
 *
 *  @param center Vector of the distortion, use [CIVector vectorWithX:Y:]
 *  @param radius Radius of the effect
 *  @param angle  Angle of the effect in radians
 *
 *  @return Return the transformed image
 */
- (UIImage *)circularWrap:(CIVector *)center
                   radius:(float)radius
                    angle:(float)angle;

/**
 *  Apply the CMY halftone effect to the image
 *
 *  @param center    Vector of the distortion, use [CIVector vectorWithX:Y:]
 *  @param width     Width value
 *  @param angle     Angle of the effect in radians
 *  @param sharpness Sharpness Value
 *  @param gcr       GCR value
 *  @param ucr       UCR value
 *
 *  @return Return the transformed image
 */
- (UIImage *)cmykHalftone:(CIVector *)center
                    width:(float)width
                    angle:(float)angle
                sharpness:(float)sharpness
                      gcr:(float)gcr
                      ucr:(float)ucr;

/**
 *  Apply the sepia filter to the image
 *
 *  @param intensity Intensity of the filter
 *
 *  @return Return the transformed image
 */
- (UIImage *)sepiaToneWithIntensity:(float)intensity;

/**
 *  Create an image from a given color
 *
 *  @param color Color value
 *
 *  @return Return an UIImage instance
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/*!
 *  图片背景颜色
 *
 *  @param color Color value
 *  @param size size
 *
 *  @return Return an UIImage instance
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

+ (instancetype)imageWithStretchableName:(NSString *)imageName;

/*! 获得的就是一个圆形的图片 */
- (UIImage *)BA_circleImage;

/*!
 *  creat a circleImage
 *
 *  @param name        imageName
 *  @param borderWidth borderWidth
 *  @param borderColor borderColor
 *
 *  @return creat a circleImage
 */
+ (instancetype)circleImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

/*! 加载最原始的图片，没有渲染 */
+ (instancetype)imageWithOriginalName:(NSString *)imageName;

/**
 *  图片的压缩方法
 *
 *  @param sourceImg   要被压缩的图片
 *  @param defineWidth 要被压缩的尺寸(宽)
 *
 *  @return 被压缩的图片
 */
+ (UIImage *)ba_IMGCompressed:(UIImage *)sourceImg targetWidth:(CGFloat)defineWidth;

@end
