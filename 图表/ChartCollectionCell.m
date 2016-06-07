//
//  ChartCollectionCell.m
//  图表
//
//  Created by 博彦科技-聂小波 on 16/6/7.
//  Copyright © 2016年 bobo. All rights reserved.
//

#import "ChartCollectionCell.h"

@implementation ChartCollectionCell
-(void)layoutSubviews{

    if (!_chartView1) {
        
        float colloW=40;
        float colloH=( arc4random() % 100 / 100.0 )*(ColloHeight-50);
        float dateW=(ColloWidth-colloW*2)/2.0;
        float orgX=dateW/2.0;
        
        _chartView1=[[UIView alloc]initWithFrame:CGRectMake(orgX, ColloHeight-colloH, colloW, colloH)];
        _chartView1.backgroundColor=[self randomColor];
        
        _chartName1=[[UILabel alloc]initWithFrame:CGRectMake(0, ColloHeight-colloH-30, colloW+dateW, 20)];
        _chartName1.textAlignment=NSTextAlignmentCenter;
        _chartName1.font=[UIFont systemFontOfSize:14];
        orgX=dateW*1.5+colloW;
        
        colloH=( arc4random() % 100 / 100.0 )*ColloHeight;
        _chartView2=[[UIView alloc]initWithFrame:CGRectMake(orgX, ColloHeight-colloH, colloW, colloH)];
        _chartView2.backgroundColor=[self randomColor];
        
        _chartName2=[[UILabel alloc]initWithFrame:CGRectMake(dateW+colloW, ColloHeight-colloH-20, colloW+dateW, 15)];
        _chartName2.textAlignment=NSTextAlignmentCenter;
        _chartName2.font=[UIFont systemFontOfSize:14];
        [self addSubview:_chartView1];
        [self addSubview:_chartView2];
        [self addSubview:_chartName1];
        [self addSubview:_chartName2];
        
    }

}

- (void)addSubChartView:(UIView*)chartView chartLabel:(UILabel*)chartLabel {
    
    
    
}




- (UIColor*)randomColor
{
    
    
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}
- (void)reloadData {
    
    
}
@end
