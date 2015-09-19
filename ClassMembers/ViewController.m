//
//  ViewController.m
//  ClassMembers
//
//  Created by beecroft on 9/18/15.
//  Copyright © 2015 Awesometistic, LLC. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"Class Members";
    
    UITableView *tableView = [UITableView new];
    tableView.frame = self.view.frame;
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    tableView.dataSource = self;
    tableView.delegate = self;
    
    [self.view addSubview:tableView];
}

- (NSArray *)classMemberNames {
    NSArray * members = @[@"Wil", @"Erin", @"James", @"Kyle", @"Jake", @"Jacob", @"Ben", @"Alex"
                          , @"Spencer", @"Brock", @"Dave"];
    
    return members;
}

#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController *detailViewController = [DetailViewController new];
    detailViewController.name = [self classMemberNames][indexPath.row];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

#pragma mark - UITableViewDataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self classMemberNames].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [self classMemberNames][indexPath.row];
    
    return cell;
}




@end
