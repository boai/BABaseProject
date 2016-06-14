
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
#import "RegexKitLite.h"
#import "DemoVC5_TextPart.h"

@interface DemoVC5 ()
<
    UITableViewDelegate,
    UITableViewDataSource,
    UITextFieldDelegate,
    UITextViewDelegate
>

@property (nonatomic, strong) UITableView  *tableView;
@property (nonatomic, strong) NSArray      *titlesArray;
@property (nonatomic, strong) DemoVC5Cell2 *cell2;

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
            make.edges.mas_equalTo(UIEdgeInsetsMake(0 , 0, 0, 0));
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) return self.titlesArray.count;
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        // 创建cell
        DemoVC5Cell *cell = [DemoVC5Cell cellWithTableView:tableView];
        cell.titleLabel.text = self.titlesArray[indexPath.row];
        cell.textField.tag = 1001 + indexPath.row;
        cell.textField.delegate = self;
        
        return cell;
    }
    if (indexPath.section == 1)
    {
        // 创建cell
        _cell2 = [DemoVC5Cell2 DemoVC5Cell2WithTableView:tableView];
//        cell.titleLabel.text = self.titlesArray[indexPath.row];
//        cell.textField.tag = 1001 + indexPath.row;
        _cell2.normalTextView.delegate = self;
        _cell2.hightlightTextField.delegate = self;
        _cell2.backgroundColor = BA_Orange_Color;
        
        return _cell2;
    }
    return [UITableViewCell new];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 点击立刻取消该cell的选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1)
    {
        return 280;
    }
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*! 第二种：卡片式动画 */
    static CGFloat initialDelay = 0.2f;
    static CGFloat stutter = 0.06f;
    
    cell.contentView.transform =  CGAffineTransformMakeTranslation(SCREEN_WIDTH, 0);
    
    [UIView animateWithDuration:1.0f delay:initialDelay + ((indexPath.row) * stutter) usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
        cell.contentView.transform = CGAffineTransformIdentity;
    } completion:NULL];
    
}

//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    CATransform3D rotation;
//    rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
//    rotation.m44 = 1.0/ -600;
//    //阴影
//    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
//    
//    //阴影偏移
//    cell.layer.shadowOffset = CGSizeMake(10, 10);
//    cell.alpha = 0;
//    cell.layer.transform = rotation;
//    //锚点
//    cell.layer.anchorPoint = CGPointMake(0.5, 0.5);
//    [UIView beginAnimations:@"rotation" context:NULL];
//    [UIView setAnimationDuration:0.8];
//    cell.layer.transform = CATransform3DIdentity;
//    cell.alpha = 1;
//    cell.layer.shadowOffset = CGSizeMake(0, 0);
//    [UIView commitAnimations];
//}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *headerLabel = [UILabel new];
    headerLabel.frame = CGRectMake(0, 0, BA_SCREEN_WIDTH, 20);
    headerLabel.textColor = BA_TEXTGrayColor;
    headerLabel.font = BA_FontSize(13);
    headerLabel.backgroundColor = BA_Yellow_Color;
    
    [self.view addSubview:headerLabel];
    
    if (section == 0)
    {
        headerLabel.text = @"正则表达式测试";
    }
    if (section == 1)
    {
        headerLabel.text = @"文字高亮筛选";
    }
    
    return headerLabel;
}

#pragma mark - ***** UITextFieldDelegate
#pragma mark 第一分区
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
            [self.view ba_showAlertView:@"温馨提示：" message:[BARegularExpression ba_getPhoneNumType:textField.text]];
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
    
//    _cell2 = [DemoVC5Cell2 DemoVC5Cell2WithTableView:self.tableView];
    //收起键盘
    [_cell2.hightlightTextField resignFirstResponder];
    NSString *inputText = textField.text;
    NSLog(@"%@---%@",_cell2.normalStr,inputText);
    _cell2.attributeStr = [self attributedTextWithText:_cell2.normalStr withPattern:inputText];
    _cell2.resultLabel.attributedText = _cell2.attributeStr;
    
    return YES;
}

- (void)judgeTextFieldResultType:(BARegularExpressionType)type inputString:(NSString *)inputText
{
    switch (type)
    {
        case BARegularExpressionTypePhone:
            if ([BARegularExpression ba_isPhoneNumber:inputText])
            {
                [self.view ba_showAlertView:@"温馨提示：" message:@"输入的是电话号码！"];
            }
            else
            {
                [self.view ba_showAlertView:@"温馨提示：" message:@"输入的电话号码格式错误！"];
            }
            break;
        case BARegularExpressionTypeEmail:
            if ([BARegularExpression ba_isEmailQualified:inputText])
            {
                [self.view ba_showAlertView:@"温馨提示：" message:@"输入的是邮箱！"];
            }
            else
            {
                [self.view ba_showAlertView:@"温馨提示：" message:@"输入的邮箱格式错误！"];
            }
            break;
        case BARegularExpressionTypeUrl:
            if ([BARegularExpression ba_isUrl:inputText])
            {
                [self.view ba_showAlertView:@"温馨提示：" message:@"输入的是Url！"];
            }
            else
            {
                [self.view ba_showAlertView:@"温馨提示：" message:@"输入的Url格式错误！"];
            }
            break;
        case BARegularExpressionTypeAllNumber:
            if ([BARegularExpression ba_isAllNumber:inputText])
            {
                [self.view ba_showAlertView:@"温馨提示：" message:@"输入的是纯数字！"];
            }
            else
            {
                [self.view ba_showAlertView:@"温馨提示：" message:@"输入的数字格式错误！"];
            }
            break;
        case BARegularExpressionTypeIDCard:
            if ([BARegularExpression ba_isIdCardNumberQualified:inputText])
            {
                [self.view ba_showAlertView:@"温馨提示：" message:@"输入的是身份证号码！"];
            }
            else
            {
                [self.view ba_showAlertView:@"温馨提示：" message:@"输入的身份证号码格式错误！"];
            }
            break;
        case BARegularExpressionTypeEnglishAlphabet:
            if ([BARegularExpression ba_isEnglishAlphabet:inputText])
            {
                [self.view ba_showAlertView:@"温馨提示：" message:@"输入的是26个英文字母组成的字符串！"];
            }
            else
            {
                [self.view ba_showAlertView:@"温馨提示：" message:@"输入的26个英文字母组成的字符串格式错误！"];
            }
            break;
        case BARegularExpressionTypePasswordQualified:
            if ([BARegularExpression ba_isPasswordQualified:inputText])
            {
                [self.view ba_showAlertView:@"温馨提示：" message:@"输入的密码是以字母开头，长度在6-18之间，只能包含字符、数字和下划线。！"];
            }
            else
            {
                [self.view ba_showAlertView:@"温馨提示：" message:@"输入的密码格式错误！密码要以以字母开头，长度在6-18之间，只能包含字符、数字和下划线。"];
            }
            break;
        case BARegularExpressionTypeIPAddress:
            if ([BARegularExpression ba_isIPAddress:inputText])
            {
                [self.view ba_showAlertView:@"温馨提示：" message:@"输入的是IP地址！"];
            }
            else
            {
                [self.view ba_showAlertView:@"温馨提示：" message:@"输入的IP地址格式错误！IP地址（15位或18位数字）"];
            }
            break;
        case BARegularExpressionTypeChinese:
            if ([BARegularExpression ba_isChinese:inputText])
            {
                [self.view ba_showAlertView:@"温馨提示：" message:@"输入的是中文！"];
            }
            else
            {
                [self.view ba_showAlertView:@"温馨提示：" message:@"输入的中文格式错误！"];
            }
            break;
            
        default:
            break;
    }
}

#pragma mark 第二分区
- (NSAttributedString *)attributedTextWithText:(NSString *)text withPattern:(NSString *)pattern
{
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] init];
    //    // 表情的规则
    //    NSString *emotionPattern = @"\\[[0-9a-zA-Z\\u4e00-\\u9fa5]+\\]";
    //    // @的规则
    //    NSString *atPattern = @"@[0-9a-zA-Z\\u4e00-\\u9fa5-_]+";
    //    // #话题#的规则
    //    NSString *topicPattern = @"#[0-9a-zA-Z\\u4e00-\\u9fa5]+#";
    //    // url链接的规则
    //    NSString *urlPattern = @"\\b(([\\w-]+://?|www[.])[^\\s()<>]+(?:\\([\\w\\d]+\\)|([^[:punct:]\\s]|/)))";
    //    NSString *pattern = [NSString stringWithFormat:@"%@|%@|%@|%@", emotionPattern, atPattern, topicPattern, urlPattern];
    
    // 遍历所有的特殊字符串
    NSMutableArray *parts = [NSMutableArray array];
    [text enumerateStringsMatchedByRegex:pattern usingBlock:^(NSInteger captureCount, NSString *const __unsafe_unretained *capturedStrings, const NSRange *capturedRanges, volatile BOOL *const stop) {
        
        if ((*capturedRanges).length == 0) return;
        
        DemoVC5_TextPart *part = [[DemoVC5_TextPart alloc] init];
        part.text = *capturedStrings;
        part.specical = YES;
        part.range = *capturedRanges;
        [parts addObject:part];
    }];
    // 遍历所有的非特殊字符
    [text enumerateStringsSeparatedByRegex:pattern usingBlock:^(NSInteger captureCount, NSString *const __unsafe_unretained *capturedStrings, const NSRange *capturedRanges, volatile BOOL *const stop) {
        
        if ((*capturedRanges).length == 0) return;
        
        DemoVC5_TextPart *part = [[DemoVC5_TextPart alloc] init];
        part.text = *capturedStrings;
        part.range = *capturedRanges;
        [parts addObject:part];
    }];
    
    // 排序
    // 按照从小 -> 大的顺序排列对象
    [parts sortUsingComparator:^NSComparisonResult(DemoVC5_TextPart *part1, DemoVC5_TextPart *part2)
    {
        // NSOrderedAscending = -1L, NSOrderedSame, NSOrderedDescending
        // 返回NSOrderedSame:两个一样大
        // NSOrderedAscending(升序):part2>part1
        // NSOrderedDescending(降序):part1>part2
        if (part1.range.location > part2.range.location)
        {
            // part1>part2
            // part1放后面, part2放前面
            return NSOrderedDescending;
        }
        // part1<part2
        // part1放前面, part2放后面
        return NSOrderedAscending;
    }];
    
    UIFont *font = BA_FontSize(15);
    // 按顺序拼接每一段文字
    for (DemoVC5_TextPart *part in parts) {
        // 等会需要拼接的子串
        NSAttributedString *substr = nil;
        
        if (part.specical)
        {
            // 非表情的特殊文字
            substr = [[NSAttributedString alloc] initWithString:part.text attributes:@{NSForegroundColorAttributeName:BA_Red_Color}];
        }
        else
        {
            // 非特殊文字
            substr = [[NSAttributedString alloc] initWithString:part.text];
        }
        [attributedText appendAttributedString:substr];
    }
    
    // 一定要设置字体,保证计算出来的尺寸是正确的
    [attributedText addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, attributedText.length)];
    
    return attributedText;
}

#pragma mark - ***** textViewDeleagate
- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
//    DemoVC5Cell2 *cell = [DemoVC5Cell2 DemoVC5Cell2WithTableView:self.tableView];
    _cell2.normalStr = textView.text;
    BALog(@"----------------%@", _cell2.normalStr);

    return YES;
}

@end
