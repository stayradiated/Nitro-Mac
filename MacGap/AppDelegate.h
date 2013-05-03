//
//  AppDelegate.h
//  MacGap
//
//  Created by Alex MacCaw on 08/01/2012.
//  Copyright (c) 2012 Twitter. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "INAppStoreWindow.h"
#import "Classes/ContentView.h"

#import "WindowController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet INAppStoreWindow *window;
@property (nonatomic,retain) IBOutlet WebView *webView;
@property (nonatomic, retain) IBOutlet NSView *titleView;

@end
