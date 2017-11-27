//
//  ViewController.m
//  CJJellyView
//
//  Created by CJ on 2017/11/27.
//  Copyright © 2017年 CJ. All rights reserved.
//

#import "ViewController.h"
#import "CJJellyView.h"
#import "CustomView.h"

@interface ViewController ()

@property (strong, nonatomic) UIButton * refreshButton;
@property (nonatomic, strong) CJJellyView * jellyView;
@property (nonatomic, strong) CJJellyView * jellyView1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _refreshButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _refreshButton.frame = CGRectMake(50, 300, self.view.frame.size.width - 100, 44);
    _refreshButton.backgroundColor = [UIColor orangeColor];
    [_refreshButton setTitle:@"刷新" forState:UIControlStateNormal];
    [_refreshButton addTarget:self action:@selector(clickRefresh) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_refreshButton];
    
    _jellyView = [[CJJellyView alloc]initWithPoint:CGPointMake(self.view.frame.size.width/2, 294) anchorPoint:CGPointMake(0.5, 1) size:CGSizeMake(188, 34)];
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:_jellyView.bounds];
    imageView.image = [UIImage imageNamed:@"appstore_comment_image"];
    [_jellyView addSubview:imageView];
    [_jellyView setClickBlock:^{
        // 点击回调
    }];
    [self.view addSubview:_jellyView];
    
    _jellyView1 = [[CJJellyView alloc]initWithPoint:CGPointMake(self.view.frame.size.width/2, 350) anchorPoint:CGPointMake(0.5, 0) size:CGSizeMake(200, 200)];
    CustomView * customView = [[CustomView alloc]initWithFrame:_jellyView1.bounds];
    [_jellyView1 addSubview:customView];
    [_jellyView1 setClickBlock:^{
        // 点击回调
    }];
    [self.view addSubview:_jellyView1];
    
}

- (void)clickRefresh {
    [_jellyView show];
    [_jellyView1 show];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
