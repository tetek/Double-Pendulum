//
//  HelloWorldLayer.h
//  pendulum
//
//  Created by Wojciech Mandrysz on 22/02/2012.
//  Copyright 2012. All rights reserved.
//

#import "cocos2d.h"
#import "Vector4.h"
#import "Controls.h"
@interface MainLayer : CCLayer
{
    CCSprite *pendulum1;
    CCSprite *pendulum2;

    CGPoint pen1;
    CGPoint pen2;
    
    float mass1;
    float mass2;
    
    float length1;
    float length2;
    
    float gravity;
    float h;
    float scale;
}

-(Vector4*)f:(Vector4*)v;
-(float)f1:(Vector4*)v;
-(float)f2:(Vector4*)v;
+(CCScene *) scene;
@property(nonatomic,retain)Vector4 *vz;

@end
