//
//  DemoTableView.m
//  SliderView
//
//  Created by Van Thanh Tran on 6/26/16.
//  Copyright © 2016 Van Thanh Tran. All rights reserved.
//

#import "DemoTableView.h"

@implementation DemoTableView
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.delegate = self;
    self.dataSource = self;
    self.separatorColor = [UIColor clearColor];
    return self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"cell";
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (tableViewCell == nil) {
        tableViewCell = (UITableViewCell *)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    tableViewCell.backgroundColor = [UIColor clearColor];
    tableViewCell.textLabel.textColor = [UIColor blueColor];
    tableViewCell.textLabel.text = @"Hello World";
    return tableViewCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
