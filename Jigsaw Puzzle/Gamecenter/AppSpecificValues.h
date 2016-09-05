/*
 
 File: AppSpecificValues.h
 Abstract: Basic introduction to GameCenter
 
 Version: 1.0
 
 Disclaimer: IMPORTANT:  This Apple software is supplied to you by Apple Inc.
 ("Apple") in consideration of your agreement to the following terms, and your
 use, installation, modification or redistribution of this Apple software
 constitutes acceptance of these terms.  If you do not agree with these terms,
 please do not use, install, modify or redistribute this Apple software.
 
 In consideration of your agreement to abide by the following terms, and subject
 to these terms, Apple grants you a personal, non-exclusive license, under
 Apple's copyrights in this original Apple software (the "Apple Software"), to
 use, reproduce, modify and redistribute the Apple Software, with or without
 modifications, in source and/or binary forms; provided that if you redistribute
 the Apple Software in its entirety and without modifications, you must retain
 this notice and the following text and disclaimers in all such redistributions
 of the Apple Software.
 Neither the name, trademarks, service marks or logos of Apple Inc. may be used
 to endorse or promote products derived from the Apple Software without specific
 prior written permission from Apple.  Except as expressly stated in this notice,
 no other rights or licenses, express or implied, are granted by Apple herein,
 including but not limited to any patent rights that may be infringed by your
 derivative works or by other works in which the Apple Software may be
 incorporated.
 
 The Apple Software is provided by Apple on an "AS IS" basis.  APPLE MAKES NO
 WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION THE IMPLIED
 WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND OPERATION ALONE OR IN
 COMBINATION WITH YOUR PRODUCTS.
 
 IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL OR
 CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION, MODIFICATION AND/OR
 DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED AND WHETHER UNDER THEORY OF
 CONTRACT, TORT (INCLUDING NEGLIGENCE), STRICT LIABILITY OR OTHERWISE, EVEN IF
 APPLE HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
 Copyright (C) 2010 Apple Inc. All Rights Reserved.
 
 */

//These constants are defined in iTunesConnect, and will function as long
//  as this sample is built/run with the existing bundle identifier
//  (com.appledts.GKTapper).  If you want to experiment with this sample and
//  iTunesConnect, you'll need to define you're own bundle ID and iTunes
//  Connect configurations.  This sample uses reverse DNS for Leaderboards
//  and Achievement IDs, but this is not a requirement.  Any string that
//  iTunes Connect will accept will work fine.

//Leaderboard Category IDs
#define kEasyLeaderboardID @"com.estring.jigsawpuzzles.leaderboard"

//Travelled 500 meters/ 1000 meters/ Travelled 2000 meters/ Travelled 5000 meters/Travelled 10000 meters/ Travelled 50000 meters
#define kAchievement_Travel500		@"com.kingstar.glidegame.travel500"
#define kAchievement_Travel1000		@"com.kingstar.glidegame.travel1000"
#define kAchievement_Travel2000		@"com.kingstar.glidegame.travel2000"
#define kAchievement_Travel5000		@"com.kingstar.glidegame.travel5000"
#define kAchievement_Travel10000	@"com.kingstar.glidegame.travel10000"
#define kAchievement_Travel50000	@"com.kingstar.glidegame.travel50000"

//gathered 100 suns/ gathered 200 suns/gathered 400 suns/gathered 600 suns
#define kAchievement_Gather100		@"com.kingstar.glidegame.gather100"
#define kAchievement_Gather200		@"com.kingstar.glidegame.gather200"
#define kAchievement_Gather400		@"com.kingstar.glidegame.gather400"
#define kAchievement_Gather600		@"com.kingstar.glidegame.gather600"

