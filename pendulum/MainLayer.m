//
//  HelloWorldLayer.m
//  pendulum
//
//  Created by Wojciech Mandrysz on 22/02/2012.
//  Copyright  2012. All rights reserved.
//

#import "MainLayer.h"

#define PendulumAnchorPoint ccp(384,500)

@implementation MainLayer
@synthesize vz;
+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	MainLayer *layer = [MainLayer node];
	[scene addChild: layer];
	return scene;
}


-(id) init
{
	if( (self=[super init])) {
        
        pendulum1 = [CCSprite spriteWithFile:@"megusta.png"];
        pendulum2 = [CCSprite spriteWithFile:@"megusta.png"];                
        
        [self addChild:pendulum1];
        [self addChild:pendulum2];
        //Defaults
        length1 = 1;
        length2 = 1;
        
        mass1 = 0.5;
        mass2 = 0.5;
        
        pen1 = ccp(384,PendulumAnchorPoint.y-length1);
        pen2 = ccpAdd(pen1, ccp(length2,0));
        [pendulum1 setPosition:pen1];
        [pendulum2 setPosition:pen2];
        [pendulum1 setAnchorPoint:ccp(0.5,0.5)];
        [pendulum2 setAnchorPoint:ccp(0.5,0.5)];
        
        gravity = 9.8;
        scale = 150;

        self.vz = [Vector4 vectorA:M_PI b:M_PI_2 c:0 d:0];
        
        h = 0.001;
        Controls *controls = [[Controls alloc] initWithDelegate:self];
        [[[CCDirector sharedDirector] openGLView] addSubview:controls.view];
        
        [NSThread detachNewThreadSelector:@selector(calc) toTarget:self withObject:nil];
        

	}
	return self;
}
-(void)calc{
    while (true) {
        Vector4 *va = [self f:vz];
        Vector4 *vb = [self f:[vz sum:[va multiple:0.5*h]]];
        Vector4 *vc = [self f:[vz sum:[vb multiple:0.5*h]]];
        Vector4 *vd = [self f:[vz sum:[vc multiple:h]]];
        
        Vector4 *temp = [[[va sum:[vb multiple:2.0]] sum:[vc multiple:2.0]] sum:vd];
        Vector4 *vz1 = [vz sum:[temp multiple:h/6.0]];        
        
        pen1 = ccpAdd(PendulumAnchorPoint, ccp(sinf(vz->a)*length1*scale,-cosf(vz->a)*length1*scale));
        pen2 = ccpAdd(pen1, ccp(sinf(vz->b)*length2*scale,-cosf(vz->b)*length2*scale));
        
        self.vz = [Vector4 vectorFromVector:vz1];
        [NSThread sleepForTimeInterval:h];

    }
}

-(void)draw{
    glLineWidth(2);
    glEnable(GL_LINE_SMOOTH);
    ccDrawLine(PendulumAnchorPoint,pen1);
    ccDrawLine(pen1,pen2);
//    glLineWidth(4);
    
//	glColor4ub(100, 255, 0, 255);
//	ccDrawCircle(pen1, 20, 0, 100, NO);
//    
//    glColor4ub(0, 255, 0, 255);
//    ccDrawCircle(pen2, 20, 0, 100, NO);
    [pendulum1 setPosition:pen1];    
    [pendulum2 setPosition:pen2];
}


-(Vector4*)f:(Vector4*)v{
    return [Vector4 vectorA:v->c b:v->d c:[self f1:v] d:[self f2:v]];
}
-(float)f1:(Vector4*)v{
    float ret = -gravity*(2*mass1 + mass2)*sinf(v->a) - mass2*gravity*sinf(v->a-2*v->b)-2*sinf(v->a-v->b)*mass2*(v->d*v->d*length2 + v->c*v->c*length1*cosf(v->a-v->b));
    float ret1 = length1*(2*mass1 + mass2 - mass2*cosf(2*v->a - 2*v->b));
    return ret/ret1;
}
-(float)f2:(Vector4*)v{
    float ret = 2*sinf(v->a-v->b)*(v->c*v->c*length1*(mass1+mass2)+gravity*(mass1+mass2)*cosf(v->a) + v->d*v->d*length2*mass2*cosf(v->a-v->b));
    float ret1 = length2*(2*mass1 + mass2 - mass2*cosf(2*v->a-2*v->b));
    return ret/ret1;
}
-(void)setTeta1:(float)teta1 andTeta2:(float)teta2{
    self.vz = [Vector4 vectorA:teta1 b:teta2 c:0 d:0];
}
- (void) dealloc
{
    self.vz = nil;
	[super dealloc];
}
@end
