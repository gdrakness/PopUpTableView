//
//  ViewController.m
//  popoView
//
//  Created by gdarkness on 16/4/15.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "ViewController.h"
#import "KLProvincePickerController.h"
#import "UIViewController+ENPopUp.h"
static NSString *ID = @"cell";
@interface ViewController ()<KLProvincePickerControllerDelegate>
//@property (nonatomic,strong) DYTPopupManager *popupManager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)fuckyou:(id)sender {

    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"KLProvincePicker" bundle:nil];
    KLProvincePickerController *province = [sb instantiateInitialViewController];
    
    province.delegate = self;
    
    CGFloat pickeX = self.view.center.x - province.view.frame.size.width*0.5;
    province.view.frame = CGRectMake(pickeX,500, 300, 350);
    //设置圆角边框
    province.view.layer.cornerRadius = 8;
    province.view.layer.masksToBounds = YES;
    
    province.provinceLabel = ^(NSString * string){
        NSLog(@"%@",string);
    };
    
    [self presentPopUpViewController:province];
    

}
//确认事件
-(void)confirBtnClick{
    self.dismissPopUpViewController;
}
//取消事件
-(void)cancelBtnClick{
    self.dismissPopUpViewController;
}


@end
