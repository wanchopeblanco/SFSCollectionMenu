//
//  SFSViewController.m
//  SFSCollectionMenu
//
//  Created by BJ Miller on 9/7/13.
//  Copyright (c) 2013 Six Five Software, LLC. All rights reserved.
//

#import "SFSViewController.h"
#import "SFSCollectionMenuController.h"

@interface SFSViewController () <SFSCollectionMenuDelegate>
@property (nonatomic, strong) SFSCollectionMenuController *collectionMenu;
@property (weak, nonatomic) IBOutlet UILabel *buttonTappedLabel;
- (IBAction)buttonTap:(id)sender;
@end

@implementation SFSViewController

- (IBAction)buttonTap:(id)sender {
    if (!_collectionMenu) {
        _collectionMenu = [[SFSCollectionMenuController alloc] initWithDelegate:self];
    }
    [self.collectionMenu showMenuWithLightEffect:SFSLightEffectTypeMediumLight];
}


#pragma mark - SFSCollectionMenuDelegate methods

- (UIView *)viewForMenu {
    return self.view;
}

- (NSInteger)numberOfButtonsInMenuController:(SFSCollectionMenuController *)controller {
    return 6;
}

- (UIImage *)imageForButtonAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *images = @[[UIImage imageNamed:@"later-today"],
                        [UIImage imageNamed:@"later-tomorrow"],
                        [UIImage imageNamed:@"later-tomorrow-morning"],
                        [UIImage imageNamed:@"later-saturday"],
                        [UIImage imageNamed:@"later-week"],
                        [UIImage imageNamed:@"later-month"]];
    return images[indexPath.row];
}

- (UIImage *)titleForButtonAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *images = @[@"6 PM",
                        @"7 AM",
                        @"Manaña",
                        @"Sabado",
                        @"1 semana",
                        @"1 mes",];
    return images[indexPath.row];
}

- (UIColor *)backgroundColorForButtonAtIndexPath:(NSIndexPath *)indexPath {
    return [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1.0];
}

- (void)controller:(SFSCollectionMenuController *)controller didTapButtonAtIndexPath:(NSIndexPath *)indexPath {
    NSString *text = [NSString stringWithFormat:@"Button %d tapped", indexPath.row];
    self.buttonTappedLabel.text = text;
}

- (NSString *)accessibilityLabelForButtonAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *labels = @[@"Camera",
                        @"Chat",
                        @"Phone",
                        @"Star",
                        @"Tag",
                        @"Voicemail"];
    return labels[indexPath.row];
}

- (NSString *)accessibilityHintForButtonAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *hints = @[@"Opens the camera",
                       @"Starts a chat session",
                       @"Opens the phone app",
                       @"Marks this as a favorite",
                       @"Tags this for later",
                       @"Opens the voicemail interface to listen to voicemails"];
    return hints[indexPath.row];
}

- (UIImage *)imageForCloseButton {
    return [UIImage imageNamed:@"closeButtonGray"];
}

- (NSString *)labelTextForMenu {
    return @"My Menu";
}

- (UIColor *)colorForLabelText {
    return [UIColor whiteColor];
}

- (NSString *)accessibilityHintForMenuLabel {
    return @"Displaying My Menu to choose an option";
}

- (NSString *)accessibilityLabelForMenuLabel {
    return @"My Menu";
}

- (BOOL)isButtonEnabledAtIndexPath:(NSIndexPath *)indexPath inMenuController:(SFSCollectionMenuController *)controller {
    NSInteger button = indexPath.row;
    if (button == 1) // this would be the "Chat" button
        return NO;
    // or for instance, if MessageUI framework is added, you could do:
    // return ([MFMessageComposeViewController canSendText]) ? YES : NO;
    
    return YES;
}

@end
