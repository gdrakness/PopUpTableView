//
//  CityDataModel.m
//  Test
//
//  Created by gdarkness on 16/4/11.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "CityDataModel.h"

@implementation CityDataModel
- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }return self;
}
+ (instancetype)CityDataWithDict:(NSDictionary *)dict{
    return [[CityDataModel alloc]initWithDict:dict];
}
+ (NSArray *)CityData{
    NSArray *fileArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"cities.plist" ofType:nil]];
    NSMutableArray *cityArr = [[NSMutableArray alloc]init];
        for (NSDictionary *dict in fileArr) {
        CityDataModel *cityData = [CityDataModel CityDataWithDict:dict];
    [cityArr addObject:cityData];
        
    }
    return cityArr;
}


@end
