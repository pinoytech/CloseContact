//
//  Constants.h
//  CloseContact
//
//  Created by Thorpe Obazee on 4/21/15.
//  Copyright (c) 2015 Thorpe Obazee. All rights reserved.
//

//screen configs
#define SCREEN_HEIGHT_5               568.0   // iPhone 5
#define SCREEN_HEIGHT_4               480.0   // iPhone 4/4S
#define IS_IOS8_ABOVE                 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 )
#define IS_IPHONE_5                   ((double)[[UIScreen mainScreen] bounds].size.height == SCREEN_HEIGHT_5)
#define IS_IPHONE_4                   ((double)[[UIScreen mainScreen] bounds].size.height == SCREEN_HEIGHT_4)
#define IS_IPHONE_4S_IOS8             (!IS_IPHONE_5 && IS_IOS8_ABOVE)
#define IS_RETINA                     ([UIScreen mainScreen].scale == 2.0)
#define SCREEN_WIDTH                  [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT                 [[UIScreen mainScreen] bounds].size.height
#define SCREEN_CENTER_X               SCREEN_WIDTH / 2
#define SCREEN_CENTER_Y               SCREEN_HEIGHT / 2
#define SCREEN_MARGIN                 10.0
#define SCREEN_SPACE                  40.0

//colors
#define RGB(r,g,b)                    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define BLUE_GREEN                    RGB(2, 55, 69)
#define YELLOW                        RGB(252, 191, 45)


// blah

#define CORNER_RADIUS                 5.0f
