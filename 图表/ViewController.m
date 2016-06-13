//
//  ViewController.m
//  图表
//
//  Created by 博彦科技-聂小波 on 16/6/7.
//  Copyright © 2016年 bobo. All rights reserved.
//

#import "ViewController.h"
#import "ChartListCollectionViewCell.h"
#import "ChartCollectionCell.h"
static NSString * CellIdentifier = @"ChartListCollectionViewCell";
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>{
    
}
@property (strong, nonatomic)UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableDictionary *contentOffsetArray;

@property(nonatomic, strong)UIPinchGestureRecognizer *pinchGestureRecognizer;
@property(nonatomic, unsafe_unretained)CGFloat currentScale;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //确定是水平滚动，还是垂直滚动
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    self.collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, Screen_width, Screen_height-100) collectionViewLayout:flowLayout];
    self.collectionView.dataSource=self;
    self.collectionView.delegate=self;
    [self.collectionView setBackgroundColor:[UIColor clearColor]];
    
    //注册Cell，必须要有
    [self.collectionView registerClass:[ChartListCollectionViewCell class] forCellWithReuseIdentifier:CellIdentifier];
    
    [self.view addSubview:self.collectionView];
    
    self.currentScale=1.0;
    
    /*create the pinch Gesture Recognizer*/
    self.pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinches:)];
    [self.collectionView addGestureRecognizer:self.pinchGestureRecognizer];
}

#pragma mark -- UIPinchGestureRecognizer
-(void)handlePinches:(UIPinchGestureRecognizer *)paramSender{
    if (paramSender.state == UIGestureRecognizerStateEnded) {
        self.currentScale = paramSender.scale;
        [self.collectionView reloadData];
    }else if(paramSender.state == UIGestureRecognizerStateBegan && self.currentScale != 0.0f){
        paramSender.scale = self.currentScale;
    }
    if (paramSender.scale !=NAN && paramSender.scale != 0.0) {
        
        
        
        //        paramSender.view.transform = CGAffineTransformMakeScale(paramSender.scale > 1 ? 1 : paramSender.scale, 1);
    }
    //    self.currentScale = paramSender.scale;
    NSLog(@"--缩放比例-->%f<----",paramSender.scale);//缩放比例
    
    
}


#pragma mark -- UICollectionViewDataSource

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 20;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    ChartListCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [cell awakeFromNib];
    
    if (self.currentScale>1) {
        self.currentScale=1;
    }else if (self.currentScale<0.3) {
        self.currentScale=0.3;
    }
    
    cell.currentScale=self.currentScale;
    //    cell.currentScale=1;
    
    [cell.collectionView reloadData];
    return cell;
}

#pragma mark --UICollectionViewDelegateFlowLayout

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(Screen_width, ColloHeight);
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

#pragma mark --UICollectionViewDelegate

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ChartListCollectionViewCell * cell = (ChartListCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //设置Cell的动画效果为3D效果
    //设置x和y的初始值为0.1；
//        cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
//        //x和y的最终值为1
//        [UIView animateWithDuration:1 animations:^{
//            cell.layer.transform = CATransform3DMakeScale(1, 1, 1);
//        }];
    
}
@end
