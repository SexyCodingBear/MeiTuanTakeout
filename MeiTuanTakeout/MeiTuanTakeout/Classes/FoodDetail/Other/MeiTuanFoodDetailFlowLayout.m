//
//  MeiTuanFoodDetailFlowLayout.m
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/5.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import "MeiTuanFoodDetailFlowLayout.h"

@implementation MeiTuanFoodDetailFlowLayout


/// 预布局
-(void)prepareLayout {
    
    /// 单元格大小
    self.itemSize = self.collectionView.bounds.size;
    
    
    /// 最小行间距
    self.minimumLineSpacing = 0;
    
    /// 最小列间距
    self.minimumInteritemSpacing = 0;
    
    /// 滚动方向
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;



}


@end
