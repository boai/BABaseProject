//
//  BABaseHeaderFooterView.h
//  BABaseProject
//
//  Created by 博爱 on 16/7/7.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BABaseHeaderFooterView;

@protocol BABaseHeaderFooterViewDelegate <NSObject>

/*!
 *  BABaseHeaderFooterView
 *
 *  @param BABaseHeaderFooterView BABaseHeaderFooterView
 *  @param action                 action
 */
- (void)ba_customHeaderFooterView:(BABaseHeaderFooterView *)customHeaderFooterView action:(id)action;

@end

@interface BABaseHeaderFooterView : UITableViewHeaderFooterView

/*!
 *  CustomHeaderFooterView's delegate.
 */
@property (nonatomic, weak)  id <BABaseHeaderFooterViewDelegate>   delegate;

/*!
 *  CustomHeaderFooterView's data.
 */
@property (nonatomic, weak)  id                data;

/*!
 *  UITableView's section.
 */
@property (nonatomic)        NSInteger         section;

/*!
 *  TableView.
 */
@property (nonatomic, weak) UITableView       *tableView;

/*!
 *  Controller.
 */
@property (nonatomic, weak) UIViewController  *controller;

/*!
 *  Setup HeaderFooterView, override by subclass.
 */
- (void)ba_setupHeaderFooterView;

/*!
 *  Build subview, override by subclass.
 */
- (void)ba_buildSubview;

/*!
 *  Load content, override by subclass.
 */
- (void)ba_loadContent;

@end
