//
//  AppDelegate.h
//  Nitro
//
//  Created by Jono Cooper on 28/04/12.
//  Copyright (c) 2012 Caffeinated Code. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface AppDelegate : NSObject  {
	NSWindow *window;
	IBOutlet WebView *webView;
}

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic, retain) IBOutlet WebView *webView;

@end
