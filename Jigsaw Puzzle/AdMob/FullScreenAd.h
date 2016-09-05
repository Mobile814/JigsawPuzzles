//
//  FullScreenAd.h
//  Beard Booth
//
//  Created by Afzaal Ahmad on 11/17/13.
//
//

#import "GADInterstitial.h"


@interface FullScreenAd : GADInterstitial <GADInterstitialDelegate>
{
    UIViewController *          controller;
}

@property ( retain ) UIViewController * controller;

+ (FullScreenAd *)sharedFullScreenAdWithViewController:(UIViewController *)c;
+ (void)clearFullScreenAd;

-(id)init;
-(void)showFullScreenAd;
-(void)hideFullScreenAd;
@end