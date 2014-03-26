//
//  ZZZSpellDetailsViewController.m
//  MagicalProject
//
//  Created by _Zach on 3/25/14.
//  Copyright (c) 2014 ZZZ. All rights reserved.
//

#import "ZZZSpellDetailsViewController.h"
#import "MagicSpell.h"

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
    // rien
    // update something on the model and save in Core Data
    
}

@end
