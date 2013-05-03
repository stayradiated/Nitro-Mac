//
//  AppDelegate.m
//  MacGap
//
//  Created by Alex MacCaw on 08/01/2012.
//  Copyright (c) 2012 Twitter. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize webView;

-(BOOL)applicationShouldHandleReopen:(NSApplication*)application
                   hasVisibleWindows:(BOOL)visibleWindows{

    return YES;
}

- (void) awakeFromNib {
    NSString *resourcesPath = [[NSBundle mainBundle] resourcePath];
	NSString *htmlPath = [resourcesPath stringByAppendingString:@"/public/index.html"];
    [[webView mainFrame] loadRequest:[NSURLRequest requestWithURL: [NSURL fileURLWithPath:htmlPath]]];
}

- (void) applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    // self.titleView is a an IBOutlet to an NSView that has been configured in IB with everything you want in the title bar
    self.titleView.frame = self.window.titleBarView.bounds;
    self.titleView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
    [self.window.titleBarView addSubview:self.titleView];
    
    NSSize buttonSize = NSMakeSize(100.f, 100.f);
    NSRect buttonFrame = NSMakeRect(NSMidX(self.window.titleBarView.bounds) - (buttonSize.width / 2.f), NSMidY(self.window.titleBarView.bounds) - 41.f, buttonSize.width, buttonSize.height);
    
    NSString *resourcesPath = [[NSBundle mainBundle] resourcePath];
    NSImage *logo = [[NSImage alloc] initWithContentsOfFile:[resourcesPath stringByAppendingString:@"/public/img/logo.png"]];
    NSImageView *logoView = [[NSImageView alloc] initWithFrame:buttonFrame];
    logoView.autoresizingMask = NSViewMaxXMargin | NSViewMinXMargin;
    [logoView setImage:logo];
    [self.titleView addSubview:logoView];
    
    self.window.trafficLightButtonsLeftMargin = 7.0;
    self.window.fullScreenButtonRightMargin = 7.0;
    self.window.centerFullScreenButton = YES;
    self.window.titleBarHeight = 40.0;
    
}

@end
