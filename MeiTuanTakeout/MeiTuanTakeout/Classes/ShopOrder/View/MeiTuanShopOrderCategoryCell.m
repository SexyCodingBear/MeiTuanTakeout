//
//  MeiTuanShopOrderCategoryCell.m
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/3.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import "MeiTuanShopOrderCategoryCell.h"

@implementation MeiTuanShopOrderCategoryCell

// xib或者storyboard创建的视图加载完成会调用awakeFromNib方法
-(void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupUI];
}





// 代码创建的视图初始化方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self setupUI];
    }
    
    return self;

}




// 搭建界面
- (void)setupUI{
    
    /**
     cell中视图层级关系：
     
     最底层：backgroundView -> selectedBackgroundView / multipleSelectionBackgroundView -> contentView
     
     */
    
    // TODO:1、设置textLabel
    
    // 设置背景颜色
    self.backgroundColor = [UIColor colorWithHex:0xefefef];
    
    // TODO:如果使用第一种方法方法添加虚线，设置字体必须在背景颜色之前
    self.textLabel.font = [UIFont systemFontOfSize:12];
    
    // 设置换行
    self.textLabel.numberOfLines = 2;
    
    
    
    
    
    // TODO:2、设置虚线背景视图
    // 创建背景视图
    UIView *dashLineView = [[UIView alloc] init];
    
    // 设置背景视图的背景颜色，平铺图片作为背景颜色
    dashLineView.backgroundColor = [UIColor colorWithPatternImage:[UIImage dashLineViewWithColor:[UIColor blackColor]]];
    
    /**
     
     两种方法添加虚线：
     第一种：替换默认的backgroundView，
     第二种：将虚线视图添加到最上层的contentView中，这种方法不受设置背景颜色代码书写位置的影响，设置txetLabel字体代码可以写在设置背景颜色代码之后。
     
     */
    
//    self.backgroundView = dashLineView;//第一种方法
    [self.contentView addSubview:dashLineView];//第二种方法
    
    // 设置约束
    [dashLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.bottom.right.offset(0);
        make.height.offset(1);
        
        
    }];
    
    
    
    
    
    // TODO:3、设置选中背景视图
    // 创建选中背景视图
    UIView *selectedBackgroundView = [[UIView alloc]init];
    
    // 设置背景视图的背景颜色
    selectedBackgroundView.backgroundColor = [UIColor whiteColor];
    
    // 设置背景视图
    self.selectedBackgroundView = selectedBackgroundView;
    
    
    
    
    
    // TODO:4、添加分类指示器
    UIView *selectedSectionIndicatorView = [[UIView alloc] init];
    
    // 设置分类指示器的背景颜色
    selectedSectionIndicatorView.backgroundColor = [UIColor primaryColor];
    
    // 添加到父视图
    [selectedBackgroundView addSubview:selectedSectionIndicatorView];
    
    // 设置约束
    [selectedSectionIndicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.centerY.offset(0);
        make.width.offset(4);
        make.height.offset(44);
        
    }];
    
    
}




#pragma mark - 重写ShopOrderCategoryModel属性的setter方法
// 重写ShopOrderCategoryModel属性的setter方法，在赋值的时候给单元格属性赋值
-(void)setShopOrderCategoryModel:(MeiTuanShopOrderCategoryModel *)shopOrderCategoryModel {
    
    // 给属性赋值
    _shopOrderCategoryModel = shopOrderCategoryModel;

    
    // 使用食物分类模型的name属性给单元格的文本标签赋值
    self.textLabel.text = shopOrderCategoryModel.name;


}



@end
