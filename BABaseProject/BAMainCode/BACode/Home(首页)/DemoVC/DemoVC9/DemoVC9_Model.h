//
//  DemoVC9_Model.h
//  BABaseProject
//
//  Created by 博爱 on 16/5/26.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BABaseModel.h"

@interface DemoVC9_Model : BABaseModel

/*! 图像的名称，如果为nil则没有图像 */
@property (nonatomic,strong)  NSString *imageName;
/*! 标题 */
@property (nonatomic, strong) NSString *title;
/*! 来源 */
@property (nonatomic, strong) NSString *source;


@end
