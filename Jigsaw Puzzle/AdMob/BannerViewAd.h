//
//  BannerViewAd.h
//  Beard Booth
//
//  Created by Afzaal Ahmad on 11/17/13.
//
//

#import "GADBannerViewDelegate.h"
#import <Foundation/Foundation.h>
#import "GADBannerView.h"


@interface BannerViewAd : GADBannerView <GADBannerViewDelegate>
{
    
}

- (id)initWithViewController:(UIViewController *)controller;
- (void)showAd;
- (void)hideAd;
- (void)removeAd;
@end