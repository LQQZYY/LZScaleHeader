//
//  ViewController.m
//  LZScaleHeaderView
//
//  Created by Artron_LQQ on 16/7/31.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "ViewController.h"
#import "UIScrollView+LZScaleHeader.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITableView *table = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    table.headerHeight = 100;
//    [table addScaleHeaderWithImage:[UIImage imageNamed:@"9c16fdfaaf51f3de3b5b8e0d94eef01f3b2979e9.jpg"]];
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"aaaaa";
    
    [table addScaleHeaderWithImage:[UIImage imageNamed:@"9c16fdfaaf51f3de3b5b8e0d94eef01f3b2979e9.jpg"] andCoverView:label];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellID"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld--%ld",(long)indexPath.section,(long)indexPath.row];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
