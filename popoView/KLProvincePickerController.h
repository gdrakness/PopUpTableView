//
//  KLProvincePickerController.h
//  KLDoctor
//
//  Created by Juno on 16/4/15.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KLProvincePickerControllerDelegate <NSObject>

-(void)confirBtnClick;
-(void)cancelBtnClick;

@end

@interface KLProvincePickerController : UIViewController

@property (nonatomic, copy) void (^provinceLabel)(NSString *string);
@property (nonatomic, weak) id<KLProvincePickerControllerDelegate> delegate;
@end
