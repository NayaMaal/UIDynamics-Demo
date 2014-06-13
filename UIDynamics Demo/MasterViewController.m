//
//  MasterViewController.m
//  UIDynamics Demo
//
//  Created by Nikhilesh on 09/12/13.
//  Copyright (c) 2013 Global Logic. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"
#import "SnapViewController.h"
#import "GravityViewController.h"
#import "CollisionViewController.h"
#import "AttachmentViewController.h"
#import "PushViewController.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

- (void)viewDidLoad{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _objects = [[NSMutableArray alloc] initWithObjects:@"Gravity Behavior", @"Snap Behavior", @"Push Behavior", @"Collision Behavior", @"Attachment Behavior", nil];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSDate *object = _objects[indexPath.row];
    cell.textLabel.text = [object description];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            GravityViewController *viewController = [[GravityViewController alloc] initWithNibName:@"GravityViewController" bundle:nil];
            [self.navigationController pushViewController:viewController animated:YES];
        }
            break;
        case 1:{
            SnapViewController *viewController = [[SnapViewController alloc] initWithNibName:@"SnapViewController" bundle:nil];
            [self.navigationController pushViewController:viewController animated:YES];
        }
            break;
        case 2:{
            PushViewController *viewController = [[PushViewController alloc] initWithNibName:@"PushViewController" bundle:nil];
            [self.navigationController pushViewController:viewController animated:YES];
        }
            break;
        case 3:{
            CollisionViewController *viewController = [[CollisionViewController alloc] initWithNibName:@"CollisionViewController" bundle:nil];
            [self.navigationController pushViewController:viewController animated:YES];
        }
            break;
        case 4:{
            AttachmentViewController *viewController = [[AttachmentViewController alloc] initWithNibName:@"AttachmentViewController" bundle:nil];
            [self.navigationController pushViewController:viewController animated:YES];
        }
            break;
       default:
            break;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = _objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
