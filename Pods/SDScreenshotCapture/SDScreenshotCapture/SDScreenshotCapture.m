// The MIT License (MIT)
//
// Copyright (c) 2013 Shiny Development Ltd.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
// the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import <QuartzCore/QuartzCore.h>
#import "SDScreenshotCapture.h"

#ifndef __IPHONE_7_0
#error "This class requires an SDK version of iOS 7.0 or later"
#endif

#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_5_0
#error "This class requires a deployment target of iOS 5.0 or later"
#endif

@implementation SDScreenshotCapture

+ (NSData *)dataWithScreenshotInPNGFormat
{
  CGSize imageSize = CGSizeZero;
  UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
  if (UIInterfaceOrientationIsPortrait(orientation)) imageSize = [UIScreen mainScreen].bounds.size;
  else imageSize = CGSizeMake([UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width);

  UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
  CGContextRef context = UIGraphicsGetCurrentContext();
  for (UIWindow *window in [[UIApplication sharedApplication] windows]) {
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, window.center.x, window.center.y);
    CGContextConcatCTM(context, window.transform);
    CGContextTranslateCTM(context, -window.bounds.size.width * window.layer.anchorPoint.x, -window.bounds.size.height * window.layer.anchorPoint.y);
    if (orientation == UIInterfaceOrientationLandscapeLeft) {
      CGContextRotateCTM(context, M_PI_2);
      CGContextTranslateCTM(context, 0, -imageSize.width);
    } else if (orientation == UIInterfaceOrientationLandscapeRight) {
      CGContextRotateCTM(context, -M_PI_2);
      CGContextTranslateCTM(context, -imageSize.height, 0);
    } else if (orientation == UIInterfaceOrientationPortraitUpsideDown) {
      CGContextRotateCTM(context, M_PI);
      CGContextTranslateCTM(context, -imageSize.width, -imageSize.height);
    }
    if ([window respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
      [window drawViewHierarchyInRect:window.bounds afterScreenUpdates:YES];
    } else {
      [window.layer renderInContext:context];
    }
    CGContextRestoreGState(context);
  }
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return UIImagePNGRepresentation(image);
}

+ (UIImage *)imageWithScreenshot
{
  NSData *imageData = [self dataWithScreenshotInPNGFormat];
  return [UIImage imageWithData:imageData];
}

+ (void)takeScreenshotToActivityViewController
{
  if ([UIActivityViewController class] == nil) {
    NSLog(@"UIActivityViewController is not supported on iOS versions less than 6.0");
    return;
  }

  UIImage *image = [self imageWithScreenshot];
  UIViewController *topViewController = [self topViewController];
  UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems:@[ image ] applicationActivities:nil];
  [topViewController presentViewController:controller animated:YES completion:nil];
}

+ (void)takeScreenshotToCameraRoll
{
  UIImage *image = [self imageWithScreenshot];
  UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
}

+ (void)takeScreenshotToDocumentsDirectory
{
  NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
  [self takeScreenshotToDirectoryAtPath:documentsPath];
}

+ (void)takeScreenshotToDirectoryAtPath:(NSString *)path
{
  static NSDateFormatter *dateFormatter = nil;
  if (dateFormatter == nil) {
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"Y-MM-d HH-mm-ss-SSS"];
  }

  NSData *imageData = [self dataWithScreenshotInPNGFormat];
  NSString *imageFileName = [NSString stringWithFormat:@"%@.png", [dateFormatter stringFromDate:[NSDate date]]];
  NSString *imagePath = [path stringByAppendingPathComponent:imageFileName];
  [[NSFileManager defaultManager] createFileAtPath:imagePath contents:imageData attributes:nil];
}

+ (UIViewController *)topViewController
{
  // Returns the currently visible ViewController, including active modal ViewControllers.
  NSAssert([UIApplication sharedApplication].keyWindow, @"Application should have a key window");
  NSAssert([UIApplication sharedApplication].keyWindow.rootViewController, @"Window should have a root view controller");
  return [self topViewControllerWithRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

+ (UIViewController *)topViewControllerWithRootViewController:(UIViewController *)rootViewController
{
  // Check type of rootViewController and return current or topmost child ViewController.
  // (Implementation by kleo, see http://stackoverflow.com/a/17578272/170132.)

  if ([rootViewController isKindOfClass:[UITabBarController class]]) {
    UITabBarController *tabBarController = (UITabBarController *)rootViewController;
    return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
  } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
    UINavigationController *navigationController = (UINavigationController *)rootViewController;
    return [self topViewControllerWithRootViewController:navigationController.visibleViewController];
  } else if (rootViewController.presentedViewController) {
    UIViewController *presentedViewController = rootViewController.presentedViewController;
    return [self topViewControllerWithRootViewController:presentedViewController];
  }
  return rootViewController;
}

@end
