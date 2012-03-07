//
//  Controls.h
//  pendulum
//
//  Created by Wojciech Mandrysz on 07/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainLayer;
@interface Controls : UIViewController 

{
    UITextField *mass1;
    UITextField *mass2;
    UITextField *length1;
    UITextField *length2;
    UITextField *gravity;
    UITextField *h;
    UITextField *teta1;
    UITextField *teta2;
    UIButton *okButton;
    
    
}
- (id)initWithDelegate:(MainLayer*)delegate_;
- (void)addFields;
@property(nonatomic,retain)MainLayer *delegate;
@end
