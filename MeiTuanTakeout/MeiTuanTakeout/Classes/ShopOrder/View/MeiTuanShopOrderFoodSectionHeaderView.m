//
//  MeiTuanShopOrderFoodSectionHeaderView.m
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/4.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import "MeiTuanShopOrderFoodSectionHeaderView.h"

@implementation MeiTuanShopOrderFoodSectionHeaderView

// xib或者storyboard创建的视图加载完成会调用awakeFromNib方法
-(void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupUI];
}

// 代码创建的指定视图初始化方法
- (instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier {
    
    self = [super initWithReuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self setupUI];
    }
    
    return self;
}

// 搭建界面
- (void)setupUI{
    
    /**
     
     注意：系统会在组头视图显示之前使用系统默认值设置组头视图的标题字体，如果要想更换组头视图的标题字体，必须要在系统使用系统默认值设置组头视图的标题字体之后更换，组头视图的标题字体才不会被系统默认值替换。setupUI方法是在初始化方法中调用，调用的时候视图还没有准备显示，所以在setupUI方法中设置组头视图的标题字体会被系统默认值覆盖。如果要在setupUI方法中设置组头视图的标题字体，就需要用到延迟线，程延迟以后视图准备显示已经完成，再设置组头视图的标题字体就不会被系统默认值覆盖。
     
     */
    
    // TODO:第一种设置组头视图的标题字体方法：线程延迟方法
    // 线程延迟方法，最佳方法
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // 设置文本标签的字体
        self.textLabel.font = [UIFont systemFontOfSize:14.0];
        
        // 设置文本标签的文本颜色
        self.textLabel.textColor = [UIColor blackColor];
        
    });
    
}






#pragma mark - 重写ShopOrderCategoryModel属性的setter方法
// 重写ShopOrderCategoryModel属性的setter方法，在赋值的时候给单元格属性赋值
-(void)setShopOrderCategoryModel:(MeiTuanShopOrderCategoryModel *)shopOrderCategoryModel {
    
    // 给属性赋值
    _shopOrderCategoryModel = shopOrderCategoryModel;
    
    
    // 使用食物分类模型的name属性给单元格的文本标签赋值
    self.textLabel.text = shopOrderCategoryModel.name;
    
    
}





// TODO:第二种设置组头视图的标题字体方法：绘图方法
// 绘图方法，视图准备显示已经完成，再设置组头视图的标题字体就不会被系统默认值覆盖。缺点：官方建议不要在绘图方法中做与绘图无关的事情。
//-(void)drawRect:(CGRect)rect {
//
//    // 设置文本标签的字体
//    self.textLabel.font = [UIFont systemFontOfSize:14.0];
//
//    // 设置文本标签的文本颜色
//    self.textLabel.textColor = [UIColor blackColor];
//
//}





// TODO:第三种设置组头视图的标题字体方法：布局子控件方法
// 布局子控件以后，视图准备显示已经完成，再设置组头视图的标题字体就不会被系统默认值覆盖。缺点：会不停的调用,消耗性能。
//-(void)layoutSubviews {
//
//    [super layoutSubviews];
//
//    // 设置文本标签的字体
//    self.textLabel.font = [UIFont systemFontOfSize:14.0];
//
//    // 设置文本标签的文本颜色
//    self.textLabel.textColor = [UIColor blackColor];
//
//}









@end
