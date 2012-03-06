//
//  Vector4.h
//  pendulum
//
//  Created by Wojciech Mandrysz on 06/03/2012.
//  Copyright (c) 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Vector4 : NSObject
{
    @public
    float a;
    float b;
    float c;
    float d;
}
+(id)vectorA:(float)a_ b:(float)b_ c:(float)c_ d:(float)d_;
+(id)vectorFromVector:(Vector4*)v;
-(Vector4*)sum:(Vector4*)v;
-(Vector4*)multiple:(float)m;

@end
