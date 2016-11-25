//
//  ViewController.m
//  Receipts++
//
//  Created by carmen cheng on 2016-11-24.
//  Copyright © 2016 carmen cheng. All rights reserved.
//

#import "ViewController.h"
#import "newTagViewController.h"
#import "DetailViewController.h"
#import "LHLCoreDataStack.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic) newTagViewController *nTagVC;
@property (nonatomic) LHLCoreDataStack *stack;
@property (nonatomic) NSFetchedResultsController *frc;
@property (nonatomic) NSMutableArray *receipts;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.stack = [[LHLCoreDataStack alloc]init];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"Receipt"];
    NSSortDescriptor *sortByTag = [[NSSortDescriptor alloc]initWithKey:@"note" ascending:NO];
    fetchRequest.sortDescriptors = @[sortByTag];
    
    self.frc = [[NSFetchedResultsController alloc]initWithFetchRequest:fetchRequest managedObjectContext:self.stack.context sectionNameKeyPath:nil cacheName:nil];
    
    self.frc.delegate = self;
    NSError *fetchError = nil;
    [self.frc performFetch:&fetchError];
    
  }

#pragma mark - TableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self.frc sections]count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    id <NSFetchedResultsSectionInfo> sectionInfo = [[self.frc sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Receipt *receipt = [self.frc objectAtIndexPath:indexPath];
    [self configureCell:cell withReceipt:receipt];
    return cell;
}

-(void)configureCell:(UITableViewCell *)cell withReceipt:(Receipt *)receipt{
    cell.textLabel.text = [NSString stringWithFormat:@"%@",receipt.note];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.receipts removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

 #pragma mark - Navigation

 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     if ([[segue identifier]isEqualToString:@"showDetail"]) {
         NSIndexPath *indexPath = [self.myTableView indexPathForSelectedRow];
         Receipt *detailReceipt = [self.frc objectAtIndexPath:indexPath];
         DetailViewController *detailVC = (DetailViewController *)[segue destinationViewController];
         [detailVC setDetailReceipt:detailReceipt];
         
     }else if ([segue.identifier isEqualToString:@"addReceipt"]) {
         newTagViewController *newtagVC = segue.destinationViewController;
         [newtagVC setManagedObjectContext:self.stack.context];
     }
 }

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.myTableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.myTableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.myTableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        default:
            return;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView = self.myTableView;
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.myTableView endUpdates];
}




@end
