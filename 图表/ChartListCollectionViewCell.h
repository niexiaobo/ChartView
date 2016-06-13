//
//  ChartListCollectionViewCell.h
//  图表
//
//  Created by 博彦科技-聂小波 on 16/6/7.
//  Copyright © 2016年 bobo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChartCollectionCell.h"
@interface ChartListCollectionViewCell : UICollectionViewCell <UICollectionViewDelegate, UICollectionViewDataSource>
@property (strong, nonatomic)UICollectionView *collectionView;
@property (strong, nonatomic) ChartCollectionCell *ChartCollCell;
@property(nonatomic, unsafe_unretained)CGFloat currentScale;
@end
