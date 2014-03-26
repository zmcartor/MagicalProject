//
//  ZZZTableViewController.m
//  MagicalProject
//
//  Created by _Zach on 3/25/14.
//  Copyright (c) 2014 ZZZ. All rights reserved.
//

#import "ZZZTableViewController.h"
#import <CoreData+MagicalRecord.h>
#import "MagicSpell.h"
#import "ZZZSpellDetailsViewController.h"

@interface ZZZTableViewController ()

@property(strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@end

@implementation ZZZTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuse"];
   
    self.fetchedResultsController = [MagicSpell MR_fetchAllSortedBy:@"id" ascending:YES withPredicate:nil groupBy:nil delegate:self];
}

// NOTE - this is computationally expensive to reload rows after every single update.
// perform reloadData in DidChangeContent if too crazy

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    NSLog(@"something changed yoyo!");
    [self.tableView beginUpdates];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    NSLog(@"controller:didChangeObject:");
    UITableView *tableView = self.tableView;
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            NSLog(@"record has changed!!");
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            // Reloading the section inserts a new row and ensures that titles are updated appropriately.
            [tableView reloadSections:[NSIndexSet indexSetWithIndex:newIndexPath.section] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger count = [[self.fetchedResultsController sections] count];
    NSLog(@"number of sections is: %i", count);
    return count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
    NSLog(@"#rows in section: %lu", (unsigned long)[sectionInfo numberOfObjects]);
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    // TODO, set the style type as something better here.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse" forIndexPath:indexPath];
    
    NSLog(@"the cell: %@", cell);
    
    MagicSpell *magicSpell = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = magicSpell.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Cast: %@ times", magicSpell.castCount];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    // this isn't loading the nib, so storyBoard stuff doesn't happen hmmm.
    MagicSpell *spell = [self.fetchedResultsController objectAtIndexPath:indexPath];
    ZZZSpellDetailsViewController *detail = [[ZZZSpellDetailsViewController alloc] initWithSpell:spell];
    [self.navigationController pushViewController:detail animated:YES];
}

@end
