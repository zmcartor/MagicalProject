//
//  ZZZSpellDetailsViewController.m
//  MagicalProject
//
//  Created by _Zach on 3/25/14.
//  Copyright (c) 2014 ZZZ. All rights reserved.
//

#import "ZZZSpellDetailsViewController.h"
#import "MagicSpell.h"
#import <CoreData+MagicalRecord.h>

@interface ZZZSpellDetailsViewController ()

@end

@implementation ZZZSpellDetailsViewController

/**
 *  This is a really cool function
 *
 *  @param spell casts an awesome spell
 *
 *  @return a new instance of the class.
 */

- (instancetype)initWithSpell:(MagicSpell *)spell {
    self = [super init];
    if (self) {
        _spellModel = spell;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.spellModel.name;

    self.nameLabel.text = self.spellModel.name;
    self.manaLabel.text = [NSString stringWithFormat:@"%@", self.spellModel.mana];
    self.castLabel.text = [NSString stringWithFormat:@"%@", self.spellModel.castCount];
   
    // could be put in custom setter for self.spellModel
    // also stash off the editingContext
    
    // initializing the editingContext part of custom setter on first load.
    NSManagedObjectContext *editingContext = [NSManagedObjectContext MR_contextWithParent:[NSManagedObjectContext MR_defaultContext]];
    
    
    NSError *errord = nil;
    self.spellModel = (MagicSpell *)[editingContext existingObjectWithID:self.spellModel.objectID error:&errord];
}
/**
 *  Fired when the 'cast' button is called within the screen.
 *
 *  @param sender this is the sender description, cool!
 */
- (IBAction)castButtonTouched:(id)sender {
   
    NSString *message = [NSString stringWithFormat:@"%@ cast!", self.spellModel.name];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Whoosh" message:message delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    // lookup within another context and make a change. then save.
    __block typeof(self) blockSelf = self;
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        NSError *errord;
        MagicSpell *spell = (MagicSpell *)[localContext existingObjectWithID:blockSelf.spellModel.objectID error:&errord];
        spell.castCountValue+=1;
        //localContext saved automatically
    }];
}
@end
