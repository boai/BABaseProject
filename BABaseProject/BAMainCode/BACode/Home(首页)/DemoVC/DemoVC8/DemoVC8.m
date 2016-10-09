//
//  DemoVC8.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/25.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC8.h"
/*! 日历提醒事件 */
#import <EventKit/EventKit.h>

@interface DemoVC8 ()

@property (nonatomic, strong) UIButton      *btn;
@property (nonatomic, strong) UIButton      *btn2;

@property (nonatomic, strong) EKEventStore  *eventStore;
@property (nonatomic, strong) UIDatePicker  *datePicker;

@property (nonatomic, strong) NSDate        *selectedDate;
@property (nonatomic, strong) UILabel       *label;


@end

@implementation DemoVC8

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self test3];
    
}

- (void)test3
{
    /*!
     
     注意：
     
     1、要先导入系统库：
     
     EventKit.framework
     
     CoreGraphics.framework
     
     2、导入头文件：
     
     #import <EventKit/EventKit.h>
     
     */
    
    
    self.btn.hidden = NO;
    self.btn2.hidden = NO;
    self.datePicker.hidden = NO;
    
    
    
    /*! 日历提醒的设置 */
    [self settingsEvent];
}

- (UIButton *)btn
{
    if (!_btn)
    {
        _btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _btn.frame = CGRectMake(40, 100, BA_SCREEN_WIDTH - 80, 40);
        [_btn setBackgroundColor:[UIColor redColor]];
        [_btn setTitle:@"添加到提醒事项" forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _btn.showsTouchWhenHighlighted = YES;
        _btn.layer.masksToBounds = YES;
        _btn.layer.cornerRadius = 5.0;
        _btn.tag = 1001;
        [_btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_btn];
    }
    return _btn;
}

- (UIButton *)btn2
{
    if (!_btn2)
    {
        _btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _btn2.frame = CGRectMake(_btn.x, _btn.bottom + 10, _btn.width, 40);
        [_btn2 setBackgroundColor:[UIColor redColor]];
        [_btn2 setTitle:@"添加到日历提醒" forState:UIControlStateNormal];
        [_btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _btn2.showsTouchWhenHighlighted = YES;
        _btn2.layer.masksToBounds = YES;
        _btn2.layer.cornerRadius = 5.0;
        _btn2.tag = 1002;
        [_btn2 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_btn2];
    }
    return _btn;
}

- (UILabel *)label
{
    if (!_label)
    {
        _label = [UILabel new];
        _label.frame = CGRectMake(0, _datePicker.bottom + 20, BA_SCREEN_WIDTH, 40);
        _label.backgroundColor = [UIColor yellowColor];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.textColor = [UIColor redColor];
        
        [self.view addSubview:_label];
    }
    return _label;
}

- (UIDatePicker *)datePicker
{
    if (!_datePicker)
    {
        _datePicker = [[UIDatePicker alloc] init];
        _datePicker.frame = CGRectMake(0, _btn2.bottom + 20, BA_SCREEN_WIDTH, 200);
        _datePicker.backgroundColor = [UIColor blackColor];

        /*! 跟踪所有可用的地区，取出想要的地区 */
        BALog(@"%@", [NSLocale availableLocaleIdentifiers]);
        
        /*! 1、设置日期选择控件的地区 */
        [_datePicker setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_Hans_CN"]];
        /*! 英文 */
        //        [_datePicker setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"en_SC"]];
        
        /*! 2、设置DatePicker的日历。默认为当天。 */
        [_datePicker setCalendar:[NSCalendar currentCalendar]];
        
        /*! 3、设置DatePicker的时区。*/
        [_datePicker setTimeZone:[NSTimeZone defaultTimeZone]];
        
        /*! 4、设置DatePicker的日期。 */
        [_datePicker setDate:[NSDate date]];
        
        /*! 5、设置DatePicker的允许的最小日期。 */
        //        NSDate *minDate = [[NSDate alloc]initWithTimeIntervalSince1970:NSTimeIntervalSince1970];
        //        _datePicker.minimumDate = minDate;
        
        /*! 6、设置DatePicker的允许的最大日期。 */
        NSDateComponents *dc = [[NSDateComponents alloc] init];
        dc.year = 2099;
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        _datePicker.maximumDate = [gregorian dateFromComponents:dc];
        
        /*! 6.1 限定UIDatePicker的时间范围 */
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDate *currentDate = [NSDate date];
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        comps.year = 30;
        NSDate *maxDate = [calendar dateByAddingComponents:comps toDate:currentDate options:0];
        comps.year = -30;
        
        NSDate *minDate = [calendar dateByAddingComponents:comps toDate:currentDate options:0];
        _datePicker.minimumDate = minDate;
        _datePicker.maximumDate = maxDate;
        
        /*! 7、显示年月日，名称根据本地设置，显示小时，分钟和AM/PM,这个的名称是根据本地设置的 */
        [_datePicker setDatePickerMode:UIDatePickerModeDateAndTime];
        
        /*! 8、当值发生改变的时候调用的方法 */
        [_datePicker addTarget:self action:@selector(datePickValueChanged:) forControlEvents:UIControlEventValueChanged];
        
        /*! 9、用 runtime 和 KVC 改变字体颜色 */
        [self setTextColor];
        
        [self.view addSubview:_datePicker];
    }
    return _datePicker;
}

- (void)setTextColor
{
    // 获取所有的属性，去查看有没有对应的属性
    unsigned int count = 0;
    objc_property_t *propertys = class_copyPropertyList([UIDatePicker class], &count);
    for(int i = 0;i < count;i ++){
        
        // 获得每一个属性
        objc_property_t property = propertys[i];
        // 获得属性对应的nsstring
        NSString *propertyName = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        // 输出打印看对应的属性
        NSLog(@"propertyname = %@",propertyName);
        if ([propertyName isEqualToString:@"textColor"])
        {
            [_datePicker setValue:[UIColor redColor] forKey:propertyName];
        }
    }
    
    /*! 
     UIDatePicker 所有的属性，所以不能改变字体大小，需要改字体的只能使用 pickview 自定义了！
     
     2016-10-09 15:47:52.058 BABaseProject[1198:300932] propertyname = usesBlackChrome
     2016-10-09 15:47:52.058 BABaseProject[1198:300932] propertyname = drawsBackground
     2016-10-09 15:47:52.058 BABaseProject[1198:300932] propertyname = allowsZeroCountDownDuration
     2016-10-09 15:47:52.058 BABaseProject[1198:300932] propertyname = allowsZeroTimeInterval
     2016-10-09 15:47:52.058 BABaseProject[1198:300932] propertyname = dateUnderSelectionBar
     2016-10-09 15:47:52.058 BABaseProject[1198:300932] propertyname = contentWidth
     2016-10-09 15:47:52.058 BABaseProject[1198:300932] propertyname = isTimeIntervalMode
     2016-10-09 15:47:52.058 BABaseProject[1198:300932] propertyname = useCurrentDateDuringDecoding
     2016-10-09 15:47:52.058 BABaseProject[1198:300932] propertyname = _usesModernStyle
     2016-10-09 15:47:52.058 BABaseProject[1198:300932] propertyname = highlightColor
     2016-10-09 15:47:52.058 BABaseProject[1198:300932] propertyname = textColor
     2016-10-09 15:47:52.058 BABaseProject[1198:300932] propertyname = textShadowColor
     2016-10-09 15:47:52.058 BABaseProject[1198:300932] propertyname = timeInterval
     2016-10-09 15:47:52.058 BABaseProject[1198:300932] propertyname = shouldAnimateSetDateCall
     2016-10-09 15:47:52.059 BABaseProject[1198:300932] propertyname = datePickerMode
     2016-10-09 15:47:52.059 BABaseProject[1198:300932] propertyname = locale
     2016-10-09 15:47:52.059 BABaseProject[1198:300932] propertyname = calendar
     2016-10-09 15:47:52.059 BABaseProject[1198:300932] propertyname = timeZone
     2016-10-09 15:47:52.059 BABaseProject[1198:300932] propertyname = date
     2016-10-09 15:47:52.059 BABaseProject[1198:300932] propertyname = minimumDate
     2016-10-09 15:47:52.059 BABaseProject[1198:300932] propertyname = maximumDate
     2016-10-09 15:47:52.059 BABaseProject[1198:300932] propertyname = countDownDuration
     2016-10-09 15:47:52.059 BABaseProject[1198:300932] propertyname = minuteInterval
     */
}

- (void)datePickValueChanged:(UIDatePicker *)sender
{
    self.selectedDate = sender.date;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"]; // 这里是用大写的 H
    NSString *dateStr = [dateFormatter stringFromDate:self.selectedDate];
    
    if (self.selectedDate)
    {
        self.label.hidden = NO;
        self.label.text = [NSString stringWithFormat:@"选择日期：%@", dateStr];
    }
    else
        self.label.hidden = YES;
    
}

- (IBAction)btnClick:(UIButton *)sender
{
    
    if (sender.tag == 1001)
    {
        BALog(@" 添加到提醒事项 ");
        
        EKReminder *reminder = [EKReminder reminderWithEventStore:self.eventStore];
        reminder.calendar = self.eventStore.defaultCalendarForNewReminders;
        reminder.title = @"测试提醒事项【此处可随意更改】！";
        if (!self.selectedDate)
        {
            [[[UIAlertView alloc] initWithTitle:@"温馨提示：" message:@"请先选择日期时间" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
            return;
        }
        [reminder addAlarm:[EKAlarm alarmWithAbsoluteDate:self.selectedDate]];
        
        NSError *error = nil;
        [self.eventStore saveReminder:reminder commit:YES error:&error];
        if (error)
        {
            BALog(@"saveReminder error:%@", error);
        }
        BALog(@" 添加到提醒事项 , 时间为：%@", self.selectedDate);
    }
    if (sender.tag == 1002)
    {
        BALog(@" 添加到日历 ");
        
        EKEvent *event = [EKEvent eventWithEventStore:self.eventStore];
        event.calendar = self.eventStore.defaultCalendarForNewEvents;
        event.allDay = NO;
        event.title = @"测试日历提醒事项【此处可随意更改】！";
        
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *oneDayAgoComponents = [[NSDateComponents alloc] init];
        oneDayAgoComponents.minute = 2;
        NSDate *startDate = [calendar dateByAddingComponents:oneDayAgoComponents toDate:[NSDate date] options:0];
        NSDateComponents *oneYearFromNowComponents = [[NSDateComponents alloc] init];
        oneYearFromNowComponents.minute = 10;
        NSDate *endDate = [calendar dateByAddingComponents:oneYearFromNowComponents toDate:[NSDate date] options:0];
        
        event.startDate = startDate;
        event.endDate = endDate;
        
        /*! 加入提醒时间 */
        [event addAlarm:[EKAlarm alarmWithAbsoluteDate:startDate]];
        
        NSError *error = nil;
        [self.eventStore saveEvent:event span:EKSpanFutureEvents commit:YES error:&error];
        if (error) {
            BALog(@"error!!! \n%@", error);
        }
    }
    
}

#pragma mark - ***** 日历提醒的设置
- (void)settingsEvent
{
    if (self.eventStore == nil)
    {
        self.eventStore = [[EKEventStore alloc] init];
        if ([[[UIDevice currentDevice] systemVersion] floatValue] > 6.0)
        {
            /*! 6.0以后的系统需要申请权限 */
            [self.eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError * _Nullable error) {
                
                if (granted)
                {
                    BALog(@"用户允许使用“日历”！！！");
                }
                else
                {
                    BALog(@"用户不允许使用“日历”！！！");
                }
                if (error)
                {
                    BALog(@"申请“日历”权限error:%@", error);
                }
                
            }];
            [self.eventStore requestAccessToEntityType:EKEntityTypeReminder completion:^(BOOL granted, NSError * _Nullable error) {
                
                if (granted)
                {
                    BALog(@"用户允许使用“提醒事项”！！！");
                }
                else
                {
                    BALog(@"用户不允许使用“提醒事项”！！！");
                }
                if (error)
                {
                    BALog(@"申请“提醒事项”权限error:%@", error);
                }
                
            }];
        }
    }
}

@end
