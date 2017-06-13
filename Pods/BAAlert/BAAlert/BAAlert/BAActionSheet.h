
/*!
 *  @brief      BAAlert
 *
 *  @author     BAHome
 *  @copyright  Copyright © 2016年 BAHome. All rights reserved.
 *  @version    V1.1.0
 */


#import <UIKit/UIKit.h>
#import "BAAlert_Config.h"

@class BAActionSheet, BAActionSheetModel;

typedef void(^BAActionSheet_ConfigBlock)(BAActionSheet *tempView);
typedef void (^BAActionSheet_ActionBlock)(NSIndexPath *indexPath, BAActionSheetModel *model);


@interface BAActionSheet : UIView

/*! 是否开启边缘触摸隐藏 alert 默认：YES */
@property (nonatomic, assign) BOOL isTouchEdgeHide;

/*! 是否开启进出场动画 默认：NO，如果 YES ，并且同步设置进出场动画枚举为默认值：1 */
@property (nonatomic, assign, getter=isShowAnimate) BOOL showAnimate;

/*! 进出场动画枚举 默认：1 ，并且默认开启动画开关 */
@property (nonatomic, assign) BAAlertAnimatingStyle animatingStyle;

/*! BAActionSheet 类型，默认：1 */
@property (nonatomic, assign) BAActionSheetType actionSheetType;

@property (nonatomic, strong) NSArray <BAActionSheetModel *>*dataArray;
@property (nonatomic, strong) NSString *title;

/*!
 *
 *  @param configuration 属性配置：如 bgColor、buttonTitleColor、isTouchEdgeHide...
 *  @param actionBlock   block回调点击的选项
 */
+ (void)ba_actionSheetShowWithConfiguration:(BAActionSheet_ConfigBlock)configuration
                                actionBlock:(BAActionSheet_ActionBlock)actionBlock;

/*!
 *  隐藏 BAActionSheet
 */
- (void)ba_actionSheetHidden;

@end

@class BAActionSheetSubContentModel;
@interface BAActionSheetModel : NSObject

@property(nonatomic, copy) NSString *imageUrl;
@property(nonatomic, copy) NSString *content;
@property(nonatomic, copy) NSString *subContent;
@property(nonatomic, strong) NSArray <BAActionSheetSubContentModel *>*subContentArray;

@end

@interface BAActionSheetSubContentModel : NSObject

@property(nonatomic, copy) NSString *subContent;

@end
