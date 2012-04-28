//
//  AppDelegate.m
//  Nitro
//
//  Created by Jono Cooper on 28/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize webView;

//this returns a nice name for the method in the JavaScript environment
+(NSString*)webScriptNameForSelector:(SEL)sel
{
    if(sel == @selector(logJavaScriptString:))
        return @"log";
    return nil;
}

//this allows JavaScript to call the -logJavaScriptString: method
+ (BOOL)isSelectorExcludedFromWebScript:(SEL)sel
{
    if(sel == @selector(logJavaScriptString:))
        return NO;
    return YES;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
}

- (void)awakeFromNib {
    //set this class as the web view's frame load delegate 
    //we will then be notified when the scripting environment 
    //becomes available in the page
	[webView setFrameLoadDelegate:self];
    
	NSString *resourcesPath = [[NSBundle mainBundle] resourcePath];
	NSString *htmlPath = [resourcesPath stringByAppendingString:@"/Nitro/app.html"];
	[[webView mainFrame] loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:htmlPath]]];

}



//this is a simple log command
- (void)logJavaScriptString:(NSString*) logText
{
	//Splits Command
	NSArray *commands = [logText componentsSeparatedByString:@"|"];
	
	//Access JavaScript
	//id scriptObject = [webView windowScriptObject];
	
	
	if ([[commands objectAtIndex:0] isEqualToString:@"set"]) {
        
        NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
        
        if (standardUserDefaults) {
            [standardUserDefaults setObject:[commands objectAtIndex:2] forKey:[commands objectAtIndex:1]];
            [standardUserDefaults synchronize];
        }        
        
    } else if ([[commands objectAtIndex:0] isEqualToString:@"get"]) {
        
        NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
        NSString *val = nil;
        
        if (standardUserDefaults) 
            val = [standardUserDefaults objectForKey:[commands objectAtIndex:1]];
        
        id scriptObject = [webView windowScriptObject];
        
        NSString *script = [NSString stringWithFormat:@"%@%@%@", @"xcode = '", val, @"'"];
        
        [scriptObject evaluateWebScript: script];
    }
}

//this is called as soon as the script environment is ready in the webview
- (void)webView:(WebView *)sender didClearWindowObject:(WebScriptObject *)windowScriptObject forFrame:(WebFrame *)frame
{
    //add the controller to the script environment
    //the "Cocoa" object will now be available to JavaScript
    [windowScriptObject setValue:self forKey:@"Cocoa"];
}

@end


