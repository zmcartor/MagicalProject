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

- (instancetype)initWithSpell:(MagicSpell *)spell {
    self = [super init];
    if (self) {
        _spellModel = spell;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //wtf why?
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = self.spellModel.name;

    self.nameLabel.text = self.spellModel.name;
    self.manaLabel.text = [NSString stringWithFormat:@"%@", self.spellModel.mana];
    self.castLabel.text = [NSString stringWithFormat:@"%@", self.spellModel.castCount];
}

- (IBAction)castButtonTouched:(id)sender {
   
    NSString *message = [NSString stringWithFormat:@"%@ cast!", self.spellModel.name];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Whoosh" message:message delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {

    // update and save on main context, what happens ?
    self.spellModel.castCountValue+=1;
    NSError *errord;
    [[NSManagedObjectContext MR_defaultContext] save:&errord];
    
    if (errord) {
        NSLog(@"ERRORD: %@", errord);
    }
   
    
    
    /*
    __block typeof(self) blockSelf = self;
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        
       [blockSelf.spellModel]
        
        [localContext insertObject:blockSelf.spellModel];
        self.spellModel.castCountValue+=1;
    }];
     */
}

@end
