//
//  BAFPSLabel.h
//  Pods
//
//  Created by HyanCat on 16/4/4.
//
//

#import <UIKit/UIKit.h>

@interface BAFPSLabel : UILabel

@property (nonatomic, assign, getter=isAutoHide) BOOL autoHide;

+ (instancetype)showInWindow:(UIWindow *)window;

@end
