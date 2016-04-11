//
//  ViewController.m
//  json curd
//
//  Created by MAC OS  on 3/4/16.
//  Copyright (c) 2016 MAC OS . All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize txt_fnm,txt_lnm,txt_pass,txt_city,txt_state,img_vw,txt_unm;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    arr_st=[[NSArray alloc]init];
    
    NSURL *url=[NSURL URLWithString:@"http://krushna2016-001-site1.ctempurl.com/WebService02172016.asmx/JsonCrud1GetAllStates"];
    NSData *data=[NSData dataWithContentsOfURL:url];
    arr_st=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    pkr_st=[[UIPickerView alloc]init];
    pkr_st.dataSource=self;
    pkr_st.delegate=self;
    [txt_state setInputView:pkr_st];
    
    pkr_ct=[[UIPickerView alloc]init];
    pkr_ct.dataSource=self;
    pkr_ct.delegate=self;
    [txt_city setInputView:pkr_ct];
    txt_city.delegate=self;
    
    
    
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSInteger index;
    
    if (pickerView==pkr_st)
    {
        index=arr_st.count;
    }
    else
    {
        index=arr_ct.count;
    }
    return index;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *index=@"";
    
    if (pickerView==pkr_st)
    {
        index=[[arr_st objectAtIndex:row]objectForKey:@"state_nm"];
    }
    else
    {
        index=[[arr_ct objectAtIndex:row]objectForKey:@"city_nm"];
    }
    return index;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView==pkr_st)
    {
        txt_state.text=[[arr_st objectAtIndex:row]objectForKey:@"state_nm"];
    }
    else
    {
        txt_city.text=[[arr_ct objectAtIndex:row]objectForKey:@"city_nm"];
    }
    
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(textField==txt_city)
    {
        NSArray *arr_st_id=[arr_st valueForKey:@"state_nm"];
        NSLog(@"%@",arr_st_id);
        
        NSInteger indx_st=[arr_st_id indexOfObject:txt_state.text];
        NSLog(@"%ld",(long)indx_st);
        
        NSString *st_id=[[arr_st objectAtIndex:indx_st] objectForKey:@"state_id"];
        NSLog(@"%@",st_id);
        
        NSString *st_format=[NSString stringWithFormat:@"http://krushna2016-001-site1.ctempurl.com/webservice02172016.asmx/JsonCrud2GetCityByState?state_id=%@",st_id];
        NSURL *url=[NSURL URLWithString:st_format];
        NSData *data=[NSData dataWithContentsOfURL:url];
        arr_ct=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        [pkr_ct reloadAllComponents];
        
    }
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissViewControllerAnimated:YES completion:nil];
    UIImage *img=info[UIImagePickerControllerOriginalImage];
    img_vw.image=img;
   
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn_action:(id)sender
{
    NSArray *arr_st_id=[arr_st valueForKey:@"state_nm"];
    NSInteger index_st=[arr_st_id indexOfObject:txt_state.text];
    NSString *st_id=[[arr_st objectAtIndex:index_st]objectForKey:@"state_id"];
    NSLog(@"%@",st_id);
    
    NSArray *arr_ct_id=[arr_ct valueForKey:@"city_nm"];
    NSInteger index_ct=[arr_ct_id indexOfObject:txt_city.text];
    NSString *ct_id=[[arr_ct objectAtIndex:index_ct]objectForKey:@"city_id"];
    NSLog(@"%@",ct_id);
    
    //NSLog(@"%@",[self encodeToBase64String:img_vw.image]);
    
    NSMutableURLRequest *req=[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://krushna2016-001-site1.ctempurl.com/webservice02172016.asmx/JsonCrud3InsertUserData?"]];
    NSString *st_format=[NSString stringWithFormat:@"txt_fnm=%@&txt_lnm=%@&u_st=%@&u_ct=%@&u_photo=%@&u_unm=%@&u_pass=%@",txt_fnm.text,txt_lnm.text,st_id,ct_id,[self encodeToBase64String:img_vw.image],txt_unm.text,txt_pass.text];
    [req setHTTPBody:[st_format dataUsingEncoding:NSUTF8StringEncoding]];
    [req setHTTPMethod:@"POST"];
    
    NSURLConnection *con=[[NSURLConnection alloc]initWithRequest:req delegate:self];
    if (con)
    {
        
    }
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSString *str=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",str);
}
- (NSString *)encodeToBase64String:(UIImage *)image
{
    return [UIImagePNGRepresentation(image) base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
}
- (IBAction)upload_img:(id)sender
{
    UIImagePickerController *image_pik=[[UIImagePickerController alloc]init];
    image_pik.sourceType=UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    image_pik.delegate=self;
    [self presentViewController:image_pik animated:YES completion:nil];
}
@end
