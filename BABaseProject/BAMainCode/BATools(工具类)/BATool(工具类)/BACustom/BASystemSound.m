
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

#import "BASystemSound.h"
#import "BALog.h"

@implementation BASystemSound

/* 从ID中播放系统声音 */
+ (void)playSystemSound:(AudioID)audioID
{
    AudioServicesPlaySystemSound(audioID);
}

/* 播放系统声音震动 */
+ (void)playSystemSoundVibrate
{
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

/* 播放网页声音 */
+ (SystemSoundID)playCustomSound:(NSURL *)soundURL
{
    SystemSoundID soundID;
    
    OSStatus err = AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundURL), &soundID);
    if(err != kAudioServicesNoError)
    {
        BALog(@"Could not load %@", soundURL);
    }
    return soundID;
}

/* 配置自定义音效 */
+ (BOOL)disposeSound:(SystemSoundID)soudID
{
    OSStatus err = AudioServicesDisposeSystemSoundID(soudID);
    if(err != kAudioServicesNoError)
    {
        BALog(@"Error while disposing sound %i", (unsigned int)soudID);
        return NO;
    }
    
    return YES;
}

@end
