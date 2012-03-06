//
//  AppDelegate.h
//  pendulum
//
//  Created by Wojciech Mandrysz on 22/02/2012.
//  Copyright 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
