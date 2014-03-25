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

@interface ZZZTableViewController ()

@property(strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@end

@implementation ZZZTableViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuse"];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"MagicSpell"];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc]
                              initWithKey:@"id" ascending:YES];
    
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sort]];
    [fetchRequest setFetchBatchSize:20];
   
    // TODO what is correct context to use here ?
    NSFetchedResultsController *theFetchedResultsController =
    [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                        managedObjectContext:[NSManagedObjectContext MR_defaultContext] sectionNameKeyPath:nil
                                                   cacheName:@"SpellsCache"];
    
    self.fetchedResultsController = theFetchedResultsController;
    theFetchedResultsController.delegate = self;
   
    NSError *errorFetch = nil;
    [theFetchedResultsController performFetch:&errorFetch];
    
    if (errorFetch){
        NSLog(@"error fetching spells: %@", errorFetch);
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self.fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 0;
    if ([[self.fetchedResultsController sections] count] > 0) {
        id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
        return [sectionInfo numberOfObjects];
    } else
        return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse" forIndexPath:indexPath];
    
    NSLog(@"the cell: %@", cell);
    
    MagicSpell *magicSpell = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = magicSpell.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Mana: %@", magicSpell.mana];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    NSLog(@"boom selected yo");
    
   
}

@end
