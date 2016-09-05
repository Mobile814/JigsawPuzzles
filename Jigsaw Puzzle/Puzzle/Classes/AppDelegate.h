//
//  AppDelegate.h
//  Puzzle
//
//  Created by Andrea Barbon on 19/04/12.
//  Copyright (c) 2012 Università degli studi di Padova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "GCViewController.h"
#import <GameKit/GameKit.h>
#import "GameCenterManager.h"
#import "AppSpecificValues.h"
#import "Global.h"
#import "CMailComposeViewController.h"


#define FRACTAL_DEBUG

#ifdef FRACTAL_DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...);
#endif


#define APP_STORE_APP_ID 525717757
#define TIMES_B4_ASKING_TO_REIEW 5

#define YELLOW [UIColor colorWithRed:1.0 green:200.0/255.0 blue:0.0 alpha:1.0]
#define WOOD [UIColor colorWithPatternImage:[UIImage imageNamed:@"Wood.jpg"]]


#define IS_DEVICE_PLAUYING_MUSIC [[MPMusicPlayerController iPodMusicPlayer] playbackState] != MPMusicPlaybackStatePlaying


@class PuzzleController, CreatePuzzleOperation;
@interface AppDelegate : UIResponder <  UIApplicationDelegate,
                                        GKAchievementViewControllerDelegate,
                                        GKLeaderboardViewControllerDelegate,
                                        GameCenterManagerDelegate
                                        >
{
    
    BOOL wasOpened;
    int finalScore;

    //GameCenter
	GameCenterManager *     gameCenterManager;
	NSString *              currentLeaderBoard;
}

@property (nonatomic, retain) GameCenterManager *   gameCenterManager;
@property (nonatomic, retain) NSString *            currentLeaderBoard;

@property (retain, nonatomic) UIWindow *window;
@property (retain, nonatomic) PuzzleController *puzzle;

@property (nonatomic,retain) CreatePuzzleOperation *puzzleOperation;
@property (nonatomic       ) int finalScore;

@property (readonly, retain, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, retain, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, retain, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, retain, nonatomic) NSOperationQueue *operationQueue;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

- (void)showLeaderboard;
- (void)submitScore:(int)nScore;
@end
