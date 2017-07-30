//
//  UILabel+Addition.m
//  AlipayMomentView(CodeEditionRelease)
//
//  Created by 温岱阳 on 2017/7/8.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import "UILabel+Addition.h"

@implementation UILabel (Addition)

+ (instancetype) makeLabelWithTitleColor:(UIColor *)color andFont:(UIFont *)font andText:(NSString *)text{
    
    
    UILabel * label = [[UILabel alloc] init];
    
    label.text = text;
    
    label.textColor = color;
    
    label.font = font;
    
    return label;

}

@end
