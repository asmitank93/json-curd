//
//  detailviewcontroller.h
//  json curd
//
//  Created by MAC OS  on 3/17/16.
//  Copyright (c) 2016 MAC OS . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailviewcontroller : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txt_login_unm;
@property (weak, nonatomic) IBOutlet UITextField *txt_login_pass;
- (IBAction)btn_login:(id)sender;

@end
