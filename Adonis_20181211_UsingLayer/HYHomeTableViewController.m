//
//  HYHomeTableViewController.m
//  Adonis_20181211_UsingLayer
//
//  Created by Adonis_HongYang on 2018/12/13.
//  Copyright © 2018年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "HYHomeTableViewController.h"
#import "HYBaseViewController.h"



@interface HYHomeTableViewController ()

/** 数据 */
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation HYHomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
    
    self.navigationItem.title = @"Layer";
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForItem:self.dataArray.count -1 inSection:0] atScrollPosition:(UITableViewScrollPositionBottom) animated:YES];
    });
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    // Configure the cell...
    cell.textLabel.text = self.dataArray[indexPath.row];    cell.textLabel.textColor = UICOLOR_RANDOM;
//    cell.backgroundColor = UICOLOR_RANDOM;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:self.dataArray[indexPath.row] sender:self.dataArray[indexPath.row]];
}

- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = @[@"LayerAndView", @"Contents", @"Custom Drawing", @"AnchorPoint", @"CoordinateSystem", @"Hit Testing", @"CornerRadius", @"LayerBorder", @"Shadow", @"LayerMasking", @"StretchFilter", @"GroupOpaque", @"Transform", @"Transform3D", @"Cube", @"Cube Light", @"CAShapeLayer", @"CATextLayer", @"CATransformLayer", @"CAGradientLayer", @"CAReplicatorLayer", @"CAScrollLayer", @"CATiledLayer",
                       @"GCD"];
    }
    return _dataArray;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    [segue destinationViewController].navigationItem.title = (NSString *)sender;
}


@end
