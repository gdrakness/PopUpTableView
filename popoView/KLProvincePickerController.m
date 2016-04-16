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
//图片名称
@property (nonatomic, strong) UIImage *image;
//indexPath
@property (nonatomic, assign) NSInteger num;
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                        reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    self.cityData = self.cityArr[indexPath.row];
    cell.textLabel.text =  self.cityData.name;
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.backgroundColor = [UIColor whiteColor];
    cell.imageView.image = self.image;
 
    if (indexPath.row == self.num) {
        cell.imageView.image = [UIImage imageNamed:@"illness_rb_img_sel.png@3x"];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.cityData = self.cityArr[indexPath.row];
    self.num = indexPath.row;
    [tableView reloadData];
   
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
-(UIImage *)image{
    if (_image == nil) {
        _image = [UIImage imageNamed:@"illness_rb_img_nor.png@3x"];
    }return _image;
}


@end
