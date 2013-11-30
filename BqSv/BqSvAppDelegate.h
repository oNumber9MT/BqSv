//
//  BqSvAppDelegate.h
//  BqSv
//
//  Created by 竹下 仁 on 11/07/24.
//  Copyright 2011 office #9. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface BqSvAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet MainViewController *mainViewController;

@end
