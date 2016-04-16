//
//  KLProvincePickerController.m
//  KLDoctor
//
//  Created by Juno on 16/4/15.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "KLProvincePickerController.h"
#import "CityDataModel.h"

//#import "Masonry.h"

static NSString *ID = @"cell";
@interface KLProvincePickerController ()<UITableViewDelegate,UITableViewDataSource>
//城市模型
@property (nonatomic, strong) NSArray *cityArr;
//城市名字
@property (nonatomic, strong) CityDataModel *cityData;
@end

@implementation KLProvincePickerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect rect = CGRectMake(0, 44, 300, 260);
    UITableView *tabView = [[UITableView alloc]initWithFrame:rect
                                               style:UITableViewStylePlain];
    [tabView setDelegate:self];
    [tabView setDataSource:self];
    [self.view addSubview:tabView];

    //tableView需要 Masonry约束
//    [tabView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view).offset(44);
//        make.centerX.equalTo(self.view);
//        make.size.mas_equalTo(CGSizeMake(300, 260));
//    }];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cityArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                         reuseIdentifier:ID];
    }
    //[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    self.cityData = self.cityArr[indexPath.row];
    cell.textLabel.text =  self.cityData.name;
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.backgroundColor = [UIColor colorWithRed:
                            ((float)arc4random_uniform(256) / 255.0)
                                    green:((float)arc4random_uniform(256) / 255.0)
                                    blue:((float)arc4random_uniform(256) / 255.0)
                                    alpha:1.0];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.cityData = self.cityArr[indexPath.row];
}

//确认按钮
- (IBAction)confirBtn:(id)sender {
    //block回调选择当前的城市
    if (self.provinceLabel) {
        self.provinceLabel(self.cityData.name);
    }
    //回调dismiss当前PopUpView
    if ([self.delegate respondsToSelector:@selector(cancelBtnClick)]) {
        [self.delegate cancelBtnClick];
    }
}

//取消按钮
- (IBAction)cancelBtn:(id)sender {
    //回调dismiss当前PopUpView
    if ([self.delegate respondsToSelector:@selector(cancelBtnClick)]) {
        [self.delegate cancelBtnClick];
    }
}

#pragma mark -- 懒加载

- (NSArray *)cityArr {
    if (_cityArr == nil) {
        _cityArr = [CityDataModel CityData];
    }
    return _cityArr;
}


@end
