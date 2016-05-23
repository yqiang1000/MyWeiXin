//
//  ThemeTableViewController.m
//  MWX
//
//  Created by pengxiuxiu on 16/5/20.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "ThemeTableViewController.h"
#import "FourthViewController.h"
#import "ThemeManager.h"

@interface ThemeTableViewController ()
{
    NSArray *_themeArr;
}
@end

@implementation ThemeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"主题";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeChange) name:kThemeChange object:nil];
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"theme.plist" ofType:nil];
    
    NSDictionary *themeConfig = [NSDictionary dictionaryWithContentsOfFile:path];
    
    _themeArr = [themeConfig allKeys];
    
}


-(void)themeChange {
    ThemeManager *manager = [ThemeManager shareInstance];
    
    UIImage *image = [manager getThemeImage:@"bg_home.jpg"];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:image]];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _themeArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    NSString *title = _themeArr[indexPath.row];
    ThemeManager *manager = [ThemeManager shareInstance];
    UIImage *image = [manager getThemeImage:@"bg_home.jpg"];
    cell.backgroundColor = [UIColor colorWithPatternImage:image];
    cell.textLabel.text = title;
    cell.textLabel.textColor = [manager getThemeColor:@"More_Item_Text_color"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *theme = _themeArr[indexPath.row];
    [[ThemeManager shareInstance]setThemeName:theme];
    [self.navigationController popViewControllerAnimated:YES];
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
