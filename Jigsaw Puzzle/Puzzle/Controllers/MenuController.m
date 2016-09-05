//
//  MenuController.m
//  Puzzle
//
//  Created by Andrea Barbon on 27/04/12.
//  Copyright (c) 2012 Università degli studi di Padova. All rights reserved.
//

#import "MenuController.h"
#import "PuzzleController.h"
#import "NewGameController.h"
#import "LoadGameController.h"

#import "AppDelegate.h"
#import "SHKFacebook.h"
#import "SHKTwitter.h"


@interface MenuController ()

@end

@implementation MenuController

@synthesize delegate, duringGame, game, obscuringView, mainView, menuSound, chooseLabel, loadGameController;

@synthesize managedObjectContext = __managedObjectContext;
@synthesize managedObjectModel = __managedObjectModel;
@synthesize persistentStoreCoordinator = __persistentStoreCoordinator;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if( self )
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadSounds];
    newGameButton.titleLabel.font = [UIFont fontWithName:@"Bello-Pro" size:40];
    resumeButton.titleLabel.font = [UIFont fontWithName:@"Bello-Pro" size:40];
    showThePictureButton.titleLabel.font = [UIFont fontWithName:@"Bello-Pro" size:40];
    loadGameButton.titleLabel.font = [UIFont fontWithName:@"Bello-Pro" size:40];
    if( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        self.view.layer.masksToBounds = YES;
        self.view.layer.cornerRadius = 20;
    }
    CGRect screen = [[UIScreen mainScreen] bounds];
    CGRect rect = CGRectMake(0, 0, screen.size.height, screen.size.height);
    obscuringView = [[UIView alloc] initWithFrame:rect];
    obscuringView.backgroundColor = WOOD;
    chooseLabel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ChooseLabel"]];
    chooseLabel.alpha = 0;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        [obscuringView addSubview:chooseLabel];
    [delegate.view addSubview:obscuringView];
    [delegate.view bringSubviewToFront:self.view];
    resumeButton.hidden = YES;
    showThePictureButton.hidden = YES;
    CGRect selfRect = self.view.frame;
    mainView.frame = CGRectMake(0, 0, selfRect.size.width, selfRect.size.height);
    //Game
    game = [[NewGameController alloc] init];
    game.delegate = self;
    game.view.frame = CGRectMake(selfRect.size.width, 0, selfRect.size.width, selfRect.size.height);
    [self.view addSubview:game.view];
    //Load
    loadGameController = [[LoadGameController alloc] init];
    loadGameController.view.frame = CGRectMake(mainView.frame.size.width, 0, loadGameController.view.frame.size.width, loadGameController.view.frame.size.height);
    loadGameController.delegate = self;
    [self.view addSubview:loadGameController.view];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (YES);
}

- (void)toggleMenuWithDuration:(float)duration
{
    resumeButton.hidden = !duringGame;
    showThePictureButton.hidden = (!duringGame || delegate.puzzleCompete);
    
    float obscuring;
    
    if (duringGame) {
        
        obscuring = 1;
        
    } else {
        obscuring = 1;
    }
    
    
    if (self.view.alpha==0) {
        
        [delegate.view removeGestureRecognizer:delegate.pan];

        [UIView animateWithDuration:duration animations:^{
            
            obscuringView.alpha = obscuring;
            self.view.alpha = 1;
            delegate.completedController.view.alpha = 0;
        }];
        
        [delegate stopTimer];

        
    } else {
     
        [delegate.view addGestureRecognizer:delegate.pan];
        
        [UIView animateWithDuration:duration animations:^{
            
            obscuringView.alpha = 0;
            self.view.alpha = 0;
            if (delegate.puzzleCompete) delegate.completedController.view.alpha = 1;
            
        } completion:^(BOOL finished) {

            game.view.frame = CGRectMake(self.view.frame.size.width, game.view.frame.origin.y, 
                                         game.view.frame.size.width, game.view.frame.size.height);
            
            mainView.frame = CGRectMake(0, mainView.frame.origin.y, 
                                        mainView.frame.size.width, mainView.frame.size.height);
            [delegate startTimer];

        }];
    }
    
}

- (void)createNewGame {
        
    [delegate startNewGame];            
}

- (IBAction)startNewGame:(id)sender {
    
    if (sender!=nil) {
        
        [self playMenuSound];
        
        [UIView animateWithDuration:0.3 animations:^{
            
            [self showNewGameView];
            
        }];
        
    } else {
        
        [self showNewGameView];
    }
}

- (void)showNewGameView
{
    chooseLabel.center = CGPointMake(self.view.center.x-5, self.view.center.y-280);
    game.tapToSelectLabel.hidden = NO;
    game.startButton.enabled = (game.image.image != nil);
    game.view.frame = CGRectMake(0, game.view.frame.origin.y, game.view.frame.size.width, game.view.frame.size.height);
    mainView.frame = CGRectMake(-mainView.frame.size.width, mainView.frame.origin.y, mainView.frame.size.width, mainView.frame.size.height);
//    AppDelegate *m_delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    delegate = [[PuzzleController alloc] init];
//    delegate.managedObjectContext = m_delegate.managedObjectContext;
//    delegate.persistentStoreCoordinator = m_delegate.persistentStoreCoordinator;
//    [delegate loadPuzzle:[delegate lastSavedPuzzle]];
    
//    [self.window addSubview:puzzle.view];
    
    
    [self.delegate.bannerAd showAd];
    
}

- (void)loadSounds {
    
    NSString *soundPath =[[NSBundle mainBundle] pathForResource:@"Scissors_Shears" ofType:@"wav"];
    NSURL *soundURL = [NSURL fileURLWithPath:soundPath];
    menuSound = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:nil];
    [menuSound prepareToPlay];

}

- (void)playMenuSound {
    
    if (!IS_DEVICE_PLAUYING_MUSIC) {
        
        [menuSound play];
    }
}

- (IBAction)loadGame:(id)sender {

    [loadGameController reloadData];

    float f = 0;//delegate.adBannerView.bannerLoaded*delegate.adBannerView.frame.size.height;

    [UIView animateWithDuration:0.3 animations:^{
        loadGameController.view.frame = CGRectMake(0, f/2, game.view.frame.size.width, game.view.frame.size.height-f);
        mainView.frame = CGRectMake(-mainView.frame.size.width, mainView.frame.origin.y, mainView.frame.size.width, mainView.frame.size.height);
    }];
}

- (IBAction)resumeGame:(id)sender {
    
    DLog(@"Resume game");
    
    delegate.puzzleCompleteImage.alpha = 0;
    [self toggleMenuWithDuration:0.5];
    [self playMenuSound];
    
    [delegate.bannerAd hideAd];
}

- (IBAction)showThePicture:(id)sender {
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Hint" message:@"A shortcut to show the image: hold one finger on the screen for 1 second.\nEnjoy!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alertView show];

    //[self toggleMenu];    
    [delegate toggleImageWithDuration:0.5];
    [self playMenuSound];
    
    [delegate.bannerAd hideAd];
}

#pragma mark - Share Score
- (IBAction)onFacebook:(id)sender
{
    SHKItem * item = [SHKItem text:[NSString stringWithFormat:@"Your final score is %lld", m_nScore]];
    [SHKFacebook shareItem:item];
}

- (IBAction)onTwitter:(id)sender
{
    SHKItem * item = [SHKItem text:[NSString stringWithFormat:@"Your final score is %lld", m_nScore]];
    [SHKTwitter shareItem:item];
}

- (IBAction)onGameCenter:(id)sender
{
    AppDelegate * appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appDelegate submitScore:(int)m_nScore];
    [appDelegate showLeaderboard];
}
@end