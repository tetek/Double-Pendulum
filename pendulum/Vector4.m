//
//  Vector4.m
//  pendulum
//
//  Created by Wojciech Mandrysz on 06/03/2012.
//  Copyright (c) 2012. All rights reserved.
//

#import "Vector4.h"

@implementation Vector4
-(id)initA:(float)a_ b:(float)b_ c:(float)c_ d:(float)d_{
    if ((self = [super init])) {
        a = a_;
        b = b_;
        c = c_;
        d = d_;
    }
    return self;
}
+(id)vectorA:(float)a_ b:(float)b_ c:(float)c_ d:(float)d_{
    return [[[Vector4 alloc] initA:a_ b:b_ c:c_ d:d_] autorelease];
}
+(id)vectorFromVector:(Vector4 *)v{
    return [Vector4 vectorA:v->a b:v->b c:v->c d:v->d];
}
-(Vector4*)sum:(Vector4*)v{
    return [Vector4 vectorA:a+v->a b:b+v->b c:c+v->c d:d+v->d];
}
-(Vector4*)multiple:(float)m{
    return [Vector4 vectorA:a*m b:b*m c:c*m d:d*m];
}
@end
