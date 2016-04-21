# PopUpTableView
![image](https://github.com/gdrakness/PopUpTableView/blob/master/po.gif)
# How to use

```Object-C
#import "KLProvincePickerController.h"
#import "UIViewController+ENPopUp.h"
@interface ViewController ()<KLProvincePickerControllerDelegate>
- (IBAction)clickButton:(id)sender {

    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"KLProvincePicker" bundle:nil];
    KLProvincePickerController *province = [sb instantiateInitialViewController];
    
    province.delegate = self;
    
    CGFloat pickeX = self.view.center.x - province.view.frame.size.width*0.5;
    province.view.frame = CGRectMake(pickeX,500, 300, 350);
    
    province.provinceLabel = ^(NSString * string){
        //回调回来的参数string
        NSLog(@"%@",string);
    };
    
    [self presentPopUpViewController:province];

}
```
# Dismiss method
```Object-C
//确认事件
-(void)confirBtnClick{
    self.dismissPopUpViewController;
}
//取消事件
-(void)cancelBtnClick{
    self.dismissPopUpViewController;
}
```
