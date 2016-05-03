
/*!
 *  @header BAKit.h
 *          demoTest
 *
 *  @brief  BAKit
 *
 *  @author 博爱
 *  @copyright    Copyright © 2016年 博爱. All rights reserved.
 *  @version    V1.0
 */

/*!
 *
 *          ┌─┐       ┌─┐
 *       ┌──┘ ┴───────┘ ┴──┐
 *       │                 │
 *       │       ───       │
 *       │  ─┬┘       └┬─  │
 *       │                 │
 *       │       ─┴─       │
 *       │                 │
 *       └───┐         ┌───┘
 *           │         │
 *           │         │
 *           │         │
 *           │         └──────────────┐
 *           │                        │
 *           │                        ├─┐
 *           │                        ┌─┘
 *           │                        │
 *           └─┐  ┐  ┌───────┬──┐  ┌──┘
 *             │ ─┤ ─┤       │ ─┤ ─┤
 *             └──┴──┘       └──┴──┘
 *                 神兽保佑
 *                 代码无BUG!
 */

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
