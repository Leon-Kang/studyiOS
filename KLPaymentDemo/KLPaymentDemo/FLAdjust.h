//
//  FLAdjust.h
//  flirten
//
//  Created by Joan Martin on 13/08/14.
//  Copyright (c) 2014 MobileJazz. All rights reserved.
//



#import <Adjust/Adjust.h>

static NSString * FLAdjustAppKey = @"ubosavwb5beo";

typedef NSString FLAdjustToken;

static FLAdjustToken * const FLAdjustTokenScreenSettings                = @"om15yc";
static FLAdjustToken * const FLAdjustTokenScreenSlotMachine             = @"27daxa";
static FLAdjustToken * const FLAdjustTokenScreenProfile                 = @"8e2fki";
static FLAdjustToken * const FLAdjustTokenScreenRadar                   = @"eb8z5c";
static FLAdjustToken * const FLAdjustTokenScreenSearch                  = @"7gh2u0";
static FLAdjustToken * const FLAdjustTokenScreenInvite                  = @"og4e1e";
static FLAdjustToken * const FLAdjustTokenScreenDiamonds                = @"8upvgq";
static FLAdjustToken * const FLAdjustTokenScreenVoting                  = @"xqak2c";
static FLAdjustToken * const FLAdjustTokenScreenToplist                 = @"37m4nu";
static FLAdjustToken * const FLAdjustTokenScreenBadges                  = @"qjtz8n";
static FLAdjustToken * const FLAdjustTokenScreenFlirts                  = @"i21ie0";
static FLAdjustToken * const FLAdjustTokenScreenNotifications           = @"cy093x";
static FLAdjustToken * const FLAdjustTokenScreenNews                    = @"ace6cq";
static FLAdjustToken * const FLAdjustTokenScreenMyFame                  = @"oxrz1g";

static FLAdjustToken * const FLAdjustTokenDidRegister                   = @"yfiv75";
static FLAdjustToken * const FLAdjustTokenDidFinishRegistrationBack     = @"ckbhhf";
static FLAdjustToken * const FLAdjustTokenDidFinishRegistrationButton   = @"yebmk1";

static FLAdjustToken * const FLAdjustTokenFlatrate12Months              = @"3vnsfy";
static FLAdjustToken * const FLAdjustTokenFlatrate3Months               = @"v2t5i1";
static FLAdjustToken * const FLAdjustTokenFlatrate1Months               = @"s3qc3s";

static FLAdjustToken * const FLAdjustTokenMessageSent                   = @"3jmgwe";
static FLAdjustToken * const FLAdjustTokenStartedFlirt                  = @"rkjwr8";
static FLAdjustToken * const FLAdjustTokenNewSelfQuestion               = @"q9s1oz";
static FLAdjustToken * const FLAdjustTokenNewOtherQuestion              = @"2tppnq";

static FLAdjustToken * const FLAdjustTokenUploadedPhoto                 = @"ozgm0r";
static FLAdjustToken * const FLAdjustTokenUploadPhotoFacebook           = @"nhzo7h";

static FLAdjustToken * const FLAdjustTokenVotedAll                      = @"hm2gkw";
static FLAdjustToken * const FLAdjustTokenVotedHand                     = @"214ngj";
static FLAdjustToken * const FLAdjustTokenVotedFlame                    = @"kvq1fz";
static FLAdjustToken * const FLAdjustTokenVotedHeart                    = @"mc4m50";

static FLAdjustToken * const FLAdjustTokenUnlockFlirt                   = @"8lq4l6";
static FLAdjustToken * const FLAdjustTokenUnlockVote                    = @"t2r4dq";
static FLAdjustToken * const FLAdjustTokenUnlockQuestion                = @"7guba1";
static FLAdjustToken * const FLAdjustTokenUnlockAllFlirts               = @"yy3y4c";
static FLAdjustToken * const FLAdjustTokenUnlockAllVotes                = @"spywxt";
static FLAdjustToken * const FLAdjustTokenUnlockAllQuestions            = @"2qatvt";
static FLAdjustToken * const FLAdjustTokenBecomeVIP                     = @"jwrnv9";
//2.0
static FLAdjustToken * const FLAdjustTokenInvitesAll                    = @"qjl3b8";
static FLAdjustToken * const FLAdjustTokenInviteSMS                     = @"uu1f7a";
static FLAdjustToken * const FLAdjustTokenInviteFacebook                = @"20vk7k";
static FLAdjustToken * const FLAdjustTokenInviteEmail                   = @"debxec";
static FLAdjustToken * const FLAdjustTokenInviteWhatsApp                = @"d81tzc";

static FLAdjustToken * const FLAdjustTrackerTokenInviteFacebook         = @"aiukzw";
static FLAdjustToken * const FLAdjustTrackerTokenInviteEmail            = @"ply58t";
static FLAdjustToken * const FLAdjustTrackerTokenInviteWhatsApp         = @"ynsw3t";
//2.0
static FLAdjustToken * const FLAdjustTokenDiamondPackage1000            = @"iq9v0x";
static FLAdjustToken * const FLAdjustTokenDiamondPackage300             = @"gytrtd";
static FLAdjustToken * const FLAdjustTokenDiamondPackage125             = @"acsrc4";
static FLAdjustToken * const FLAdjustTokenDiamondPackage50              = @"43o7zz";
static FLAdjustToken * const FLAdjustTokenDiamondPackageALL             = @"bs6osm";
static FLAdjustToken * const FLAdjustTokenDiamondPackagePurchasing      = @"r38oet";
static FLAdjustToken * const FLAdjustTokenDiamondPackageFiled           = @"nr3k6p";
static FLAdjustToken * const FLAdjustTokenDiamondPackagePayFinished     = @"i5qece";
static FLAdjustToken * const FLAdjustTokenDiamondPackageDeferred        = @"qqbejz";

static FLAdjustToken * const FLAdjustTokenSlot10                        = @"meoh2h";
static FLAdjustToken * const FLAdjustTokenSlot23                        = @"3zq5ym";
static FLAdjustToken * const FLAdjustTokenSlot50                        = @"u0rojy";
static FLAdjustToken * const FLAdjustTokenSlot100                       = @"bc1sm2";
static FLAdjustToken * const FLAdjustTokenSlotPlay                      = @"xiwq3g";

static FLAdjustToken * const FLAdjustTokenPushReceived                  = @"208ivw";
static FLAdjustToken * const FLAdjustTokenXMPPReceived                  = @"oapo5k";

static FLAdjustToken * const FLAdjustTokenAccountDeletion               = @"k51yco";
static FLAdjustToken * const FLAdjustTokenUserLogout                    = @"mhad4r";


// Used to decide if calling 1 or 2
static NSInteger FLAdjustTokenLocationTag = 0;
static BOOL FLAdjustTokenAPNMaleActive = NO;
static BOOL FLAdjustTokenAPNFemaleActive = NO;
static NSInteger FLAdjustTokenAPNTag = 0;

static FLAdjustToken * const FLAdjustTokenLocation1Yes                  = @"jgfg2s";
static FLAdjustToken * const FLAdjustTokenLocation1No                   = @"53o6s1";
static FLAdjustToken * const FLAdjustTokenLocation2Yes                  = @"a1ow2q";
static FLAdjustToken * const FLAdjustTokenLocation2No                   = @"53o6s1";
static FLAdjustToken * const FLAdjustTokenAPNSMale1Yes                  = @"cmnrdf";
static FLAdjustToken * const FLAdjustTokenAPNSMale1No                   = @"jhv28t";
static FLAdjustToken * const FLAdjustTokenAPNSMale2Yes                  = @"m9uw05";
static FLAdjustToken * const FLAdjustTokenAPNSMale2No                   = @"uny6cl";
static FLAdjustToken * const FLAdjustTokenAPNSFemale1Yes                = @"9l0jpd";
static FLAdjustToken * const FLAdjustTokenAPNSFemale1No                 = @"fvrq3e";
static FLAdjustToken * const FLAdjustTokenAPNSFemale2Yes                = @"6if5cy";
static FLAdjustToken * const FLAdjustTokenAPNSFemale2No                 = @"ma63cm";

