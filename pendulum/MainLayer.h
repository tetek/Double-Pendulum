//
//  HelloWorldLayer.h
//  pendulum
//
//  Created by Wojciech Mandrysz on 22/02/2012.
//  Copyright 2012. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface MainLayer : CCLayer
{
    CCLabelTTF *label;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
