
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

#import <AudioToolbox/AudioToolbox.h>
#import <Foundation/Foundation.h>
/**
 *  音频标识枚举 http://iphonedevwiki.net/index.php/AudioServices
 */
typedef NS_ENUM(NSInteger, AudioID)
{
    AudioIDNewMail = 1000,
    AudioIDMailSent = 1001,
    AudioIDVoiceMail = 1002,
    AudioIDRecivedMessage = 1003,
    AudioIDSentMessage = 1004,
    AudioIDAlarm = 1005,
    AudioIDLowPower = 1006,
    AudioIDSMSReceived1 = 1007,
    AudioIDSMSReceived2 = 1008,
    AudioIDSMSReceived3 = 1009,
    AudioIDSMSReceived4 = 1010,
    AudioIDSMSReceived5 = 1013,
    AudioIDSMSReceived6 = 1014,
    AudioIDTweetSent = 1016,
    AudioIDAnticipate = 1020,
    AudioIDBloom = 1021,
    AudioIDCalypso = 1022,
    AudioIDChooChoo = 1023,
    AudioIDDescent = 1024,
    AudioIDFanfare = 1025,
    AudioIDLadder = 1026,
    AudioIDMinuet = 1027,
    AudioIDNewsFlash = 1028,
    AudioIDNoir = 1029,
    AudioIDSherwoodForest = 1030,
    AudioIDSpell = 1031,
    AudioIDSuspence = 1032,
    AudioIDTelegraph = 1033,
    AudioIDTiptoes = 1034,
    AudioIDTypewriters = 1035,
    AudioIDUpdate = 1036,
    AudioIDUSSDAlert = 1050,
    AudioIDSIMToolkitCallDropped = 1051,
    AudioIDSIMToolkitGeneralBeep = 1052,
    AudioIDSIMToolkitNegativeACK = 1053,
    AudioIDSIMToolkitPositiveACK = 1054,
    AudioIDSIMToolkitSMS = 1055,
    AudioIDTink = 1057,
    AudioIDCTBusy = 1070,
    AudioIDCTCongestion = 1071,
    AudioIDCTPathACK = 1072,
    AudioIDCTError = 1073,
    AudioIDCTCallWaiting = 1074,
    AudioIDCTKeytone = 1075,
    AudioIDLock = 1100,
    AudioIDUnlock = 1101,
    AudioIDFailedUnlock = 1102,
    AudioIDKeypressedTink = 1103,
    AudioIDKeypressedTock = 1104,
    AudioIDTock = 1105,
    AudioIDBeepBeep = 1106,
    AudioIDRingerCharged = 1107,
    AudioIDPhotoShutter = 1108,
    AudioIDShake = 1109,
    AudioIDJBLBegin = 1110,
    AudioIDJBLConfirm = 1111,
    AudioIDJBLCancel = 1112,
    AudioIDBeginRecording = 1113,
    AudioIDEndRecording = 1114,
    AudioIDJBLAmbiguous = 1115,
    AudioIDJBLNoMatch = 1116,
    AudioIDBeginVideoRecord = 1117,
    AudioIDEndVideoRecord = 1118,
    AudioIDVCInvitationAccepted = 1150,
    AudioIDVCRinging = 1151,
    AudioIDVCEnded = 1152,
    AudioIDVCCallWaiting = 1153,
    AudioIDVCCallUpgrade = 1154,
    AudioIDTouchTone1 = 1200,
    AudioIDTouchTone2 = 1201,
    AudioIDTouchTone3 = 1202,
    AudioIDTouchTone4 = 1203,
    AudioIDTouchTone5 = 1204,
    AudioIDTouchTone6 = 1205,
    AudioIDTouchTone7 = 1206,
    AudioIDTouchTone8 = 1207,
    AudioIDTouchTone9 = 1208,
    AudioIDTouchTone10 = 1209,
    AudioIDTouchToneStar = 1210,
    AudioIDTouchTonePound = 1211,
    AudioIDHeadsetStartCall = 1254,
    AudioIDHeadsetRedial = 1255,
    AudioIDHeadsetAnswerCall = 1256,
    AudioIDHeadsetEndCall = 1257,
    AudioIDHeadsetCallWaitingActions = 1258,
    AudioIDHeadsetTransitionEnd = 1259,
    AudioIDVoicemail = 1300,
    AudioIDReceivedMessage = 1301,
    AudioIDNewMail2 = 1302,
    AudioIDMailSent2 = 1303,
    AudioIDAlarm2 = 1304,
    AudioIDLock2 = 1305,
    AudioIDTock2 = 1306,
    AudioIDSMSReceived1_2 = 1307,
    AudioIDSMSReceived2_2 = 1308,
    AudioIDSMSReceived3_2 = 1309,
    AudioIDSMSReceived4_2 = 1310,
    AudioIDSMSReceivedVibrate = 1311,
    AudioIDSMSReceived1_3 = 1312,
    AudioIDSMSReceived5_3 = 1313,
    AudioIDSMSReceived6_3 = 1314,
    AudioIDVoicemail2 = 1315,
    AudioIDAnticipate2 = 1320,
    AudioIDBloom2 = 1321,
    AudioIDCalypso2 = 1322,
    AudioIDChooChoo2 = 1323,
    AudioIDDescent2 = 1324,
    AudioIDFanfare2 = 1325,
    AudioIDLadder2 = 1326,
    AudioIDMinuet2 = 1327,
    AudioIDNewsFlash2 = 1328,
    AudioIDNoir2 = 1329,
    AudioIDSherwoodForest2 = 1330,
    AudioIDSpell2 = 1331,
    AudioIDSuspence2 = 1332,
    AudioIDTelegraph2 = 1333,
    AudioIDTiptoes2 = 1334,
    AudioIDTypewriters2 = 1335,
    AudioIDUpdate2 = 1336,
    AudioIDRingerVibeChanged = 1350,
    AudioIDSilentVibeChanged = 1351,
    AudioIDVibrate = 4095
};

/**
 *  这个类添加一些播放系统声音的方法
 */
@interface BASystemSound : NSObject

/**
 *  从ID中播放系统声音
 */
+ (void)playSystemSound:(AudioID)audioID;

/**
 *  播放系统声音震动
 */
+ (void)playSystemSoundVibrate;

/**
 *  播放网页声音
 */
+ (SystemSoundID)playCustomSound:(NSURL *)soundURL;

/**
 *  配置自定义音效
 */
+ (BOOL)disposeSound:(SystemSoundID)soundID;
@end
