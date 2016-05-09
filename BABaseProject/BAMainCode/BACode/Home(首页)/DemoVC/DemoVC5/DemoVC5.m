
/*!
 *  @header BAKit.h
 *          BABaseProject
 *
 *  @brief  BAKit
 *
 *  @author 博爱
 *  @copyright    Copyright © 2016年 博爱. All rights reserved.
 *  @version    V1.0
 */

//                            _ooOoo_
//                           o8888888o
//                           88" . "88
//                           (| -_- |)
//                            O\ = /O
//                        ____/`---'\____
//                      .   ' \\| |// `.
//                       / \\||| : |||// \
//                     / _||||| -:- |||||- \
//                       | | \\\ - /// | |
//                     | \_| ''\---/'' | |
//                      \ .-\__ `-` ___/-. /
//                   ___`. .' /--.--\ `. . __
//                ."" '< `.___\_<|>_/___.' >'"".
//               | | : `- \`.;`\ _ /`;.`/ - ` : | |
//                 \ \ `-. \_ __\ /__ _/ .-` / /
//         ======`-.____`-.___\_____/___.-`____.-'======
//                            `=---='
//
//         .............................................
//                  佛祖镇楼                  BUG辟易
//          佛曰:
//                  写字楼里写字间，写字间里程序员；
//                  程序人员写程序，又拿程序换酒钱。
//                  酒醒只在网上坐，酒醉还来网下眠；
//                  酒醉酒醒日复日，网上网下年复年。
//                  但愿老死电脑间，不愿鞠躬老板前；
//                  奔驰宝马贵者趣，公交自行程序员。
//                  别人笑我忒疯癫，我笑自己命太贱；
//                  不见满街漂亮妹，哪个归得程序员？

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
 * 博客    : http://boai.github.io
 
 *********************************************************************************
 
 */

#import "DemoVC5.h"
#import "DemoVC5Cell.h"


@interface DemoVC5 ()
<
    UITableViewDelegate,
    UITableViewDataSource,
    UITextFieldDelegate
>

@property (nonatomic, strong) UITableView  *tableView;
@property (nonatomic, strong) NSArray      *titlesArray;

@end

@implementation DemoVC5

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.hidden = NO;
}

- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] init];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorColor = [UIColor redColor];
        
        [self.view addSubview:_tableView];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0 , 0, BA_getTabbarHeight, 0));
        }];
        
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

- (NSArray *)titlesArray
{
    if (!_titlesArray)
    {
        _titlesArray = @[@"电话号码：", @"运营商类型：", @"邮箱地址：", @"用户密码：", @"身份证号码：", @"全数字：", @"网页地址URL：", @"IP地址：", @"汉字：", @"英文字符："];
    }
    return _titlesArray;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titlesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 创建cell
    DemoVC5Cell *cell = [DemoVC5Cell cellWithTableView:tableView];
    cell.titleLabel.text = self.titlesArray[indexPath.row];
    cell.textField.tag = 1001 + indexPath.row;
    cell.textField.delegate = self;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 点击立刻取消该cell的选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark --UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //收起键盘
    [textField resignFirstResponder];
//    NSString *inputText = textField.text;
    
    switch (textField.tag)
    {
        case 1001:
            [self judgeTextFieldResultType:BARegularExpressionTypePhone inputString:textField.text];
            break;
        case 1002:
            [self.view showAlertView:@"温馨提示：" message:[BARegularExpression ba_getPhoneNumType:textField.text]];
            break;
        case 1003:
            [self judgeTextFieldResultType:BARegularExpressionTypeEmail inputString:textField.text];
            break;
        case 1004:
            [self judgeTextFieldResultType:BARegularExpressionTypePasswordQualified inputString:textField.text];
            break;
        case 1005:
            [self judgeTextFieldResultType:BARegularExpressionTypeIDCard inputString:textField.text];
            break;
        case 1006:
            [self judgeTextFieldResultType:BARegularExpressionTypeAllNumber inputString:textField.text];
            break;
        case 1007:
            [self judgeTextFieldResultType:BARegularExpressionTypeUrl inputString:textField.text];
            break;
        case 1008:
            [self judgeTextFieldResultType:BARegularExpressionTypeIPAddress inputString:textField.text];
            break;
        case 1009:
            [self judgeTextFieldResultType:BARegularExpressionTypeChinese inputString:textField.text];
            break;
        case 1010:
            [self judgeTextFieldResultType:BARegularExpressionTypeEnglishAlphabet inputString:textField.text];
            break;
            
        default:
            break;
    }
    
    return YES;
}

- (void)judgeTextFieldResultType:(BARegularExpressionType)type inputString:(NSString *)inputText
{
    switch (type)
    {
        case BARegularExpressionTypePhone:
            if ([BARegularExpression ba_isPhoneNumber:inputText])
            {
                [self.view showAlertView:@"温馨提示：" message:@"输入的是电话号码！"];
            }
            else
            {
                [self.view showAlertView:@"温馨提示：" message:@"输入的电话号码格式错误！"];
            }
            break;
        case BARegularExpressionTypeEmail:
            if ([BARegularExpression ba_isEmailQualified:inputText])
            {
                [self.view showAlertView:@"温馨提示：" message:@"输入的是邮箱！"];
            }
            else
            {
                [self.view showAlertView:@"温馨提示：" message:@"输入的邮箱格式错误！"];
            }
            break;
        case BARegularExpressionTypeUrl:
            if ([BARegularExpression ba_isUrl:inputText])
            {
                [self.view showAlertView:@"温馨提示：" message:@"输入的是Url！"];
            }
            else
            {
                [self.view showAlertView:@"温馨提示：" message:@"输入的Url格式错误！"];
            }
            break;
        case BARegularExpressionTypeAllNumber:
            if ([BARegularExpression ba_isAllNumber:inputText])
            {
                [self.view showAlertView:@"温馨提示：" message:@"输入的是纯数字！"];
            }
            else
            {
                [self.view showAlertView:@"温馨提示：" message:@"输入的数字格式错误！"];
            }
            break;
        case BARegularExpressionTypeIDCard:
            if ([BARegularExpression ba_isIdCardNumberQualified:inputText])
            {
                [self.view showAlertView:@"温馨提示：" message:@"输入的是身份证号码！"];
            }
            else
            {
                [self.view showAlertView:@"温馨提示：" message:@"输入的身份证号码格式错误！"];
            }
            break;
        case BARegularExpressionTypeEnglishAlphabet:
            if ([BARegularExpression ba_isEnglishAlphabet:inputText])
            {
                [self.view showAlertView:@"温馨提示：" message:@"输入的是26个英文字母组成的字符串！"];
            }
            else
            {
                [self.view showAlertView:@"温馨提示：" message:@"输入的26个英文字母组成的字符串格式错误！"];
            }
            break;
        case BARegularExpressionTypePasswordQualified:
            if ([BARegularExpression ba_isPasswordQualified:inputText])
            {
                [self.view showAlertView:@"温馨提示：" message:@"输入的密码是以字母开头，长度在6-18之间，只能包含字符、数字和下划线。！"];
            }
            else
            {
                [self.view showAlertView:@"温馨提示：" message:@"输入的密码格式错误！密码要以以字母开头，长度在6-18之间，只能包含字符、数字和下划线。"];
            }
            break;
        case BARegularExpressionTypeIPAddress:
            if ([BARegularExpression ba_isIPAddress:inputText])
            {
                [self.view showAlertView:@"温馨提示：" message:@"输入的是IP地址！"];
            }
            else
            {
                [self.view showAlertView:@"温馨提示：" message:@"输入的IP地址格式错误！IP地址（15位或18位数字）"];
            }
            break;
        case BARegularExpressionTypeChinese:
            if ([BARegularExpression ba_isChinese:inputText])
            {
                [self.view showAlertView:@"温馨提示：" message:@"输入的是中文！"];
            }
            else
            {
                [self.view showAlertView:@"温馨提示：" message:@"输入的中文格式错误！"];
            }
            break;
            
        default:
            break;
    }
}



@end
