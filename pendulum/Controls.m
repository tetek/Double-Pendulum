//
//  Controls.m
//  pendulum
//
//  Created by Wojciech Mandrysz on 07/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Controls.h"

@interface Controls ()

@end

@implementation Controls

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.view = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)] autorelease];
        [self.view setBackgroundColor:[UIColor redColor]];
    }
    return self;
}

- (void)loadView
{
    // If you create your views manually, you MUST override this method and use it to create your views.
    // If you use Interface Builder to create your views, then you must NOT override this method.
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
