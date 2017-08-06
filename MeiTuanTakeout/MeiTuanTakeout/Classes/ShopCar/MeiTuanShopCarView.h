//
//  MeiTuanShopCarView.h
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/6.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MeiTuanShopCarModel.h"

@interface MeiTuanShopCarView : UIView


/// 购物车模型属性
@property (strong,nonatomic) MeiTuanShopCarModel *shopCarModel;


/**
 类方法加载xib文件，创建MeiTuanShopCarView实例对象

 @return 返回MeiTuanShopCarView实例对象
 */
+ (instancetype)shopCarView;

@end
