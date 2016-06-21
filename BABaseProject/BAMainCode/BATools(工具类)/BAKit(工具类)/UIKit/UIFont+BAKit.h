
/*!
 *  @header BAKit
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

#import <UIKit/UIKit.h>
/**
 *  在iOS7可用的所有字体系列名称
 */
typedef NS_ENUM(NSInteger, FamilyFontName)
{
    FamilyFontNameAcademyEngravedLET = 0,
    FamilyFontNameAlNile,
    FamilyFontNameAmericanTypewriter,
    FamilyFontNameAppleColorEmoji,
    FamilyFontNameAppleSDGothicNeo,
    FamilyFontNameArial,
    FamilyFontNameArialHebrew,
    FamilyFontNameArialRoundedMTBold,
    FamilyFontNameAvenir,
    FamilyFontNameAvenirNext,
    FamilyFontNameAvenirNextCondensed,
    FamilyFontNameBanglaSangamMN,
    FamilyFontNameBaskerville,
    FamilyFontNameBodoni72,
    FamilyFontNameBodoni72Oldstyle,
    FamilyFontNameBodoni72Smallcaps,
    FamilyFontNameBodoniOrnaments,
    FamilyFontNameBradleyHand,
    FamilyFontNameChalkboardSE,
    FamilyFontNameChalkduster,
    FamilyFontNameCochin,
    FamilyFontNameCopperplate,
    FamilyFontNameCourier,
    FamilyFontNameCourierNew,
    FamilyFontNameDamascus,
    FamilyFontNameDevanagariSangamMN,
    FamilyFontNameDidot,
    FamilyFontNameDINAlternate,
    FamilyFontNameDINCondensed,
    FamilyFontNameEuphemiaUCAS,
    FamilyFontNameFarah,
    FamilyFontNameFutura,
    FamilyFontNameGeezaPro,
    FamilyFontNameGeorgia,
    FamilyFontNameGillSans,
    FamilyFontNameGujaratiSangemMN,
    FamilyFontNameGurmukhiMN,
    FamilyFontNameHeitiSC,
    FamilyFontNameHeitiTC,
    FamilyFontNameHelvetica,
    FamilyFontNameHelveticaNeue,
    FamilyFontNameHiraginoKakuGothicProN,
    FamilyFontNameHiraginoMinchoProN,
    FamilyFontNameHoeflerText,
    FamilyFontNameIowanOldStyle,
    FamilyFontNameKailasa,
    FamilyFontNameKannadaSangamMN,
    FamilyFontNameKhmerSangamMN NS_ENUM_AVAILABLE_IOS(8_0),
    FamilyFontNameKohinoorDevanagari NS_ENUM_AVAILABLE_IOS(8_0),
    FamilyFontNameLaoSangamMN NS_ENUM_AVAILABLE_IOS(8_0),
    FamilyFontNameMalayamSangamMN,
    FamilyFontNameMarion,
    FamilyFontNameMarkerFelt,
    FamilyFontNameMenlo,
    FamilyFontNameMishafi,
    FamilyFontNameNoteworthy,
    FamilyFontNameOptima,
    FamilyFontNameOriyaSangemMN,
    FamilyFontNamePalatino,
    FamilyFontNamePapyrus,
    FamilyFontNamePartyLET,
    FamilyFontNameSavoyeLET,
    FamilyFontNameSinhalaSangamMN,
    FamilyFontNameSnellRoundhand,
    FamilyFontNameSuperclarendon,
    FamilyFontNameSymbol,
    FamilyFontNameTamilSangamMN,
    FamilyFontNameTeluguSangamMN,
    FamilyFontNameThonburi,
    FamilyFontNameTimesNewRoman,
    FamilyFontNameTrebuchetMS,
    FamilyFontNameVerdana,
    FamilyFontNameZapfDingBats,
    FamilyFontNameZapfino
};

/**
 *  iOS7的所有可用的所有字体系列的的字体名称
 */
typedef NS_ENUM(NSInteger, FontName)
{
    FontNameAcademyEngravedLetPlain = 0,
    FontNameAlNile,
    FontNameAlNileBold,
    FontNameAmericanTypewriter,
    FontNameAmericanTypewriterBold,
    FontNameAmericanTypewriterCondensed,
    FontNameAmericanTypewriterCondensedBold,
    FontNameAmericanTypewriterCondensedLight,
    FontNameAmericanTypewriterLight,
    FontNameAppleColorEmoji,
    FontNameAppleSDGohticNeoBold,
    FontNameAppleSDGohticNeoLight,
    FontNameAppleSDGohticNeoMedium,
    FontNameAppleSDGohticNeoRegular,
    FontNameAppleSDGohticNeoSemiBold,
    FontNameAppleSDGohticNeoThin,
    FontNameArialBoldItalicMT,
    FontNameArialBoldMT,
    FontNameArialHebrew,
    FontNameArialHebrewBold,
    FontNameArialHebrewLight,
    FontNameArialItalicMT,
    FontNameArialMT,
    FontNameArialRoundedMTBold,
    FontNameASTHeitiLight,
    FontNameASTHeitiMedium,
    FontNameAvenirBlack,
    FontNameAvenirBlackOblique,
    FontNameAvenirBook,
    FontNameAvenirBookOblique,
    FontNameAvenirHeavtOblique,
    FontNameAvenirHeavy,
    FontNameAvenirLight,
    FontNameAvenirLightOblique,
    FontNameAvenirMedium,
    FontNameAvenirMediumOblique,
    FontNameAvenirNextBold,
    FontNameAvenirNextBoldItalic,
    FontNameAvenirNextCondensedBold,
    FontNameAvenirNextCondensedBoldItalic,
    FontNameAvenirNextCondensedDemiBold,
    FontNameAvenirNextCondensedDemiBoldItalic,
    FontNameAvenirNextCondensedHeavy,
    FontNameAvenirNextCondensedHeavyItalic,
    FontNameAvenirNextCondensedItalic,
    FontNameAvenirNextCondensedMedium,
    FontNameAvenirNextCondensedMediumItalic,
    FontNameAvenirNextCondensedRegular,
    FontNameAvenirNextCondensedUltraLight,
    FontNameAvenirNextCondensedUltraLightItalic,
    FontNameAvenirNextDemiBold,
    FontNameAvenirNextDemiBoldItalic,
    FontNameAvenirNextHeavy,
    FontNameAvenirNextItalic,
    FontNameAvenirNextMedium,
    FontNameAvenirNextMediumItalic,
    FontNameAvenirNextRegular,
    FontNameAvenirNextUltraLight,
    FontNameAvenirNextUltraLightItalic,
    FontNameAvenirOblique,
    FontNameAvenirRoman,
    FontNameBanglaSangamMN,
    FontNameBanglaSangamMNBold,
    FontNameBaskerville,
    FontNameBaskervilleBold,
    FontNameBaskervilleBoldItalic,
    FontNameBaskervilleItalic,
    FontNameBaskervilleSemiBold,
    FontNameBaskervilleSemiBoldItalic,
    FontNameBodoniOrnamentsITCTT,
    FontNameBodoniSvtyTwoITCTTBold,
    FontNameBodoniSvtyTwoITCTTBook,
    FontNameBodoniSvtyTwoITCTTBookIta,
    FontNameBodoniSvtyTwoOSITCTTBold,
    FontNameBodoniSvtyTwoOSITCTTBook,
    FontNameBodoniSvtyTwoOSITCTTBookIt,
    FontNameBodoniSvtyTwoSCITCTTBook,
    FontNameBradleyHandITCTTBold,
    FontNameChalkboardSEBold,
    FontNameChalkboardSELight,
    FontNameChalkboardSERegular,
    FontNameChalkduster,
    FontNameCochin,
    FontNameCochinBold,
    FontNameCochinBoldItalic,
    FontNameCochinItalic,
    FontNameCopperplate,
    FontNameCopperplateBold,
    FontNameCopperplateLight,
    FontNameCourier,
    FontNameCourierBold,
    FontNameCourierBoldOblique,
    FontNameCourierNewPSBoldItalicMT,
    FontNameCourierNewPSBoldMT,
    FontNameCourierNewPSItalicMT,
    FontNameCourierNewPSMT,
    FontNameCourierOblique,
    FontNameDamascus,
    FontNameDamascusBold,
    FontNameDamascusMedium,
    FontNameDamascusSemiBold,
    FontNameDevanagariSangamMN,
    FontNameDevanagariSangamMNBold,
    FontNameDidot,
    FontNameDidotBold,
    FontNameDidotItalic,
    FontNameDINAlternateBold,
    FontNameDINCondensedBold,
    FontNameDiwanMishafi,
    FontNameEuphemiaUCAS,
    FontNameEuphemiaUCASBold,
    FontNameEuphemiaUCASItalic,
    FontNameFarah,
    FontNameFuturaCondensedExtraBold,
    FontNameFuturaCondensedMedium,
    FontNameFuturaMedium,
    FontNameFuturaMediumItalicm,
    FontNameGeezaPro,
    FontNameGeezaProBold,
    FontNameGeezaProLight,
    FontNameGeorgia,
    FontNameGeorgiaBold,
    FontNameGeorgiaBoldItalic,
    FontNameGeorgiaItalic,
    FontNameGillSans,
    FontNameGillSansBold,
    FontNameGillSansBoldItalic,
    FontNameGillSansItalic,
    FontNameGillSansLight,
    FontNameGillSansLightItalic,
    FontNameGujaratiSangamMN,
    FontNameGujaratiSangamMNBold,
    FontNameGurmukhiMN,
    FontNameGurmukhiMNBold,
    FontNameHelvetica,
    FontNameHelveticaBold,
    FontNameHelveticaBoldOblique,
    FontNameHelveticaLight,
    FontNameHelveticaLightOblique,
    FontNameHelveticaNeue,
    FontNameHelveticaNeueBold,
    FontNameHelveticaNeueBoldItalic,
    FontNameHelveticaNeueCondensedBlack,
    FontNameHelveticaNeueCondensedBold,
    FontNameHelveticaNeueItalic,
    FontNameHelveticaNeueLight,
    FontNameHelveticaNeueMedium,
    FontNameHelveticaNeueMediumItalic,
    FontNameHelveticaNeueThin,
    FontNameHelveticaNeueThinItalic,
    FontNameHelveticaNeueUltraLight,
    FontNameHelveticaNeueUltraLightItalic,
    FontNameHelveticaOblique,
    FontNameHiraKakuProNW3,
    FontNameHiraKakuProNW6,
    FontNameHiraMinProNW3,
    FontNameHiraMinProNW6,
    FontNameHoeflerTextBlack,
    FontNameHoeflerTextBlackItalic,
    FontNameHoeflerTextItalic,
    FontNameHoeflerTextRegular,
    FontNameIowanOldStyleBold,
    FontNameIowanOldStyleBoldItalic,
    FontNameIowanOldStyleItalic,
    FontNameIowanOldStyleRoman,
    FontNameKailasa,
    FontNameKailasaBold,
    FontNameKannadaSangamMN,
    FontNameKannadaSangamMNBold,
    FontNameKhmerSangamMN NS_ENUM_AVAILABLE_IOS(8_0),
    FontNameKohinoorDevanagariLight NS_ENUM_AVAILABLE_IOS(8_0),
    FontNameKohinoorDevanagariMedium NS_ENUM_AVAILABLE_IOS(8_0),
    FontNameKohinoorDevanagariBook NS_ENUM_AVAILABLE_IOS(8_0),
    FontNameLaoSangamMN NS_ENUM_AVAILABLE_IOS(8_0),
    FontNameMalayalamSangamMN,
    FontNameMalayalamSangamMNBold,
    FontNameMarionBold,
    FontNameMarionItalic,
    FontNameMarionRegular,
    FontNameMarkerFeltThin,
    FontNameMarkerFeltWide,
    FontNameMenloBold,
    FontNameMenloBoldItalic,
    FontNameMenloItalic,
    FontNameMenloRegular,
    FontNameNoteworthyBold,
    FontNameNoteworthyLight,
    FontNameOptimaBold,
    FontNameOptimaBoldItalic,
    FontNameOptimaExtraBlack,
    FontNameOptimaItalic,
    FontNameOptimaRegular,
    FontNameOriyaSangamMN,
    FontNameOriyaSangamMNBold,
    FontNamePalatinoBold,
    FontNamePalatinoBoldItalic,
    FontNamePalatinoItalic,
    FontNamePalatinoRoman,
    FontNamePapyrus,
    FontNamePapyrusCondensed,
    FontNamePartyLetPlain,
    FontNameSavoyeLetPlain,
    FontNameSinhalaSangamMN,
    FontNameSinhalaSangamMNBold,
    FontNameSnellRoundhand,
    FontNameSnellRoundhandBlack,
    FontNameSnellRoundhandBold,
    FontNameSTHeitiSCLight,
    FontNameSTHeitiSCMedium,
    FontNameSTHeitiTCLight,
    FontNameSTHeitiTCMedium,
    FontNameSuperclarendonBlack,
    FontNameSuperclarendonBlackItalic,
    FontNameSuperclarendonBold,
    FontNameSuperclarendonBoldItalic,
    FontNameSuperclarendonItalic,
    FontNameSuperclarendonLight,
    FontNameSuperclarendonLightItalic,
    FontNameSuperclarendonRegular,
    FontNameSymbol,
    FontNameTamilSangamMN,
    FontNameTamilSangamMNBold,
    FontNameTeluguSangamMN,
    FontNameTeluguSangamMNBold,
    FontNameThonburi,
    FontNameThonburiBold,
    FontNameThonburiLight,
    FontNameTimesNewRomanPSBoldItalicMT,
    FontNameTimesNewRomanPSBoldMT,
    FontNameTimesNewRomanPSItalicMT,
    FontNameTimesNewRomanPSMT,
    FontNameTrebuchetBoldItalic,
    FontNameTrebuchetMS,
    FontNameTrebuchetMSBold,
    FontNameTrebuchetMSItalic,
    FontNameVerdana,
    FontNameVerdanaBold,
    FontNameVerdanaBoldItalic,
    FontNameVerdanaItalic,
    FontNameZapfDingbatsITC,
    FontNameZapfino
};

/**
 *  给UIFont类添加许多有用的方法
 */
@interface UIFont (BAKit)

/**
 *  打印控制台所有的字体系列和字体的名字
 */
+ (void)allFamilyAndFonts;

/**
 *  返回一个给定字体系列的所有字体名称集合
 */
+ (NSArray *)fontsNameForFamilyName:(FamilyFontName)familyFontName;

/**
 *  从给定的字体名称和大小中创建一个UIFont对象
 */
+ (UIFont *)fontForFontName:(FontName)fontName
                       size:(CGFloat)fontSize;


@end
