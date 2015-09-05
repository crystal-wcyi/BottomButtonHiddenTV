//
//  ViewController.m
//  BottomButtonHiddenTV
//
//  Created by crystal on 15/9/5.
//  Copyright (c) 2015年 crystal. All rights reserved.
//

#import "ViewController.h"
#define SCREEN [UIScreen mainScreen].bounds.size

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) UIButton *bottomButton;
@property (strong, nonatomic) UITableView *contenTableView;
@property (strong, nonatomic) NSArray *dataSources;
@property (assign, nonatomic) CGFloat offsetY;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSources = @[@"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test",@"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test",@"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test",@"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test",@"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test", @"test"];
    
    self.contenTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN.width, SCREEN.height) style:UITableViewStylePlain];
    self.contenTableView.dataSource = self;
    self.contenTableView.delegate = self;
    [self.view addSubview:self.contenTableView];
    
    self.bottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.bottomButton.frame = CGRectMake(SCREEN.width / 2 - 25, SCREEN.height - 50, 50, 50);
    [self.bottomButton setBackgroundImage:[UIImage imageNamed:@"icon_bureau.png"] forState:UIControlStateNormal];
    [self.view addSubview:self.bottomButton];
    self.offsetY = 0.f;
}

//底部按钮出现
- (void)buttonDidAppear
{
    [UIView transitionWithView:self.bottomButton duration:0.1 options:UIViewAnimationOptionTransitionNone animations:^{
        self.bottomButton.frame = CGRectMake(SCREEN.width / 2 - 25, SCREEN.height - 50, 50, 50);
    }completion:NULL];
}

//底部按钮消失
- (void)buttonDidDisAppear
{
    [UIView transitionWithView:self.bottomButton duration:0.1 options:UIViewAnimationOptionTransitionNone animations:^{
        self.bottomButton.frame = CGRectMake(SCREEN.width / 2 - 25, SCREEN.height, 50, 50);
    }completion:NULL];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y > self.offsetY && scrollView.contentOffset.y > 0)
    {//向上滑动 底部按钮消失
        [self buttonDidDisAppear];
    }
    else if (scrollView.contentOffset.y < self.offsetY)
    {//向下滑动 底部按钮出现
        [self buttonDidAppear];
    }
    else if (scrollView.contentOffset.y == scrollView.contentSize.height - self.contenTableView.frame.size.height)
    {//滑动到底部 底部按钮出现
        [self buttonDidAppear];
    }
    self.offsetY = scrollView.contentOffset.y;// 将当前位移变成缓存位移
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSources.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.dataSources[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
