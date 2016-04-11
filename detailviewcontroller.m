//
//  detailviewcontroller.m
//  json curd
//
//  Created by MAC OS  on 3/17/16.
//  Copyright (c) 2016 MAC OS . All rights reserved.
//

#import "detailviewcontroller.h"

@interface detailviewcontroller ()

@end

@implementation detailviewcontroller
@synthesize txt_login_pass,txt_login_unm;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)btn_login:(id)sender
{
    NSString *st_format=[NSString stringWithFormat:@"http://krushna2016-001-site1.ctempurl.com/webservice02172016.asmx/JsonCrud4CheckLogin?u_nm=%@&u_pass=%@",txt_login_unm.text,txt_login_pass.text];
     NSURL *url=[NSURL URLWithString:st_format];
    NSData *data=[NSData dataWithContentsOfURL:url];
    NSString *str=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",str);
    

}
@end
