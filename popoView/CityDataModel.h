//
//  CityDataModel.h
//  Test
//
//  Created by gdarkness on 16/4/11.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityDataModel : NSObject
//城市名字
@property (nonatomic, strong) NSString *name;
//城市字典
@property (nonatomic, strong) NSArray *cities;

//@property (nonatomic, strong) NSString *item;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)CityDataWithDict:(NSDictionary *)dict;
+ (NSArray *)CityData;

@end
