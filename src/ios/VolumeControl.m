/********* VolumeControl.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

#ifdef DEBUG
    #define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
    #define DLog(...)
#endif

@interface VolumeControl : CDVPlugin {
   UIView *volumeView;
}
@property(nonatomic, retain) UIView *volumeView;
- (void)initCommand:(CDVInvokedUrlCommand *)command;
- (void)setVolume:(CDVInvokedUrlCommand*)command;
- (void)getVolume:(CDVInvokedUrlCommand*)command;
- (void)showVolumeNotifications:(CDVInvokedUrlCommand *)command;
- (void)hideVolumeNotifications:(CDVInvokedUrlCommand *)command;
/*
- (void)getCategory:(CDVInvokedUrlCommand*)command;
- (void)hideVolume:(CDVInvokedUrlCommand*)command;
*/
@end

@implementation VolumeControl

- (void)initCommand:(CDVInvokedUrlCommand*)command
{
    NSNumber* hideVolumeNotification = nil;
    
    
    NSDictionary* options = [command argumentAtIndex:0 withDefault:nil];
    if(options != nil){
        hideVolumeNotification = [options objectForKey:@"hideVolumeNotification"];
    }
    
}


- (void)showVolumeNotifications: (CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    if(self.volumeView){
        [self.volumeView removeFromSuperview];
        self.volumeView = nil;
    }
    BOOL result;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    
}
- (void)hideVolumeNotifications: (CDVInvokedUrlCommand*)command
{
     CDVPluginResult* pluginResult = nil;
    if ( ! self.volumeView){
        CGRect frame = CGRectMake(0, 0, 10, 0);
        self.volumeView = [[MPVolumeView alloc] initWithFrame:frame];
        [self.volumeView sizeToFit];
        [[[[UIApplication sharedApplication] windows] firstObject] insertSubview:self.volumeView atIndex:0];
    }
    BOOL result;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}



- (void)setVolume:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    float volume = [[command argumentAtIndex:0] floatValue];

    DLog(@"setVolume: [%f]", volume);

    
    [[MPMusicPlayerController applicationMusicPlayer] setVolume:volume];
   
    BOOL result;
  

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getVolume:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    DLog(@"getVolume");

    AVAudioSession *audioSession = [AVAudioSession sharedInstance];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDouble:audioSession.outputVolume];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

/*
- (void)getCategory:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    DLog(@"getCategory");

    AVAudioSession *audioSession = [AVAudioSession sharedInstance];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:audioSession.category];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)hideVolume:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    DLog(@"hideVolume");

    MPVolumeView *volumeView = [[MPVolumeView alloc] initWithFrame: CGRectZero];
    volumeView.alpha = 0.01;
    [self.webView.superview addSubview: volumeView];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:YES];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}*/

@end
