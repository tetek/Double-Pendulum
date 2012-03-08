//
//  Controls.m
//  pendulum
//
//  Created by Wojciech Mandrysz on 07/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Controls.h"
#import "MainLayer.h"
@interface Controls ()
-(void)hideKeyboard;
- (void)addFields;
@end

@implementation Controls
@synthesize delegate;

- (id)initWithDelegate:(MainLayer*)delegate_
{
    self = [super init];
    if (self) {

        self.delegate = delegate_;
        self.view = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 768, 150)] autorelease];
        [self.view setBackgroundColor:[UIColor redColor]];
        [self addFields];
        
    }
    return self;
}
-(NSString*)stringFrom:(float)a{
    return [NSString stringWithFormat:@"%.4f",a];
}

- (void)addFields{
    
    UILabel *mass = [[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, 20)] autorelease];
    [mass setText:@"masses"];
    [mass setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:mass];
    
    mass1 = [[UITextField alloc] initWithFrame:CGRectMake(20, 40, 100, 20)];
    [mass1 setBackgroundColor:[UIColor whiteColor]];
    [mass1 setPlaceholder:@"mass 1"];
    [self.view addSubview:mass1];
    
    mass2 = [[UITextField alloc] initWithFrame:CGRectMake(20, 70, 100, 20)];
    [mass2 setBackgroundColor:[UIColor whiteColor]];
    [mass2 setPlaceholder:@"mass 2"];
    [self.view addSubview:mass2];
    
    UILabel *len = [[[UILabel alloc] initWithFrame:CGRectMake(150, 10, 100, 20)] autorelease];
    [len setText:@"lenghts"];
    [len setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:len];
    
    length1 = [[UITextField alloc] initWithFrame:CGRectMake(150, 40, 100, 20)];
    [length1 setBackgroundColor:[UIColor whiteColor]];
    [length1 setPlaceholder:@"length 1"];
    [self.view addSubview:length1];  
    
    length2 = [[UITextField alloc] initWithFrame:CGRectMake(150, 70, 100, 20)];
    [length2 setBackgroundColor:[UIColor whiteColor]];
    [length2 setPlaceholder:@"length 2"];
    [self.view addSubview:length2];      
    
    UILabel *gh = [[[UILabel alloc] initWithFrame:CGRectMake(280, 10, 100, 20)] autorelease];
    [gh setText:@"gravity and h"];
    [gh setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:gh];
    
    gravity = [[UITextField alloc] initWithFrame:CGRectMake(280, 40, 100, 20)];
    [gravity setBackgroundColor:[UIColor whiteColor]];
    [gravity setPlaceholder:@"gravity"];
    [self.view addSubview:gravity];    
    
    h = [[UITextField alloc] initWithFrame:CGRectMake(280, 70, 100, 20)];
    [h setBackgroundColor:[UIColor whiteColor]];
    [h setPlaceholder:@"h "];
    [self.view addSubview:h];    
    
    UILabel *angles = [[[UILabel alloc] initWithFrame:CGRectMake(410, 10, 100, 20)] autorelease];
    [angles setText:@"angles"];
    [angles setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:angles];
    
    teta1 = [[UITextField alloc] initWithFrame:CGRectMake(410, 40, 100, 20)];
    [teta1 setBackgroundColor:[UIColor whiteColor]];
    [teta1 setPlaceholder:@"teta 1"];
    [self.view addSubview:teta1];  
    
    teta2 = [[UITextField alloc] initWithFrame:CGRectMake(410, 70, 100, 20)];
    [teta2 setBackgroundColor:[UIColor whiteColor]];
    [teta2 setPlaceholder:@"teta 2"];
    [self.view addSubview:teta2];   
    
    okButton = [[UIButton alloc] initWithFrame:CGRectMake(540, 40,150, 50)];
    [okButton setBackgroundColor:[UIColor blackColor]];
    [okButton setTitle:@"Apply" forState:UIControlStateNormal];
    [okButton addTarget:self action:@selector(setValues:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:okButton];
    
    [mass1 setText:[self stringFrom:delegate->mass1]];
    [mass2 setText:[self stringFrom:delegate->mass2]];
    [length1 setText:[self stringFrom:delegate->length1]];  
    [length2 setText:[self stringFrom:delegate->length2]];  
    [gravity setText:[self stringFrom:delegate->gravity]];
    [h setText:[self stringFrom:delegate->h]];  
    [teta1 setText:[self stringFrom:CC_RADIANS_TO_DEGREES((delegate.vz)->a)]];       
    [teta2 setText:[self stringFrom:CC_RADIANS_TO_DEGREES((delegate.vz)->b)]];  
}
-(void)setValues:(id)sender{
    [self hideKeyboard];
    delegate->mass1 = [[mass1 text] floatValue];    
    delegate->mass2 = [[mass2 text] floatValue]; 
    delegate->length1 = [[length1 text] floatValue];  
    delegate->length2 = [[length2 text] floatValue];  
    delegate->gravity = [[gravity text] floatValue];  
    delegate->h = [[h text] floatValue];   
    NSLog(@"%f",CC_DEGREES_TO_RADIANS([[teta1 text] floatValue]));
    [delegate setTeta1:CC_DEGREES_TO_RADIANS([[teta1 text] floatValue]) andTeta2:CC_DEGREES_TO_RADIANS([[teta2 text] floatValue])];

}
-(void)hideKeyboard{
    [mass1 resignFirstResponder];
    [mass2 resignFirstResponder];
    [length1 resignFirstResponder];
    [length2 resignFirstResponder];
    [gravity resignFirstResponder];
    [h resignFirstResponder];
    [teta1 resignFirstResponder];
    [teta2 resignFirstResponder];    
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
-(void)dealloc{
    [mass1 release];
    [mass2 release];
    [length1 release];
    [length2 release];
    [gravity release];
    [h release];
    [teta1 release];
    [teta2 release];
    [okButton release];
    [delegate release];
    [super dealloc];
}
@end
