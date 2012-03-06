//
//  HelloWorldLayer.m
//  pendulum
//
//  Created by Wojciech Mandrysz on 22/02/2012.
//  Copyright  2012. All rights reserved.
//



#import "MainLayer.h"


@implementation MainLayer

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

		label = [CCLabelTTF labelWithString:@"Hello World" fontName:@"Marker Felt" fontSize:64];

		CGSize size = [[CCDirector sharedDirector] winSize];
			label.position =  ccp( size.width /2 , size.height/2 );

		[self addChild: label];
        [self schedule:@selector(updateWolf) interval:1];

	}
	return self;
}

-(void)updateWolf{
    [label runAction:[CCRotateBy actionWithDuration:0.001 angle:20]];
}
//
- (void) dealloc
{

	[super dealloc];
}
@end
