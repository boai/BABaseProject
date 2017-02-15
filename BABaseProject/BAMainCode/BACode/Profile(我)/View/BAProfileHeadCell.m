//
//  BAProfileHeadCell.m
//  博爱微信
//
//  Created by 博爱 on 2016/10/24.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BAProfileHeadCell.h"
#import "BAUserModel.h"

@interface BAProfileHeadCell ()

@property (weak, nonatomic) IBOutlet UIImageView  *userImgView;
@property (weak, nonatomic) IBOutlet UILabel      *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel      *accountLabel;
@property (weak, nonatomic) IBOutlet UIImageView  *QRCodeImgView;

@end

@implementation BAProfileHeadCell

- (void)setModel:(BAUserModel *)model
{
    _model = model;
    
    if (model.isLogin)
    {
        _userImgView.image = BA_ImageName(@"icon1.jpg");
        _userNameLabel.text = model.nickName;
        _accountLabel.text = [NSString stringWithFormat:@"微信号：%@",model.phone];
    }
    else
    {
        _userImgView.image = BA_ImageName(@"profileVC.bundle/xhr");
        _userNameLabel.text = @"游客";
        _accountLabel.text = @"18588886666";
    }
}

- (void)awakeFromNib
{

}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
