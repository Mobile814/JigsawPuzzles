//
//  BannerViewAd.m
//  Beard Booth
//
//  Created by Afzaal Ahmad on 11/17/13.
//
//

#import "BannerViewAd.h"
#import "constants.h"

@implementation BannerViewAd

- (id)initWithViewController:(UIViewController *)controller
{
    self = [super init];
    if( self )
    {
        // Specify the ad unit ID.
        self.adUnitID = kMY_BANNER_UNIT_ID;
        self.delegate = self;
        // Let the runtime know which UIViewController to restore after taking
        // the user wherever the ad goes and add it to the view hierarchy.

        self.rootViewController = controller;
        self.adSize = kGADAdSizeSmartBannerPortrait;
        [controller.view addSubview:self];
        self.backgroundColor = [UIColor blackColor];
        
        GADRequest *request = [GADRequest request];
        if( !kIS_Published_APP )
        {
            request.testDevices = @[GAD_SIMULATOR_ID];
        }
        // Initiate a generic request to load it with an ad.
        [self loadRequest:request];
    }
    
    return self;
}

- (void)showAd
{
    self.hidden = NO;
    [[self superview] bringSubviewToFront:self];
}

- (void)hideAd
{
    self.hidden = YES;
}

- (void)removeAd
{
    self.delegate = nil;
    [self removeFromSuperview];
}

#pragma mark Ad Request Lifecycle Notifications

- (void)adViewDidReceiveAd:(GADBannerView *)view
{

}

- (void)adView:(GADBannerView *)view didFailToReceiveAdWithError:(GADRequestError *)error
{

}

#pragma mark Click-Time Lifecycle Notifications

- (void)adViewWillPresentScreen:(GADBannerView *)adView
{
    
}

- (void)adViewWillDismissScreen:(GADBannerView *)adView
{
    
}

- (void)adViewDidDismissScreen:(GADBannerView *)adView
{
    
}

- (void)adViewWillLeaveApplication:(GADBannerView *)adView
{
    
}
@end
