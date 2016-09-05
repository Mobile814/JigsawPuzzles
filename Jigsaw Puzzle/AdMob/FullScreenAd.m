//
//  FullScreenAd.m
//  Beard Booth
//
//  Created by Afzaal Ahmad on 11/17/13.
//
//

#import "FullScreenAd.h"
#import "constants.h"

static FullScreenAd * singletonFullScreenAd = nil;

@implementation FullScreenAd
@synthesize controller;

+ (FullScreenAd *)sharedFullScreenAdWithViewController:(UIViewController *)c
{
    if( singletonFullScreenAd == nil )
        singletonFullScreenAd = [FullScreenAd new];
    singletonFullScreenAd.controller = c;
    
    return singletonFullScreenAd;
}

+ (void)clearFullScreenAd
{
    if( singletonFullScreenAd != nil )
    {
        [singletonFullScreenAd hideFullScreenAd];
        singletonFullScreenAd.controller = nil;
        [singletonFullScreenAd release];
        singletonFullScreenAd = nil;
    }
}

-(id)init
{
    self =[super init];
    if( self )
    {
        self.controller = nil;
        self.delegate = self;
        self.adUnitID = kMY_INTERSTITIAL_UNIT_ID;
        GADRequest *request  = [GADRequest request];

        if (!kIS_Published_APP)
        {
            request.testDevices = @[GAD_SIMULATOR_ID];
        }
        
        [self loadRequest:request];
    }
    return self;
}

- (void)dealloc
{
    self.delegate = nil;
    [controller release];
    [super dealloc];
}

-(void)showFullScreenAd
{
    [self presentFromRootViewController:self.controller];
}

-(void)hideFullScreenAd
{
    [self presentFromRootViewController:nil];
}

#pragma mark - Ad Request Lifecycle Notifications
// Sent when an interstitial ad request succeeded.  Show it at the next
// transition point in your application such as when transitioning between view
// controllers.
- (void)interstitialDidReceiveAd:(GADInterstitial *)interstitial
{
    [self presentFromRootViewController:self.controller];
}

// Sent when an interstitial ad request completed without an interstitial to
// show.  This is common since interstitials are shown sparingly to users.
- (void)interstitial:(GADInterstitial *)ad didFailToReceiveAdWithError:(GADRequestError *)error
{
    NSLog(@"%@", error);
}

#pragma mark - Display Time Lifecycle Notifications
// Sent just before presenting an interstitial.  After this method finishes the
// interstitial will animate onto the screen.  Use this opportunity to stop
// animations and save the state of your application in case the user leaves
// while the interstitial is on screen (e.g. to visit the App Store from a link
// on the interstitial).
- (void)interstitialWillPresentScreen:(GADInterstitial *)ad
{
    
}

// Sent before the interstitial is to be animated off the screen.
- (void)interstitialWillDismissScreen:(GADInterstitial *)ad
{
    
}

// Sent just after dismissing an interstitial and it has animated off the
// screen.
- (void)interstitialDidDismissScreen:(GADInterstitial *)ad
{

}

// Sent just before the application will background or terminate because the
// user clicked on an ad that will launch another application (such as the App
// Store).  The normal UIApplicationDelegate methods, like
// applicationDidEnterBackground:, will be called immediately before this.
- (void)interstitialWillLeaveApplication:(GADInterstitial *)ad
{
    
}
@end