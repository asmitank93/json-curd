//
//  ViewController.h
//  json curd
//
//  Created by MAC OS  on 3/4/16.
//  Copyright (c) 2016 MAC OS . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "detailviewcontroller.h"
#import "displayinformation.h"

@interface ViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,NSURLConnectionDelegate>
{
    UIPickerView *pkr_st;
    UIPickerView *pkr_ct;
    NSArray *arr_st;
    NSArray *arr_ct;
   
}

@property (weak, nonatomic) IBOutlet UITextField *txt_fnm;
@property (weak, nonatomic) IBOutlet UITextField *txt_lnm;
@property (weak, nonatomic) IBOutlet UITextField *txt_pass;
@property (weak, nonatomic) IBOutlet UITextField *txt_state;
@property (weak, nonatomic) IBOutlet UITextField *txt_city;
- (IBAction)btn_action:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *img_vw;
- (IBAction)upload_img:(id)sender;
- (NSString *)encodeToBase64String:(UIImage *)image;
@property (weak, nonatomic) IBOutlet UITextField *txt_unm;



@end

